// Jede async-function gibt ein Promise-Objekt zurück, wenn die Funktion abgeschlossen ist.
// Anschließend hat man auf die then()-function des Promise-Objects Zugriff.

async function createFileAsync(){
	// asynchroner code
	
	return "Das ist ein String"
}

createFileAsync().then((resolve)=>{
	console.log(resolve)
})

// Beispiel

function a(){
	return new Promise((resolve, reject)=>{
		operationSuccess = false;
		
		if(true){
			operationSuccess = true;
			resolve(operationSuccess)
		}
	})
}

function b(argument1){
	return new Promise((resolve, reject)=>{
		
		if(argument1 == true){
			resolve(true)
		}
	})
}

// Durch await wird solange gewartet, bis das Promise-Objekt zurückgegeben wurde.
// Erst dann werden die nachfolgenden Zeilen ausgeführt.

async function createFileAsync(){
	
	let var_a = await a()
	console.log("erstes Promise-Objekt wurde zurückgegeben")
	
	let var_b = await b(var_a)
	console.log("zweites Promise-Objekt wurde zurückgegeben")
}

















