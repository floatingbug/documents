# Funktionsweise
Nginx weist dem Betriebssystem an, welche Server-Sockets es erstellen soll. Die Portnummern für die Server-Sockets werden in nginx.conf angegeben. Z.B.: listen 80 und listen 81. In diesem fall erstellt das Betriebssystem zwei Server-Sockets durch Aufforderung von nginx, wenn nginx gestartet wird.

#### Prozesse von nginx
Nginx Besteht aus den Processen: master process und den worker-processes. 
Der master process ließt und evaluiert die Konfiguration und verwaltet die worker-processes.
Die worker-processes verwalten die Verbindungen und Verarbeiten die HTTP-Anfragen.
#### Worker-Prozesse
Nginx erstellt so viele Worker-Prozesse, wie es Prozessor-Kerne gibt.
Jeder Worker-Prozess kann mehrere Sockets mit Hilfe von Worker-Connections verwalten. 

Ein Worker-Prozess erstellt für jeden Socket sogenannte Worker-Connections die der Verwaltung der Sockets dienen, bspw. Lesen aus dem Socket und Schreiben in den Socket oder das Beenden der Verbindung. 

Der Worker-Prozess nutzt seine Worker-Connection um aus einen Socket zu Lesen und gelangt so zur HTTP-Anfrage. Der Worker-Prozess bearbeitet dann die HTTP-Anfrage entsprechend der Konfiguration in nginx.conf und nutzt dann die entsprechende Worker-Connection um die HTTP-Antwort in den entsprechenden Socket zu schreiben.

Insgesammt können so viele Anfragen parallel beantwortet werden, wie es Prozessor-Kerne gibt. Die Anzahl von Anfragen die Bearbeitet werden können ergibt sich aus der Multiplikation von Worker-Prozessen und Worker-Connections.
#### Ablauf einer HTTP-Anfrage
1. Aufbau der TCP-Verbindung bspw. durch den Server-Socket mit dem Port 80.
	2. Ein neuer Socket mit den Portnummern und IP-Adressen von Server und Client werden für die Verbindung erstellt.
2. HTTP-Request wird an den neu erstellten Socket gesendet.
3. Nginx führt den Server-Block aus, indem der Port und der HTTP-Header Host mit dem im Server-Block stehenden Port und Host übereinstimmt.

---

# Nginx Steuern
Syntax: `nginx -s signal`

Signale sind:
- `stop` — fast shutdown
- `quit` — graceful shutdown
- `reload` — reloading the configuration file
- `reopen` — reopening the log files

---


# Konfiguration
Konfigurationsdatei ist meist unter: /etc/nginx/nginx.conf.
Nginx besteht aus Modulen die durch Direktiven in nginx.conf konfiguriert werden.
Es gibt einfache Direktiven und Block-Direktiven. Einfacha Direktiven bestehen aus dem Namen des Moduls, dessen Parameter und enden mit einem Semikolon. Block-Direktiven bestehen ebenfalls aus dem Modul-Namen und dessen Parameter aber dann folgen geschweifte Klammern, in denen Anweisungen stehen.
Wenn eine Block-Direktive weitere Direktiven enthält, nennt man den Block auch Kontext.
Direktiven die in keiner Block-Direktive vorhanden sind, gehören zum main context.

 Beispiel: 
```nginx
# location ist die URI die in einer HTTP-Anfrage steht, also bspw. GET /XXX # # # HTTP/1.1, wobei /XXX die Ressource darstellt.
# root ist der absolute Pfad zur Ressource /XXX wobei die Ressource, also /XXX # # nicht mit angegeben wird.
server {
    listen 80;
    server_name example.com;

    location /Bilder {
	    root /absoluter/pfad/zu/ordner/mit/bilder/;
    }
}

# Der Wert von server_name ist der Hostname.
server {
    listen 8080;
    server_name test.example.com;

    # Konfiguration für test.example.com
    # ...
}
```
