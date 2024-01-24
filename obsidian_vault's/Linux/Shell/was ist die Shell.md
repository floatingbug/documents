
## Kommando Syntax

![[Pasted image 20231219134355.png]]

---

## Funktionsweise

- Die shell ist ein Programm, das automatisch aufgerufen wird, wenn ein Terminal gestartet wird.
	- Für jedes Terminal existiert also eine eigene Shell-Instanz bspw. bash.

-  Über das Terminal kann man mit der Shell kommunizieren, indem die im Terminal eingegebene Kommandozeile an die shell weitergegeben wird.

- Terminal nimmt die eingegebene Kommandozeile entgegen und gibt sie an die shell (bspw. bash) weiter.
	- Die Shell interpretiert die Kommandozeile, indem der Kommandoname die Option und die Parameter aufgeteilt werden.

- Die shell sucht das Programm anhand des Kommandonamens und der in PATH angegebenen Pfaden.
#### Kommunikation zwischen terminal und shell

- Jedes Terminal ist mit drei Dateien verbunden.
	- Diese Dateien sind stdin, stdout und stderr.
		- Diese Dateien können als Buffer betrachtet werden, sodass in diese Daten geschrieben und gelesen werden können. In Unix gilt das Prinzip alles ist eine Datei, sodass auch Buffer genau wie gewöhnliche Dateien behandelt werden können, in denen geschrieben und von denen gelesen werden können.
	 
	  -  Standardeingabe (Tastatur): stdin.
		- Eingaben werden von dem Terminal in die Datei stdin der shell geschrieben und die shell erhält die Daten.
			- Die shell erhält nach und nach die Daten. Ist das Ende der Daten erreicht, wird dies durch ein backslash und "n" der shell signalisiert und sie führt die Anweisung aus.
	
	-  Standardausgabe (Bildschirm): stdout.
		- Die shell schreibt ergebnisse in stdout des Terminals und das Terminal zeigt dann die Daten an.

	 - Standard-Fehlerausgabe (Bildschirm): stderr
		- Wie stdout.
  

- Die shell kann angewiesen werden, die Ausgabe umzuleiten bspw. in eine Datei.