
# Netzwerk-Protokoll

SSH ist ein Netzwerkprotokoll. Ein Client baut eine TCP-Verbindung zu einem Server auf. Nachdem die Verbindung aufgebaut wurde, wird auf Basis der TCP-Verbindung eine SSH-Verbindung aufgebaut. Über diese SSH-Verbindung werden dann verschlüsselt Shell-Kommandos versendet.

## SSH-Handshake

- Verhandlung der Verschlüsselungsmethode für den Austausch von Nachrichten.
- Authentifizierung von Client und Server, bspw. durch: 
  - **Passwortauthentifizierung**: Der Benutzer muss ein Passwort eingeben, das der Server überprüft.
  - **Public-Key-Authentifizierung**: Der öffentliche Schlüssel (Public Key) des Clients muss beim Server vorhanden sein, und der private Schlüssel (Private Key) muss beim Client vorhanden sein.

**Authentifizierung von Client und Server**:

- **Passwortauthentifizierung**: Der Benutzer muss ein Passwort eingeben, das der SSH-Server überprüft. 
- **Public-Key-Authentifizierung**: Der Client verfügt über einen privaten Schlüssel (Private Key), und der Server hat den entsprechenden öffentlichen Schlüssel (Public Key). Der Server authentifiziert den Client, indem er eine Herausforderung verschlüsselt (eine zufällige Zeichenkette) und sendet sie an den Client. Der Client kann die Zeichenfolge mit dem private-key entschlüsseln und sendet die entschlüsselten Zeichenfolge zurück. Der Server vergleicht die Zeichenfolgen, stimmen sie überein, muss der Client über den private-key verfügen und die Verbindung wird hergestellt. 


---

# ssh (client) Kommandos

## Private Keys dem SSH-Agent hinzufügen

```shell
ssh-add /pfad/zum/privatekey
```

**Beschreibung:** Der Client schreibt in den socket, bspw. /tmp/ssh-XXXXXX51PEsL/agent.3907300//tmp/ssh-XXXXXX51PEsL/agent.3907300.
Der SSH-Agent ließt aus dem socket und speichert den private-key.
Der Pfad zum Socket wird in der Umgebungsvariable `SSH_AUTH_SOCK` gespeichert, sodass `ssh-add` und andere SSH-Client-Programme wissen, wie sie den Agenten erreichen können.

## Das Kommando ssh

Das Kommando ssh ist ein Client, dass mit einem ssh-server, meinst ein daemon mit dem namen sshd, eine TCP-Verbindung aufbaut.

Mit dem Client eine ssh-Verbindung aufbauen:
```shell
ssh [username@ipadresseDesRechners]
```

## Dem SSH-Agent hinzugefügte keys anzeigen

``` shell
ssh-add -l
```

## Verbindung ohne SSH-Agent herstellen

Die Option `-i` im SSH-Befehl steht für "identity file", also dem private key.

```shell
ssh -i /pfad/zum/privatekey user@hostname
```

## Schlüsselpaare erstellen

```shell
ssh-keygen
```

---

## Ohne Anmeldung Kopieren

#### vom Client zum host (Push)

**Einzelne Dateien:**

```shell
scp test.txt user@ipadresse:/home/user/documents
```

**Mehrere Dateien:**

```shell
scp -r testordner user@ipadresse:/home/user/folder
```

→ vom host zum client (pull)

→ # scp -r user@ipadresse:/home/user/folder



→ Schlüsselpaar (privat, öffentlich) auf client-rechner erstellen.

//-t steht für type, also Typ der Verschlüsselung

→ # ssh-keygen -t rsa

→ Öffentlichen Schlüssen auf Benutzeraccount des Servers bringen.

→ # scp .ssh/id_rsa.pub [user@ipadresse](mailto:user@ipadresse):home/user/.ssh

→ Login ohne Passwort.

→ # ssh [user@ipadresse](mailto:user@ipadresse)

---
  
# SSH-Agent

Bei einem SSH-Verbindungsaufbau reicht der Client die Herausforderung vom Server weiter an den SSH-Agent der die Herausforderung (challenge) löst. Der SSH-Agent reicht das Ergebnis an den Client und dieser sendet die Lösung an den Server. 
Ist die SSH-Verbindung aufgebaut, is der SSH-Agent wärend der Verbindung nicht mehr involviert.

## Verbindung mit den SSH-Agent

Der SSH-Agent erstellt einen Socket, damit zwischen dem SSH-Agent Prozess und anderen Prozessen Daten ausgetauscht werden können.
Der Pfad zum Socket wird in der Umgebungsvariable `SSH_AUTH_SOCK` gespeichert, sodass `ssh-add` und andere SSH-Client-Programme wissen, wie sie den Agenten erreichen können.

## SSH-Agent starten

**Beispiel:** 

```shell
eval "$(ssh-agent -s)"
```

- In der subshell wird der Agent-Prozess gestartet und die Ausgabe von ssh-agent -s wird in die shell zurückgeführt.
- Durch die Option `-s` gibt ssh-agent eine liste an Kommandos zurück, die die Shell ausführten kann, bspw. export VARIABLE oder echo "hello world". `ssh-agent -s` gibt folgendes zurück:

```shell
SSH_AUTH_SOCK=/tmp/ssh-XXXXXX/agent.12345; export SSH_AUTH_SOCK;
SSH_AGENT_PID=12345; export SSH_AGENT_PID;
echo Agent pid 12345;
```

Es werden Variablen gesetzt und als Umgebungsvariablen mit export für die Shell bereitgestellt.

- eval ist ein Programm, das Shell-Kommandos innerhalb eines Strings ausführen kann.