# Mastodon Spam Lists

Curated lists of email domains and IP ranges repeatedly used for spam registrations on Mastodon instances.

Kuratierte Listen von E-Mail-Domains und IP-Ranges, die wiederholt für Spam-Registrierungen auf Mastodon-Instanzen verwendet werden.

## Files / Dateien

| File | Content | Entries |
|------|---------|---------|
| `spam-domains.txt` | Disposable email domains | ~190 |
| `spam-domains-active.txt` | Active domains only (generated) | varies |
| `spam-ips.txt` | IP ranges (CIDR) | ~60 |
| `spam-mx-servers.txt` | Mail servers behind spam domains | 6 |
| `domain-status.md` | DNS status report (generated) | — |

## Context / Kontext

The domains in `spam-domains.txt` are **not** included in the well-known [disposable-email-domains](https://github.com/disposable-email-domains/disposable-email-domains) list — they complement it.

The IP ranges in `spam-ips.txt` belong to hosting providers, VPN services, and Tor exit nodes that are repeatedly abused for automated spam registrations.

**Key finding:** 128 of 192 spam domains (67%) share the same two MX servers (`mail.wabblywabble.com` and `mail.wallywatts.com`). This means a single operator runs most of the spam email infrastructure. See `spam-mx-servers.txt` for all known spam MX servers — useful for detecting new spam domains before they appear on any blocklist.

**Wichtiger Fund:** 128 von 192 Spam-Domains (67%) nutzen dieselben zwei MX-Server (`mail.wabblywabble.com` und `mail.wallywatts.com`). Das bedeutet: ein einziger Betreiber steckt hinter dem Großteil der Spam-Mail-Infrastruktur. Siehe `spam-mx-servers.txt` für alle bekannten Spam-MX-Server — nützlich um neue Spam-Domains zu erkennen bevor sie auf einer Blockliste stehen.

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

## Updates

These lists are actively maintained and updated regularly based on ongoing moderation of our instances.

Diese Listen werden aktiv gepflegt und regelmäßig auf Basis der laufenden Moderation unserer Instanzen aktualisiert.

## License / Lizenz

[CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) — Public Domain. Free to use without restrictions.
