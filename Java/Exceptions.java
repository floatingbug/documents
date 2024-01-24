//-> Informationen über ein Fehler werden in ein Exception-Objekt Transportiert,
//   dessen Klasse von Throwable abgeleitet wurde.
//	->Throwable liefert Methoden wie getStackTrace, die genauere Information zum Fehler liefern.
//-> Exception-Behandlung ohne Exception-Klassen
//	->Die Funktion in der eine Exception auftreten kann, muss Fehlersignale über den Rückgabewert an das aufrufende Programm
//	  zurück geben, sodass das aufrufende Programm auf den Fehler reagieren kann und den Fehler behandelt.
//		->Nachteil: Technische Fehlersignale und fachliche Rückgabewerte werden über den selben Rückgabewert
//	          an das aufrufende Programm zurück gegeben.
//-> Handhabung mit Exceptions
//	-> Exception wird innerhalb der Methode behandelt
//	-> Exception wird an aufrufendes Programm weiter geleitet wo sie Behandelt werden muss
//	-> Exception wird an aufrufendes Programm, mit spezifischer Fehlermeldung, weitergeleitet.

//-> try catch Beispiel
try{
	//versuche bspw. von eine Datei von der Festplatte zu lesen.
}
catch(FileNotFoundException e){
	//Fehler wird in das Objekt e transportiert. Bspw. konnte nicht von der Datei gelesen werden.
	//(wird nur aufgerufen, wenn es eine FileNotFoundException gab).
}
catch(IOExcetption e){
	//Ein anderer IO Fehler ist aufgetreten.
	//(wird nur aufgerufen, wenn es einen IOException gab).
}
catch(Exception e){
	//Ein anderer Fehler.
	//(wird immer aufgerufen).
}
finally{
	//Falls Datei geöffnet wurde, hier wieder schließen.
}

//-> Verkürzte Schreibweise
catch(FileNotFoundException e | IOException e){

}

//-> Resourcen in der Parameterliste von try-catch aufrufen.
//-> Resourcen stehen in der gesamten try-catch Anweisung zur verfügung.
//-> Resourcen werden nach der try-catch Anweisung automatisch geschlossen.
//-> Beispiel:
try(IOKlasse1 x = new IOKlasse1("dateiname1");
	IOKlasse2 y = new IOKlasse2("dateiname2")){
	//x und y verwänden
}
catch(IOException e){
	//auf Fehler reagieren
}

//-> Exceptions weiter geben//
//-> Wird eine Methode mit throws deklariert, muss der Aufruf der Methode mit try-catch abgesichert werden.

public void m1() throws Exception{

}

//-> wird die Funktion aufgerufen, muss sie durch einer evtl. auftretenden Exception abgesichert werden.
//   Wird eine Exception geworfen (throws) muss das aufrufende Programm die Exception "fangen".
try{
	m1();
}
catch(Exception e){
	System.out.println(e.getMessage());
}

//-> Exception wird im catch-block gefangen und mit spezifischer Meldung geworfen, sodass das aufrufende Programm
//   die Exceptin fangen muss.

public double m1(double a, double b) throws ArithmeticException{
	try(){
		return 	a/b;
	}
	catch(ArithmeticException e){
		throw new ArithmeticException("division durch null ist nicht möglich");
	}
}

//->Programm ruft Funktion auf
try(){
	m1(12, 0);
}
catch(ArithmeticException e){
	System.out.println(e.getMessage());
}
