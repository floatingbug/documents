Wenn Daten an die Netzwerkkarte (NIC, Network Interface Card) ankommen, durchläuft das Paket eine Reihe von Schichten und Komponenten, bevor es das Betriebssystem erreicht und an die entsprechenden Anwendungen weitergeleitet wird. Hier ist eine kurze Übersicht des Ablaufs:

### 1. **Physikalische Schicht (Layer 1)** und **Datenverbindungsschicht (Layer 2) - Netzwerkkarte (NIC)**:

- **Datenempfang**: Wenn Daten (z. B. ein Ethernet-Frame oder ein WLAN-Paket) vom Netzwerk ankommen, empfängt die Netzwerkkarte diese. Die Daten werden auf der **physikalischen Schicht (Layer 1)** empfangen, z. B. über Kupferkabel (Ethernet) oder drahtlos (Wi-Fi).
- **Rahmenverarbeitung**: Die Netzwerkkarte verarbeitet diese Daten auf der **Datenverbindungsschicht (Layer 2)**, wo sie in Frames (z. B. Ethernet-Frames) organisiert sind. Die Netzwerkkarte überprüft die Ziel-MAC-Adresse und erkennt, ob das Paket für sie bestimmt ist.

### 2. **Verarbeitung auf der Netzwerkkarte**:

- **Dekapselung auf Layer 2**: Die Netzwerkkarte prüft den Ethernet-Header und extrahiert die Payload (die eigentlichen Nutzdaten des Pakets), wenn die MAC-Adresse des Frames mit der Adresse der Netzwerkkarte übereinstimmt.
- **MAC-Adresse und Weiterleitung**: Falls es sich um ein Broadcast- oder Multicast-Paket handelt (z. B. ARP oder DHCP), könnte es an alle angeschlossenen Geräte weitergegeben werden. Bei einem gezielten Paket wird es an den Kernel des Betriebssystems weitergeleitet.

### 3. **Übertragung an den Kernel (Betriebssystem)**:

- **Interrupt**: Sobald die Netzwerkkarte das Paket erfolgreich verarbeitet hat, sendet sie einen **Interrupt** an die CPU. Dies bedeutet, dass die Netzwerkkarte dem Betriebssystem mitteilt, dass neue Daten empfangen wurden und verarbeitet werden müssen.
- **Daten an den Kernel weiterleiten**: Der Interrupt führt dazu, dass der Kernel auf die Netzwerkkarte zugreift und die empfangenen Daten in den **Netzwerk-Stack** des Betriebssystems weiterleitet. Der Kernel nutzt hierfür Treiber, die für die Netzwerkkarte zuständig sind.

### 4. **Verarbeitung im Netzwerk-Stack des Betriebssystems**:

- **Netzwerk-Stack**: Das Betriebssystem verwendet einen **TCP/IP-Stack** (Internet Protocol Stack), der aus mehreren Schichten besteht:
    - **Link Layer (Layer 2)**: Hier wird das Paket überprüft und auf die obere Schicht übergeben.
    - **Internet Layer (Layer 3)**: Das IP-Paket wird dekodiert. Die **Ziel-IP-Adresse** wird überprüft, und das Paket wird der entsprechenden **Protokollschicht (z. B. TCP oder UDP)** weitergeleitet.
    - **Transport Layer (Layer 4)**: Hier wird überprüft, ob das Paket für einen laufenden TCP- oder UDP-Stream bestimmt ist, und es wird der jeweiligen Anwendung zugewiesen.

### 5. **Übermittlung an Anwendungen**:

- **Socket-API**: Sobald der Transport-Layer (z. B. TCP) die Daten verarbeitet hat, werden sie über die **Socket-API** an die richtige Anwendung weitergegeben.

### Kommunikation zwischen Netzwerkkarte und Betriebssystem:

1. **Datenlink-Layer**:
    
    - Die **Netzwerkkarte** empfängt Daten im **Datenlink-Layer** (Layer 2) des OSI-Modells. Sie kümmert sich um die Übertragung von Frames, die MAC-Adressen enthalten.
    - Diese Frames sind jedoch nicht direkt an die **IP-Adressen** gebunden, sondern sind auf der **Verbindungsebene** (Layer 2) von Gerät zu Gerät relevant, um sicherzustellen, dass Daten über ein lokales Netzwerk korrekt zugestellt werden.
2. **Datenübergabe von der Netzwerkkarte an das Betriebssystem**:
    
    - Nachdem die Netzwerkkarte (NIC) die Frames auf der Datenlink-Schicht empfangen hat, extrahiert sie die Daten (z. B. **IP-Pakete**) und reicht sie an die **Transport-Schicht (Layer 3)** des Betriebssystems weiter.
    - Dies geschieht über sogenannte **Interrupts**. Wenn die Netzwerkkarte Daten empfängt, benachrichtigt sie das Betriebssystem über einen **Interrupt**. Der Interrupt signalisiert dem OS, dass neue Daten verfügbar sind, und der OS-Treiber für die Netzwerkkarte übernimmt die Verantwortung für das Verarbeiten der Daten.
    - Der Treiber der Netzwerkkarte verwaltet die Kommunikation zwischen der Netzwerkkarte und dem Betriebssystem und übergibt die empfangenen Pakete an die **IP-Schicht (Layer 3)** des OS.
3. **Übergabe der Daten an die IP-Schicht**:
    
    - Nachdem das Betriebssystem (via den Treiber) das Frame vom Datenlink-Layer erhalten hat, extrahiert es das IP-Paket und leitet es an die **Netzwerkschicht (Layer 3)** weiter, wo die **IP-Adresse** für Routing und Adressierung verwendet wird.
    - Falls es sich um ein **TCP/IP**-Paket handelt, wird es anschließend an die **Transport-Schicht (Layer 4)** weitergereicht, wo es dann auf Anwendungen zugreift (z. B. via HTTP, FTP usw.).