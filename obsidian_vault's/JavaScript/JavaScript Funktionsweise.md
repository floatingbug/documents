# Unterschied Call-Stack und Execution Thread

### Der Call Stack ist eine Struktur, die den Zustand von Funktionsaufrufen speichert.

- Eine **Datenstruktur**, die verfolgt, welche Funktionen aufgerufen und noch nicht abgeschlossen sind.
- Wird von der **JavaScript-Engine** (z. B. V8 in Chrome und Node.js) verwaltet.
- Wenn eine Funktion ausgeführt wird, wird sie auf den Stack gelegt; wenn sie abgeschlossen ist, wird sie entfernt.

### Der Execution Thread ist der eigentliche Prozess, der den Code im Call Stack ausführt.

- Der **Thread**, auf dem der JavaScript-Code tatsächlich **ausgeführt** wird.
- JavaScript ist **single-threaded**, d. h., es gibt **nur einen Haupt-Thread**, der Code ausführt.
- Dieser Thread arbeitet eng mit dem **Call Stack** zusammen, um Code sequenziell abzuarbeiten.

---

# Global Executen Context

Wenn eine JavaScript-Datei geladen wird, wird der Global Executen Context (GEC) erzeugt.
Das ist der Hauptkontext, indem der gesamte Code der Datei ausgeführt wird.

**Der Glocal Executen Context (GEC) besteht aus zwei Teilen: Memory und Code** 

**Memory:**

- **Variablen mit `var`**: Diese werden beim Erstellen des Execution Contexts im Speicher platziert und zunächst mit dem Wert **`undefined`** versehen.
- **Variablen mit `let` oder `const`**: Diese werden ebenfalls „gehoisted“, aber bleiben in einem „temporal dead zone“-Zustand (TDZ). Das bedeutet, sie sind zwar im Speicher, aber es wird ein Fehler geworfen, wenn man versucht, auf sie zuzugreifen, bevor sie explizit initialisiert wurden.
- **Funktionen**: Funktionsdeklarationen werden komplett „gehoisted“, d.h. sie stehen während der gesamten Laufzeit zur Verfügung, unabhängig davon, wo sie im Code definiert sind.

**Code:**

- Der Code aus der JavaScript-Datei wird in den Code-Bereich des GEC geparst.
- Der Code der Funktionen wird nicht in den Code-Bereich kopiert, stattdessen wird eine Referenz auf den Memory-Bereich des GEC geparst, in dem die Funktion liegt.

**Wichtig: Der GEC befindet sich im Callstack. Immer wenn eine Funktion aufgerufen wird, wird ein EC erstellt und dieser wird auf den Callstack gelegt.**

**Callstack:**

- Durch den Callstack weiß die JS-Engine, welche Funktion sie als nächstes ausführen soll und welchen sie aktuell ausführen soll (den obersten EC im Callstack).
- wenn eine Funktion **`b`** innerhalb einer Funktion **`a`** aufgerufen wird, speichert der **Call Stack** den **Rückkehrpunkt**, also die Stelle in **`a`**, an der die JavaScript-Engine die Ausführung fortsetzen soll, nachdem **`b`** abgeschlossen ist. Dieser Rückkehrpunkt ist wichtig, um den Programmfluss korrekt zu verwalten.

---

# Ausführung des Codes

Die JavaScript-Engine führt den Code im Code-Bereich des GEC Zeile für Zeile aus.


Beispiel anhand einer Datei main.js:
```js
let n = 2;

function square(num){
	let ans = num * num;
	return ans;
}

let square2 = square(n);
let square4 = square(4);
```

![[executenContext.png]]

---

# Asynchrone Operationen

- Ein asynchroner Aufruf wie `setTimeout()`, `fetch()`, oder `fs.readFile()` wird an eine Web API (im Browser) oder an `libuv` (in Node.js) übergeben. Dort wird dann die Asynchrone Operation, bspw. eine Funktion die in C geschrieben wurde, in einem separaten Thread ausgeführt.
- Sobald das Betriebssystem oder die API die Aufgabe fertig hat, **legt es den zugehörigen Callback in die richtige Warteschlange (Queue).**
- Wenn der **Call Stack leer** ist, nimmt die Event Loop einen wartenden Callback aus einer der Queues und schiebt ihn in den Call Stack zur Ausführung.

### Queues

- Die Queues (z. B. **Microtask Queue**, **Task Queue**) sind separate Datenstrukturen, die von der JavaScript-Engine oder `libuv` verwaltet werden.
- Sie enthalten Callbacks, die auf ihre Verarbeitung warten.