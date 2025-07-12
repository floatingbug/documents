# JavaScript Array-Methoden

## splice

- Lösche Element an einem angegebenem Index.
- das erste Argument ist der Index ab dem gelöscht wird, das zweite Element gibt die Anzahl an Elementen an die gelöscht werden sollen.

**Beispiel:**
```javascript
let arr = [1, 2, 3, 4];
arr.splice(2, 1); // löscht das Element an Index 2 (also die "3")
```

## pop

- Löscht das letzte Element

**Beispiel:**
``` javascript
arr.pop(); // entfernt das letzte Element des Arrays
```

## slice

- Kopiert Elemente in einem Array.
- Erstes Argument gibt den Startindex an, ab welchem Element kopiert wird. Das Zweite Argument gibt den Endindex an, bis zu dem kopiert wird.

**Beispiel:**
```javascript
let arr = [1, 2, 3, 4, 5, 6];
let neu = arr.slice(2, 5); // kopiert die Elemente an Index 2, 3, 4 → [3, 4, 5]
console.log(neu); // [3, 4, 5]
console.log(arr); // [1, 2, 3, 4, 5, 6] (unverändert)
```


## forEach

- **Beschreibung:** Iteriert über jedes Element eines Arrays und führt eine Callback-Funktion aus. Es wird kein neues Array zurückgegeben.
- **Beispiel:**
  ```js
  [1, 2, 3].forEach(num => console.log(num));
```


## map

- **Beschreibung:** Erzeugt ein neues Array, indem es eine Callback-Funktion auf jedes Element des Arrays anwendet.
- **Beispiel:**
    ```js
const doubled = [1, 2, 3].map(num => num * 2); console.log(doubled); // [2, 4, 6]
```


## every

- **Beschreibung:** Prüft, ob **alle** Elemente eines Arrays eine bestimmte Bedingung erfüllen. Gibt `true` zurück, wenn dies der Fall ist, sonst `false`.
- **Beispiel:**
    ```js
const allPositive = [1, 2, 3].every(num => num > 0); console.log(allPositive); // true`
    ```


## find

- **Beschreibung:** Liefert das **erste** Element, das die angegebene Bedingung erfüllt. Wird kein Element gefunden, wird `undefined` zurückgegeben.
- **Beispiel:**
```js
const found = [1, 2, 3].find(num => num > 1); console.log(found); // 2`
```


## reduce

- **Beschreibung:** Reduziert ein Array auf einen einzigen Wert, indem eine Callback-Funktion auf einen Akkumulator und jedes Element angewendet wird.
- **Beispiel:**
```js
const sum = [1, 2, 3].reduce((acc, num) => acc + num, 0); console.log(sum); // 6`
```

## filter

- **Beschreibung:** Erzeugt ein neues Array, das alle Elemente enthält, die eine definierte Bedingung erfüllen.
- **Beispiel:**
```js
const evens = [1, 2, 3, 4].filter(num => num % 2 === 0); console.log(evens); // [2, 4]
```

## flatMap

- **Beschreibung:** Bei einem Array von Arrays werden die inneren Arrays  "entpackt" , sodass deren Inhalte in einem einzigen Array gespeichert werden.
- **Beispiel:**
```js
const data = [
  [1, 2],
  [3, 4],
  [5, 6]
];

// flatMap mit einer Identitätsfunktion (es wird jedes innere Array "entpackt")
const flattenedArray = data.flatMap(innerArray => innerArray);

console.log(flattenedArray);

// Ausgabe: [1, 2, 3, 4, 5, 6]
```
