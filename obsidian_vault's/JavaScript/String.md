# String Methoden

### split

- Trennt einen **String** in ein **Array von Teilstrings**, anhand eines Trennzeichens.

**Beispiel:**
```javascript
const str = "alice,bob,doe";

const arr = str.split(",")

// Resultat
arr === ["alice", "bob", "doe"];
```


---

### Das letzte Zeichen in einem String löschen

- Mit `slice` kann man das letzte Zeichen in einem String löschen.
**Beispiel:**
```javascript
let str = "Hallo!";
let neu = str.slice(0, -1); // "Hallo"
```
`slice(0, -1)` bedeutet: Von Index 0 bis **eins vor dem letzten Zeichen**.

