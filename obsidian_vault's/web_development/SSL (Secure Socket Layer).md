# SSL-Zertifikat und HTTPS

#### Zweck des SSL-Zertifikats
- Aufbau einer HTTPS-Verbindung.
- Verschlüsselung der Kommunikation zwischen Web-Server und Client (meist Browser).
- Nachweis für den Client, dass die Domain auch von dem Domain Besitzer stammt. Das ist möglich, weil der Domain Besitzer vor dem Erhalt des Zertifikats von einer CA validiert wurde (validiert von der CA).

#### Erst SSL-Handshake dann HTTP-Anfrage
Bevor eine verschlüsselte HTTP-Anfrage gesendet werden kann, einigen sich Server und Client am Ende des SSL-Handshake auf ein symmetrischen Schlüssel, mit dem die HTTP-Daten verschlüsselt und entschlüsselt werde.
Dadurch, dass Client und Server die HTTP-Pakete, mit Hilfe des symmetrischen Schlüssels, verschlüsselt über die TCP-Verbindung austauschen, bezeichnet man die TCP-Verbindung als verschlüsselt. Diese Verschlüsselte Verbindung bezeichnet man als HTTPS.
Bevor der SSL/TLS-Handshake beginnen kann, wird eine **TCP-Verbindung** über Port 443 aufgebaut.
### **Wichtige Details**

- **Verschlüsselte Verbindung:** HTTPS bezeichnet eine Kombination aus HTTP (für die Datenübertragung) und SSL/TLS (für die Verschlüsselung). Die TCP-Verbindung selbst bleibt unverändert, wird aber durch die Verschlüsselung der übertragenen Daten sicher.
- **HTTPS ≠ neue Verbindung:** HTTPS nutzt die bestehende TCP-Verbindung, fügt jedoch eine Verschlüsselungsschicht hinzu.

#### Erhalt eines SSL-Zertifikats
Ein SSL-Zertifikat stammt von einer Zertifizierungsstelle (CA). 
Der Antragsteller erstellt ein Schlüsselpar und bettet den Public-Key in den Zertifikatsantrag (CSR: Certificate Signed Request). Mit dem Privat-Key wird die Signatur des CSR verschlüsselt. Dann sendet der Antragsteller den CSR an die CA.
Die CA erstellt eine Signatur des CSR, entschlüsselt die mitgelieferte Signatur und vergleicht beide Signaturen. Stimmen beide überein, sendet die CA eine Zertifikatskette zurück, das alle Zertifikate vom Endentitätszertifikat (Zertifikat des Domain-Besitzers) bis zum Wurzelzertifikat enthält. 

#### Zertifikate in der Zertifikatskette
- Endentitätszertifikat: Vom Domain Besitzer.
- Zwischenzertifikat: Vom CA der das Endentitätszertifikat ausgestellt hat.
- Wurzelzertifikat: Von der Wurzelzertifizierungsstelle. Im Browser vorinstalliert.

#### Signieren und verschlüsselung der Signatur eines Zertifikats
1. Ein Hash-Wert des Zertifikats wird erstellt. Dieser Hash-Wert ist die Signatur.
2. Hash-Wert/Signatur wird mit Privat-Key verschlüsselt.
3. Mit dem Public-Key kann die Signatur wieder entschlüsselt werden.

#### Überprüfung der Signatur eines Zertifikats
1. Signatur mit Public-Key entschlüsseln.
2. Eigene Signatur/Hash-Wert des Zertifikats erstellen.
3. Die mit dem Zertifikat mitgelieferte Signatur mit der Eigenen Signatur vergleichen.
	1. Stimmen beide Signaturen überein, stammt die Signatur vom besitzer des Privat-Key, da nur der Privat-Key die Signatur so verschlüsseln kann, dass man die Signatur wieder durch den Public-key erhält.

#### Aufbau der HTTPS-Verbindung (SSL-Handshake)
Um das Endentitätszertifikat zur überprüfen, benötigt der Client (Browser) die Zertifikatskette.
Jedes Zertifikat in der Zertifikatskette wird von einer Zertifizierungsstelle Signiert. 
Um die Signatur eines Zertifikats zu Überprüfen, wird der Public-Key der CA benutz, die das Zertifikat signiert hat.

**SSL-Handshake:** 
1. Server sendet Zertifizierungskette an Client.
2. Client entnimmt den Public-Key aus dem Zwischenzertifikat und überprüft das Endentitätszertifikat. Ist die Signatur des Endentitätszertifikat korrekt, wird die überprüfung fortgesetzt.
3. Ist der Client beim letzten Zertifikat angekommen, nutzt der Client den Schlüssel aus dem Wurzelzertifikat, um die Signatur des letzten Zertifikats zu überprüfen. Stimmt diese Signatur, stimmt auch die Signatur des Endentitätszertifikat.
4. Client und Server einigen sich auf einen symmetrischen Schlüssel, mit dem die Daten ver- und entschlüsselt werden.

Das Wurzelzertifikat ist auf dem Browser oder Betriebssystem vorinstalliert.