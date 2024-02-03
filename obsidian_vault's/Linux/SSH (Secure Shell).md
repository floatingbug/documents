→ Netzwerk-Protokoll

→ Shell Befehle werden über Netzwerk an ein anderen Computer Gesendet.

→ TCP-Verbindung wird vorher aufgebaut.

--SSH Nutzern--

→ # ssh [username@ipadresseDesRechners](mailto:username@ipadresseDesRechners)

→ # [username@ipadresseDesRechners](mailto:username@ipadresseDesRechners) passowrd:

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

  

--Ohne Passwort Einloggen (automatisches Einloggen)--

→ Dabei werden die Keys nur zur Authorisierung genutzt, nicht zur Verschlüsselung.

→ Vorgehen:

→ 1. Server generiert eine zufällige Nachricht und sendet sie an den client.

→ 2. Client signiert die Nachricht mit dem SSH-Agent und sendet sie an den Server.

→ Der SSH-Agent nutzt den private-key zur verschlüsselung.

→ 3. Server kann Nachricht mit public-key entschlüsseln.

→ Nur der pribate-key kann die Nachricht so verschlüsseln, dass

sie mit dem public-key entschlüsselt werden kann. Der Empfänger

der Nachricht muss im Besitz des private-key sein.

→ Nach der Authorisierung werden im Hintergrund Keys zur verschlüsselten

Datenübertragung ausgetauscht.

  

→ Schlüsselpaar (privat, öffentlich) auf client-rechner erstellen.

//-t steht für type, also Typ der Verschlüsselung

→ # ssh-keygen -t rsa

→ Öffentlichen Schlüssen auf Benutzeraccount des Servers bringen.

→ # scp .ssh/id_rsa.pub [user@ipadresse](mailto:user@ipadresse):home/user/.ssh

→ Login ohne Passwort.

→ # ssh [user@ipadresse](mailto:user@ipadresse)

---
  
## SSH-Agent

Signiert Nachrichten automatisch im Hintergrund. Benötigt dafür den Privat-Key.

#### Private Keys dem SSH-Agent hinzufügen 

```shell
ssh-add
```
Ohne Parameter werden ssh-keys im home-directory gesucht und dem ssh-agent hinzugefügt.

Beispiele für abgespeicherte Keys:
~/.ssh/id_rsa
~/.ssh/id_ed25519
~/.ssh/id_dsa
~/.ssh/id_ecdsa

Wenn die Keys hinzugefügt wurden, werden sie automatisch verwendet.