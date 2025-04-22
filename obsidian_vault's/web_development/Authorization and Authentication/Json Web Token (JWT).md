# Anwendung
- Authorization (nicht Authentication).
- Token wird benutzt, um sicherzustellen, dass der bereits eingeloggte Benutzer der den Request sendet, auch berechtigt ist den Request zu tätigen, also das der Request auf dem Server ausgeführt wird.

# Vergleich JWT und Sessions
### Authorization ohne JWT
- Der Server verwendet Sessions in denen die Benutzerdaten gespeichert werden, bspw. express-session.
	- Bei jedem Request sendet der Benutzer die Session-Id, mit der die Session des Benutzers auf dem Server Identifiziert wird in der die Benutzerdaten vorhanden sind.

### Authorization mit JWT
- Wie bei Sessions muss sich der Benutzer mit seinem Password anmelden. Der Server erstellt bei der Anmeldung keine Session sondern erstellt ein Token den er mit seinem geheimen Schlüssel signiert.
	- Dieser Token wird im Client und nicht im Server gespeichert.
- In dem Token, der bei jedem Request gesendet wird, befinden sich die Benutzerdaten.

# Technische Umsetzung

### Token Zusammensetzung
- Der Token besteht aus dem Header, Payload und der Signatur. Diese Daten sind im JSON-Format.
	- Header: In ihm steht, welcher Algorithmus zum Kodieren und Dekodieren des tokens benutzt wird und um welche Art von Token es sich handelt.
		- base64 kodiert, aber nicht verschlüsselt.
	- Payload: Benutzerinformationen.
		- base64 kodiert, aber nicht verschlüsselt.
	- Signatur: Der Algorithmus (ein Hash-Algorithmus), der ein String aus den Daten (Header, Payload und Secret Key) erzeugt (der String ist also die Signatur).
		- Der Server überprüft den Token, indem er den base64 decodierten Header und Payload dekodiert, den Secret Key hinzufügt und erneut signiert. Stimmt diese Signatur mit der an dem Token angehängte Signatur überein, wurde die Nachricht nicht manipuliert.
	- ![[Bildschirmfoto vom 2023-10-30 09-12-19.png]]

### Ablauf 
- Nach dem senden der Benutzerdaten an den Server (Name und Password), erstellt der Server ein JWT.
	- Der Token hat diese Form: Header.Payload.Signatur
		- Header und Payload sind base64 kodiert, die Signatur ist ein Hashwert aus Header+Payload+Secret.
			- Der Hashwert/Signatur wird vor der base64 kodierung erstellt.
- Die durch Punkten getrennten bestandteile (Header, Payload, Signatur) werden an den Client gesendet.
- Der Client sendet bei jeder Anfrage den Token.
- Der Server signiert den vom Client gesendeten Token erneut.
	- Header + Body + Secret Key (nur auf Server vorhanden) = Signatur.
	- Stimmt diese Signatur mit der vom Client gesendeten  Signatur überein, wurde die Nachricht nicht manipuliert.
		- Verfügt aber der Client über den Secret Key, kann der Client eine gültige Signatur erzeugen.

# HTTP
Der Token wird meist im HTTP-Header Authorization gesendet 
also: Authorization: Bearer "Tokenstring".
Vor dem Token steht, welches Authentifizierungsschema angewendet wird. Beim JWT handelt es sich um einen Bearer Token (Zugriffstoken) der verwendet wird, um auf dem Server auf geschützte Ressourcen zuzugreifen.
Es wird "Bearer" genannt, da der Client es einfach "mit sich trägt" (englisch: "to bear"), um seine Identität zu authentifizieren.

# Beispiel mit node.js


