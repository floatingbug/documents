## Funktionsweise
1. Der Resolver fragt den Root-Nameserver nach der IP-Adresse des TLD-Nameservers für die angegebene Top-Level-Domain (zum Beispiel .com, .org usw.).

2. Der Root-Nameserver antwortet mit der IP-Adresse des entsprechenden TLD-Nameservers für die angegebene Top-Level-Domain.

3. Dann fragt der Resolver den TLD-Nameserver nach der IP-Adresse des autoritativen Nameservers für die angegebene Domain (zum Beispiel google.com).

4. Der TLD-Nameserver antwortet mit der IP-Adresse des autoritativen Nameservers für die Domain (zum Beispiel ns1.google.com, ns2.google.com).

5. Schließlich fragt der Resolver den autoritativen Nameserver nach der IP-Adresse des vollständigen Domainnamens (zum Beispiel www.google.com).

6. Der autoritative Nameserver antwortet mit der IP-Adresse des vollständigen Domainnamens.

## Nameserver

Nameserver speichern DNS-Einträge, die Domainnamen (z.B. www.google.com) IP-Adressen (z.B. 192.168.1.1) zuordnen. Es gibt verschiedene Arten von Nameservern:
- **Root-Nameserver:** Verweisen auf die TLD-Nameserver.
- **TLD-Nameserver:** Verweisen auf die autoritativen Nameserver für eine bestimmte Domain.
- **Autoritative Nameserver:** Speichern die tatsächlichen DNS-Einträge einer Domain.

## Domain Registrieren

Ein Domain-Registrar registriert die Domain, bspw. www.bliblablo.de bei einem TLD, bspw. .com.

## Registrierung einer Domain

1. **Auswahl eines Domain-Registrars:**
   - Ein Benutzer wählt einen Domain-Registrar aus, bspw. IONOS, um eine Domain zu registrieren (z.B. `www.bliblablo.de`).

2. **Domainregistrierung:**
   - Der Domain-Registrar registriert die Domain bei der entsprechenden TLD-Registry (z.B. `.de` für Deutschland). Diese TLD-Registry speichert die DNS-Daten in ihren Nameserver. Diese daten beinhalten die Zuordnung von IP-Adressen zu den autoritativen Nameservers, bspw. ns1.bliblablo.de, ns2.bliblablo.de oder ns3.bliblablo.de.
   - Die autoritativen Nameserver müssen meist vom Betreiber der jeweiligen Webseite selbst konfiguriert werden, bspw. ns1.bliblablo.de die IP-Adresse zuordnen, auf der ein Webserver läuft.

3. **Nameserver-Einträge:**
   - Der Registrar stellt sicher, dass die autoritativen Nameserver-Einträge für die neue Domain korrekt in der TLD-Registry hinterlegt werden.
   - Dies beinhaltet die IP-Adressen der autoritativen Nameserver, die die endgültige Auflösung der Domain übernehmen.
