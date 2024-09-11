
# Prinzip

Die Callback Funktion einer asynchronen Operation hat Zugriff auf zwei Funktionen (resolve und reject), die von einem Objekt stammen, dem Promise-Objekt.
In der Callback Funktion kann resolve aufgerufen und das Ergebnise der asynchronen Operation übergeben werden. resolve ruft dann eine handler Funktion, der als Argument das ergebnis der asynchronen Operation von resolve übergeben wird. Die handler Funktion ist ebenfalls Teil des Promis-Objekts.
Die handler Funktion wird also erst aufgerufen, wenn die Callback Funktion resolve aufgerufen hat, bevor dies geschiet, kann anderer Code auf dem call stack ausgeführt werden.
**Sobalt in einer Callback Funktion resolve aufgerufen wird, bekommt das Promise Objekt den zustand fullfilled. Ruft die Callback Funktion reject auf, bekommt das Promise Objekt den zustand rejected.** 

---

# Micro Taskqueue

Bei einem **Promise-Objekt** wird in die **Microtask-Queue** der **Callback (Handler)** gesetzt, der durch die Methode `then()`, `catch()`, oder `finally()` hinzugefügt wird, und zwar, nachdem das Promise-Objekt den Zustand `resolved` oder `rejected` erreicht hat.
Sobald `resolve()` oder `reject()` aufgerufen wird, ändert das Promise seinen Zustand zu entweder "fulfilled" (erfüllt) oder "rejected" (abgelehnt).

---

#  Beispiele

**Beispiel 1:**

``` JavaScript
function doSomething(resolve, reject){
    setTimeout(() => {
	    resolve("hello promise");    
    }, 0)
}


function doSomeOtherWork(resolve, reject){
    setTimeout(() => {
	    resolve("some other work");
	}, 0)
}

//doSomething werden die Argumente resolve und reject übergeben.
//resolve und reject sind Funktionen vom Promise-Objekt.
//doSomething wird ausgeführt, sobald das Promise-Objekt erstellt wurde.
//in p wird die Referenz des Promise-Objekts gespeichert.
const p = new Promise(doSomething);

//then wird eine handler Funktion übergeben, die aufgerufen wird, wenn resolve aufgerufen wird.
//der handler Funktion wird als Argument übergeben, was resolve übergeben wurde, also das Ergebnis einer asynchronen Operation.
p.then((result) => {
    console.log(result);
    
    return new Promise(doSomeOtherWork);
}).then((result) => {
    console.log(result);
});
//wird in then ein Promise Objekt zurück gegeben, gibt then dieses promise zurück und mit dem Punkt Operator (.) kann dann auf dieses Promise Objekt zugegriffen wreden. Die zweite then Funktion ist also die then Funktion vom Promise Objekt das von der ersten then Funktion zurück gegeben wurde.
```

**Beispiel 2:**

```javascript
p.then((result) => {
    console.log(result);
    
    return new Promise(doSomeOtherWork);
}).then((result) => {
    console.log(result);
}).catch((err) => {
	console.log(err)
});
//Die `catch()` Methode wird angehängt, um Fehler innerhalb der Promise-Kette zu behandeln.
//Die handler Funktion die catch übergeben wird, wird aufgerufen wenn: In der Callback Funktion einer asynchronen Operation reject aufgerufen wird oder wenn in einer der then Funktionen, ein Fehler geworfen wird.
```