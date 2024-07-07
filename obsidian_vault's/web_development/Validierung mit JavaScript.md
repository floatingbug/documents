
# Anzahl an Eigenschaften in einem Objekt ermitteln

Die Eigenschaftsnamen (keys) eines Objekts müssen als Array gespeichert werden, dann kann mit Array.length die Anzahl ermittelt werden.
Die Methode keys des Objekts Object gibt ein Array mit allen Eigenschaftsnamen zurück.

Beispiel:

```javaScript
Object.keys(obj).length
```

---

# Type einer Eigenschaft ermitteln

Mit dem typeof Operator wird der Type einer Eigenschaft ermittelt.

Der mit typeof Operator ermittelte Type ist immer ein String. 

- `"undefined"`: Wenn der Wert `undefined` ist.
- `"boolean"`: Wenn der Wert ein `boolean` ist.
- `"number"`: Wenn der Wert eine Zahl ist.
- `"bigint"`: Wenn der Wert ein `BigInt` ist.
- `"string"`: Wenn der Wert ein `string` ist.
- `"symbol"`: Wenn der Wert ein `symbol` ist.
- `"function"`: Wenn der Wert eine Funktion ist.
- `"object"`: Wenn der Wert ein Objekt ist (einschließlich `null`).

Beispiel:

```javaScript
const v1 = 123;

if(typeof v1 === "number"){
	console.log("v1 ist vom Type number")
}
```

## Array ist nicht vom Type "array"

Bei einem Array liefert der typeof Operator den Wert "object". Um zu überprüfen, ob eine Variable ein Array Speichert, muss die Funktion Array.isArray(arr) verwendet werden.

Beispiel:

```javaScript
const arr = ["a", "b", "c"];

console.log(typeof arr) // Ausgabe: "object"
console.log(Array.isArray(arr)) //Ausgabe: true
```

---



```javaScript
```

```javaScript
```

```javaScript
```

```javaScript
```

