Ein **Docker-Netzwerk** ist eine virtuelle Netzwerkumgebung, die Docker bereitstellt, um Container miteinander, mit dem Host und ggf. mit externen Netzwerken (z. B. dem Internet) zu verbinden. Es stellt sicher, dass Container miteinander kommunizieren können, unabhängig davon, ob sie auf dem gleichen Host oder in unterschiedlichen Umgebungen ausgeführt werden. Docker-Netzwerke ermöglichen außerdem eine logische Trennung von Diensten und Netzwerken.

---

### **Komponenten eines Docker-Netzwerks**

1. **Virtuelle Netzwerkschnittstelle (vNIC)**
    
    - Jeder Container verfügt über eine virtuelle Netzwerkschnittstelle (virtuelle Netzwerkkarte), die ihm erlaubt, mit anderen Containern und dem Host zu kommunizieren.
    - Diese Schnittstelle hat eine eigene IP-Adresse im Docker-Netzwerk und kann über das TCP/IP-Protokoll Daten senden und empfangen.
    - Schnittstelle im Container: Standardmäßig `eth0`.
2. **Bridge-Netzwerk**
    
    - Docker erstellt standardmäßig ein Bridge-Netzwerk (z. B. `docker0`) auf dem Host.
    - Es fungiert als virtueller Switch, der Container miteinander und mit dem Host verbindet.
    - Container innerhalb des gleichen Bridge-Netzwerks können sich direkt über IP-Adressen oder Container-Namen ansprechen.
3. **Netzwerk-Namespaces**
    
    - Docker isoliert die Netzwerkressourcen jedes Containers mithilfe von **Netzwerk-Namespaces**.
    - Jeder Namespace stellt einen unabhängigen TCP/IP-Stack bereit, einschließlich eigener IP-Adressen, Routingtabellen und Portnummern.
4. **NAT (Network Address Translation)**
    
    - Docker verwendet NAT-Regeln, um eingehende Anfragen vom Host an Container weiterzuleiten.
    - Beispiel: Wenn ein Port des Hosts an einen Container-Port weitergeleitet wird (`-p 8080:80`), verwendet Docker NAT, um die Verbindung korrekt zuzuordnen.
5. **Netzwerktreiber (Drivers)**
    
    - Docker verwendet Treiber, um unterschiedliche Netzwerkszenarien zu unterstützen:
        - **Bridge**: Container auf dem gleichen Host kommunizieren miteinander.
        - **Host**: Der Container teilt sich den Netzwerk-Stack mit dem Host.
        - **Overlay**: Ermöglicht die Kommunikation zwischen Containern auf verschiedenen Hosts.
        - **Macvlan**: Container erhalten direkte Zugriff auf das Netzwerk des Hosts mit einer eigenen MAC-Adresse.
6. **IP-Adressen und Subnetze**
    
    - Jeder Container in einem Docker-Netzwerk erhält eine private IP-Adresse aus einem bestimmten Subnetz, das für das Netzwerk definiert ist.
    - Docker verwaltet automatisch die Zuweisung der IP-Adressen, kann aber auch manuell konfiguriert werden.
7. **DNS-Auflösung**
    
    - Docker stellt einen internen DNS-Server bereit, um Container über ihre Namen zu finden.
    - Container können sich gegenseitig mit Namen ansprechen, anstatt IP-Adressen verwenden zu müssen.
8. **Routing und Weiterleitung**
    
    - Docker verwaltet die Routingtabellen, um den Datenverkehr zwischen Containern, dem Host und externen Netzwerken zu lenken.
    - Externe Verbindungen werden typischerweise über die NAT-Bridge geleitet.

---

### **Zusammenfassung der Architektur**

Ein Docker-Netzwerk besteht aus:

- **Virtuellen Netzwerkschnittstellen (vNIC)** für die Container.
- **Netzwerk-Namespaces** für die Isolation.
- **Bridge-Netzwerk** als Standard-Switch.
- **NAT-Regeln** für die Portweiterleitung.
- **IP-Adressen, Subnetze und DNS-Dienste** zur Adressierung und Namensauflösung.
- **Netzwerktreibern**, die verschiedene Netzwerkmodi bereitstellen.

Docker-Netzwerke bieten somit eine flexible und sichere Möglichkeit, Container und Anwendungen miteinander zu verbinden.