/*
	- Funktionen die mit async deklariert werden, können Promise-Objekte zurück liefern.
	- Innerhalb einer mit async deklarierten Funktion können Funktionen aufgerufen werden,
		die ein Promise zurück liefern.
		-> Wenn die Funktionen mit await deklariert werden, wird solange gewartet, bis der
			zurück gelieferte Promise entweder den Status Fulfilled oder Rejected ist.
*/

// asyncFunction liefert ein Promise zurück.
// der Zustand des Promise-Objekts (ergebnis) kann in dem Zustand Pending sein, auch wenn
// then des Promise-Objekts p aufgerufen wird.
// Da createFileAsync mit async deklariert wurde, kann die Funktion ein Promise zurück liefern.
async function createFileAsync(){
	let ergebnis = asyncFunction()
	
	return ergebnis
}

let p = createFileAsync();

p.then((e)=>{
	console.log(e)
})

// Kurzschreibweise
createFileAsync().then((e)=>{
	console.log(e)
})


// Damit ergebnis nicht im Zustand Pending ist, kann mit await darauf 
// gewartet werden, bis ergebnis den Zustand Fulfilled hat und
// dann erst das Promise-Objekt ergebnis zurückgegeben wird.
// Solange asyncFunction ausgeführt wird, ist der stack/thread frei.
async function createFileAsync(){
	let ergebnis = await asyncFunction()
	
	return ergebnis
}

createFileAsync().then((e)=>{
	console.log(e)
})


// Problem: befinden sich mehrere Funktionen mit await in einer async Funktion,
// werden diese alle nacheinander abgearbeitet.
// Lösung: Alle Promise-Objekte (ergebnis_1, ergebnis_2, ergebnis_3) gleichzeitig ausführen.
async function createFileAsync(){
	let ergebnis_1 = await asyncFunction_1()
	let ergebnis_2 = await asyncFunction_2()
	let ergebnis_3 = await asyncFunction_3()
	
	let ergebnis = await Promise.all([ergebnis_1, ergebnis_2, ergebnis_3])
	
	return ergebnis
}

createFileAsync().then((e)=>{
	console.log(e)
})
























