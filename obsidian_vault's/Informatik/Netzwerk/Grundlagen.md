# Wie empfangen Programme bzw. Prozesse Daten aus einem Socket?

## Prozess muss "wissen", wann Daten im Socket vorhanden sind

### Polling:
Das Programm führt regelmäßig Leseoperationen durch, ohne zu wissen ob neue Daten im Socket vorhanden sind. Dazu wird recv() oder read() genutzt, die Systemcalls an das OS senden, das dann aus dem jeweiligen socket ließt. recv() wird als Parameter eine buffer-Adresse übergeben, damit das OS weis, wo die Daten aus dem Socket gespeichert werden sollen.

Dies kann ineffizient sein, da es zu hoher CPU-Auslastung führt, wenn häufig geprüft wird, ob Daten vorhanden sind.

Blockiert 

### Ereignisgesteuertes Lesen:
Das Betriebssystem bietet Mechanismen wie `select()`, `poll()`, `epoll()` (Linux: [[POSIX]]) oder `kqueue()` (BSD) an, mit denen ein Programm benachrichtigt werden kann, wenn Daten auf einem Socket verfügbar sind. Diese Methoden ermöglichen effizienteres Warten auf Ereignisse, ohne kontinuierlich den Socket prüfen zu müssen.

## Client Beispliel in C

**connect():** 
stellt die TCP-Verbindung zum Server her. connect() blockiert den Prozess für eine gewisse Zeit, bis die Verbindung aufgebaut wurde. Konnte in dieser Zeit keine verbindung aufgebaut werden, gibt connect() [[errno]] zurück.
Ist der socket auf non-blocking gesetzt, gibt connect(); sofort 1 zurück, wenn die Verbindung noch nicht aufgebaut wurde. Dann kann mit recv() überprüft werden, ob Daten im Kernel-Buffer für den anstehenden socket zur verfügung steht. Ist dies der fall, wurde auch eine Verbindung aufgebaut.

connect() gibt folgendes zurück:
- `0`: Verbindung erfolgreich hergestellt.
- Positiver Wert: Verbindung wird asynchron.
- `-1`: Fehler bei der Verbindungsherstellung.
- In [[errno]] sind immer detailliertere Beschreibungen enthalten, bspw. kann [[errno]] den string "EINPROGRESS" enthalten, wenn die Verbindung noch hergestellt wird.

**recv():** 
Schreibt Daten aus dem Kernel-Buffer (Buffer zeigt auf den Socket), in den Buffer des Programms. Wenn keine Daten vorhanden sind, blockiert recv() den Prozess und startet ihn erst wieder, wenn Daten im Kernel-Buffer vorhanden sind.
Ist der socket auf non-blocking geschaltet, gibt recv() beim Aufruf sofort `EWOULDBLOCK` oder `EAGAIN` zurück. Dadurch kann recv() in einer Schleife ausgeführt werden und der Prozess blockiert nicht.

**Socket in den nicht blockierenden Modus versetzen:**
fcntl(sockfd, F_SETFL, O_NONBLOCK). Dabei steht sockfd für den Socket-Deskriptor, F_SETFL für das Setzen des folgenden Flags und O_NONBLOCK für das nicht-blockierende Flag.

**Beispiel mit einem Blockierenden Socket:**
```c
#include <sys/types.h>
#include <sys/socket.h>
#ineWclude <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>

#define PORT 8080
#define BUF_SIZE 1024

int main() {
    int sockfd;
    struct sockaddr_in server_addr;
    char buffer[BUF_SIZE];

    // Socket erstellen
    if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        perror("Socket creation failed");
        exit(EXIT_FAILURE);
    }

    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(PORT);
    server_addr.sin_addr.s_addr = INADDR_ANY;

    // Mit dem Server verbinden
    if (connect(sockfd, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
        perror("Connection failed");
        close(sockfd);
        exit(EXIT_FAILURE);
    }

    // Daten mit recv() vom Server lesen
    ssize_t bytes_received = recv(sockfd, buffer, BUF_SIZE, 0);
    if (bytes_received < 0) {
        perror("recv failed");
    } else {
        printf("Received %zd bytes: %s\n", bytes_received, buffer);
    }

    // Beispielhafte Verwendung von read() mit einer Datei
    int fd = open("example.txt", O_RDONLY);
    if (fd < 0) {
        perror("File open failed");
    } else {
        ssize_t bytes_read = read(fd, buffer, BUF_SIZE);
        if (bytes_read < 0) {
            perror("read failed");
        } else {
            printf("Read %zd bytes from file: %s\n", bytes_read, buffer);
        }
        close(fd);
    }

    // Socket schließen
    close(sockfd);

    return 0;
}

```

**Beispiel mit einem non-blocking-socket:**
```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <arpa/inet.h>

#define PORT 8080
#define BUF_SIZE 1024

int main() {
    int sockfd;
    struct sockaddr_in server_addr;
    char buffer[BUF_SIZE];

    // Socket erstellen
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0) {
        perror("Socket creation failed");
        exit(EXIT_FAILURE);
    }

    // Socket in den nicht-blockierenden Modus versetzen
    int flags = fcntl(sockfd, F_GETFL, 0);
    if (flags < 0) {
        perror("fcntl F_GETFL failed");
        close(sockfd);
        exit(EXIT_FAILURE);
    }

    if (fcntl(sockfd, F_SETFL, flags | O_NONBLOCK) < 0) {
        perror("fcntl F_SETFL failed");
        close(sockfd);
        exit(EXIT_FAILURE);
    }

    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(PORT);
    server_addr.sin_addr.s_addr = inet_addr("127.0.0.1");

    // Mit dem Server verbinden
    if (connect(sockfd, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
        if (errno != EINPROGRESS) {
            perror("Connection failed");
            close(sockfd);
            exit(EXIT_FAILURE);
        }
    }

    ssize_t total_bytes_received = 0;
    ssize_t bytes_received;

    // Schleife zum Lesen aller Daten
    while (1) {
        bytes_received = recv(sockfd, buffer + total_bytes_received, BUF_SIZE - total_bytes_received, 0);
        
        if (bytes_received > 0) {
            total_bytes_received += bytes_received;
        } else if (bytes_received == 0) {
            printf("Server closed connection\n");
            break;
        } else {
            if (errno != EWOULDBLOCK && errno != EAGAIN) {
                perror("recv failed");
                break;
            }
        }

        // Optional: Verarbeiten Sie die Daten oder brechen Sie die Schleife, wenn Sie genug Daten haben
        // Zum Beispiel, wenn Sie eine bestimmte Nachrichtengröße erwarten:
        // if (total_bytes_received >= EXPECTED_MESSAGE_SIZE) {
        //     break;
        // }
    }

    if (total_bytes_received > 0) {
        printf("Received %zd bytes: %s\n", total_bytes_received, buffer);
    }

    // Socket schließen
    close(sockfd);

    return 0;
}

```