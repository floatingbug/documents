# Date Objekt

Erstellung:
```javascript
const date = new Date();
```

Wenn das date Objekt ausgegeben wird, wird automatisch die Methode toString() aufgerufen:
```javascript
console.log(data)

//"Wed Mar 27 2024 16:00:00 GMT+0100 (Central European Standard Time)"
```

---

# Zeitstempel (Timestamp)

Ein **Zeitstempel** ist die vergangene Zeit in **Millisekunden** ab einem bestimmten Zeitpunkt. In JavaScript ist dieser Zeitpunkt der **1. Januar 1970 00:00:00 UTC** (auch **Unix-Epoche** genannt).

Die Klasse `Date` hat die **statische Methode** `now()`, um einen Zeitstempel zu erstellen.  
Eine Instanz von `Date` hat die Methoden `getTime()` und `valueOf()`, um einen Zeitstempel abzurufen.

Interne Darstellung als Zeitstempel:
```javascript
// Statische Methode von Date (empfohlen)
let timestamp = Date.now();
console.log(timestamp); // ✅ Anzahl der Millisekunden seit 1. Januar 1970

// Methoden für Date-Instanzen
let date = new Date();
console.log(date.getTime()); // ✅ Anzahl der Millisekunden

// Alternative
console.log(date.valueOf()); // ✅ Gleiches Ergebnis wie getTime()
```

