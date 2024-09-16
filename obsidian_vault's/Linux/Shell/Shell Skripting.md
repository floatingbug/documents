# Grundlegendes

Jede Zeile ohne # wird als Befehlszeile bewertet.
Jede Zeile die mit # beginnt, wird als Kommentarzeile bewertet.

## Semikolon

Verwendung: Trennung von einzelnen Befehlen in einer einzelnen Zeile. Ermöglicht das Ausführen von aufeinanderfolgenden Befehlen in einer einzelnen Zeile. Ohne Semikolon wird die komplette Zeile als einzelnen Befehl von der Shell interpretiert. 
### 1. Mehrere Befehle/Kommandos in einer Zeile

es können mehrere Befehle nacheinander ausgeführen werden, indem die Befehle mit einem Semikolon getrennt werden:

```bash
`echo "Erster Befehl"; echo "Zweiter Befehl"; echo "Dritter Befehl"`
```

Ohne das Semikolon, würde die shell die nachfolgenden eingaben als Argumente für das echo-Kommando bewerten: echo, "Zweiter Befehl", echo und "Dritter Befehl".
Durch das Semikolon wird nicht nur einmal ein echo-Kommando ausgeführt, mit nachfolgenden Argumenten, sondern drei mal und jedes echo-Kommando hat seine eigenen Argumente.

### 2. if-Anweisungen

**Bestehen aus Schlüsselwörter (keine eigenständigen Programme) und Kommandos (eigenständige Programme)**
#### Schlüsselwörter:

- `if`
- `then`
- `else`
- `fi`

#### Kommandos:

- `[ $# -eq 0 ]` (dies ist ein Testkommando, auch bekannt als `test`, das überprüft, ob die Anzahl der Argumente gleich null ist)
	- **Kommando `[`**:
	- Es ist ein Synonym für das Kommando `test`.
	- `[ ... ]`, ruft die Shell tatsächlich das eingebaute `test`-Kommando auf.
	- `[` und `test` prüfen Bedingungen und geben `0` (Erfolg) oder `1` (Fehler) zurück, basierend auf der Bedingung.
	- **Operatoren:** 
	- `$#` und `-eq` sind Operatoren und keine Kommandos oder Schlüsselwörter.
	- Operatoren sollten immer von Leerzeichen umgeben sein, damit die Shell jeden Operator richtig interpretieren kann.
- `echo "Keine Argumente übergeben."` (dies ist das `echo`-Kommando, das den Text "Keine Argumente übergeben." ausgibt)
- `echo "Argumente wurden übergeben."` (dies ist das `echo`-Kommando, das den Text "Argumente wurden übergeben." ausgibt)

```bash
if [ $# -eq 0 ]; then 
	echo "Keine Argumente übergeben."; 
else 
	echo "Argumente wurden übergeben."; 
fi
```

Die Einrückungen der Anweisungen für then und else sind nicht notwendig, da die shell durch die Schlüsselwörter then und else erkennt, was wann ausgeführt werden soll. fi ist notwendig, damit die shell interpretieren kann, dass die nächsten Kommandos oder Schlüsselwörter nicht mehr zu else gehören.
Folgendes Skript würde also auch funktionieren:

```bash
if [ $# -eq 0 ]; then 
echo "Keine Argumente übergeben."; 
else 
echo "Argumente wurden übergeben."; 
fi
```

### 3. In `for`-Schleifen

- `for`: Beginnt die Schleife.
- `in`: Gibt an, dass die nachfolgenden Werte durchlaufen werden.
- `do`: Beginnt den Block von Befehlen, die in jeder Iteration ausgeführt werden.
- `done`: Beendet den Block von Befehlen.

Die Schlüsselwörter `for` und `in` benötigen kein Semikolon zur Trennung, da sie zusammen die Schleifenbedingung definieren und die Shell diesen Teil der Schleife als zusammengehörig erkennt.

```bash
for i in 1 2 3; do echo "Nummer $i"; done
# Ausgabe: 
# Number 1
# Number 2
# Number 3
```

Beispliel ohne Semikolon:
Durch Zeilenumbrüche werden keine Semikolons benötigt (erklärung weiter oben).
Ein Semikolon wird zwischen `for` und `in` nicht benötigt, weil die Shell diese als eine zusammenhängende Schleifenanweisung interpretiert.

```bash
for i in 1 2 3
do
    echo "Nummer $i"
done
```

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

## Parametererweiterung

**wird verwendet, um den Wert einer Variablen abzurufen, wobei ein Standardwert verwendet wird, falls die Variable nicht gesetzt ist oder einen leeren Wert hat.**

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
Mit der Option -p (print) kann ein Satz auf dem Bildschirm ausgegeben werden, der ohne abschließenden Zeilentrenner ausgegeben wird, bevor Eingaben gelesen werden. Dieser Satz muß in Anführungszeichen stehen, wenn er Leerzeichen enthält, sonst würde alles nach dem ersten Wort schon als Variablennamen gewertet.

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

# Anführungszeichen 

In Shell gibt es einen Unterschied in der Verwendung von einfachen Anführungszeichen (`'`) und doppelten Anführungszeichen (`"`), insbesondere wenn es um die Verwendung von Variablen geht:

1. **Einfache Anführungszeichen (`'`)**:
    
    - Wenn eine Zeichenkette in einfachen Anführungszeichen steht, werden die darin enthaltenen Variablen nicht interpretiert oder erweitert. Das bedeutet, dass der gesamte Inhalt der Zeichenkette wörtlich genommen wird.

Beispiel:
``` shell
name="John" echo 'Hello $name'  # Ausgabe: Hello $name`
```

Hier wird der Wert der Variable `name` (`John`) nicht ausgegeben, da er innerhalb einfacher Anführungszeichen steht.

1. **Doppelte Anführungszeichen (`"`)**:
    
    - Wenn eine Zeichenkette in doppelten Anführungszeichen steht, werden Variablen innerhalb der Zeichenkette erweitert, d.h., ihre Werte werden eingesetzt.

Beispiel:
```bash
name="John" echo "Hello $name"  # Ausgabe: Hello John`
``` 

 Hier wird der Wert der Variable `name` innerhalb der doppelten Anführungszeichen ersetzt und ausgegeben.

## Escapesequenz

Mit der \ escapesequence, wird der Shell mitgeteilt, dass das nachfolgende Zeichen als Literal bewertet werden soll. Dadurch kann man in einem String doppelte Anführungszeichen nutzen, ohne dass der String abgebrochen wird.

Beispiel:
```Shell
name=Bob

echo "My name is \"$name\"."

# Ausgabe: My name is "Bob".
```

Ohne escapesequence:
```Shell
name=Bob

echo "My name is "$name"."

# Ausgabe: My name is Bob.
```
Die Anführungszeichen werden nicht ausgegeben, da sie als String-Zeichen interpretiert wreden und $name als eigenständiger String interpretiert wird.
Da sich der String $name in einem umgebenen String befindet, werden beide Strings als ein String interpretiert.

## Bei Argumente für Kommandos funktionieren Escapesequenze nicht

**Beispliel mit curl:**
curl erwartet einen JSON-String ohne zusätzliche Escape-Zeichen um den gesamten JSON-Inhalt. Daher würde folgendes nicht funktionieren:
``` bash
json="{
    \"name\": \"$name\",
    \"email\": \"$email\",
    \"password\": \"$password\"
}"

echo $json

curl -v \
http://localhost:3000/add-user \
-H "Content-Type: application/json" \
-d \"$json\"

```

**Stattdessen muss ein Here-Document verwendet werden:**
``` bash
json=$(cat <<EOF
{
    "name": "$name",
    "email": "$email",
    "password": "$password"
}
EOF
)

echo $json

curl -v \
http://localhost:3000/add-user \
-H "Content-Type: application/json" \
-d "$json"

```


---

# Here-Document

**Ein Here-Dokument wird verwendet, um mehrzeilige Texte zu definieren, die an eine Anwendung oder ein Kommando übergeben werden sollen.**

## Prinzip

für die Delimiter in einem Here-Dokument können beliebige Wörter gewählt werden, solange sie eindeutig sind und nicht in dem Text des Here-Dokuments selbst vorkommen. Das bedeutet, dass der Delimiter als Markierung verwendet wird, um den Beginn und das Ende des Textblocks innerhalb des Here-Dokuments zu kennzeichnen.
Als Konvention verwendet man das Wort EOF.
**<<**: Dies ist der Here-Dokument-Operator, der auch als "Here-Dokument-Redirect" bezeichnet wird. Es wird verwendet, um ein Here-Dokument zu starten, das den Text enthält, der anschließend an ein commando weitergeleitet oder in eine Datei geschrieben wird.

``` shell
command << DELIMITER
Text
Text
...
DELIMITER

```

**Beispiel:**
``` bash
cat << bla > example.txt
Dies ist der Inhalt des Here-Dokuments.
Es enthält mehrere Zeilen.
bla

```

- `cat` liest den Inhalt des Here-Dokuments und gibt ihn aus oder schreibt ihn in die Datei `example.txt`.
- `<< bla` markiert den Beginn des Here-Dokuments mit dem Delimiter `bla`.
- `> example.txt` leitet die Ausgabe des Here-Dokuments in die Datei `example.txt`.

**Beispiel mit Shell-Substitution:**
``` bash
json=$(cat <<EOF
{
    "name": "$name",
    "email": "$email",
    "password": "$password"
}
EOF
)
```
- **$(...)**: Dies ist eine Shell-Substitution. In einer Shell-Substitution wird immer ein Kommando ausgeführt und das Ergebnis des Kommandos ersetzt dann die Shell-Substitution, also $(...) wird durch das Ergebnis ersetzt. In der Shell-Substitution wird dem Befehl cat als Argument das here-document übergeben. An der Stelle der Shell-Substitution wird dann das Ergebnis von cat zurückgegeben. Das Ergebnis wird dann der Variable json zugewießen.
	
-  Der cat Befehl übersetzt das here-document als String und gibt diesen zurück.
	
- **cat << EOF**: Der Befehl `cat` liest den Inhalt des Here-Dokuments, das zwischen `<< EOF` und `EOF` liegt. `<< EOF` signalisiert den Beginn des Here-Dokuments mit dem Delimiter `EOF`.
    
- **EOF**: Dies ist der Delimiter, der das Ende des Here-Dokuments markiert. Alle Zeilen zwischen `<< EOF` und `EOF` werden als Text behandelt und in die Variable `json` geschrieben.

**Ein Here-Document kann direkt in eine Datei geleitet werden oder an ein Programm übergeben werden, aber um den Inhalt eines Here-Documents in eine Variable zu schreiben, benötigt man einen Befehl wie `cat`, der den Inhalt liest, in ein String umwandelt und ausgibt.**

---

# Umgebungsvariablen

## Setzen einer Umgebungsvariable

``` bash
export MY_VARIABLE="mein_wert"
```

Wenn ein Skript ausgeführt wird, wird für das Skript eine neue Shell gestartet, in der das Skript ausgeführt wird. Damit die Umgebungsvariable in der Shell nach ausführen des Skriptes verfügbar ist, muss das Skript mit source aufgerufen werden, damit für das Skript nicht eine eigene Shell aufgerufen wird und stattdessen in der aktuellen Shell ausgeführt wird. 

``` bash

```

``` bash

```

``` bash

```
