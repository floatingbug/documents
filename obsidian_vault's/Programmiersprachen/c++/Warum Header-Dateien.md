# Kompiliervorgang

1. **Objekt Dateien**
	- Jede Quelltext-Datei wird in eine Objekt-Datei Kompiliert. Objekt-Dateien haben die Endung .o oder .obj. 
	- Durch Deklarationen der Header-Dateien sind dem Kompiler Namen und Typ von Klassen, Funktion, Variablen usw. bekannt.
		- Durch Typen kann der Kompiler in der Objekt-Datei Maschinencode erstellen, der Speicher allokiert, der notwendig ist, um das entsprechende Objekt speichern zu können.
		- Durch Namen, bspw. ein Klassenname und dazugehörige Funktionsnamen und Variablen, kann der Kompiler symbolische Referenzen auf Definitionen erzeugen, bspw. steht in einer Header-Datei B.h eine Funktion doSomething. In der Datei B.cpp steht dann B::doSomething. Dadurch erzeugt der Kompiler einen symbolischen Link auf die Definition. Dieser Link steht dann in der kompilierten Objekt-Datei. Wenn alle Objekt-Dateien vom Linker zu einer ausführbaren Datei gelinkt werden ersetzt der Linker diesen Link in eine Speicheradresse in der sich die Funktion doSomething befindet.

2. **Linker**
	- Der Linker fügt alle Objekt-Dateien zu einer einzelnen ausführbaren Datei zusammen.

# warum nun Header-Dateien?

Wenn in einer Objekt-Datei a.o ein Objekt aus b.o erzeugt wird, ist in a.o der Maschinencode um den notwendigen Speicher für das Objekt zu allokieren. Zusätzlich befinden sich Symbolische Links zu den Definitionen, bspw. der Funktion einer Klasse, die in b.o definiert sind, die dann der Linker in konkrete Speicheradressen umwandelt, in denen sich bspw. eine Funktion einer Klasse befindet.
Wenn nun b.cpp geändert wird und zu einer b.o kompiliert wird, muss a.cpp nicht erneut kompiliert werden, es reicht aus die Objekt-Dateien neu zu linken. 