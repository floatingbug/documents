# Replica Set

Mehrere Instanzen des DBMS (mongod, also mongo server), verwalten die selben Daten. Dabei steht jeder Instanz eine Kopie der zu verwaltenden Daten zur verfügung.
Die Instanzen befinden sich entweder auf dem gleichen Rechner auf virtuellen Rechner, oder auf mehreren Rechner verteilt (Cluser).
Bei einer Transaktion müssen alle mongod Instanzen eine erfolgreiche Datenbankoperation abgeschlossen haben, an sonsten wird der Ursprung der Datenbanken wieder hergestellt.

## Replica Set Konfigurieren

### Erzeugen der mongod Instanzen

- **Konfigurationsdateien:** Erstellen Sie für jede `mongod` Instanz eine eigene Konfigurationsdatei mit spezifischen Einstellungen (Port, Datenpfad, etc.).
- **Service-Dateien:** Erstellen Sie für jede `mongod` Instanz eine eigene Systemd-Service-Datei.
- **Dienstverwaltung:** Starten und aktivieren Sie die Dienste, damit sie beim Systemstart automatisch ausgeführt werden.

#### Konfigurationsdateien
Für jede mongod Instanz eine .conf erstellen z.B.: `/etc/mongod1.conf`, `/etc/mongod2.conf`, etc. Jede Datei sollte die spezifischen Einstellungen für eine `mongod` Instanz enthalten, einschließlich des Ports, des Datenpfads und der Replica-Set-Informationen.

##### Beispiel:
**replication:** Folgende Konfigurationsparameter sollen für die Replikation verwendet werden.
**replSetName:** Name des Replica Sets festlegen.

/etc/mongod1.conf
``` yaml
storage:
  dbPath: /var/lib/mongodb1
systemLog:
  destination: file
  path: /var/log/mongodb/mongod1.log
  logAppend: true
net:
  bindIp: 127.0.0.1
  port: 27017
replication:
  replSetName: rs0
```

/etc/mongod2.conf
``` yaml
storage:
  dbPath: /var/lib/mongodb2
systemLog:
  destination: file
  path: /var/log/mongodb/mongod2.log
  logAppend: true
net
  bindIp: 127.0.0.1
  port: 27018
replication:
  replSetName: rs0
```

#### Service-Dateien für jede mongod Instanz

/etc/systemd/system/mongod1.service
```ini
[Unit]
Description=MongoDB Database Server - Instance 1
After=network.target

[Service]
User=mongodb
ExecStart=/usr/bin/mongod --config /etc/mongod1.conf
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure
Type=forking

[Install]
WantedBy=multi-user.target
```

etc/systemd/system/mongod2.service
```ini
[Unit]
Description=MongoDB Database Server - Instance 2
After=network.target

[Service]
User=mongodb
ExecStart=/usr/bin/mongod --config /etc/mongod2.conf
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure
Type=forking

[Install]
WantedBy=multi-user.target
```

```shell
sudo systemctl daemon-reload
sudo systemctl start mongod1
sudo systemctl start mongod2
sudo systemctl enable mongod1
sudo systemctl enable mongod2
```

## Initialisieren des Replica Sets

**rs.initiate():** mongod startet einen Primärknoten und initialisiert die Konfiguration (mongodb.conf) für das Replica Set.
Nach der Ausführung sieht der Prompt wie folgt aus `rs0 [direct: primary] test >`: `rs0` ist der Name des Replica Sets, `[direct: primary]` zeigt an, dass befehle vom primary node durchgeführt werden, `test` zeigt an, dass man sich auf der Datenbank test befindet.

```shell
rs.initiate()
rs.status()
```

**Primary node:** Die mongod Instanz primary node nimmt änderung an Daten entgegen und sendet diese an die members (secondary nodes).

**Secondary node:** Ist ebenfalls eine mongod Instanz.

**Members:** mongod Instanzen eines Replica Sets werden als members bezeichnet.

## Members hinzufügen

**Aktuelle Replica Set Konfiguration anzeigen:**

```shell
rs.conf()
```

**Member Hinzufügen**
der hostname kann beliebig gewält werden. Die Portnummber muss die des mongod prozesses sein. Das `priority` und `votes`-Feld sind optional.

```shell
rs.add({ host: "localhost:27017", priority: 0, votes: 0 })
```

```shell
```

---

# Cluster

Bei einem Cluster sind Mehrere Rechner miteinander Verbunden und Interargieren miteinander.