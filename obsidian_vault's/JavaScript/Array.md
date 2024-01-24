#### arrayName.forEach
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

#### arrayName.find
- Wie bei forEach wird einer Funktion nacheinander jedes Element übergebe.
in der Funktion wird dann überprüft, ob es sich um das gesuchte Element handelt.
Handelt es sich um das gesuchte Element, wird dieses zurückgegeben, wird das 
Element nicht gefunden, wird undefined zurückgegeben.
```JavaScript
const zahl = zahlen.find(zahl => zahl == 1);
```