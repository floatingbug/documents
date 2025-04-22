
### Was ist ein Scope

Ein **Scope** definiert, wo Variablen zugänglich sind.

### Lexikalischer Scope

- Jede Funktion oder jeder Block (`{}`) hat einen eigenen Scope.
- Variablen, die innerhalb dieses Scopes definiert werden, sind nur in diesem Scope und in inneren Scopes zugänglich.

**Beispiel 1:**
Scope1 -> Scope2 -> Scope3.
In Scope1 befindet sich Scope2 und in Scope2 befindet sich Scope3.

Scope3 hat Zugriff auf Variablen in Scope2 und Scope1.
Scope2 hat Zugriff auf Variablen in Scope1 aber nicht in Scope3.
Scope1 hat nur auf seine eigenen Variablen Zugriff.


**Beispiel 2:**  
Jede Funktion hat ihren eigenen Execution Context. Wenn eine Funktion b innerhalb einer anderen Funktion a ausgeführt wird, wird ein neuer Execution Context für b erstellt. Der Execution Context von b hat Zugriff auf:

- Die Variablen und Parameter der inneren Funktion selbst.
- Die Variablen und Parameter der äußeren Funktion (über die sogenannte **Scope Chain**).
- Den globalen Scope, falls erforderlich.

### **Einfluss von Closures:**

Wenn die innere Funktion auch nach dem Ende der äußeren Funktion ausgeführt wird (z. B. durch Rückgabe der inneren Funktion), behält sie trotzdem Zugriff auf die Variablen der äußeren Funktion. Das nennt man **Closure**.

**Beispiel mit Closure:**
```javascript
function outerFunction() {
    let outerVar = "Ich bin eine Variable aus outerFunction";

    return function innerFunction() {
        console.log(outerVar); // Zugriff auf outerVar bleibt erhalten
    };
}

const myInnerFunction = outerFunction(); // outerFunction wird ausgeführt
myInnerFunction(); // Die innere Funktion wird später ausgeführt
// Ausgabe: "Ich bin eine Variable aus outerFunction"

```

### **Zusammenfassung:**

- Die innere Funktion hat Zugriff auf die Variablen und Parameter der äußeren Funktion, da sie im **Scope der äußeren Funktion** definiert wurde.
- Dies ist durch den **lexikalischen Scope** und die **Scope Chain** möglich.
- Falls die innere Funktion länger "lebt" als die äußere, wird der Scope der äußeren Funktion durch **Closures** erhalten.

---

# Scope-Chain

- Ermöglicht den lexikalischen scope.

Der Scope einer Funktion wird nicht zur Laufzeit, sondern **bei ihrer Definition** bestimmt. Das bedeutet:

- Die innere Funktion weiß bereits bei ihrer Erstellung, in welchem Scope (bzw. welchem "lexikalischen Kontext") sie definiert wurde.
- Dieser Scope wird in ihrer **[[Environment]]-Eigenschaft** (eine interne Eigenschaft der Funktion) gespeichert.

Die innere Funktion trägt also den "Umgebungsspeicher" des äußeren Scopes mit sich, egal wann oder wo sie später ausgeführt wird.