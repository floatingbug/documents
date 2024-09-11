# source

Wird ein Programm oder ein Skript in der Shell aufgerufen, wird ein neuer Shell-Prozess erzeugt und in diesem wird das Programm oder Skript ausgeführt.
Will man, dass für das Programm oder Skript keine neue Shell zur ausführung erzeugt wird, muss der source Befehl oder ein Punkt (. ) vor dem Programm oder Skript stehen. 
Dadurch bleiben Umgebungsvariablen die im Programm oder im Skript gesetzt werden, in der Shell verfügbar.

Beispiel:
```shell
source skript
```

oder

```shell
. skript
```

---

# ps aux

`ps aux` wird in Unix-ähnlichen Betriebssystemen verwendet, um eine Momentaufnahme aller laufenden Prozesse zu machen. Die Ausgabe besteht aus mehreren Spalten, die verschiedene Informationen über die Prozesse anzeigen.

## Spalten

- **USER**: Der Benutzername des Benutzers, der den Prozess gestartet hat.
- **PID**: Die Prozess-ID (Process ID), eine eindeutige Kennung für den Prozess.
- **%CPU**: Der Prozentsatz der CPU-Zeit, die der Prozess seit seinem Start verbraucht hat.
- **%MEM**: Der Prozentsatz des physischen Speichers (RAM), den der Prozess aktuell verwendet.
- **VSZ**: Die virtuelle Größe des Prozesses in Kilobytes. Dies umfasst den gesamten von dem Prozess beanspruchten Speicher, einschließlich Speicher, der ausgelagert werden kann.
- **RSS**: Die Resident Set Size, also der tatsächlich im physischen Speicher (RAM) belegte Speicherplatz in Kilobytes.
- **TTY**: Das zugeordnete Terminal (TTY - Teletypewriter) für den Prozess. Bei Prozessen, die nicht mit einem Terminal verbunden sind, steht hier `?`.
- **STAT**: Der Status des Prozesses. Dies kann eine Kombination aus einem oder mehreren Buchstaben sein, die den Zustand des Prozesses anzeigen:
  - `R`: Running (Laufend)
  - `S`: Sleeping (Schlafend, inaktiv)
  - `D`: Uninterruptible Sleep (Schlafend, nicht unterbrechbar)
  - `T`: Stopped (Angehalten)
  - `Z`: Zombie (Zombie-Prozess)
  - `I`: Idle (Leerlauf)
  - Zusätzlich können weitere Buchstaben anzeigen, ob der Prozess z.B. ein Kernel-Thread ist (`K`), oder ob er Paging-Berechtigungen hat (`W`).
- **START**: Der Zeitpunkt, zu dem der Prozess gestartet wurde.
- **TIME**: Die gesamte CPU-Zeit, die der Prozess seit seinem Start verbraucht hat.
- **COMMAND**: Der Befehl, der den Prozess gestartet hat, zusammen mit seinen Argumenten.

## Beispiel

```plaintext
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.1 103692  8684 ?        Ss   Jun26   0:04 /sbin/init
tom       1234  0.3  1.2 298764 49032 ?        Sl   Jun26   2:03 /usr/bin/python3 script.py
```

## Nur bestimmte Spalten auswählen

- `-e` steht für "alle Prozesse anzeigen".
- `-o` erlaubt es, die gewünschten Spalten anzugeben.

```shell
ps -eo user,pid,comm,stat
```

---

# lsof

lsof (list open files) liefert Informationen über geöffnete Dateien, also auch sockets, da diese auch Dateien sind.

## Netzwerk verbindungen anzeigen

Durch `lsof -i` werden alle offene Netzwerkverbindungen (Sockets) und die zugehörigen Prozesse, aufgelistet. Durch tcp werden nur TCP-Verbindungen aufgelistet, da ein socket metadaten über die Art der Verbindung enthält.

```shell
lsof -i tcp
```

Durch -n wird anstelle des Hostname die IP-Adresse angezeigt.
Durch -P wird anstelle des Dienstnamen (bspw. http) die Port-Nummer angezeigt.

```shell
lsof -i -n -P
```

### Beispiel

```shell
sudo lsof -i -n -P | grep 27017
```

Der mongod-Prozess hört (Listen), auf dem Server-Socket mit der Port-Nummer: 27017, auf eingehende Verbindungsanfragen.
Der mongod-Prozess hat, über den Socket mit der Port-Nummer: 27017, zu einem Prozess mit der Port-Nummer: 52060 eine Verbindung aufgebaut.
```shell
mongod    12104         mongodb   14u  IPv4 157008      0t0  TCP 127.0.0.1:27017 (LISTEN)
mongod    12104         mongodb   68u  IPv4 146693      0t0  TCP 127.0.0.1:27017->127.0.0.1:52060 (ESTABLISHED)

```

### Bestimmte Ports oder IPs angeben

Herausfinden, welcher Prozess sich hinter einem Port oder IP verbirgt.
```shell
lsof -i :80    # Prozesse, die Port 80 (HTTP) verwenden
lsof -i @192.168.1.10   # Prozesse, die mit der IP-Adresse 192.168.1.10 verbunden sind
```

---

# Prozesse

## Prozesse beenden

