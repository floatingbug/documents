# Grundlegendes

Jede Zeile ohne # wird als Befehlszeile bewertet.
Jede Zeile die mit # beginnt, wird als Kommentarzeile bewertet.

## Semikolon

Verwendung: Trennung von einzelnen Befehlen in einer einzelnen Zeile. Ermöglicht das Auführen von aufeinanderfolgenden Befehlen in einer einzelnen Zeile. Ohne Semikolon wird die komplette Zeile als einzelnen Befehl von der Shell interpretiert.
### 1. Mehrere Befehle in einer Zeile

Du kannst mehrere Befehle nacheinander ausführen, indem du sie mit einem Semikolon trennst:

```bash
`echo "Erster Befehl"; echo "Zweiter Befehl"; echo "Dritter Befehl"`
```

### 2. In `if`-Anweisungen

Das Semikolon wird auch in `if`-Anweisungen verwendet, um den Befehlsteil vom Bedingungsteil zu trennen:

```bash
`if [ $# -eq 0 ]; then echo "Keine Argumente übergeben."; else echo "Argumente wurden übergeben."; fi`
```

### 3. In `for`-Schleifen

Es kann auch verwendet werden, um die einzelnen Teile einer `for`-Schleife zu trennen:

```bash
`for i in 1 2 3; do echo "Nummer $i"; done`
```

### Beispiel:

Hier ist ein vollständiges Beispiel, das verschiedene Verwendungen des Semikolons zeigt:

```bash
`#!/bin/bash  # Mehrere Befehle in einer Zeile echo "Starte Skript"; date; echo "Beendet Skript"  # if-Anweisung mit Semikolon if [ $# -eq 0 ]; then     echo "Keine Argumente übergeben." else     echo "Argumente wurden übergeben." fi  # for-Schleife mit Semikolon for i in 1 2 3; do echo "Nummer $i"; done`
```

### Zusammengefasst:

Das Semikolon ermöglicht das Erstellen von kompakteren und oft übersichtlicheren Skripten, indem es die Notwendigkeit reduziert, jeden Befehl in einer neuen Zeile zu schreiben.

---

# Variablen

Grundsätzlich wird Variableninhalt von der Shell immer als String behandelt.

## Variable definieren

``` bash
variableName=value
```

## Variable nutzen

Damit die Shell nicht den Variablenamen sondern den Inhalte der Variable nutzt, muss dem Variablenamen ein Dollerzeichen vorgesetzt werden. 

``` bash
echo $variableName
```

Die Shell interpretiert Variablen die nicht existieren mit einer leeren Zeichenkette.

**${_Variablenname_:-_Wert_}**

Wenn die Variable leer ist oder nicht existiert wird in der Anweisung – und nur da – der angegebene Wert statt dem Variableninhalt benutzt.

**${_Variablenname_:=_Wert_}**

Wenn die Variable leer ist oder nicht existiert wird der Wert in die Variable eingetragen. Diese Form unterscheidet sich von der letzten dadurch, dass der Wert jetzt auch tatsächlich in der Variable gespeichert ist und auch später noch zur Verfügung steht.

**${_Variablenname_:?_Wert_}**

Wenn die Variable leer ist oder nicht existiert wird der Wert ausgegeben und das Script wird beendet. Diese Form ist also geeignet, um kritische Fehler zu behandeln. Wenn eine für ein Script lebensnotwendige Variable nicht existiert bricht das Script ab und gibt _Wert_ auf dem Schirm aus. Logischerweise sollte _Wert_ eine Fehlermeldung enthalten.

Es ist **keine** extra Ausgabe notwendig, die bash kümmert sich um die Ausgabe von _Wert_

**${_Variablenname_:+_Wert_}**

Der Wert wird benützt und in die Variable eingetragen, wenn die Variable **nicht** leer ist.

**${#_Variablenname_}**

Dieses Konstrukt gibt die Anzahl der Zeichen zurück, die in einer Variable gespeichert sind.

---

# Dateneingabe

``` bash
read -p "Bitte geben Sie Vor und Zunamen ein: " VNAME ZNAME
```

Nachdem der Satz „Bitte geben Sie Vor und Zunamen ein: “ auf den Bildschirm geschrieben wurde, ließt der read-Befehl zwei Namen ein, der erste wird in der Variable VNAME gespeichert, der zweite in ZNAME.
Mit der Option -p kann ein Satz auf dem Bildschirm ausgegeben werden, der ohne abschließenden Zeilentrenner ausgegeben wird, bevor Eingaben gelesen werden. Dieser Satz muß in Anführungszeichen stehen, wenn er Leerzeichen enthält, sonst würde alles nach dem ersten Wort schon als Variablennamen gewertet.

---

# Datenausgabe

Der Befehl echo schreibt alles in stdout

``` bash
echo Das hier $variableName ist der Inhalte einer Variable.
```

---

# Rechnen mit Strings

Alle Variablen werden von der Shell als Zeichenkette gewertet. Mit dem Befehl **let** können mit allen nachfolgenden Variablen die Zahlen enthalten, gerechnet werden, auch wenn von der Shell der Inhalt von Variablen als Strings gewertet werden.

``` bash
let ergebnis=4*$var1+5
```

---

# Kommandozeilenparameter

Argumente die dem Skript übergeben werden, werden in den Parametern $1 bis $9 gespeichert.

``` bash
let ergebnis=$1+$2
echo $1 plus $2 ergibt $ergebnis
```

Der Parameter $0 enthält immer den Namen des Skript wie es aufgerufen wurde.

## Spezielle Variablen für Kommandozeilenparameter

**$#**

Enthält die Anzahl der übergebenen Argumente. Wurden keine Argumente übergeben, ist der Wert 0.

---

# Kontrollstrukturen

## Bedingungsüberprüfung

#### then

Leitet den Block ein, der ausgeführt wird, wenn die Bedingung wahr ist.

#### else

Leitet den Block ein, der ausgeführt wird, wenn die Bedingung falsch ist.

#### fi

Schließt die if-Anweisung

### Ausführungsprinzip

Eine if-Anweisung wird durch ein Semikolon abgeschlossen, wenn then darauf in der selben Zeile folg, anderenfalls wird kein Semikolon benötigt. Das Ergebnis der Bedingungsüberprüfung wird zwischengespeichert um Nachfolgende Anweisungen in then und else auszuführen, je nach Ergebnis, auszuführen. 
Das Schlüsselwort `fi` markiert das Ende der `if`-Struktur. Es zeigt an, dass keine weiteren Anweisungen innerhalb dieser `if`-Struktur ausgeführt werden sollen.
Nach `fi` wird das Ergebnis der Bedingungsüberprüfung verworfen und die Shell fährt mit der Ausführung des Skripts fort.

``` bash
if [ Bedingung ]
then
	Anweisungen
else
	Anweisungen
fi
```

Das Nachfolgende Beispiel ist äquivalent

``` bash
if [ Bedingung ]; then
	Anweisung
else
	Anweisung
fi
```

Die Klammer `[` ist ein symbolischer Link auf das Programm test. Aus diesem Grund muss zwischen den Klammer ein Leerzeichen stehen, damit die Shell das Programm test von der zu überprüfenden Bedingung unterscheiden kann.
Das Folgende Beispiel ist zu den beiden vorherigen Beispielen äquivalent.

``` bash
if test Bedingung; then
	Anweisung
else
	Anweisung
fi
```

---

``` bash

```
