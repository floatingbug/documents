# Cross-Origin-Request

- Client (Browser) wird von einem Script beauftragt, auf eine Ressource auf einem Server zuzugreifen.
    - Das ausgelieferte Script stammt aber nicht von dem Server, auf dem die Ressource angefragt werden soll.
    - Der Client setzt den HTTP-Header `origin: "url"`, in dem die Ursprungsadresse des Scripts steht.

- Der Server entscheidet, anhand der Adresse in `origin: "url"`, ob der Client auf die Ressource zugreifen darf.
    - Wenn der Client auf die Ressource zugreifen darf, schickt der Server eine Antwort, mit dem HTTP-Header `Access-Control-Allow-Origin: "url"`, an den Client zurück.
        - Wenn die URL in `Access-Control-Allow-Origin` mit der URL in `origin` übereinstimmt, erlaubt der Browser die Anfrage.
    - Erst jetzt wird die eigentliche HTTP-Anfrage an den Server gesendet.

# Middleware CORS

- Wenn ein Origin-Header beim Server eintrifft, erkennt das die Middleware CORS.
    - CORS managt dann jeden CORS-Request.

### Alle anfragen erlauben

```javascript
app.use(cors());
```

```javascript
```

```javascript
```