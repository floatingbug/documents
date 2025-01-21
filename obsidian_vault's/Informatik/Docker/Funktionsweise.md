# Container

### Der Container-Prozess

- Ein Container ist ein aktiv laufender Prozess.

### Image-Datei
##### Die Image-Datei stellt das Dateisystem für den Container bereit.

- Der Container kann auf das Dateisystem zugreifen und bspw. Anwendungen starten.

##### Die Image-Datei enthält Informationen, die der Container verwendet.

- Diese Informationen "sagen" dem Container bspw. welche Programme gestartet werden sollen.

### Prozess ID's

- Der Container sieht nur die PID's von Prozessen die er selbst erstellt hat.
	- Dadurch kann der Container nur auf Prozesse innerhalb des Containers zugreifen.

### Container haben ihre eigene virtuelle Netzwerkkarte

- Container haben eine virtuelle Netzwerkkarte mit einer IP-Adresse.
- Innerhalb des Containers wird ein virtueller TCP/IP-Stack ausgeführt.
- Der Server-Socket in einem Container erhält anfragen über diesen virtuellen TCP/IP-Stack.
- Das Betriebssystem trägt die Port zu Port Zuordnung in die Tabelle des Host-TCP/IP-Stack ein.
	- der Host (OS) leitet so die IP-Pakete auf der Network- und Transport-Layer (ISO-OSI) an den Container weiter.

### Container und cgroups 

- Durch cgroups können die Resourcen CPU und RAM für Container beschränkt werden. Diese Beschränkungen nennt man quotas.
- Beispiele:
	- **CPU Quotas**: Begrenzen, wie viel CPU-Zeit ein Container maximal nutzen darf.
	- **Memory Quotas**: Legen fest, wie viel RAM ein Container verwenden kann, bevor er gestoppt oder eingeschränkt wird.
	```shell
	docker run --memory="512m" --cpus="1.5" <image>
	```

- cgroups können auch andere Ressourcen wie I/O und Netzwerkbandbreite Einschänken also Quotas erteilen.


---

# Dockerfile

Das **Dockerfile** dient als Bauplan, um ein **Image** zu erstellen. Der Prozess läuft folgendermaßen ab:

1. **Definition im Dockerfile:**
    - Das Dockerfile enthält Anweisungen, die festlegen, wie das Image aufgebaut werden soll (z. B. welches Basis-Image verwendet wird, welche Dateien hinzugefügt werden, welche Programme installiert werden sollen, usw.).

2. **Erstellung des Images:**    
    - Mit dem Befehl `docker build` wird das Dockerfile verarbeitet und ein Image erstellt.
    - Docker führt die Anweisungen im Dockerfile Schritt für Schritt aus und speichert die Ergebnisse in sogenannten **Layern**.

3. **Resultierendes Image:**    
    - Das fertige Image enthält das Dateisystem, das später vom Container genutzt wird, sowie alle in der Dockerfile definierten Anpassungen.

**Um ein Container zu starten, wird das Dockerfile nicht verwendet. Um ein Container zu starten, wird nur die fertige Image verwendet.**

--- 

# **Docker-Daemon und Docker-Client**

### Docker-Daemon

1. **Aufgabe des Docker-Daemons**
    - Der Docker-Daemon (`dockerd`) ist das zentrale Backend von Docker, das Container verwaltet, Images erstellt, Netzwerke konfiguriert und alle Docker-bezogenen Operationen steuert.

2. **Zusammenarbeit mit `containerd`**
    - Der Docker-Daemon verwendet **containerd**, eine Container-Laufzeit (Container Runtime), um Container zu starten, zu überwachen, zu beenden usw.
    - **containerd** ist ein eigenständiger Daemon, der speziell für die Verwaltung von Containern entwickelt wurde.

3. **Zusammenarbeit mit `runc`**
    - **containerd** verwendet `runc`, eine low-level Container-Laufzeit, um Container auf der Ebene des Betriebssystems zu erstellen und zu starten.
    - `runc` setzt die Spezifikationen des Open Container Initiative (OCI)-Standards um und erstellt Container durch direkte Interaktion mit den Linux-Kernel-Funktionen (z. B. cgroups, Namespaces).


### Docker-Client

1. **Aufgabe des Docker-Clients**
    - Der Docker-Client (`docker`-CLI oder API) dient als Benutzerschnittstelle zu dockerd.
    - Es kommuniziert mit dem Docker-Daemon über eine RESTful-API, die Befehle wie `docker run`, `docker build` oder `docker stop` ausführt.

2. **Zugriff auf den Docker-Daemon**    
    - Die Kommunikation zwischen Client und Daemon erfolgt in der Regel über einen UNIX-Socket (`/var/run/docker.sock`) oder einen TCP-Port (bei Remote-Zugriff).
    - Über die Shell oder Skripte kann der Benutzer den Docker-Client verwenden, um Container zu starten, Images zu erstellen usw.

### **Zusammenfassung**

##### Docker-Daemon:

- Startet und verwendet `containerd`.
    - `containerd` ist ein eigenständiger Daemon für die Verwaltung von Containern.
    - `containerd` verwendet `runc`, um Container zu erstellen und mit dem Linux-Kernel zu interagieren.

##### Docker-Client:

- Bietet Zugriff auf den Docker-Daemon über die Shell oder REST-API.
- Ist die Benutzeroberfläche, um Docker-Befehle auszuführen.