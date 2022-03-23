//Wenn eine async Funktion aufgerufen wird, und der Interpreter auf ein
//await trift, wird die Funktion zwischengespeichert und erst wieder 
//aufgerufen, wenn FULFILLED===true, dann gibt das Promise ein ergebnis zurück.
//
//Beispiel:

somePromise = new Promise((resolve, reject)=>{
	setTimeout(()=>{
		resolve("promise is resolved!")
	}, 3000)
})

async function afn(){
	let result = await somePromise;
	console.log(result)
}

console.log("1st call")



afn()
