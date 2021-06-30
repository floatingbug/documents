/*
 Ordnerstruktur:
 HelloWorld->hello->HelloWorld.java
 HelloWorld->hello->Greeter.java
 HelloWorld->hello2->Greeter2.java
*/

//-> Datei HelloWorld.java
//-> Durch die Angabe hello2.Greeter kann die selbe Klasse wie in hello.Greeter
//		verwendet werden. Ohne packages wäre das nicht möglich.
package hello;
import hello2.Greeter;

public class HelloWorld{
	public static void main(String[] args){
		Greeter greeter = new Greeter();
		hello2.Greeter greeter2 = new hello2.Greeter();
		System.out.println(greeter.sayHello());
		System.out.println(greeter2.sayHello2());
	}
}

//-> Datei Greeter.java
package hello;

public class Greeter{
	public String sayHello(){
		return "Hello from package hello!";
	}
}

//-> Datei Greeter2.java im package hello2
package hello2;

public class Greeter{
	public String sayHello2(){
		return "Hello from package hello2!";
	}
}

//-> Kompilieren: javac hello/*.java hello2/*.java
//-> Aufrufen: hello.HelloWorld
//	-> damit JVM die main Funktion findet, muss das package mit angegeben werden.
//	   Der Aufruf erfolg außserhalb des package!!!
//		 Die VM sucht immer vom Projektordner aus nach den classen die in den
//		 Arbeitsspeicher geladen werden sollen.
//		 import.hello2.Greeter2 -> die VM läd Greeter2-Klasse in den Arbeitsspeicher,
// 		 dadurch kann in der Main-Funktion ein Objekt der Klasse erstellt werden.
//-> Alle Klassen die sich im selben package wie die Klasse mit Der
//		main-methode befinden, werden automatisch, beim Aufruf des Programms,
//		in den RAM geladen.
