/*
- Prinzip: Die cb einer asynchronen Funktion ruft resolve oder reject eines Objekts auf,
    sobald die asynchrone Funktion beendet wurde und dessen cb in dem main-thread ausgeführt wird.
*/

/////////////////////////////Beispiel eines eigenen Promise/////////////////////////////

const PENDING = 0;
const FULFILLED = 1;
const REJECTED = 2;

function CustomPromise(executor){
    let state = PENDING;
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
        handlers.forEach((h)=>h(result)) //der anonymen Funktion wird die Funktion h übergeben und dann aufgerufen.
    }

    function reject(err){
        if(state !== PENDING) return;

		state = REJECTED;       
		value = err;

		catches.forEach((c)=>c(err))
	}
	
	function then(callback){
		if(state === FULFILLED){
			callback(value)
		}
		else{
			//wird in resolve aufgerufen, wenn resolve 
			//aufgerufen wird.
			handlers.push(callback)
		}
	}
	
	executor(resolve, reject)
}

const doWork = (resolve, reject) =>{
    //Die methode resolve des Promise-Objekts wird aufgerufen, wenn dies asynchrone Funktion beendet ist und
    //ihre cb in dem main-thread ausgeführt wird.
    setTimeout(()=>{resolve("Ergebnis der asynchronen Operation")}, 3000)
}

let someText = new CustomPromise(doWork);

//then ist eine Methode vom Promise-Objekt. 
//resolve ruft die cb von dieser Funktion auf und übergibt der cb das ergebnis der asynchronen Operation.
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


promise().then((result)=>{
	console.log(result)
})

/////////////////////then gibt ein Promise mit return new Promise zurück/////////////////
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


someSimpleText.then((val)=>{
	console.log(val)
	
	return new Promise(doSomeOtherWork)
}).then((val)=>{
	console.log(val)
})
