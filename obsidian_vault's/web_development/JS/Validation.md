
### Anzahl der properties in einem object ermitteln

Beispiel: 
```javascript
const obj = {
	name: "bla",
	gender: "blo",
	city: "bli"
};

const keys = Object.keys(obj);
// keyes = ["name", "gender", "city"]

const objLength = keys.length;
```

Objekt gibt ein array mit allen keys zurück.
