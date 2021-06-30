//->Alle Klassen werden von der Klasse Object abgeleitet und erhalten deren Methoden.
//	->toString(), equals(), hashCode(), clone(), getClass...
//
//Darstellung Komplexer Datentypen (aus mehreren einzelnen werten zusammengesetzt).

Buch buch = new Buch()
//toString() wird automatisch aufgerufen.
System.out.println(buch);

//Methoden von Object können überschrieben werden.
public class Buch{
	public String toString(){
		return "ein Buch";
	}
}

//equals() gibt true oder false zurück
objekt1.equals(objekt2);

public boolean equals(Object o){
	if(this == o){
		return true;
	}
	if(o instanceof "typ des objektes"){
		"typ des objektes" o1 = ("typ des objektes") o;
		if(o1.att1 == att1 && o1.att2 == att2 && o1.att3 == att3){
			return true;
		}
		else{
			return false;
		}
	}
	else{
		super.equals(o);
	}
}


//hashCode() liefert eine zahl zurück. Sie berechnet sich aus dem inneren Zustand des Objektes.
if(objekt1.hashCode() == objekt2.hashCode()){}

public int hashCode(){
	String s = attr1 + attr2;
	return s.hashCode();
}

//compareTo() vergleicht zwei Objekte ob eins größer, kleiner oder gleich ist
objekt1.compareTo(objekt2);

public class Kasse1 implements Comparable{
	public int compareTo(Object o){
		"type des objekets" o1 = ("type des objektes") o;
		return attr1 - o1.attr1;
	}
}
