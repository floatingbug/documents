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

### Date Objekt-Methoden

##### `toISOString`

Die Methode `toISOString` gibt einen String zurück, der die Zeitangabe im **UTC-Format** enthält.  
UTC steht für **Coordinated Universal Time** (auf Deutsch: **koordinierte Weltzeit**).  
Es ist die standardisierte Zeitreferenz, von der aus alle anderen Zeitzonen weltweit abgeleitet werden. UTC ist unabhängig von Sommerzeit oder Ortszeit und dient als globale Bezugszeit.

**Beispiel:**
```javascript
const date = new Date(); // z. B. lokale Zeit: 2025-07-11T14:00:00+02:00
const dateUTC = date.toISOString();

console.log(dateUTC); // Ausgabe: 2025-07-11T12:00:00.000Z
```
- Das `Z` am Ende gibt an, dass es sich um das UTC Format handelt.

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


### Zeitstempel in Datum umwandeln.

```javascript
let timestamp = Date.now();
let date = new Date(timestamp);

console.log(date.toLocaleDateString()); // z. B. "4.5.2024"
console.log(date.toLocaleString());     // z. B. "4.5.2024, 00:00:00"
console.log(date.toISOString());        // z. B. "2024-05-04T00:00:00.000Z"
```

