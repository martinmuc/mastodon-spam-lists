# Mastodon Spam Lists

Curated lists of email domains and IP ranges repeatedly used for spam registrations on Mastodon instances.

Kuratierte Listen von E-Mail-Domains und IP-Ranges, die wiederholt für Spam-Registrierungen auf Mastodon-Instanzen verwendet werden.

## Files / Dateien

| File | Content | Entries |
|------|---------|---------|
| `spam-domains.txt` | Disposable email domains | 759 |
| `spam-domains-active.txt` | Active domains only (generated) | 697 |
| `spam-ips.txt` | IP ranges (CIDR) | 75 |
| `spam-mx-servers.txt` | Mail servers behind spam domains | 12 |
| `domain-status.md` | DNS status report (generated) | — |

## Context / Kontext

The domains in `spam-domains.txt` are **not** included in the well-known [disposable-email-domains](https://github.com/disposable-email-domains/disposable-email-domains) list — they complement it.

The IP ranges in `spam-ips.txt` belong to hosting providers, VPN services, and Tor exit nodes that are repeatedly abused for automated spam registrations.

**Key finding:** Many spam domains share the same MX servers (e.g. `mail.wabblywabble.com`, `mail.wallywatts.com`, `tinyhost.shop`). This means a small number of operators run most of the spam email infrastructure. See `spam-mx-servers.txt` for all known spam MX servers — useful for detecting new spam domains before they appear on any blocklist.

**Wichtiger Fund:** Viele Spam-Domains nutzen dieselben MX-Server (z.B. `mail.wabblywabble.com`, `mail.wallywatts.com`, `tinyhost.shop`). Das bedeutet: wenige Betreiber stecken hinter dem Großteil der Spam-Mail-Infrastruktur. Siehe `spam-mx-servers.txt` für alle bekannten Spam-MX-Server — nützlich um neue Spam-Domains zu erkennen bevor sie auf einer Blockliste stehen.

## Origin / Herkunft

Identified by analyzing 400+ spam accounts on [troet.cafe](https://troet.cafe) (the largest German-speaking Mastodon instance) and [muenchen.social](https://muenchen.social) (since March 2026). The accounts typically promoted casinos, escort services, real estate, crypto, or spread geopolitical propaganda.

Ermittelt durch Analyse von 400+ Spam-Accounts auf [troet.cafe](https://troet.cafe) (der größten deutschsprachigen Mastodon-Instanz) und [muenchen.social](https://muenchen.social) (seit März 2026). Die Accounts bewarben typischerweise Casinos, Escort-Dienste, Immobilien, Krypto oder verbreiteten geopolitische Propaganda.

More background on how we moderate and run the instances is on the operator's blog, for example [how an invite chain got 69 automated accounts past our sign-up review](https://www.martinmuc.de/blog/invite-chain-back-door/).

Hintergründe zu Moderation und Betrieb stehen im Blog des Betreibers, zum Beispiel [wie diese Listen entstanden sind](https://www.martinmuc.de/blog/mastodon-spam-listen/) und [was die Instanzen kosten](https://www.martinmuc.de/transparenz/).

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

## Known Bot Patterns / Bekannte Bot-Muster

Some sign-up waves cannot be stopped with domain or IP lists, because they use big mail providers and rotating residential IPs. They can be recognised by their pattern instead.

**"Deliverability probe" bot** (since September 2026, large wave again on 21/22 October 2026, more than 80 sign-ups in one day on troet.cafe):

- Username: `bp` followed by 16 hex characters, e.g. `bp5bee20427df4517e`
- Sign-up reason, word for word: `Automated protocol deliverability probe`
- Email: mostly icloud.com, gmail.com and yahoo.co.jp, often the same mailbox many times with plus tags such as `+dc27a8078a9x0738`, `+e84186a12fdx4794` or `+p20261021e714`
- IPs change with every sign-up, mostly residential connections in Japan, the Americas and Europe

The bot apparently uses Mastodon's confirmation email to check whether addresses on a list are still alive. The main risk is your mail server's reputation, not spam posts. Mastodon does not treat `name+tag@` as a duplicate of `name@`, so one mailbox can register again and again. We reject accounts that match both the username and the exact reason automatically.

---

Manche Registrierungswellen lassen sich mit Domain- oder IP-Listen nicht aufhalten, weil sie große Mailanbieter und wechselnde private IP-Adressen nutzen. Erkennen kann man sie aber an ihrem Muster.

**„Deliverability probe“-Bot** (seit September 2026, große Welle erneut am 21./22. Oktober 2026, über 80 Anmeldungen an einem Tag auf troet.cafe):

- Benutzername: `bp` und 16 Hex-Zeichen, z. B. `bp5bee20427df4517e`
- Anmeldegrund, wörtlich: `Automated protocol deliverability probe`
- E-Mail: meist icloud.com, gmail.com und yahoo.co.jp, oft dieselbe Mailbox mehrfach mit Plus-Tags wie `+dc27a8078a9x0738`, `+e84186a12fdx4794` oder `+p20261021e714`
- Die IP wechselt bei jeder Anmeldung, meist private Anschlüsse in Japan, Amerika und Europa

Der Bot nutzt offenbar die Bestätigungsmail von Mastodon, um zu prüfen, ob Adressen aus einer Liste noch existieren. Das eigentliche Risiko ist der Ruf des eigenen Mailservers, nicht Spam-Beiträge. Mastodon wertet `name+tag@` nicht als Dublette von `name@`, dieselbe Mailbox kann sich also immer wieder anmelden. Wir lehnen Konten automatisch ab, wenn Benutzername und Anmeldegrund beide passen.

## Updates

These lists are actively maintained and updated regularly based on ongoing moderation of our instances.

Diese Listen werden aktiv gepflegt und regelmäßig auf Basis der laufenden Moderation unserer Instanzen aktualisiert.

## License / Lizenz

[CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) — Public Domain. Free to use without restrictions.
