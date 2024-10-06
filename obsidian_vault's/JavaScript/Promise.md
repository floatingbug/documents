# Beispiel 1

```javascript
1 const p1 = new Promise((resolve, reject) => {
2  setTimeout(() => resolve("Hello"), 1000);
3 });
4
5 const p2 = p1.then((result) => {
6 console.log(result); // "Hello"
7 return result + " World"; // Rückgabewert für p2
8 });
9
10 p2.then((finalResult) => {
11 console.log(finalResult); // "Hello World"
});
```

- **Zeile 1:**
    
    - Ein neues Promise wird erstellt und direkt ausgeführt. Die Referenz auf dieses Promise wird in `p1` gespeichert.
- **Zeile 5:**
    
    - Durch den Aufruf von `then()` auf `p1` wird ein neues Promise erstellt, das `p2` genannt wird.
    - Die Referenz auf dieses neue Promise wird in `p2` gespeichert.
    - Ein Handler wird registriert, der ausgeführt wird, wenn `p1` aufgelöst (resolved) wird.
- **Zeile 2:**
    
    - Nach 1 Sekunde wird die Funktion `resolve` mit dem Wert `"Hello"` aufgerufen.
    - Dieser Wert wird der `then()`-Methode übergeben und der zugehörige Handler wird in die Microtask-Queue gesetzt.
- **Handler für `p1` (Zeile 5-8):**
    
    - Der Handler, der in `then()` übergeben wurde, wird im Call Stack ausgeführt.
    - Der Wert `"Hello"`, der von `resolve` in `p1` übergeben wurde, wird als Argument an diesen Handler weitergereicht.
    - In **Zeile 7** wird der Ausdruck `result + " World"` zurückgegeben, was `"Hello World"` ergibt. Dieser Wert wird verwendet, um `p2` aufzulösen.
- **Zeile 10:**
    
    - Durch den Aufruf von `then()` auf `p2` wird ein neues Promise (`p3`) erstellt.
    - Ein weiterer Handler wird gespeichert, der ausgeführt wird, wenn `p2` aufgelöst wird.
    - Da `p2` mit dem Wert `"Hello World"` sofort aufgelöst ist (durch den Rückgabewert in **Zeile 7**), wird der Handler für `p3` direkt in die Microtask-Queue gesetzt.
- **Handler für `p2` (Zeile 10-11):**
    
    - Der Handler wird im Call Stack aufgerufen.
    - Der Wert, mit dem `p2` aufgelöst wurde (nämlich `"Hello World"`), wird an den Handler übergeben.
    - In **Zeile 11** wird dieser Wert in der Konsole ausgegeben.


**Andere Schreibweise:**
```javascript
const p1 = new Promise((resolve, reject) => {
  setTimeout(() => resolve("Hello"), 1000);
});

p1.then((result) => {
  console.log(result); // "Hello"
  return result + " World"; // Rückgabewert für p2
}).then((finalResult) => {
  console.log(finalResult); // "Hello World"
});
```

# Beispiel 2

```javascript
1 function sendApiRequest(url, options){
2  const result = fetch(url, options);
3
4  return result.then((response) => {
5    return response.json();
6  }).then((data) => {
7    return data
8  }).catch((err) => {
9    console.log(err);
10  });
11 } 
```

-  **Zeile 4:**
	-  Die gesamte Promise-Kette wird zurückgegeben.

-  **Zeile 2:**
	-  fetch gibt ein promise zurück, dessen Referenz in result gespeichert wird (p1).

-  **Zeile 4:**
	-  Ist p1 resolved, wird der handler in Zeile 4 aufgerufen.
	-  Im handler (Zeile 5) wird mit return ein promise (p2) von json() zurück gegeben.
	
-  **Zeile 6:**
	-  Durch then wird ein neues promise (p3) erstellt.
	-  Ist p2 resolved, wird der handler aufgerufen.

-  **Zeile 7:**
	-  p3 ist durch return data resolved.


```javascript
const promiseKette = sendApiRequest(url, options) 

promiseKette.then((data) => { 
	console.log(data)
}; 
```

-  **Durch return data ist p3 resolved und der nächste handler wird aufgerufen:**
	-  Dieser handler gibt data auf der Konsole aus.

