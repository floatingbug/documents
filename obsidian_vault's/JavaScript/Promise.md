
# Prinzip

Die Callback Funktion einer asynchronen Operation hat Zugriff auf zwei Funktionen (resolve und reject), die von einem Objekt stammen, dem Promise-Objekt.
In der Callback Funktion kann resolve aufgerufen und das Ergebnise der asynchronen Operation übergeben werden. resolve ruft dann eine handler Funktion, der als Argument das ergebnis der asynchronen Operation von resolve übergeben wird. Die handler Funktion ist ebenfalls Teil des Promis-Objekts.
Die handler Funktion wird also erst aufgerufen, wenn die Callback Funktion resolve aufgerufen hat, bevor dies geschiet, kann anderer Code auf dem call stack ausgeführt werden.
**Sobalt in einer Callback Funktion resolve aufgerufen wird, bekommt das Promise Objekt den zustand fullfilled. Ruft die Callback Funktion reject auf, bekommt das Promise Objekt den zustand rejected.** 

---

# Micro Taskqueue

Wird resolve oder rejected in dem call-stack aufgerufen, durchsucht die JS-Engine eine Liste im Promise-Objekt nach der Handler-Funktion, die durch die Methode `then()`, `catch()`, oder `finally()` hinzugefügt wurde. Alle Handler-Funktion die gefunden werden, werden von der JS-Engine in die Microtask-Queue gesetzt. Das Ergebnis der asynchronen Operation wurde resolve oder reject übergeben, dieses wird der Handler-Funktion übergeben, wenn sie aus der Microtask-Queue in den call-stack gesetzt wird.
Sobald resolve oder rejected aufgerufen wird, wird das Promise-Objet auf fullfilled oder rejected gesetzt.

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

//then wird eine handler Funktion übergeben, die in die Microtask-queue gesetzt wird, wenn resolve aufgerufen wird.
//der handler Funktion wird als Argument übergeben, was resolve übergeben wurde, sobald diese aus der Microtask-Queue auf dem Call-Stack zu ausführung gebracht wurde.
p.then((result) => {
    console.log(result);
    
    return new Promise(doSomeOtherWork);
}).then((result) => {
    console.log(result);
});
//wird in der Handler-Funktion ein Promise Objekt zurück gegeben, kann mit dem punkt Operator auf dieses Promise zugreifen. Durch den Punkt Operator wird die then Methode des zurück gegebene Promise aufgerufen und eine Handler-Funktion übergeben.
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