# Unterschied Call-Stack und Main Thread

##### Der **Call Stack** (Stack-Frames) dient ausschließlich dazu, die **Ausführung** zu organisieren:

**Er sagt der Engine:**
1. Welche Funktion gerade ausgeführt wird
2. Welche lokalen Variablen diese Funktion hat
3. Wo die Ausführung nach einem Funktionsaufruf weitergeht (Return-Adresse)
4. Welcher Kontext (Scope Chain) zu dieser Funktion gehört
5. Welche Argumente an die Funktion übergeben wurden

💡 **Der Stack ist _kein_ Speicher für dauerhafte Werte.**  
Alles Dauerhafte liegt im Heap.

##### Auf dem Main Thread führt die JS-Engin den Code aus

- Der **Thread**, auf dem der JavaScript-Code tatsächlich **ausgeführt** wird.

---

# Global Executen Context

Wenn eine JavaScript-Datei geladen wird, wird der Global Executen Context (GEC) erzeugt.
Das ist der Hauptkontext, indem der gesamte Code der Datei ausgeführt wird.

Der GEC ist eine Spezifikation die beschreibt, welche Daten existieren müssen, damit eine .js Datei ausgeführt werden kann.
Die V8-Engine legt diese Information real als Heap-Objekte in verschiedenen Heap-Strukturen an.
Wurde der GEC (also, alle notwendigen Heap-Objekte) erstellt, wird ein Stackframe auf den Stack gelegt um die Ausführung zu überwachen.

# Ablauf beim Laden einer `.js`-Datei in V8

1. **Parsing**
    - V8 liest den Quellcode der Datei.
    - Es wird ein **AST (Abstract Syntax Tree)** erzeugt, der die Struktur des Codes beschreibt.
2. **Kompilierung**
    - Aus dem AST erzeugt V8:
        - **Bytecode** für den Interpreter
    - Dieser Bytecode wird im **Heap** abgelegt.
3. **Funktionen**
    - Jede Funktion wird als **`JSFunction`-Objekt** im Heap gespeichert.
    - Funktionen enthalten Referenzen auf:
        - Bytecode
        - Lexical Environment (Scope / Variablen)
4. **Referenzen im Bytecode**
    - Bytecode enthält **Zeiger auf Heap-Objekte** (z. B. Variablen, Funktionen, Objekte).
    - Dadurch kann der Bytecode beim Ausführen auf alles zugreifen, was im Heap liegt.
5. **Ausführung**
    - V8 erzeugt einen **Stackframe für den Global Execution Context (GEC)**.
    - Der Stackframe enthält:
        - Pointer auf Bytecode
        - Pointer auf Lexical Environment / Context
        - Temporäre Werte / Operanden
6. **Interpretation**
    - V8 führt den Bytecode aus.
    - Bei Funktionsaufrufen werden neue Stackframes erzeugt, die auf den GEC gelegt werden.
    - Rückgabewerte und temporäre Variablen werden im Stack verwaltet, permanente Daten im Heap.

---

# Ausführung des Codes

- **Ignition (Interpreter)** liest Bytecode → ruft C++-Funktionen auf → CPU führt diese aus.
- **TurboFan (JIT)** übersetzt hot Bytecode in Maschinencode → CPU führt Maschinencode direkt aus.

---

# Asynchrone Operationen

- Wenn ein asynchroner Aufruf wie `setTimeout()`, `fetch()`, oder `fs.readFile()` ausgeführt wird, ruft node eine libuv Funktion auf.
- libuv führt die aufgabe auf einem thread aus dem thread pool durch.
- Nach fertigstellung speichert libuv ein Event mit dem Ergebnis in eine queue in der Event Loop.
- Node erhält das Event von einer libuv Funktion und ruft eine V8 Funktion auf und übergibt ihr als Argument das Event.

### Queues

- Die Queues (z. B. **Microtask Queue**, **Task Queue**) sind separate Datenstrukturen, die von der JavaScript-Engine oder `libuv` verwaltet werden.
- Sie enthalten Callbacks, die auf ihre Verarbeitung warten.