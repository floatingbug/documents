# Funktionsweise
Nginx weist dem Betriebssystem an, welche Server-Sockets es erstellen soll. Die Portnummern für die Server-Sockets werden in nginx.conf angegeben. Z.B.: listen 80 und listen 81. In diesem fall erstellt das Betriebssystem zwei Server-Sockets durch Aufforderung von nginx, wenn nginx gestartet wird.

#### Prozesse von nginx
Nginx Besteht aus den Processen: master process und den worker-processes. 
Der master process ließt und evaluiert die Konfiguration und verwaltet die worker-processes.
Die worker-processes verwalten die Verbindungen und Verarbeiten die HTTP-Anfragen.
#### Worker-Prozesse
- Nginx erstellt so viele Worker-Prozesse, wie es Prozessor-Kerne gibt.
- Jeder Worker-Prozess kann mehrere Sockets mit Hilfe von Worker-Connections verwalten. 
- Worker-Prozesse werden von dem master process beim starten von nginx gestartet und sind dann autonome unabhängige Prozesse.
- Der master process kann die Worker-Prozesse bspw. starten oder stoppen.

Ein Worker-Prozess erstellt für jeden Socket sogenannte Worker-Connections die der Verwaltung der Sockets dienen, bspw. Lesen aus dem Socket und Schreiben in den Socket oder das Beenden der Verbindung. 

Der Worker-Prozess nutzt seine Worker-Connection um aus einen Socket zu Lesen und gelangt so zur HTTP-Anfrage. Der Worker-Prozess bearbeitet dann die HTTP-Anfrage entsprechend der Konfiguration in nginx.conf und nutzt dann die entsprechende Worker-Connection um die HTTP-Antwort in den entsprechenden Socket zu schreiben.

Insgesammt können so viele Anfragen parallel beantwortet werden, wie es Prozessor-Kerne gibt. Die Anzahl von Anfragen die Bearbeitet werden können ergibt sich aus der Multiplikation von Worker-Prozessen und Worker-Connections.

**Beispiel:** Server mit zwei Kernen kann zwei Anfragen gleichzeitig verarbeiten.
![[nginx-parallel-processing.png]]
#### Ablauf einer HTTP-Anfrage
1. Aufbau der TCP-Verbindung bspw. durch den Server-Socket mit dem Port 80.
	2. Ein neuer Socket mit den Portnummern und IP-Adressen von Server und Client werden für die Verbindung erstellt.
2. HTTP-Request wird an den neu erstellten Socket gesendet und gelangt von diesem in einen von nginx erstellten Worker-Prozessen.
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
Es gibt einfache Direktiven und Block-Direktiven. Einfache Direktiven bestehen aus dem Namen des Moduls, dessen Parameter und enden mit einem Semikolon. Block-Direktiven bestehen ebenfalls aus dem Modul-Namen und dessen Parameter aber dann folgen geschweifte Klammern, in denen Anweisungen stehen.
Wenn eine Block-Direktive weitere Direktiven enthält, nennt man den Block auch Kontext.
Direktiven die in keiner Block-Direktive vorhanden sind, gehören zum main context.

 Beispiel: 
```nginx
# location ist die angefragte Resource die in einer HTTP-Anfrage steht, also bspw. GET /resource.
# root ist der absolute Pfad zur Ressource /XXX wobei die Ressource, also /XXX # # nicht mit angegeben wird.
server {
    listen 80;
    server_name example.com;

    location /Bilder {
	    root /absoluter/pfad/zu/ordner/mit/bilder/;
    }
}

# Der Wert von server_name ist der Hostname.
# Bei Anfragen an Port 8080, bei denen im host-header der http-anfrage
# test.example.com steht, wird dieser server-block ausgefürht.
# In dem IP-Header steht die Server-IP-Adresse aber im HTTP-host-Header 
# steht der Domain-Name, der vom DNS in die Server-IP-Adresse aufgelöst wurde.
server {
    listen 8080;
    server_name test.example.com;

    # Konfiguration für test.example.com
    # ...
}
```

---

# Eine Homepage über nginx hosten

Standardmäßig werden Webinhalte unter `/var/www/` abgelegt. Dort wird ein neues Verzeichnis für die Homepage erstellen. In dem neu erstellten Verzeichnis wird dann die Homepage abgelegt (index.html, style.css usw.).

### NGINX Konfiguration

NGINX verwendet Dateien im Verzeichnis `/etc/nginx/sites-available/` für die Konfiguration der Websites. Diese Dateien werden normalerweise nach `/etc/nginx/sites-enabled/` verlinkt, um sie zu aktivieren.

#### Erstellen der Konfigurationsdatei

Eine neue Konfigurationsdatei wird in `/etc/nginx/sites-available/` erstellt, bspw. `/etc/nginx/sites-available/homepageName`

```nginx
server {
    listen 80;
    server_name mywebsite.com www.mywebsite.com;

    root /var/www/mywebsite;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    error_page 404 /404.html;
    location = /404.html {
        internal;
    }

    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        internal;
    }
}
```
- **`listen 80;`**: Der Server hört auf Port 80 (HTTP).
- **`server_name mywebsite.com www.mywebsite.com;`**: Gibt den Domainnamen an. Ersetze `mywebsite.com` durch deine Domain.
- **`root /var/www/mywebsite;`**: Der Pfad zu deinen Website-Dateien.
- **`index index.html;`**: Die Indexdatei.

#### Aktivieren der Konfiguration

Einen symbolischen Link in `/etc/nginx/sites-enabled/` erstellen:

```shell
sudo ln -s /etc/nginx/sites-available/mywebsite /etc/nginx/sites-enabled/
```

#### NGINX neu starten

Überprüfe die Konfiguration auf Fehler:
`sudo nginx -t`

Wenn keine Fehler vorliegen, starte NGINX neu:
`sudo systemctl restart nginx`

### 3. Hosts-Datei bearbeiten (Optional)

Falls du lokal testen möchtest, füge die Domain zu deiner `/etc/hosts`-Datei hinzu:
`sudo nano /etc/hosts`

Füge folgende Zeile hinzu:
`127.0.0.1 mywebsite.com`

### Zusammenfassung

- **Webinhalte**: `/var/www/mywebsite`
- **Konfigurationsdatei**: `/etc/nginx/sites-available/mywebsite`
- **Symbolischer Link**: `/etc/nginx/sites-enabled/mywebsite`

Durch diese Schritte wird NGINX so konfiguriert, dass es deine Homepage bereitstellt. Stelle sicher, dass deine Domain richtig konfiguriert ist und auf deinen Server zeigt, um die Website im Internet zugänglich zu machen.

---

# Automatisch ssh-Zertifikat installieren

**Certbot**. Es wird von der **Let's Encrypt**-Initiative bereitgestellt und automatisiert die Beantragung, Installation und Erneuerung von SSL-Zertifikaten.

### Hauptfunktionen von Certbot:

1. **Automatische SSL-Zertifikat-Beantragung**: Es beantragt ein Zertifikat bei Let's Encrypt.
2. **Automatische Konfiguration von Webservern**: Certbot kann SSL-Zertifikate direkt in **Nginx** oder **Apache** konfigurieren.
3. **Automatische Erneuerung**: Certbot überwacht und erneuert Zertifikate vor ihrem Ablauf.

---

### Installation von Certbot:

Die Installation hängt von deinem Betriebssystem ab. Hier ein Beispiel für Ubuntu:

bash

Code kopieren

`sudo apt update sudo apt install certbot python3-certbot-nginx`

---

### Zertifikat für Nginx anfordern:

Nach der Installation kannst du mit einem einzigen Befehl ein Zertifikat anfordern und es automatisch in die Nginx-Konfiguration einfügen lassen:

bash

Code kopieren

`sudo certbot --nginx`

---

### Zertifikat automatisch erneuern:

Certbot installiert einen Cron-Job oder Systemd-Timer, um Zertifikate automatisch zu erneuern. Du kannst es aber manuell testen:

bash

Code kopieren

`sudo certbot renew --dry-run`