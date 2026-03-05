# Mastodon Spam Lists

Curated lists of email domains and IP ranges repeatedly used for spam registrations on Mastodon instances.

Kuratierte Listen von E-Mail-Domains und IP-Ranges, die wiederholt für Spam-Registrierungen auf Mastodon-Instanzen verwendet werden.

## Files / Dateien

| File | Content | Entries |
|------|---------|---------|
| `spam-domains.txt` | Disposable email domains | ~100 |
| `spam-ips.txt` | IP ranges (CIDR) | ~30 |

## Context / Kontext

The domains in `spam-domains.txt` are **not** included in the well-known [disposable-email-domains](https://github.com/disposable-email-domains/disposable-email-domains) list — they complement it.

The IP ranges in `spam-ips.txt` belong to hosting providers, VPN services, and Tor exit nodes that are repeatedly abused for automated spam registrations.

## Origin / Herkunft

Identified by analyzing 400+ spam accounts on [troet.cafe](https://troet.cafe) and [muenchen.social](https://muenchen.social) (since March 2026). The accounts typically promoted casinos, escort services, real estate, crypto, or spread geopolitical propaganda.

Ermittelt durch Analyse von 400+ Spam-Accounts auf [troet.cafe](https://troet.cafe) und [muenchen.social](https://muenchen.social) (seit März 2026). Die Accounts bewarben typischerweise Casinos, Escort-Dienste, Immobilien, Krypto oder verbreiteten geopolitische Propaganda.

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
