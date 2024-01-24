## Konfiguration
- Konfigurationsdatei ist meist unter: /etc/nginx/nginx.conf.

## Funktionsweise
- Bei einem request entscheidet nginx anhand der Port-Nummer und des "Host" welcher virtueller Server die Anfrage bearbeiten soll.
	- Der Hostname ist im Http-Header-Feld "Host" vorhanden.
	- 
- Beispiel: 

server {
    listen 80;
    server_name example.com;

    location / {
	    root /data/www
    }
}

server {
    listen 8080;
    server_name test.example.com;

    # Konfiguration für test.example.com
    # ...
}

Der Wert von server_name ist der Hostname.

---

- nginx nutzt mehrere sockets die alle ihre eigene Portnummer haben.
	- Wird ein HTTP-request an socket mit der Portnummer 8080 gesendet und mit dem Host test.example.com, dann wird der entsprechende server-block in der nginx.conf-Datei ausgeführt.
	- Nginx verwendet die `listen`-Direktive in seiner Konfiguration, um dem Betriebssystem mitzuteilen, sockets mit den Portnummer zu erstellen, die mit listen angegeben sind.
	- In der Nginx-Konfiguration wird der erste `server`-Block als der Standardserver behandelt, wenn kein anderer `server`-Block mit passenden Parametern für die eingehende Anfrage gefunden wird.