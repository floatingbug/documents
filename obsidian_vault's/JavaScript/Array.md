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
- Wie bei forEach wird einer Funktion nacheinander jedes Element übergebe.
in der Funktion wird dann überprüft, ob es sich um das gesuchte Element handelt.
Handelt es sich um das gesuchte Element, wird dieses zurückgegeben, wird das 
Element nicht gefunden, wird undefined zurückgegeben.
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
