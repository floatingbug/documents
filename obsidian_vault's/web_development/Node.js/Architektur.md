| Bereich                       | Thread-Verhalten             | Bemerkung                                           |
| ----------------------------- | ---------------------------- | --------------------------------------------------- |
| **Dein JavaScript-Code (V8)** | 🧵 **Single-Threaded**       | Läuft komplett auf einem Thread                     |
| **libuv Thread-Pool (Node)**  | 🧵🧵🧵🧵 **Mehrere Threads** | Für I/O, Crypto, etc.                               |
| **V8 intern**                 | 🧵🧵 **Hintergrund-Threads** | GC, JIT usw.                                        |
| **Worker Threads (optional)** | 🧩 **Separate Isolates**     | Echte Parallelität, aber getrennte Speicherbereiche |

---

# V8 (JavaScript Engine)
### Call Stack
**Zuständig für Temporäre Speicherung von:** Funktionsaufrufen, Methoden und Variablen.
Beinhaltet alle Funktionen und Variablen die aktuell Ausgeführt werden.
**LIFO-Prinzip:** Ruft Funktion a die Funktion b auf, wird erst Funktion b vom Stack entfernt, dann erst Funktion a.

### Heap
Speichert Objekte auf die vom Stack aus zugegriffen werden kann.
Der Speicher vergrößert sich, wenn Objekte hinzugefügt werden und verkleiner sich, wenn sie wieder entfernt werden.
Dieser Bereich des Speichers ist für die Verwaltung von dynamisch zugewiesenen Daten wie Objekten und Arrays zuständig.

### Integration in node.js
Die V8 Engine wird nach Spezifikation und mit Hilfe von Funktionen einer speziellen Bibliothek in das Programm node.js implemntiert.
Der V8 Engine wird zusätzliche Funktionalität im Programmcode zugefügt, damit API-Aufrufe für Operationen gemacht werden können, die in Worker-Threads ausgeführt werden.

---

# Libuv (Event Loop)

### libuv verbindet Node.js mit dem Betriebssystem
Node.js nutzt die dynamische Bibliothek, um mit dem Betriebssystem zu kommunizieren. libuv verwaltet beispielsweise sockets, indem es Funktion wie listen() oder accept() von glibc aufruft.

### Event Loop
Node ruft Funktionen der dynamischen Bibliothek Libuv beim Start auf, um die Event Loop zu erstellen. Außerdem verwendet Node Funktionen der Bibliothek, um die Event Loop zu verwalten.

Die Event Loop wird immer dann auf dem Call Stack der V8 Engine Ausgeführt, wenn der Call Stack leer ist.
Wenn Die Event Loop ausgeführt wird, überprüft sie bspw. ob in der Callback-Queue Callback-Functions vorhanden sind, wenn ja, bringt die Event Loop eine Callback-Function auf dem Call Stack zur ausführung.

Für Ereignisse können Callback-Functions Registriert werden, bspw. socket.on("data", callback).
Diese Ereignisse werde in der Event-Queue gespeichert.
Die Event Loop entnimmt diese Ereignisse und ruft die für die Ereignisse registrierten Callback-Functions auf.
Ereignisse können vom Betriebssystem an Node.js gesendet werden, bspw. "data" wenn Daten in einem Socket vorhanden sind. Wenn das Betriebssystem das "data" Ereignis an Node sendet, wird es in der Event-Queue gespeichert.
Ereignisse können auch in der V8 Engine ausgelöst werden, wenn bspw. eine Node-API-Funktion aufgerufen werden soll, sorgt der Aufruf von fs.readFile() (im Call Stack von V8) dafür, dass ein Ereignis in die Event-Queue gespeichert wird. wird dieses Ereignis dann von der Event Loop behandelt, wird readFile in einem Worker Thread ausgeführt.
### Node-API-Funktionen
Node-API-Funktionen sind mit C oder C++ geschrieben und verwenden die Libuv Bibliothek um auf Bitriebssystem-APIs zuzugreifen um bspw. Dateioperationen durchzuführen.


---

# Code Execution


Node umschließt jeglichen JavaScript Code in eine Funktion.
Beispiel: Führt man mit Node eine Datei aus, die nur console.log([[arguments]]) als Code enthält, werden alle Argumente, die der Funktion übergeben wurden, angezeigt. 
Die Datei die Node Ausführt wird also in einer Funktion eingebettet und diese Funktion führt den JavaScript Code aus.

Dadurch das jede Datei mit JavaScript code innerhalb einer umgebenen Funktion steht, sind Variable und Methoden wie exports, require usw. im JavaScript Code verfügbar. Diese Methoden und Variablen sind Argumente der umgebenen Funktion.

### 5 Schritte die die require Funktion macht, wenn eine Datei geladen wird
##### Erster Schritt:
Lokalisieren der Datei im Dateisystem des Betriebssystems.

##### Zweiter Schritt:
Der Module Execution Context (MEC) wird erstellt, siehe [[JavaScript Funktionsweise]].
##### Dritter Schritt:
Der gesamte Inhalt des Moduls wird in eine Funktion eingebettet, ähnlich einer **Immediately Invoked Function Expression (IIFE)**. Dadurch wird sichergestellt, dass die Variablen und Funktionen im Modul **lokal** sind und keinen Einfluss auf den globalen Scope haben.
##### Vierter Schritt:
Der Code-Bereich des MEC wird von der JS-Engine ausgeführt (evaluiert):
- Alle Funktionen die direkt im Module aufgerufen werden, werden ausgeführt.
- Variablen wird eine Wert zugewiesen.

##### Fünfter Schritt:
Der evaluierte Inhalt wird cached.
- Dadurch werden die 5 Schritte beim nächsten laden dieser Datei (require) nicht mehr benötigt.