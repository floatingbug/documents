
# Ein Prozess

Wenn eine Applikation mit node gestarted wird, entsteht ein einzelner Prozess mit mehreren threads und einem Main Thread.
In diesem Main Thread ruft Node Funktionen aus den dynamischen Bibliotheken libuv und V8 auf.


# Threads im node Prozess

### Main thread

Der Main Thread führt dauerhaft nur die libuv-Eventloop-Schleife aus.  
libuv ruft in dieser Schleife Node-Funktionen auf, und Node ruft V8-Funktionen auf.

##### Wenn Node startet:
1. Node initialisiert libuv
2. Node initialisiert V8
3. Node führt bspw.  `main.js` einmal aus (synchron)
	main.js und alle per require geladenen Dateien werden beim Start einmal synchron ausgeführt, um ihre Module Execution Contexts zu erzeugen und Module-Objekte zu erstellen.
4. Node ruft **einmal** libuv auf:
5. Ab jetzt wird die Event Loop Schleife ausgeführt.

### Libuv thread pool

Wird ein Node Prozess gestartet, erstellt  libuv ein thread pool im Prozess, also mehrere threads. Diese threads sind für asynchrone Operationen gedacht.

### Worker threads

Vom Entwickler **explizit gestartet**, um **rechenintensiven JavaScript-Code** parallel auszuführen, also echtes Multithreading **auf JS-Ebene**.
Führt **eigenen JS-Code** in einem separaten V8-Isolate (ein thread in dem Funktionen aus der V8 Bibliothek aufgerufen werden) aus.
#### **Weitere V8-interne Threads**

V8 selbst verwendet intern **zusätzliche Threads**, aber **nicht** zur Ausführung des Codes:

- **Compiler-Threads** (für JIT-Optimierung)
- **Garbage Collector-Threads**
- **Profiler / Debugger-Threads**

Sie führen **keinen JavaScript-Code** aus. Sie werden automatisch von V8 gemanagt und beeinflussen nur Performance/Optimierungen

---

# V8 Strukturen

In der V8 Bibliothek gibt es funktionen, um eine struktur zu erstellen die notwendig ist, damit JS-Code ausgeführt wird. Im folgenden werden diese Strukturen erläutert.

### Call Stack

**Speichert temporär in Stackframes:**
- aktive Funktionsaufrufe
- lokale Variablen (nicht alle Variablen!)
- Rücksprungadressen
- Ausführungsstatus

**LIFO-Prinzip:**  
Wird Funktion A ausgeführt und ruft B auf, liegt zuerst der Stackframe von B oben, B wird entfernt, bevor A fortgesetzt wird.

### Heap

Der Heap speichert **alle dauerhaft existierenden Daten**, also alles, was **nicht** in lokalen Funktions-Stackframes liegt.

**Speichert:**
- Objekte
- Arrays
- Funktionen
- Closures
- Lexical Environments (z. B. den Module Execution Context)
- globales Objekt
- interne V8-Strukturen

---

# Ablauf einer Node Anwendung

### Start der Anwendung

- Wenn Node bspw. mit der datei main.js gestartet wird, umschließt Node den gesamten code der Datei mit einer Wrapper Funktion. 
- Node ruft über die V8-API eine Funktion auf mit der Wrapperfunktion als Argument.
- Der GEC wird von V8 erzeugt.
- Node umschließt jetzt alle weiteren .js-Dateien, die mit require geladen werden, mit der Wrapper Funktion.
- Node lässt alle diese Funktionen durch V8 ausführen, damit V8 die Module-Objekte erzeugen kann.
- Node registriert bei libuv **C++-Callback's**
- Diese Node-C++-Callbacks enthalten intern **eine Referenz auf die JS-Callback**, die V8 im JS-Heap gespeichert hat.
- libuv selbst kennt nur die Node-C++-Callback, **nicht die JS-Funktion direkt**.
- Sobald libuv ein Event fertigstellt, ruft es die Node-C++-Callback auf, die dann über V8 die JS-Callback ausführt.

### Event Loop Phasen

Wenn die Node Anwendung mit der Initialisierung fertig ist, wird nur noch die Event Loop als Schleife ausgeführt.

In jeder Phase wird geprüft, ob in einer Queue ein Event vorhanden ist.
Wenn ein Event vorhanden ist, dann geschiet folgendes:
- libuv ruft für das Event die passende callback auf, die von Node bei libuv registriert wurde.
- Die callback hat eine Referenz auf die js-callback im js-Heap.
- Die callback ruft über eine V8-API mit der Referenz die js-callback auf.
- JS-code wird auf dem Main Thread ausgeführt.
- Wenn der JS-code ausgeführt wurde, wird die nächste Phase in der Event Loop behandelt.

| Phase                 | Aufgabe / Queue                                                                                                             |
| --------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| **timers**            | Abarbeitung von `setTimeout` und `setInterval` Callbacks, deren Zeit abgelaufen ist                                         |
| **pending callbacks** | Ausführung von system-Callbacks, z. B. TCP-Errors oder `fs`-Callbacks, die direkt vom Betriebssystem kommen                 |
| **idle, prepare**     | Interne Vorbereitung, Warteschlangen für die nächste Phase werden initialisiert                                             |
| **poll**              | Der Kern der Event Loop: wartet auf neue I/O-Events, führt fertige I/O-Callbacks aus; ggf. blockiert, bis Events eintreffen |
| **check**             | Ausführung von `setImmediate` Callbacks                                                                                     |
| **close callbacks**   | Aufräumen von geschlossenen Handles / Sockets, z. B. `socket.on('close', ...)`                                              |

---

# Wrapper Funktionen

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
- Variablen wird ein Wert zugewiesen.

##### Fünfter Schritt:
Der evaluierte Inhalt wird cached.
- Dadurch werden die 5 Schritte beim nächsten laden dieser Datei (require) nicht mehr benötigt.

---
