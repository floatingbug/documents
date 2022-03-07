function makeRequest(location){
    return new Promise(resolve, reject){
        //make request and store result in res

        if(res === "google"){
            resolve("hi from google")
        }
        else{
            reject("can only talk to google")        
        }
    }
}

//makeRequest gibt ein Promise-Objekt zurück.
//durch await wird der nachfolgende code in der async function erst ausgeführt,
//wenn resolve oder reject des Promise-Objekts ausgeführt wurde.
async function doWork(){    
    try{
        //wenn statt resolve reject zurückgegeben wird, wird catch(err) aufgerufen.
        const response = await makeRequest('google')
    }
    catch(err){
        console.log(err)    
    }
}

//Zusammengefasst: durch await wird der code auserhalb der async function weiter ausgeführt. Wurde die 
//asynchrone Operation im Promise ausgeführt, gibt das Promise resolve oder reject zurück.
//Wird reject zurück gegeben, wird der catch-block ausgeführt.
//der try-block ist sozusagen die then-Funktion.
