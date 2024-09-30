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
## Aufbau der Promise-Kette

- **Zeile 5:** Wenn `p1.then(...)` aufgerufen wird, wird ein neues Promise (`p2`) erstellt. Die Handler-Funktion, die übergeben wird, wird intern mit `p2` verknüpft. Keine explizite Referenz verknüpft die Handler-Funktion mit p2, aber die Promise-API sorgt dafür, dass sie intern verwaltet wird.
    
- **Zeile 10:** Wenn `p2.then(...)` aufgerufen wird, wird ein weiteres Promise (`p3`) erstellt und die Handler-Funktion wird mit `p3` verknüpft.

## Prinzip

- **Wenn `resolve` aufgerufen wird**, wird das Ergebnis von `resolve` (der aufgelöste Wert) an den nächsten Handler (also den nächsten `.then`-Handler in der Kette) übergeben.
    
- **Der nächste Handler wird aufgerufen**. Wird in diesem Handler ein Wert zurückgegeben, wird **intern** `resolve` des zugehörigen (nächsten) Promises aufgerufen.
    
    - **Beispiel**: Wenn `return "wert"` in einem `.then`-Handler steht, wird dies intern als `resolve("wert")` behandelt, und dieser Wert wird dem Händler des nächsten Promise übergeben.
- **Der Wert wird von `resolve` an den nächsten Handler übergeben** (den nächsten `.then`-Handler in der Kette).
    
- **Der Vorgang wiederholt sich**, bis alle Promises und Handler durchlaufen sind oder ein Fehler auftritt (in diesem Fall würde `reject` aufgerufen und die Fehlerbehandlung greifen).

## Verarbeitung der Promise-Kette

1. **Resolve vom ersten Promise:** Wenn `resolve` aufgerufen wird, wird das Ergebnis, das `resolve` übergeben wurde, in die Handler-Funktion von `p2` gespeichert. Diese Funktion wird dann in die Microtask-Queue eingefügt, um nach dem aktuellen Call Stack ausgeführt zu werden.

2. **Handler-Ausführung:** Wenn die Microtask-Queue an der Reihe ist, wird die Handler-Funktion von `p2` ausgeführt, die den Wert "Hello" ausgibt und "Hello World" zurückgibt.    
    - Wenn in `then` mit `return` ein Wert zurückgegeben wird, wird automatisch `resolve` des nächsten Promise aufgerufen und der Wert wird diesem übergeben.

1. **Das zweite Promise:** Wenn `p2` aufgelöst wird (durch den Rückgabewert oder durch `resolve` des vorherigen Promises), wird die Handler-Funktion von `p3` mit dem Rückgabewert von `p2` aufgerufen, was "Hello World" ist.

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
function sendApiRequest(url, options){
  const result = fetch(url, options);

  return result.then((response) => {
    return response.json();
  }).then((data) => {
    return data
  }).catch((err) => {
    console.log(err);
  });
} 
```

1. fetch gibt ein promise zurück (p1).

2. Die CB der asynchronen Operation ruft resolve auf.

3. Der wert der resolve von der CB übergeben wurde, wird dem Handler von p2 übergeben. 

4. Der Handler von p2 gibt mit return ein Wert zurück und zwar ein Promise (p3).

5. json() ruft resolve mit einem Wert als Argument auf.

6. Der Wert wird dem Handler von p4 übergeben.

7. Der Handler von p4 ruft return mit dem Wert data auf, wodurch das letzte promise in der Kette auf fullfilled gesetzt wird.

8. Die gesamte Promise-Kette wird mit return result; von der Funktion sendApiRequest, zurückgegeben.

```javascript
const promiseKette = sendApiRequest(url, options) 

promiseKette.then((data) => { 
	console.log(data)
}; 
```

1. In der Handlerfunktion von p4 wird return data; ausgeführt.

2. Dieser Wert (data) wird dem Handler von p5 übergeben und aufgerufen.