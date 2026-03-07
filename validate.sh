#!/usr/bin/env bash
# validate.sh — Prüft DNS-Status aller Domains in spam-domains.txt
# Generiert: domain-status.md + spam-domains-active.txt
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DOMAIN_LIST="$SCRIPT_DIR/spam-domains.txt"
REPORT_FILE="$SCRIPT_DIR/domain-status.md"
ACTIVE_FILE="$SCRIPT_DIR/spam-domains-active.txt"

TODAY=$(date +%Y-%m-%d)

# Parallel DNS queries (default: 10)
PARALLEL="${PARALLEL:-10}"

if [[ ! -f "$DOMAIN_LIST" ]]; then
    echo "ERROR: $DOMAIN_LIST nicht gefunden" >&2
    exit 1
fi

# Domains einlesen (Kommentare und Leerzeilen ignorieren)
DOMAINS=()
while IFS= read -r line; do
    DOMAINS+=("$line")
done < <(grep -v '^#' "$DOMAIN_LIST" | grep -v '^[[:space:]]*$' | sort)

TOTAL=${#DOMAINS[@]}
echo "Prüfe $TOTAL Domains..."

# Temp-Dateien für Ergebnisse
TMP_ACTIVE=$(mktemp)
TMP_INACTIVE=$(mktemp)
TMP_RESULTS=$(mktemp)
trap 'rm -f "$TMP_ACTIVE" "$TMP_INACTIVE" "$TMP_RESULTS"' EXIT

check_domain() {
    local domain="$1"
    local a_record mx_record mx_info

    # DNS A-Record
    a_record=$(dig +short +timeout=5 +tries=2 "$domain" A 2>/dev/null | head -1)

    # DNS MX-Record
    mx_record=$(dig +short +timeout=5 +tries=2 "$domain" MX 2>/dev/null | head -1)

    if [[ -n "$a_record" || -n "$mx_record" ]]; then
        # MX-Info für Report (Priorität entfernen, nur Hostname)
        mx_info=$(echo "$mx_record" | awk '{print $NF}' | sed 's/\.$//')
        [[ -z "$mx_info" ]] && mx_info="-"
        echo "active|$domain|$mx_info|$TODAY" >> "$TMP_RESULTS"
    else
        echo "inactive|$domain||$TODAY" >> "$TMP_RESULTS"
    fi

    echo -n "." >&2
}

export -f check_domain
export TMP_RESULTS TODAY

printf '%s\n' "${DOMAINS[@]}" | xargs -P "$PARALLEL" -I {} bash -c 'check_domain "$@"' _ {}
echo "" >&2

# Ergebnisse sortieren und aufteilen
sort -t'|' -k2 "$TMP_RESULTS" > "${TMP_RESULTS}.sorted"
mv "${TMP_RESULTS}.sorted" "$TMP_RESULTS"

grep '^active|' "$TMP_RESULTS" | sort -t'|' -k2 > "$TMP_ACTIVE"
grep '^inactive|' "$TMP_RESULTS" | sort -t'|' -k2 > "$TMP_INACTIVE" || true

COUNT_ACTIVE=$(wc -l < "$TMP_ACTIVE" | tr -d ' ')
COUNT_INACTIVE=$(wc -l < "$TMP_INACTIVE" | tr -d ' ')
PCT_ACTIVE=$(( COUNT_ACTIVE * 100 / TOTAL ))
PCT_INACTIVE=$(( COUNT_INACTIVE * 100 / TOTAL ))

echo "Ergebnis: $COUNT_ACTIVE aktiv ($PCT_ACTIVE%), $COUNT_INACTIVE inaktiv ($PCT_INACTIVE%)"

# --- Report generieren ---
{
    cat <<EOF
# Domain Status Report
Generated: $TODAY

## Summary
- Total: $TOTAL domains
- Active: $COUNT_ACTIVE ($PCT_ACTIVE%)
- Inactive: $COUNT_INACTIVE ($PCT_INACTIVE%)

## Inactive Domains (no DNS)
| Domain | Last checked |
|--------|-------------|
EOF
    while IFS='|' read -r _ domain _ checked; do
        echo "| $domain | $checked |"
    done < "$TMP_INACTIVE"

    cat <<EOF

## Active Domains
| Domain | MX Server | Last checked |
|--------|-----------|-------------|
EOF
    while IFS='|' read -r _ domain mx checked; do
        echo "| $domain | $mx | $checked |"
    done < "$TMP_ACTIVE"
} > "$REPORT_FILE"

echo "Report: $REPORT_FILE"

# --- Aktive-Domains-Liste generieren ---
{
    cat <<EOF
# Mastodon Spam Email Domains — Active Only
# Generated from spam-domains.txt by validate.sh ($TODAY)
#
# Only domains with active DNS (A or MX record).
# Full list (incl. inactive): spam-domains.txt
#
# Format: one domain per line
# Sorted: alphabetically

EOF
    while IFS='|' read -r _ domain _ _; do
        echo "$domain"
    done < "$TMP_ACTIVE"
} > "$ACTIVE_FILE"

echo "Aktive Domains: $ACTIVE_FILE ($COUNT_ACTIVE Domains)"
