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
	return result
}

console.log("1st call")

afn()

////////////////////////////////////////////////////////////////////////////////

//await wartet auch auf Funktionen, die mit async markiert wurden
//aber kein Promise zurück gebe.
//
//Beispiel:

async function afn2(){
	//solange afn nicht vollständig ausgeführt wurde, wird afn2 vom
	//call-stack genommen.
	let someText = await afn();
	console.log("this only call, if afn is executed")
}

afn2()
