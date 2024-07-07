# Einen Fehler werfen
- Wenn eine Fehler geworfen wird, wird die Funktion, in der der Fehler geworfen wird verlassen, wenn der Fehler in dieser Funktion nicht von einem catch-Block gefangen wird.
	- Wird diese Funktion innerhalb eines try blocks ausgefürht und die funktion wirft die Ausnahme (Exception), dann wird der catch block, der außerhalb der Funktion liegt, die Ausnahme abfangen.
	- Beispie:
	 ```javascript
	 function fehlerWerfen(){
		 try{
			 const ergebnis = 1 / 0;
		 }
		 catch{
			 //hier wird der Fehler geworfen.
			 throw new Error("Division durch 0 ist nicht definiert")
		 }
	 }
	function fehlerFangen(){
		try{
			fehlerWerfen()
		}
		catch(error){
			//der fehler von fehlerWerfen wird hier abgefanden.
			//Ausgabe: Division durch 0 ist nicht definiert.
			console.log(error.message)
		}
	}
	```

