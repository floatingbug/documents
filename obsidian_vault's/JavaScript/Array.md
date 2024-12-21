# Iterieren
### arrayName.forEach
- Für jedes Element wird eine Funktion aufgerufen, der das Element übergeben wird.
``` javascript
const zahlen = [1,2,3,4,5];

zahlen.forEach(function(zahl){
	console.log(zahl)
})

//mit arrow function
zahlen.forEach((zahl)=>{
	console.log(zahl)
})

//kurze Schreibweise (wenn nur ein argument übergeben wird, können die runden und geschweiften Klammern werggelassen werden).
zahlen.forEach(zahl=>console.log(zahl))
```
- Der Funktion können neben dem Element auch noch zwei weitere Argumente übergeben werden.
```JavaScript
zahlen.forEach(function(zahl, index, array){
	console.log(`die Zahl ${zahl}, hat den index ${index} und 
	befindet sich im array ${array}.`)
})
```

---

# Elemente finden
### arrayName.find
Wie bei forEach wird einer Funktion nacheinander jedes Element übergebe.
Gibt die cb true zurück, wird das element, das von der cb überprüft wurde, von find zurück gegeben und find wird beendet.
```JavaScript
const zahl = zahlen.find(zahl => zahl == 1);
```

---

# Array Transformieren

**Mit array.map() wird für jedes Element eine Funktion aufgerufen. Mit Hilfe der Funktion kann dann jedes Element bspw. verändert werden. Nach jedem Aufruf der Funktion, wird das Ergebnis der Funktion in ein Array gespeichert, das nach dem letzten Funktionsaufruf zurückgegeben wird.

```JavaScript
const array1 = [1, 4, 9, 16];

// Funktion übergeben
const map1 = array1.map((x) => x * 2);

console.log(map1);
// Ausgabe: Array [2, 8, 18, 32]
```

---

# Array Filtern

**Mit array.filter() wird jedes Element im neuen Array gespeichert, wenn das Kriterium in der Callback Funktion erfüllt ist.**

```JavaScript
const array1 = [1, 4, 9, 16];

const newArray = array1.filter(n => {
	if(n === 9){
		return n
	}
})

//Ausgabe: Array [9]
console.log(newArray);
```

---

# Elemente eines Arrays überprüfen

Mit array.every wird überprüft, ob alle Elemente von einem bestimmten type sind.
Gibt die übergebene Funktion (die Funktion die every übergeben wird) bei enem element false zurück, gibt die Funktion every ebenfalls false zurück und wird beendet.
gibt die an every übergebene Funktion für alle Elemente true zurück, gibt every am Ende ebenfalls true zurück.

```JavaScript
const array1 = [1, 4, 9, 16];

const isTypeNumber = array1.every(n => typeof n === "string");

console.log(isTypeNumber);
// Ausgabe: false
```