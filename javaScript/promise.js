/*	
	- Promise ist ein Objekt. Wenn eine Funktion eine asynchrone Operation durchführt, wird diese nicht
		im stack des Interpreters ausgeführt, sondern in einem anderen stack/thread z.B. libuv-workerthread.
		Nach der Operation, erhält das Promise-Objekt das Resultat.
	
	- States in dem ein Promise-Objekt sein kann
		- Pending
			-> Das eventuelle Resultat ist noch nicht vorhanden
		- Fulfilled
			-> Asynchrone Operation ist abgeschlossen und das Promise-Objekt hat das Resultat erhalten.
		- Rejected
			-> Die Asynchrone Operation ist fehlgeschlagen und das Promise-Objekt erhält als Resultat einen Fehler.
*/

// Beispiel 1:
function getUserID(id){
	return new Promise((resolve, reject)=>{
		//asynchrone Operation
		
		resolve('Ergebnis der asynchronen Operation')
	})
}

// Wird getUserID ausgefürht, gibt die Funktion ein Promise-Objekt zurück, das in ergebnis gespeichert wird.
// Das Promise-Objekt (ergebnis) befindet sich im Zustand Pending, wärend die asynchrone Operation ausgeführt wird.
// Wurde resolve aufgerufen, ist der Zustand Fulfilled und then wird das Ergebnis übergeben.
// Wurde reject aufgerufen, ist der Zustand Rejected und then wird der Fehler übergeben.
let ergebnis = getUserID(25)

ergebnis.then((result)=>{
	
})

// Kurzschreibweise
// Das zurückgegebene Promise-Objekt wird nicht zwischengespeichert.
// then ist eine Funktion, die jedes Promis-Objekt verfügt und erst aufgerufen wird,
// wenn resolv oder reject aufgerufen wurde.
getUserID(35).then(()=>{

})




// Beispiel 2:
// Das Promise-Object p befindet sich im Zustand Pending bis resolve oder reject aufgerufen wurden.

let p = new Promise((resolve, reject)=>{
	//asynchrone Operation stehen hier
	
	//das Ergebnis wird im Promise-Objekt gespeichert
	resolve('Ergebnis der asynchronen Operation')
	
	//der Fehler wird im Promise-Objekt gespeichert
	reject('Fehlerbeschreibung der asynchronen Operation')
})


// then wartet bis das Promise-Objekt (p) einen Wert bekommen hat (entweder Ergebnis oder Fehler).
// Dem Promise-Objekt wird der Wert durch das Aufrufen der Funktion resolve oder reject hinzugefügt.
// Dann übergibt then das Ergebnis an einer Callback-Funktion.
// then ist eine Funktion die in jedem Promise-Objekt vorhanden ist und nur aufgerufen wird,
// wenn resolve oder reject, des Promise-Objekts, aufgerufen wurde. 
p.then((Ergebnis)=>{
	console.log(Ergebnis)
}).catch((Fehler)=>{
	console.log(Fehler)
}).finally(()=>{
	//optionale opperation die immer ausgeführt wird.
})









