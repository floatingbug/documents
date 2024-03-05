# Map
**Wie Objects nur das als Keys alle Datentypen verwendet werden können.**

---

# Funktionen
### Map erstellen
```javascript
let map = new Map();

//Direkt bei der Erstellung Schlüssel-Wert-Paara als Argument übergeben
let map = new Map(
	[
		[1: "wert"],
		["key2": "wert"],
		[3: 3]
	]
);
```

### Schlüssel-Wert-Paar hinzufügen
```javascript
// Für Keys sind alle Datentypen erlaubt.
map.set("1", "str1");
map.set(1, "num1");
map.set(true, "bool1")
```

### Wert durch Schlüssel erhalten
```javascript
map.get(1);
map.get("1");
```

### Weiter Funktionen
```javascript
//Gibt true zurück wenn der Key existiert anderenfalls false.
map.has("key"); 

//Löscht das Schlüssel-Wert-Paar
map.delete("key");

//Löscht alle Schlüssel-Wert-Paare
map.clear();

//Gibt die Anzahl an Elementen zurück
map.size();
```

---

# Iteration
map.keys() – returns an iterable for keys,
map.values() – returns an iterable for values,
map.entries() – returns an iterable for entries [key, value], it’s used by default in for..of.

**map.keys() gibt ein iterable mit allen Schlüsseln zurück.**

```javascript
for(let key of map.keys()){
	console.log(key)
}V
```

**map.values() gibt ein iterable mit allen Werten zurück.**

```javascript
for(let value of map.values()){
	console.log(value)
}V
```

**map.entries() gibt ein iterable mit allen Schlüssel-Wert-Paaren zurück.

```javascript
for(let entry of map.entries()){
	console.log(entry)
}V
```

---

# Maps aus Objects und Arrays erstellen

**Map aus Array erstellen.**

```javascript
let arr = [
	[key1: "value1"], 
	[key2: "value2"]
];

let map = new Map(arr);
```

**Map aus Object erstellen.**

```javascript
let obj = {key1: "value1", key2: "value2"}

//entries(obj) gibt ein array mit arrays zurück. Die arrays in dem array enthalten jeweils ein Schlüssel-Wert-Paar.
let map = new Map(Object.entries(obj));
```

---

# Objects aus Maps erstellen

**Object.fromEntries() nimmt ein Array entgegen, das wiederum Arrays enthalten muss, die jeweils ein Schlüssel-Wert-Paar enthalten. Object.fromEntries() gibt dann ein Object zurück.**

```javascript
let arr = [
	[key1: "value1"], 
	[key2: "value2"]
];

let obj = Object.fromEntries(arr);
```

**Da map.entries() die selbe Datenstruktur zurück gibt, kann Object.fromEntries diese verwenden, um ein Object zu erstellen.**

```javascript
let map = new Map(
	[
		[key1: "value1"], 
		[key2: "value2"]
	]
);

let obj = Object.fromEntries(map.entries());
```