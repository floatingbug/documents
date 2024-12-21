
### Wofür braucht man Streams



### Was ist ein Stream?

1. **Datenfluss**: Ein Stream repräsentiert einen kontinuierlichen Fluss von Daten, der über die Zeit empfangen oder gesendet werden kann. Dies kann in Form von Bytes, Text oder anderen Datentypen sein. Bei einem Stream fließen ständig Daten in einem Speicherort z.B. ein socket, dass wäre dann ein schreibender Stream oder Daten fließen ständig aus einem Speicherort in ein Prozess z.B. von einem socket, dass wäre dann ein lesender Stream.
    
2. **Eingabe- und Ausgabeoperationen**: Streams werden häufig für die Eingabe- und Ausgabeoperationen verwendet, wie z.B. das Lesen von Dateien, das Empfangen von Daten über ein Netzwerk oder das Schreiben von Ausgaben in eine Datei.
    
3. **Pufferung**: Streams können Daten in Batches (sogenannten „Puffern“) verarbeiten, was bedeutet, dass nicht die gesamte Datenmenge auf einmal gelesen oder geschrieben wird. Dies ist besonders nützlich für große Datenmengen.
    

### Prinzip eines Streams

**Beispiel beim schreiben in eine Datei:**
1. Prozess sendet Daten an OS.
2. OS Speichert Daten in einen buffer.
3. Ist der buffer voll, schreibt das OS die Daten in die Datei.
4. Sendet der Prozess weitere Daten, dann weiter bei Punkt 2.

### Buffer flushen

Wenn ein buffer geflushed wird, werden die Daten in ihm sofort weiter gesendet, auch wenn der buffer noch nicht voll ist.

Das OS flusht den Buffer in folgenden Fällen:

1. **Automatisch**: Wenn der Buffer voll ist.
2. **Explizit**: Wenn du manuell flushst (z. B. mit `end()`, `flush()`).
3. **Beim Schließen**: Wenn der Stream geschlossen wird, z. B. eine Datei oder ein Netzwerk-Socket.
4. **Zeitgesteuert**: In einigen Fällen auch durch festgelegte Zeitintervalle.

### Arten von Streams

Es gibt hauptsächlich vier Arten von Streams in Node.js:

1. **Readable Streams**: Streams, von denen Daten gelesen werden können. Beispiele sind das Lesen von Dateien oder das Empfangen von HTTP-Anfragen.
    
2. **Writable Streams**: Streams, in die Daten geschrieben werden können. Ein Beispiel ist das Schreiben von Daten in eine Datei oder das Senden von Daten als HTTP-Antwort.
    
3. **Duplex Streams**: Streams, die sowohl lesbar als auch beschreibbar sind. Ein Beispiel ist eine TCP-Verbindung, über die Daten gesendet und empfangen werden können.
    
4. **Transform Streams**: Spezielle Streams, die die Daten transformieren, während sie durch den Stream fließen. Ein Beispiel ist ein Stream, der Daten von einem Format in ein anderes umwandelt (z.B. Komprimierung oder Verschlüsselung).