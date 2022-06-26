/*
-> Module sind Dateien die Funktionen, Klassen, Bibliotheken oder Konfigurationen beinhalten.
-> Libraries wie commonjs ermöglichen es Module in anderen Dateien zu laden.
*/

//Beispiel:
// 📁 sayHi.js
export function sayHi(user) {
  alert(`Hello, ${user}!`);
}

// 📁 main.js
import {sayHi} from './sayHi.js';

alert(sayHi); // function...
sayHi('John'); // Hello, John!

/*
-> Wird import in einem Script bzw. einer Datei aufgerufen, wird nach der Datei, von der importiert
    werden soll, im gleichen Ordner gesucht in der sich die Datei befindet in der import ausgeführt wird.
    -> Es ist möglich in anderen Ordner zu suchen bspw. durch ../../Ordnername.
-> Importiert man ein Modul im Browser, sendet der Browser einen http-request und fordert das 
    entsprechende Modul an.
    -> Dem Browser muss vorher durch <script type="module"> mitgeteilt werden, dass Module 
        verwendet werden.
*/

//Beispiel:
/*
<!doctype html>
  <script type="module">
  import {sayHi} from './say.js';

  document.body.innerHTML = sayHi('John');
</script>
*/


/*
-> Es können mehrere Variablen, Funktionen usw. gleichzeitig exportiert und importiert werden.
*/

//Beispiel:
// 📁 say.js
function sayHi(user) {
  alert(`Hello, ${user}!`);
}

function sayBye(user) {
  alert(`Bye, ${user}!`);
}

export {sayHi, sayBye}; // a list of exported variables

// 📁 main.js
import {sayHi, sayBye} from './say.js';

sayHi('John'); // Hello, John!
sayBye('John'); // Bye, John!




