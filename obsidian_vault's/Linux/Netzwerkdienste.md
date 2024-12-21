
# Netzwerkdienste

### Was sind Netzwerkdienste

Netzwerkdienste sind spezielle Programme oder Daemons (Dienste).

### Aufgaben Übersicht

-  Zuweisung von IP-Adressen 
-  die Verwaltung von Routing-Tabellen 
-  die Bereitstellung von DNS-Auflösung 
-  Verwaltung von Verbindungen (z.B. WLAN oder kabelgebundene Netzwerke).

### Aufgaben 

1. **Netzwerksuche und Verbindungsaufbau**: Dienste wie `NetworkManager` oder `wpa_supplicant` durchsuchen verfügbare WLAN-Netzwerke und stellen die Verbindung zu einem gewählten Netzwerk her. Sie verwalten die Authentifizierung (z.B. WPA2), stellen sicher, dass der richtige Netzwerkschlüssel verwendet wird, und kümmern sich um die verschlüsselte Kommunikation.
    
2. **IP-Adressen-Management**: Sobald die WLAN-Verbindung hergestellt ist, kümmert sich ein DHCP-Client (wie `dhclient`) darum, eine IP-Adresse vom Router zu beziehen, damit das System auf das Netzwerk zugreifen kann.
    
3. **DNS und Routing**: Dienste wie `systemd-resolved` sorgen dafür, dass Domain-Namen auf die richtigen IP-Adressen aufgelöst werden, damit du Websites erreichen kannst. Außerdem wird durch Routing-Tabellen sichergestellt, dass die Datenpakete den richtigen Weg im Netzwerk nehmen.
    
4. **Verwaltung und Überwachung der Verbindung**: Netzwerkdienste überwachen die Stabilität der WLAN-Verbindung. Wenn die Verbindung unterbrochen wird, versuchen sie automatisch, diese wiederherzustellen oder auf ein alternatives Netzwerk zu wechseln.

### **`NetworkMangaer`**

Der NetworkManager ist einer der Netzwerkdiensten.

**Aufgaben:**
- Der **NetworkManager** verwaltet die Netzwerkschnittstellen, sowohl für kabelgebundene (Ethernet) als auch drahtlose (Wi-Fi) Verbindungen.
- Zuweisung von IP-Adressen
- Verwalten von Verbindungen 
	- Konfiguriert IP-Adressen
	- Konfiguriert DNS und Routing 
	- Überwacht den Verbindungsstatus (z. B. ob ein Kabel eingesteckt ist).
- Aktivieren/Deaktivieren der Schnittstellen
- Er bietet sowohl eine grafische als auch eine Kommandozeilenoberfläche zur Konfiguration von Netzwerkschnittstellen und zur Verwaltung von Verbindungen.

### Funktionsweise:
##### 1. **WLAN- oder Ethernet-Verbindung herstellen (erste Verbindung):**

- **Bei der ersten Verbindung zu einem WLAN-Netzwerk:** Wenn der NetworkManager das Netzwerk zum ersten Mal erkennt (z. B. durch Scannen nach verfügbaren Netzwerken, mit hilfe von wpa_supplicant), zeigt er dem Benutzer die verfügbaren Netzwerke an.
    
    - Wenn der Benutzer ein Netzwerk auswählt, benötigt der NetworkManager **nur die SSID** (Netzwerkname) und möglicherweise **Authentifizierungsinformationen** (z.B. ein WLAN-Passwort).
    - **Für WLAN-Netzwerke ohne gespeichertes Profil** fragt der NetworkManager den Benutzer nach den notwendigen Informationen (wie das Passwort für ein WPA2-Netzwerk).
    - Sobald diese Informationen eingegeben werden, kann sich der NetworkManager, mit hilfe von wpa_supplicant verbinden und gleichzeitig ein **Verbindungsprofil** für zukünftige Verbindungen erstellen, das die SSID und Authentifizierungsdetails speichert.
- **Bei der ersten Verbindung zu einem kabelgebundenen Netzwerk (Ethernet):** Hier wird der NetworkManager normalerweise direkt über das Vorhandensein des Kabels informiert. In der Regel erfolgt die Verbindung automatisch über DHCP, um eine IP-Adresse zu erhalten. Für kabelgebundene Netzwerke wird dabei kein explizites Profil benötigt.
    

##### 2. **Erstellung eines Verbindungsprofils bei der ersten Verbindung:**

- Sobald eine Verbindung hergestellt wird (z.B. zu einem WLAN oder Ethernet), erstellt der **NetworkManager** **automatisch** ein **Verbindungsprofil**. Dieses Profil speichert alle relevanten Informationen wie:
    - **SSID**, **Passwort** und andere Authentifizierungsdetails (für WLAN).
    - **IP-Konfigurationen**, wie statische IP oder DHCP-Einstellungen.
- Wenn die Verbindung später erneut hergestellt wird (z.B. nach einem Neustart oder bei erneutem Scannen nach Netzwerken), verwendet der NetworkManager das gespeicherte Profil, um die Verbindung automatisch ohne erneute Eingabe der Informationen herzustellen.

### **Zusammenarbeit zwischen NetworkManager und wpa_supplicant:**

##### **Kabelgebundene Netzwerke:**

- **Verwaltung durch NetworkManager:**
    - Der **NetworkManager** verwaltet kabelgebundene Verbindungen direkt, ohne die Unterstützung eines separaten Dienstes wie `wpa_supplicant`.
    - Er konfiguriert IP-Adressen, DNS und Routing und überwacht den Verbindungsstatus (z. B. ob ein Kabel eingesteckt ist).

##### **Kabellose Netzwerke:**

- Der NetworkManager **koordiniert** die Verbindung zu WLAN-Netzwerken, führt die Aufgaben jedoch nicht selbst aus.
- Stattdessen nutzt er **`wpa_supplicant`** als Backend für folgende Aufgaben:
    - **Scannen nach Netzwerken:**
        - Der NetworkManager fordert `wpa_supplicant` auf, verfügbare Netzwerke zu scannen.
    - **Authentifizierung und Verschlüsselung:**
        - `wpa_supplicant` führt WPA/WPA2-Authentifizierungen durch und handhabt Verschlüsselungsprotokolle.
    - **Herstellen einer Verbindung:**
        - Der NetworkManager übermittelt die Verbindungseinstellungen (z. B. SSID, Passwort) an `wpa_supplicant`, der dann die Verbindung aufbaut.

##### **Ablauf bei kabellosen Verbindungen:**

1. **Initiierung:**
    - Der Benutzer wählt ein WLAN-Netzwerk aus oder der NetworkManager versucht automatisch, eine bekannte Verbindung herzustellen.
2. **Anfrage an wpa_supplicant:**
    - Der NetworkManager sendet die Verbindungsdetails an `wpa_supplicant` (z. B. SSID und Sicherheitsdetails).
3. **Ausführung durch wpa_supplicant:**
    - `wpa_supplicant` übernimmt die Aufgaben der Authentifizierung und des Verbindungsaufbaus.
4. **Ergebnisse zurück an den NetworkManager:**
    - `wpa_supplicant` meldet den Status der Verbindung (z. B. erfolgreich, fehlgeschlagen, oder Netzwerk nicht gefunden) zurück.
5. **Benutzerinteraktion:**
    - Der NetworkManager zeigt diese Ergebnisse in seiner Benutzeroberfläche an (z. B. in `nm-applet`, `nmcli`, oder einer Desktop-Umgebung wie GNOME/KDE).


### **`wpa_supplicant`**

- **Beschreibung**: Ein Dienst, der für die Verwaltung von drahtlosen Netzwerken (WLAN) verantwortlich ist. Er wird verwendet, um sich mit WLANs zu verbinden, insbesondere mit Netzwerken, die WPA/WPA2-Verschlüsselung verwenden.
- Arbeitet eng mit der Netzwerkhardware und dem Treiber zusammen, um verfügbare Netzwerke zu erkennen.
- Ist für das Scannen von Netzwerken zuständig.

- **Aufgaben**:
    - Verbindet das System mit gesicherten drahtlosen Netzwerken
    - Scannen von verfügbaren Netzwerken
- **Befehl**:
    - Starten/Neustarten: `sudo systemctl restart wpa_supplicant`
    - Status anzeigen: `sudo systemctl status wpa_supplicant`

### Alternative zu `wpa_supplicant`
Wenn `wpa_supplicant` nicht genutzt wird, wird `iwd` genutzt.
`iwd` hat die gleichen Aufgaben wie `wpa_supplicant`.

### **DHCP-Client (z.B. `dhclient`)**

- **Beschreibung**: Dieser Dienst ermöglicht es einem System, dynamisch eine IP-Adresse von einem DHCP-Server zu beziehen. Der DHCP-Client sendet Anfragen an den DHCP-Server, um Netzwerkinformationen wie IP-Adresse, Gateway, Subnetz und DNS-Server zu erhalten.
- **Verwendung**:
    - Automatische IP-Adressen-Zuweisung von einem DHCP-Server
- **Befehl**:
    - Neustart: `sudo dhclient -r && sudo dhclient`

### **DNS-Dienste (z.B. `systemd-resolved`, `dnsmasq`)**

- **Beschreibung**: DNS-Dienste sind für die Namensauflösung verantwortlich, d.h. die Übersetzung von Domainnamen (z.B. [www.example.com](http://www.example.com)) in IP-Adressen.
- **`systemd-resolved`**: Ein Teil von `systemd`, der DNS-Anfragen verwaltet und Namensauflösung bereitstellt.
- **`dnsmasq`**: Ein leichtgewichtiger DNS-Weiterleitungsdienst, der oft für lokale DNS-Server oder als Teil von DHCP-Servern verwendet wird.
- **Befehl**:
    - `systemd-resolved` Neustart: `sudo systemctl restart systemd-resolved`
    - `dnsmasq` Neustart: `sudo systemctl restart dnsmasq`

### **Firewall-Dienste (z.B. `iptables`, `firewalld`)**

- **Beschreibung**: Diese Dienste steuern den Netzwerkverkehr, der durch die Firewall-Regeln geleitet wird. Sie ermöglichen es dem Systemadministrator, bestimmte Ports, Protokolle und IP-Adressen zuzulassen oder zu blockieren.
- **Verwendung**:
    - Steuerung des eingehenden und ausgehenden Netzwerkverkehrs
    - Implementierung von Sicherheitsregeln
- **Befehl**:
    - `iptables` Firewall-Regeln anzeigen: `sudo iptables -L`
    - `firewalld` Neustart: `sudo systemctl restart firewalld`

### **Avahi (mDNS/DNS-SD, Zeroconf)**

- **Beschreibung**: Avahi bietet Multicast-DNS-Dienste, die es ermöglichen, Geräte im lokalen Netzwerk ohne Konfiguration automatisch zu entdecken und anzusprechen (z.B. Drucker oder andere Computer). Es wird oft in Netzwerken verwendet, um die Konfiguration zu vereinfachen.
- **Verwendung**:
    - Automatische Erkennung von Netzwerkgeräten
    - Bereitstellung von Diensten wie Druck- oder Dateifreigaben im LAN
- **Befehl**:
    - Starten/Neustarten: `sudo systemctl restart avahi-daemon`
    - Status anzeigen: `sudo systemctl status avahi-daemon`

---

# Geräte und Dienste ein- und abschalten

### Netzwerk Dienste neu starten

```shell
sudo systemctl restart networking
```

### NetworkManager neu starten

```shell
sudo systemctl restart NetworkManager
```

### Netzwerkschnittstelle neu starten

##### Netzwerkschnittstellen anzeigen

```shell
ip link show
```

##### Netzwerkschnittstelle abschalten

```shell
sudo ifdown eth0
```

##### Netzwerkschnittstelle einschalten

```shell
sudo ifup eth0
```