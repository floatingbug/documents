/*	
	- Ein Promise-Objekt "wartet" bis eine asynchrone Funktion ausgeführt wurde.
    - Eine executerfunction wird an ein Promise-Objekt übergeben und das Promise-Objekt führt diese aus.
        
	
	- States in dem ein Promise-Objekt sein kann
		- Pending
			-> Das eventuelle Resultat ist noch nicht vorhanden
		- Fulfilled
			-> Asynchrone Operation ist abgeschlossen und das Promise-Objekt hat das Resultat erhalten.
		- Rejected
			-> Die Asynchrone Operation ist fehlgeschlagen und das Promise-Objekt erhält als Resultat einen Fehler.
*/

// Beispiel:

const PENDING = 0;
const FULFILLED = 1;
const REJECTED = 2;

function CustomPromise(executor){
    let state = PENDING;
    
    //In value soll der Wert des Ergebnises der asynchronen Ausführung gespeichert werden.
    //Darauf wartet das Promise-Objekt.    
    let value = null;
    
    //callbacks die ausgeführt werden, wenn die asynchrone Ausführung beendet wurde.
    let handlers = [];
    
    //callbacks die ausgefürht werden, wenn die asynchrone Ausführung beendet wurde und
    //fehlgeschlagen ist.
    let catches = [];
    
    //wird vom executor aufgerufen, also wird die Funktion dem executor gegeben und der
    //executor ruft die Funktion auf.
    function resolve(result){
        if(state !== PENDING) return;
        
        state = FULFILLED;
        value = result;

        handlers.forEach((h)=>h(value))
    }

    function reject(err){
        if(state !== PENDING) return;

		state = REJECTED;       
		value = err;

		catches.forEach((c)=>c(err))
	}
	
	this.then = function(callback){
		if(state === FULFILLED){
			callback(value)
		}
		else{
			handlers.push(callback)
		}
	}

	executor(resolve, reject)
}


const doWork = (resolve, reject) =>{
	resolve("this is a text")
}

let someText = new CustomPromise(doWork);
someText.then((value)=>{
	console.log(value)
})
