
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

- Jedes Terminal wird durch eine Gerätedateien representiert, bspw. `/dev/tty`, `/dev/pts/0` (bei einem Pseudo-Terminal wie einem Terminalemulator) oder `/dev/console`.
- Jedes Terminal, bzw. Gerätedatei des Terminals, ist mit drei Dateien verbunden.
	- Diese Dateien sind stdin, stdout und stderr.
		- Diese Dateien sind Dateideskriptoren.
		- Beim Start eines Terminals wird eine Shell Instanz erzeugt und diese Shell Instanz erhält die Dateideskriptoren: stdin, stdout und stderr, bzw.: 0, 1 und 2.
		- Die Dateideskriptoren verweißen direkt auf die Gerätedatei des Terminals.
		- Das Terminal selbst erhält ebenfalls einen Dateideskriptor der nicht notwendigerweise 0, 1 oder 2 ist, aber ebenfalls auf die Gerätedatei verweißt.
	 
	  -  Standardeingabe: stdin.
		- Da das Terminal den Dateideskriptor der Gerätedatei kennt, schreibt das Terminal die Eingaben in diese. Die Shell ließt direkt aus der Gerätedatei.
			- Die shell erhält nach und nach die Daten. Ist das Ende der Daten erreicht, wird dies durch ein backslash und "n" der shell signalisiert und sie führt die Anweisung aus.
	
	-  Standardausgabe und Standard-Fehlerausgabe: stdout/stderr.
		- Die Shell schreibt Ergebnisse in die Gerätedatei, wenn 1 oder 2 ebenfalls auf die Gerätedatei des Terminals verweisen und das Terminal zeigt dann die Daten an.
  

- Die shell kann angewiesen werden, die Ausgabe umzuleiten, bspw. in eine Datei und nicht in die Gerätedatei des Terminals.