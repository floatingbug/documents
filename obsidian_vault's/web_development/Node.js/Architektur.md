# Bestandteile von Node
### V8
### Libuv
### Core Modules

### C++ Bindings

### Node API

### Externe Abhängigkeiten
##### http-parser
##### c-ares
##### OpenSSL
##### zlib

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

---

# Libuv (Event Loop)
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
Wird im Call Stack setTimeout aufgerufen, wird diese Funktion nicht im Call Stack ausgefürht, denn setTimeout gehört nicht zu JavaScript, setTimeout gehört zu Node und wird durch die Node API aufgerufen. Die Event Loop fügt setTimeout in die Event-Queue. Ist setTimeout als Nächstes an der Reihe, wird setTimeout von der Event Loop zur Ausführung gebracht, wobei die Ausführung dann nicht auf dem Call Stack von V8 ausgefürht wird, sondern von einem [[Worker Thread]].
Ist die Ausführung von setTimeout beendet, wird die Callback-Funktion von setTimeout durch die Event Loop in die Callback-Queue gebracht. Ist der Call-Stack Frei, wird die Callback-Funktion durch die Event Loop auf den Call-Stack gebracht und ausgefürht.

Ist der Call Stack und die Event Queue leer, wird Node beendet.
Damit Node nicht beendet wird, darf die Event Queue nicht leer sein. Beispielsweise wird die Event Queue niemals leer sein, wenn ein HTTP-Server gestartet wurde.

Node umschließt jeglichen JavaScript Code in eine Funktion.
Beispiel: Führt man mit Node eine Datei aus, die nur console.log([[arguments]]) als Code enthält, werden alle Argumente, die der Funktion übergeben wurden, angezeigt. 
Die Datei die Node Ausführt wird also in einer Funktion eingebettet und diese Funktion führt den JavaScript Code aus.

Dadurch das jede Datei mit JavaScript code innerhalb einer umgebenen Funktion steht, sind Variable und Methoden wie exports, require usw. im JavaScript Code verfügbar. Diese Methoden und Variablen sind Argumente der umgebenen Funktion.

### 5 Schritte die die require Funktion macht, wenn eine Datei geladen wird
##### Erster Schritt:
Lokalisieren der Datei im Dateisystem des Betriebssystems.

##### Zweiter Schritt:
Der Inhalt der Datei wird in den Arbeitsspeicher geladen.

##### Dritter Schritt:
Der Inhalt der Datei wird von der umgebenden Funktion eingeschlossen.

##### Vierter Schritt:
Der Inhalt der Datei wird von V8 evaluiert. Alle Funktionen und Variablen sind dann dort verfügbar, in der die Datei mit require importiert wurde.

##### Fünfter Schritt:
Der evaluierte Inhalt wird cached.
- Dadurch werden die 5 Schritte beim nächsten laden dieser Datei (require) nicht mehr benötigt.