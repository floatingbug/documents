
### Wofür braucht man Streams

- Wenn ein Sender mehr Daten sendet als der Prozess beim Empfänger verarbeiten kann, werden die Daten in einem **Buffer** gespeichert und erst wenn dieser voll ist, 

![[Stream 1|800]]

---

### Kernel- und Benutzer-Buffer

##### **1. Benutzer-Buffer (User-Space Buffer):**

- **Beschreibung:**
    - Der Speicherbereich im User-Space, in den ein Prozess die Daten kopiert, die er aus dem Kernel-Buffer liest.
    - Dieser Buffer wird typischerweise vom Prozess selbst angelegt und verwaltet.
    - Beispiele:
        - Ein Array oder ein `Buffer`-Objekt in Node.js.
        - Ein byte-Array in C oder eine ähnliche Datenstruktur.
- **Funktion:**
    - Ermöglicht dem Prozess, die empfangenen Daten weiterzuverarbeiten, zu speichern oder zu manipulieren.

##### **2. Unterschied zum Kernel-Buffer:**

- **Kernel-Buffer:**
    
    - Ein Speicherbereich im Kernel-Space, in dem Daten zwischengespeichert werden, die z. B. über Netzwerk- oder IO-Operationen empfangen wurden.
    - Wird vom Betriebssystem verwaltet und dient als Schnittstelle zwischen Hardware und Prozessen.
- **Benutzer-Buffer:**
    
    - Ein vom Prozess verwalteter Speicherbereich im User-Space.
    - Hier werden die Daten abgelegt, nachdem sie mit Systemaufrufen wie `read()` oder `recv()` aus dem Kernel-Buffer gelesen wurden.

---

### Prinzip eines Streams

##### **1. Flusskontrolle (Flow Control)**

- **Beschreibung:**  
    Der Sender wird pausiert, bis der Prozess genügend Daten aus dem Kernel-Buffer gelesen hat, um Platz für neue Daten zu schaffen.
- **Wie es funktioniert:**
    - Im Fall von TCP (z. B. bei einem Videoplayer, der Daten über das Internet erhält) wird das sogenannte **Sliding-Window-Protocol** verwendet. Der Empfänger meldet dem Sender regelmäßig, wie viel Platz im Buffer verfügbar ist. Das geschieht auf Layer 4 (Transport-Layer).
    - Wenn der Buffer voll ist, teilt der Empfänger, auf Layer 4 dem Sender mit, dass er keine weiteren Daten senden soll. Der Sender stoppt, bis wieder Platz verfügbar ist, also bis der Prozess durch einen Systemaufruf wie read() oder recv() Daten aus dem Kernel-Buffer gelesen und in den Speicherbereich des Prozesses (Benutzer-Buffer) geschrieben hat .

##### **2. Datenverlust**

- **Beschreibung:**  
    In manchen Fällen, wie bei UDP, gibt es keine Flusskontrolle. Wenn der Buffer voll ist, gehen die neuen Datenpakete verloren.
- **Beispiele:**
    - UDP wird oft in Echtzeitanwendungen verwendet, bei denen Datenverlust akzeptabel ist (z. B. bei Livestreaming oder Videokonferenzen).
    - Datenpakete, die verloren gehen, werden nicht zwischengespeichert, sondern einfach verworfen.

##### **3. Erweiterung des Buffers**

- **Beschreibung:**  
    Einige Anwendungen oder Systeme können den Buffer dynamisch erweitern, um weitere Daten aufzunehmen.
- **Wie es funktioniert:**
    - Der Speicherbedarf des Buffers wird erhöht, indem zusätzliche RAM-Ressourcen reserviert werden.
    - Dies ist jedoch nicht immer möglich, da Speicherressourcen begrenzt sind, und kann zu einer erhöhten Speicherlast führen.

##### **4. Blockierung oder Rückstau**

- **Beschreibung:**  
    Wenn der Buffer voll ist und keine Flusskontrolle implementiert ist, blockiert der Prozess, der versucht, Daten in den Buffer zu schreiben, bis Platz verfügbar wird.
- **Beispiele:**
    - In Node.js Streams kann ein `write()`-Aufruf `false` zurückgeben, was bedeutet, dass der Schreibvorgang pausiert wurde, bis der Buffer Platz geschaffen hat.
    - Der Schreibprozess wird erst fortgesetzt, wenn der Buffer entlastet wurde.

##### **Für deinen Videoplayer:**

1. **Empfangsdaten speichern:**  
    Der Videoplayer speichert die Daten in einem dedizierten Empfangsbuffer.
2. **Verarbeitung:**
    - Während der Videoplayer noch alte Daten verarbeitet, könnten neue Daten entweder:
        - Im Empfangsbuffer warten, bis sie verarbeitet werden.
        - Verloren gehen, wenn der Empfangsbuffer (z. B. bei UDP) keinen Platz mehr hat.
        - Den Empfang pausieren, wenn TCP verwendet wird und Flusskontrolle greift.

##### **Fazit:**

Wenn der Buffer voll ist, werden neue Daten **entweder zurückgehalten (TCP), verworfen (UDP) oder der Buffer wird erweitert** (je nach Implementierung). Ein Videoplayer versucht üblicherweise, über TCP zu arbeiten, da er Datenverluste minimieren möchte.

---

### Buffer flushen

Wenn ein buffer geflushed wird, werden die Daten in ihm sofort weiter gesendet, auch wenn der buffer noch nicht voll ist.

Das OS flusht den Buffer in folgenden Fällen:

1. **Automatisch**: Wenn der Buffer voll ist.
2. **Explizit**: Wenn du manuell flushst (z. B. mit `end()`, `flush()`).
3. **Beim Schließen**: Wenn der Stream geschlossen wird, z. B. eine Datei oder ein Netzwerk-Socket.
4. **Zeitgesteuert**: In einigen Fällen auch durch festgelegte Zeitintervalle.

---

### Arten von Streams

Es gibt hauptsächlich vier Arten von Streams in Node.js:

1. **Readable Streams**: Streams, von denen Daten gelesen werden können. Beispiele sind das Lesen von Dateien oder das Empfangen von HTTP-Anfragen.
    
2. **Writable Streams**: Streams, in die Daten geschrieben werden können. Ein Beispiel ist das Schreiben von Daten in eine Datei oder das Senden von Daten als HTTP-Antwort.
    
3. **Duplex Streams**: Streams, die sowohl lesbar als auch beschreibbar sind. Ein Beispiel ist eine TCP-Verbindung, über die Daten gesendet und empfangen werden können.
    
4. **Transform Streams**: Spezielle Streams, die die Daten transformieren, während sie durch den Stream fließen. Ein Beispiel ist ein Stream, der Daten von einem Format in ein anderes umwandelt (z.B. Komprimierung oder Verschlüsselung).