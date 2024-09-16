
# Global Executen Context

Wenn eine JavaScript-Datei geladen wird, wird der Global Executen Context (GEC) erzeugt.
Das ist der Hauptkontext, indem der gesamte Code der Datei ausgeführt wird.

**Der Glocal Executen Context (GEC) gesteht aus zwei Teilen: Memory und Code** 

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

