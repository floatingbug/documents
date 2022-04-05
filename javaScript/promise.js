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

    - Sowohl die Methode Promise.prototype.then als auch Promise.prototype.catch geben ein Promise-Objekt zurück.
    - Wurde im Objekt resolve aufgerufen, befindet sich das Objekt im Status fulfilled und der handler wird durch then aufgerufen.
    - Wurde im Objekt reject aufgerufen, befindet sich das Objekt im Status rejected und  der handler wird durch catch aufgerufen.
*/

/////////////////////////////Beispiel eines eigenen Promise/////////////////////////////

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
    
    function resolve(result){
        if(state !== PENDING) return;
        
        state = FULFILLED;
        value = result;
		
		//jeder handler, der in der then methode hinzugefügt wurde, wird
		//hier aufgerufen.
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
			//wird in resolve aufgerufen, wenn resolve 
			//aufgerufen wird.
			handlers.push(callback)
		}
	}
	
	//hier wird doWork aufgerufen und resolve und reject übergeben.
	//dann wird resolve, nach der asynchronen Ausführung,
	//mit dem Argument "this is a text" aufgerufen (dem Ergebnis der
	//asynchronen Ausführung).
	executor(resolve, reject)
}


const doWork = (resolve, reject) =>{
	setTimeout(()=>{resolve("this is a text")}, 3000)
}

let someText = new CustomPromise(doWork);

//wurde die asynchrone Operation bereits durchgeführt, kann
//die cb direkt mit dem Ergebnis in die cb-queue gesendet werden.
//Wenn nicht, wird die cb gespeichert und in resolve aufgerufen,
//da resolve nach der asynchronen Operation aufgerufen wird.
someText.then((value)=>{
	console.log(value)
})


////////////////////Beispiel eines Promise//////////////////////

function promise(){
	return new Promise((resolve,reject)=>{
		setTimeout(()=>{
			resolve("Ergebnis der asynchronen Ausführung")
		}, 3000)
	})
}

//erst wenn die asynchrone Operation ausgeführt wurde, wird
//das Ergebnis der Operation an die cb übergeben und ausgeführt.
promise().then((result)=>{
	console.log(result)
})

/////////////////////then gibt ein Promise zurück/////////////////
const doSomeWork = (resolve, reject)=>{
	setTimeout(()=>{
		resolve("Hello World!")
	}, 1000)
};

const doSomeOtherWork = (resolve, reject)=>{
	setTimeout(()=>{
		resolve("How are you?")
	},3000)
}

let someSimpleText = new Promise(doSomeWork);

//wenn in dem handler von then ein Wert zurückgegeben wird,
//dann gibt then ein Promise zurück
someSimpleText.then((val)=>{
	console.log(val)
	
	//erst wenn der promise zurückgegeben wird, wird then ausgeführt.
	return new Promise(doSomeOtherWork)
}).then((val)=>{
	console.log(val)
})
