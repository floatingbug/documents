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

-> Wenn das Promise (hier result) reject aufruft, wird der catch-block ausgeführt und der Wert, der reject übergeben wurde, wird in error gespeichert.
    -> Auch hier wird der nachfolgende Code erst ausgeführt, wenn reject oder resolve vom promise-object (result) aufgerufen wurde.

- await kann auch ohne try- catch-block aufgerufen werden:
const promise = await asyncFunction();

promise.then(()=>{})
promise.catch(()=>{})

//dieser code wird erst ausgeführt, wenn resolve oder reject vom promise aufgerufen wurde.

--- async ---
- await funktioniert nur in Funktionen die mit async definiert wurden.


