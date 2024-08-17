
# Prinzip

Die Callback Funktion einer asynchronen Operation hat Zugriff auf zwei Funktionen (resolve und reject), die von einem Objekt stammen, dem Promise-Objekt.
In der Callback Funktion kann resolve aufgerufen und das Ergebnise der asynchronen Operation übergeben werden. resolve ruft dann eine handler Funktion, der als Argument das ergebnis der asynchronen Operation von resolve übergeben wird. Die handler Funktion ist ebenfalls Teil des Promis-Objekts.
Die handler Funktion wird also erst aufgerufen, wenn die Callback Funktion resolve aufgerufen hat, bevor dies geschiet, kann anderer Code auf dem call stack ausgeführt werden.
**Sobalt in einer Callback Funktion resolve aufgerufen wird, bekommt das Promise Objekt den zustand fullfilled. Ruft die Callback Funktion reject auf, bekommt das Promise Objekt den zustand rejected.** 

---

# Mechanismus

Dem Promise-Objekt wird als Argument eine Funktion übergeben, das zwei Parameter enthält (nennen wir die Funktion func). Wenn das Promise-Objekt erstellt wird, ruft es func auf und übergibt den beiden Parameter als Referenzen die Funktionen resolve und reject. Diese Funktionen sind Funktionen des Promise-Objekts.
Dem Promise-Objekt wird eine handler Funktion übergeben, die von resolve aufgerufen wird. 
Durch diesen Mechanismus, kann In einer Callback Funktion einer asynchronen Funktion resolve das Ergebnis übergeben und aufgerufen werden. Erst wenn die Callback Funktion auf dem call stack ausgeführt wird, wird resolve aufgerufen, daher kann in zwischenzeit anderer code auf dem call stack ausgeführt werden. resolve führt dann die handler Funktion aus, der das Ergebnis der asynchronen Operation von resolve als Argument übergebin wird.


---

#  Beispiele

**Beispiel 1:**

``` JavaScript
function doSomething(resolve, reject){
    resolve("hello promise");
}


function doSomeOtherWork(resolve, reject){
    resolve("some other work");
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