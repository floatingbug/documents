//Event-Objekt erstellen
const EventEmitter = require('event');
const eventEmitter = new EventEmitter();

//-> Die Methode on fügt eine callback-functin hinzu und
//      wenn das entsprechende event getriggert wird, wird diese 
//      auf die cb-queue gesendet.

//-> Die Methode emit triggert ein event.

//-> Beispiel:

eventEmitter.on('start', (number)=>{
    console.log("started" + number)
});

eventEmitter.emit('start', 23);


