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
// Die cb-Funktionen für die Parameter resolve und reject, werden über die Promise-Funktionen .then und
// .catch übergeben.
// Wurde die asynchrone Operation ausgeführt, wird das Ergebnis entweder an resolve oder reject übergeben und
// diese dann in die Microtaskqueue gesendet.
function getUserID(id){
	return new Promise((resolve, reject)=>{
		//asynchrone Operation beginnt hier, ist sie beendet, wird das Ergebnis in ergebnis gespeichert.
        ergebnis = true;
        
        if(ergebnis){
		    resolve('Ergebnis der asynchronen Operation')
        }
        else{
            reject({msg: "asynchrone operation fehlgeschlagen, ", fehlercode: 24}) 
        }	
    })
}

//  ->Das Promise-Objekt wird in ergebnis gespeichert.
//  ->Die im Promise-Objekt stehende asynchrone Anweisung wird ausgeführt, sobald das Promise-Objekt instnziiert wurde (return new Promise)
//      -> Wurde die asynchrone Operation durchgeführt, wird entweder der callback-function (then) das Ergebnis über resolve mitgegeben,
//          und in die callback-queue gesendet, oder die callback-function catch wird in die callback-queue gesendet.
let ergebnis = getUserID(25)

ergebnis.then((result)=>{
	
}).catch((err)=>{

})

// Kurzschreibweise
getUserID(35).then(()=>{

})




// Beispiel 2:
// Das Promise-Object p befindet sich im Zustand Pending bis resolve oder reject aufgerufen wurden.

let p = new Promise((resolve, reject)=>{
	//asynchrone Operation stehen hier
	
	resolve('Ergebnis der asynchronen Operation')
	
	reject('Fehlerbeschreibung der asynchronen Operation')
})

p.then((Ergebnis)=>{
	console.log(Ergebnis)
}).catch((Fehler)=>{
	console.log(Fehler)
}).finally(()=>{
	//optionale opperation die immer ausgeführt wird.
})









