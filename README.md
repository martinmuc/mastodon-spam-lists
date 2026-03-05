# Mastodon Spam Lists

Kuratierte Listen von E-Mail-Domains und IP-Ranges, die wiederholt für Spam-Registrierungen auf deutschsprachigen Mastodon-Instanzen verwendet werden.

## Listen

| Datei | Inhalt | Einträge |
|-------|--------|----------|
| `spam-domains.txt` | Wegwerf-E-Mail-Domains | ~100 |
| `spam-ips.txt` | IP-Ranges (CIDR) | ~30 |

## Kontext

Die Domains in `spam-domains.txt` sind **nicht** in der bekannten [disposable-email-domains](https://github.com/disposable-email-domains/disposable-email-domains)-Liste enthalten — sie ergänzen diese.

Die IP-Ranges in `spam-ips.txt` stammen von Hosting-Providern, VPN-Diensten und Tor-Exit-Nodes, die wiederholt für automatisierte Spam-Registrierungen missbraucht werden.

## Herkunft

Ermittelt durch Analyse von 400+ Spam-Accounts auf [troet.cafe](https://troet.cafe) und [muenchen.social](https://muenchen.social) (seit März 2026). Die Accounts bewarben typischerweise Casinos, Escort-Dienste, Immobilien, Krypto oder verbreiteten geopolitische Propaganda.

## Nutzung

Die Listen sind plain text (eine Domain/Range pro Zeile, `#`-Kommentare). Sie lassen sich leicht in eigene Moderations-Scripts oder Blocklisten einbinden.

## Beitragen

Pull Requests mit weiteren Domains/IPs sind willkommen. Bitte:
- Pro Eintrag kurz angeben, woher die Info stammt (z.B. "Spam auf instanz.example")
- Keine legitimen Mail-Provider oder Wohn-ISP-Ranges eintragen
- Domains alphabetisch einsortieren

## Lizenz

[CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) — Public Domain. Frei verwendbar ohne Einschränkungen.
