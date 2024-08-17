# Einrichtung:

## Schritt 1

**Repository auf github.com so konfigurieren, dass ein post request gemacht wird, wenn sich etwas im Repository ändert, bspw. bei einem push.**

- **auf GitHub.**
- **Navigieren zu "Settings" -> "Webhooks".**
- **Klicken auf "Add webhook".**
- **Payload-URL des Servers eingeben.**
    - Beispiel: `http://servername.com/webhook`
- **"application/json" als Content type wählen.**
- **"Just the push event" auswählen.**
- **Klicken auf "Add webhook".**

### Schritt 2: Webhook-Skript auf Ihrem Server einrichten

Erstellen eines einfaches Webhook-Skript auf dem Server, das den `git pull` Befehl ausführt, wenn eine Push-Benachrichtigung (per post) empfangen wird.

1. **Verzeichnis für das Webhook-Skript erstellen:**

```sh
mkdir -p /path/to//webhook
cd /path/to/webhook
```

2. einfaches Node.js-Skript erstellen (webhook.js):
```javascript
const http = require('http');
const exec = require('child_process').exec;

const server = http.createServer((req, res) => {
  if (req.method === 'POST' && req.url === '/webhook') {
    let body = '';

    req.on('data', chunk => {
      body += chunk.toString();
    });

    req.on('end', () => {
      res.writeHead(200, { 'Content-Type': 'text/plain' });
      res.end('OK');

      // Optional: Validate the webhook signature here

      // Execute git pull
      exec('cd /path/to/repo && git pull', (error, stdout, stderr) => {
        if (error) {
          console.error(`exec error: ${error}`);
          return;
        }
        console.log(`stdout: ${stdout}`);
        console.error(`stderr: ${stderr}`);
      });
    });
  } else {
    res.writeHead(404, { 'Content-Type': 'text/plain' });
    res.end('Not Found');
  }
});

server.listen(3000, () => {
  console.log('Server is listening on port 3000');
});

```