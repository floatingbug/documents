//-> Gang of four: besserer Programmierstil gegen ein interface zu Programmieren, als gegen eine implementierung.
//-> Trennung von Spezifizierung und Implementierung.
//		-> Spezifizierung: was soll die Klasse können. Implementierung: umsetzung der Spezifizierung.
//-> Vorteile: schneller Austausch der implementierung, die Wiederverwendbarkeit von Klassen und Packeten steigt.
//-> zustandslos (keine Variablen, außer Konstanten)

public interface Hallo{
	public void sagHallo();
} 

public class Klasse1 implements Hallo{
	public void sagHallo(){
		System.out.println("Hallo!");
	}
}