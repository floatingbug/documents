# Cross-Origin-Request

- Client (Browser) wird von einem Script oder einer html-Datei beauftragt, auf eine Ressource auf einem Server zuzugreifen.
    - Das Script oder die html-Datei die das Script  anfordert, stammt aber nicht von dem Server von dem das Script angefragt werden soll.
    - Der Client setzt den HTTP-Header `origin: "url"`.
	    - `url` ist die Adresse, von der das Script oder die html-Datei stammt, die das Script anfordert, das über eine andere `url` angefordert wird.

- Der Server entscheidet, anhand der Adresse in `origin: "url"`, ob der Client auf die Ressource zugreifen darf.
    - Wenn der Client auf die Ressource zugreifen darf, schickt der Server eine Antwort, mit dem HTTP-Header `Access-Control-Allow-Origin: "url"`, an den Client zurück.
        - Wenn die URL in `Access-Control-Allow-Origin` mit der URL in `origin` übereinstimmt, erlaubt der Browser die Anfrage.
    - Erst jetzt wird die eigentliche HTTP-Anfrage an den Server gesendet.


### Ablauf einer **einfachen Anfrage (Simple Request)**:

1. Der Browser sendet direkt die HTTP-Anfrage mit dem `Origin`-Header.
2. Die API prüft den `Origin`-Header und entscheidet, ob die Anfrage erlaubt ist.
3. Falls erlaubt, sendet die API **sofort** die HTTP-Antwort mit `Access-Control-Allow-Origin`.
4. Falls nicht erlaubt, bekommt der Client die Antwort zwar technisch, aber der Browser blockiert den Zugriff darauf.

📌 **Wichtig:**

- Eine **einfache Anfrage** ist nur `GET`, `POST` oder `HEAD` **ohne spezielle Header** oder `Content-Type: application/json`.
- Falls zusätzliche Header oder Methoden (`PUT`, `DELETE`) genutzt werden, gibt es einen **Preflight (`OPTIONS`)** davor.


### Ablauf einer **Preflight-Anfrage (Preflight Request):**

1. Der Browser sendet zuerst eine **`OPTIONS`-Anfrage** mit dem `Origin`-Header, um zu prüfen, ob die eigentliche Anfrage erlaubt ist.
2. Die API prüft den `Origin`-Header und sendet, falls erlaubt, eine Antwort mit den CORS-Headern (`Access-Control-Allow-Origin`, `Access-Control-Allow-Methods`, `Access-Control-Allow-Headers`).
3. Falls die Antwort korrekt ist, sendet der Browser erst danach die **eigentliche HTTP-Anfrage**.
4. Falls die `OPTIONS`-Antwort keine gültigen CORS-Header enthält oder die Anfrage nicht erlaubt ist, blockiert der Browser die eigentliche Anfrage.

📌 **Wichtig:**

- Preflight-Anfragen passieren bei **`PUT`**, **`DELETE`**, **`PATCH`** oder wenn spezielle Header (`Authorization`, `Content-Type: application/json`) genutzt werden.
- Die `OPTIONS`-Anfrage wird **automatisch** vom Browser gesendet, der Code im Vue-Client bekommt das nicht mit.


# Middleware CORS

- Wenn ein Origin-Header beim Server eintrifft, erkennt das die Middleware CORS.
    - CORS managt dann jeden CORS-Request.

### Alle anfragen erlauben

- **`origin: "*"`**: Erlaubt Anfragen von allen Ursprüngen (Domains).
- **`allowedHeaders: ["Content-Type", "Authorization"]`**: Gibt an, welche HTTP-Header der Client in seinen Anfragen senden darf.

```javascript
app.use(cors({
	origin: "*"
}));
```

### Erlauben welche Header der client senden darf

```javascript
app.use(cors({
	allowedHeaders: ["Content-Type", "Authorization"]
}));
```

### Header in javaScript zugänglich machen

Es gibt Header, wie Authorization, die von javaScript nicht gelesen werden können. Erst wenn der Header Access-Control-Expose-Headers auf true gesetzt ist, kann javaScript auf diesen zugreifen. 

```javascript
app.use(cors({
	exposedHeaders: ["Authorization"]
}));
```
