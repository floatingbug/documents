
# Client

### Socket erstellen

**Funktion socket:**

Parameter:

- **Erster Parameter**: Gibt das **Adressierungs-Schema** an, z. B. `AF_INET` für IPv4 oder `AF_INET6` für IPv6.
- **Zweiter Parameter**: Gibt die **Art und Weise der Datenübertragung** an. Zum Beispiel:
    - `SOCK_STREAM` steht für eine **verbindungsorientierte** und **zuverlässige** Übertragung mit einem **byteorientierten** Stream (normalerweise TCP).
    - `SOCK_DGRAM` wird für **verbindungslos**e und **paketorientierte** Übertragung (typischerweise UDP) verwendet.
- **Dritter Parameter**: Gibt das **Netzwerkprotokoll** an, mit dem die Daten transportiert werden.
    - `0` wählt das **Standardprotokoll**, das dem im zweiten Parameter angegebenen Typ entspricht. Bei `SOCK_STREAM` wird standardmäßig **TCP** verwendet.
    - Alternativ könnte man explizit ein bestimmtes Protokoll angeben, falls gewünscht (z. B. eine andere IP-basierte Protokollvariante).

Rückgabe:
-  Der Filedescriptor des erstellten sockets.

```c
int socketFD = socket(AF_INET, SOCK_STREAM, 0);
```

