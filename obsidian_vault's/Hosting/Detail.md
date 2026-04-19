## 1. Infrastruktur / Laufzeit

- Ubuntu/Debian Server
- Docker Compose
- nginx
- API
- Frontend
- Datenbank
- HTTPS
- Firewall
- Backups

## 2. Sicherheit

- SSH nur mit Key, kein Passwort-Login
- möglichst kein Root-Login per SSH
- regelmäßige Security-Updates
- starke Secrets und keine Passwörter im Repo
- `.env` sauber behandeln
- Datenbank nicht öffentlich erreichbar machen
- Rate Limiting für API/Login
- Schutz gegen Brute Force
- sichere Cookie-/Session-Konfiguration oder saubere Token-Strategie
- CORS korrekt konfigurieren
- Dateiuploads absichern, falls du welche hast
- Reverse Proxy korrekt härten
- nur notwendige Ports öffnen

## 3. Daten / Persistenz

- persistente Volumes
- getestete Backups
- Restore-Strategie
- klare Regeln: was wird wie oft gesichert?
- Aufbewahrungsdauer der Backups
- idealerweise Backups **nicht nur auf demselben Server**
- Migrationsstrategie für DB-Änderungen
- Monitoring für Speicherplatz

Ganz wichtig:  
**Ein Backup ist erst dann ein Backup, wenn ein Restore erfolgreich getestet wurde.**

## 4. Deployment

Klarer Weg, wie neue Versionen live gehen.

Zum Beispiel:

- Git-basierter Deploy-Prozess
- Build-Prozess
- Restart-Strategie
- Rollback-Möglichkeit
- möglichst keine manuellen Bastelschritte auf dem Server
- getrennte Umgebungen für dev / staging / production, sobald es ernster wird

Am Anfang kann das simpel sein, aber es sollte **reproduzierbar** sein.

## 5. Beobachtbarkeit

Fehlerlogging allein reicht nicht.

Man braucht idealerweise auch:

- Request-Logs
- App-Logs
- nginx-Logs
- Error-Tracking
- Monitoring für CPU, RAM, Disk
- Uptime-Monitoring
- Alerts bei Ausfall
- evtl. Healthcheck-Endpoints

Denn sonst man oft erst durch den Kunden, dass etwas kaputt ist.

## 6. Verfügbarkeit / Betrieb

Selbst hosten heißt auch:

- Was passiert bei Server-Neustart?
- Starten Container automatisch wieder?
- Was passiert bei vollem Speicher?
- Was passiert bei abgelaufenem Zertifikat?
- Was passiert bei kaputtem Deploy?
- Was passiert bei Datenbankfehler?
- Was passiert, wenn ein Container hängt?

Man Brauchst also ein kleines **Betriebskonzept**.

## 7. Domain / DNS / Mail

Wird oft vergessen.

Man braucht meistens auch:

- Domain
- DNS-Konfiguration
- Subdomains, z. B. `api.domain.de` und `app.domain.de`
- Mailversand für Login, Passwort-Reset, Rechnungen etc.
- SPF / DKIM / DMARC, wenn man Mails selbst versendet oder zustellen will

Gerade für SaaS ist Mail oft ein Pflichtpunkt.

## 8. Rechtliches / organisatorisches

Sobald man Geld verdienen will, reicht „läuft technisch“ nicht mehr.

Je nach Produkt braucht man:

- Impressum
- Datenschutzerklärung
- AV-Verträge, wenn relevant
- Cookie-/Tracking-Thema sauber
- DSGVO-konformer Umgang mit Nutzerdaten
- Löschkonzept
- Zugriffsrechte auf personenbezogene Daten
- Logging mit Augenmaß, damit du nicht sensible Daten unnötig speicherst

Wenn man B2B macht, ist das zwar oft etwas entspannter als bei Endkundenprodukten, aber ignorieren darf man es nicht.

## 9. Produktbezogene Betriebsfragen

Je nach Website/API zusätzlich:

- User-Authentifizierung
- Passwort-Reset
- E-Mail-Verifikation
- Rollen/Rechte
- Missbrauchsschutz
- API-Keys oder OAuth
- Quotas / Rate Limits
- Abrechnung / Billing
- Audit-Logs, wenn Firmenkunden relevant sind

## 10. Notfallfragen

Das ist ein sehr wichtiger Block.

Man sollte beantworten können:

- Wie komme ich wieder rein, wenn ich mich ausgesperrt habe?
- Wie stelle ich Backups wieder her?
- Wie rolle ich die letzte funktionierende Version zurück?
- Wie erkenne ich, dass die App down ist?
- Wie erneuere ich Zertifikate?
- Was ist mein Plan bei Serverkompromittierung?