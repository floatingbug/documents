--- await ---
- Das Schlüsselwort wird vor einer Funktion gesetzt, die ein Promise zurück gibt.
-> Nachfolgender Code wird erst ausgefürht, wenn das Promise resolve oder reject aufruft.
    -> await ist also dafür da, dass nachfolgender code erst ausgeführt wird, wenn das jeweilige Promise-Object resolve oder reject aufgerufen hat.


- await kann in einem try- catch- block verwendet werden:
async fn(){
    try{
        const result = await asyncFunction();
    }
    catch(error){
        console.log(error)
    }
}

-> Die Funktion asyncFunction kann wie folgt aussehen:
function asyncFunction(){
	return new Promise((resolve, reject)=>{
		 fs.readFile("./image.jpg", (image, err)=>{
		 	if(err){
		 		reject(err);
		 	}
		 	else{
		 		resolve(image);
		 	}
		 });
	})
}
-> In der Funktion asyncFunction wird ein neues Promise Objekt erstellt, in dem nach der erstellung die asynchrone Funktion readFile ausgeführt wird.
	Das Promise Objekt wird dann zurück gegeben und erst wenn resolve aufgerufen wurde, wird der Wert, der resolve übergeben wurde in result gespeichert.

- await kann auch ohne try- catch-block aufgerufen werden:
const promise = await asyncFunction();

promise.then(()=>{})
promise.catch(()=>{})

//dieser code wird erst ausgeführt, wenn resolve oder reject vom promise aufgerufen wurde.

--- async ---
- await funktioniert nur in Funktionen die mit async definiert wurden.


