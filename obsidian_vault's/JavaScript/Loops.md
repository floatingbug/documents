# for in loop

### `for in loop` in objects

Iteriert durch die keys der properties eines objects.

**Beispiel:**
```javascript
const obj = {
	key1: "prop 1",
	key2: "prop 2",
	key3: "prop 3"
};

for (let x in obj){
	console.log(x)
}

// Ausgabe: key1, key2, key3
```


### `for in loop` in arrays

Iteriert über alle Elemente im array.

**Beispiel:**
```javascript
const arr = [12, 23, 42];

for(let x in arr){
	console.log(x)
}

// Ausgabe: 12, 23, 42
```


---

# for of loop

Iteriert über die values der properties eines objects

**Beispiel:**
```javascript
const obj = {
	key1: "prop 1",
	key2: "prop 2",
	key3: "prop 3"
};

for (let x of obj){
	console.log(x)
}

// Ausgabe: prop 1, prop 2, prop 3
```