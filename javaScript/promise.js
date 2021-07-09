/*	
	-Promise ist ein Objekt, das zurückgegeben wird.
		-> An welches callback-Funktionen angehängt werden können.
	-Anstatt callbacks an Funktionen zu übergeben, werden callbacks an ein Promise-Objekt angehängt.
		-> Die Funktion then() des zurückgegebenen Promise-Objekts wird Aufgerufen, wenn im Objekt
			entweder result oder reject aufgerufen wurden. Der callback Funktion innerhalb von then() 
			wird das übergeben was reject oder result zurückgegeben haben. Dann wird then() in die
			callback-queue gelegt.
*/

// Beispiel: Die Funktion createAudioFileAsync erstellt eine Audio-Datei. Wurde die Datei erstellt, übergibt sie 
// einer der Beiden Callback-Funktionen das Ergebnis, aber erst, wenn die Datei auch erstellt wurde oder das 
// Erstellen fehlgeschlagen wurde.
function successCallback(result) {
  console.log("Audio-Datei bereit unter URL: " + result);
}

function failureCallback(error) {
  console.error("Fehlerhafte Generierung der Audio-Datei: " + error);
}

createAudioFileAsync(audioSettings, successCallback, failureCallback);

// Man könnte createAudioFileAsync so umschreiben, dass es ein Promise-Objekt zurückgibt.
// In der ersten Zeile wird createAudioFileAsync ausgeführt und zwas Asynchron (nicht auf dem Stack sondern z.B. von
// einer C++ Funktion.
// Nach Beendigung der Operation, gibt createAudioFileAsync das Promise-Objekt zurück und die Funktion then() des Promise-
// Objekts wird aufgerufen. einer der beiden Callback-Funktionen wird dann das Ergebnis als Argument übergeben und
// auf die callback-queue gelegt. 
const promise = createAudioFileAsync(audioSettings);
promise.then(successCallback, failureCallback);

// Kurzschreibweise
createAudioFileAsync(audioSettings).then(successCallback, failureCallback)

// Mehrere Promises nacheinander Aufrufen (möglich da then() immer ein Promise zurückgibt)
const promise = doSomething();
const promise2 = promise.then(successCallback, failureCallback);


// Kurzschreibweise
const promise2 = doSomething().then(successCallback, failureCallback);

// Allgemeinse Beispiel
function cleaningRoom(){
	return new Promise((resolve, reject)=>{
  	if(true){
    	resolve("ergebnis der Asynchronen Operation.")
    }
    else{
    	reject("Asynchrone Operation fehlgeschlagen.")
    }
  })
}

// Wurde resolve oder reject aufgerufen, wird das Promiseobjekt zurückgegeben.
// Wurde reject aufgerufen, wird statt then() catch() ausgeführt und dessen callback als Argument
// übergeben, was reject() zurückgegeben hat.
promise = cleaningRoom()
promise.then((result)=>{
	console.log(result)
}).catch((result)=>{
	console.log("Asynchrone Operation fehlgeschlagen: " + result)
})
