# Die Befehle `ip` und `iw`


### Der Befehl `ip`

Der `ip`-Befehl ist ein vielseitiges Werkzeug zur Konfiguration und Verwaltung von Netzwerkschnittstellen und Routing.

**Funktionalität:**

- Anzeigen und Konfigurieren von Netzwerkschnittstellen (IP-Adressen, MTU, Status, etc.).
- Verwalten von Routing-Tabellen und ARP-Einträgen.
- Konfigurieren von Tunneln und VLANs.

**Häufig verwendete Syntax:**

- **Anzeigen von Schnittstellen:**
```shell
ip link show
```

- **IP-Adresse einer Schnittstelle anzeigen:**
```shell
ip addr show
```

- **Schnittstelle aktivieren oder deaktivieren:**
```shell
ip link set <interface> up
ip link set <interface> down
```

- **Route hinzufügen:**
```shell
ip route add default via <gateway-ip>
```

### Der Befehl `iw`

Der `iw`-Befehl ist ein Werkzeug zur Konfiguration und Verwaltung von Wireless-LAN-Schnittstellen.

**Funktionalität:**

- Anzeigen von Informationen zu WLAN-Schnittstellen.
- Scannen nach verfügbaren Netzwerken.
- Konfigurieren von WLAN-Einstellungen (z. B. Kanal, Frequenz, Modus).

**Häufig verwendete Syntax:**

- **Verfügbare Netzwerke scannen:**
```shell
iw dev <interface> scan
```

- **Anzeigen von WLAN-Schnittstellen:**
```shell
iw dev
```


- **Kanal und Frequenz setzen:**
```shell
iw dev <interface> set channel <channel>
```

- **Modus ändern (z. B. Managed, Monitor):**
```shell
iw dev <interface> set type <mode>
```

### Zusammenfassung

- **`ip`:** Allgemeiner Netzwerkbefehl für alle Arten von Schnittstellen (Ethernet, WLAN, Tunnels).
- **`iw`:** Spezieller Befehl für die Verwaltung von WLAN-Schnittstellen und deren Funktionen.

---

