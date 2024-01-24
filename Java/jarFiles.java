//-> Alle .java-Dateien Kompilieren.
//-> Manifest mit folgendem Eintrag erstellen: Main-Class: NameDerKlasseMitMainMethode.
//	-> Am Ende von Main-Class muss eine Leerzeile stehen!
//-> jar erstellen mit: jar cvfm MyJarName.jar manifest.txt *.class
//	-> "c" steht für: "create a jar", "v" steht für: "verbose", "f" steht für: output jar-file-name,
//	   "m" steht für:  name of the manifest file.

//-> Beispiel (Ordner Struktur: Projektordner/hello/.java-Dateien):

//HelloWorld.java
package hello;

public class HelloWorld{
	public static void main(String[] args){
		Greeter greeter = new Greeter();
		System.out.println(greeter.sayHello());
	}
}

//Greeter.java
package hello;

public class Greeter{
	public String sayHello(){
		return "Hello there!";
	}
}

//-> Kompilieren und Manifest erstellen (Manifest-> Main-Class: hello.HelloWorld)
//	->im Projektordner: jar cvfm test.jar MANIFEST.MF hello/*.class ausführen.
