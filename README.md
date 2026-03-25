# Mastodon Spam Lists

Curated lists of email domains and IP ranges repeatedly used for spam registrations on Mastodon instances.

Kuratierte Listen von E-Mail-Domains und IP-Ranges, die wiederholt für Spam-Registrierungen auf Mastodon-Instanzen verwendet werden.

## Files / Dateien

| File | Content | Entries |
|------|---------|---------|
| `spam-domains.txt` | Disposable email domains | ~207 |
| `spam-domains-active.txt` | Active domains only (generated) | ~189 |
| `spam-ips.txt` | IP ranges (CIDR) | ~72 |
| `spam-mx-servers.txt` | Mail servers behind spam domains | 7 |
| `domain-status.md` | DNS status report (generated) | — |

## Context / Kontext

The domains in `spam-domains.txt` are **not** included in the well-known [disposable-email-domains](https://github.com/disposable-email-domains/disposable-email-domains) list — they complement it.

The IP ranges in `spam-ips.txt` belong to hosting providers, VPN services, and Tor exit nodes that are repeatedly abused for automated spam registrations.

**Key finding:** Many spam domains share the same MX servers (e.g. `mail.wabblywabble.com`, `mail.wallywatts.com`, `tinyhost.shop`). This means a small number of operators run most of the spam email infrastructure. See `spam-mx-servers.txt` for all known spam MX servers — useful for detecting new spam domains before they appear on any blocklist.

**Wichtiger Fund:** Viele Spam-Domains nutzen dieselben MX-Server (z.B. `mail.wabblywabble.com`, `mail.wallywatts.com`, `tinyhost.shop`). Das bedeutet: wenige Betreiber stecken hinter dem Großteil der Spam-Mail-Infrastruktur. Siehe `spam-mx-servers.txt` für alle bekannten Spam-MX-Server — nützlich um neue Spam-Domains zu erkennen bevor sie auf einer Blockliste stehen.

## Origin / Herkunft

Identified by analyzing 400+ spam accounts on [troet.cafe](https://troet.cafe) (the largest German-speaking Mastodon instance) and [muenchen.social](https://muenchen.social) (since March 2026). The accounts typically promoted casinos, escort services, real estate, crypto, or spread geopolitical propaganda.

Ermittelt durch Analyse von 400+ Spam-Accounts auf [troet.cafe](https://troet.cafe) (der größten deutschsprachigen Mastodon-Instanz) und [muenchen.social](https://muenchen.social) (seit März 2026). Die Accounts bewarben typischerweise Casinos, Escort-Dienste, Immobilien, Krypto oder verbreiteten geopolitische Propaganda.

## Usage / Nutzung

Plain text files — one domain/range per line, `#` comments. Easy to integrate into your own moderation scripts or blocklists.

## Contributing / Beitragen

Pull requests with additional domains/IPs are welcome. Please:
- Mention the source (e.g. "spam on instance.example")
- Do not add legitimate mail providers or residential ISP ranges
- Sort domains alphabetically

## Inclusion Criteria / Aufnahmekriterien

A domain is added to `spam-domains.txt` when **at least 2** of the following criteria are met:

1. **Multiple occurrences**: Used by ≥2 different spam accounts (across instances)
2. **Known spam MX**: Domain uses a mail server already linked to other spam domains
3. **Self-hosted mail**: Domain runs its own mail server (mail.domain / mx.domain)
4. **Random email pattern**: Email local part contains random digit patterns (e.g. rohoje7445@)
5. **No website**: Domain has no A record / no web presence

**Instant inclusion** (single criterion sufficient):
- Domain uses a mail server listed in `spam-mx-servers.txt`

**Never included**: Legitimate mail providers (Gmail, ProtonMail, GMX, Outlook, etc.)

---

Eine Domain wird in `spam-domains.txt` aufgenommen wenn **mindestens 2** der folgenden Kriterien erfüllt sind:

1. **Mehrfach aufgetreten**: Von ≥2 verschiedenen Spam-Accounts genutzt (instanzübergreifend)
2. **Bekannter Spam-MX**: Domain nutzt einen Mailserver der schon mit anderen Spam-Domains verknüpft ist
3. **Eigener Mailserver**: Domain betreibt eigenen MX (mail.domain / mx.domain)
4. **Random-E-Mail-Muster**: Lokalteil der E-Mail enthält zufällige Ziffernmuster (z.B. rohoje7445@)
5. **Keine Website**: Domain hat keinen A-Record / keine Webpräsenz

**Sofortige Aufnahme** (ein Kriterium reicht):
- Domain nutzt einen Mailserver aus `spam-mx-servers.txt`

**Nie aufgenommen**: Legitime Mail-Provider (Gmail, ProtonMail, GMX, Outlook, etc.)

## Updates

These lists are actively maintained and updated regularly based on ongoing moderation of our instances.

Diese Listen werden aktiv gepflegt und regelmäßig auf Basis der laufenden Moderation unserer Instanzen aktualisiert.

## License / Lizenz

[CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) — Public Domain. Free to use without restrictions.
