	
# Senden über Streams

### Ohne pipeline

pipeline ist eine methode, wie man streams heute handhabt. Damit man pipeline versteht, wird erst gezeigt, wie es ohne pipeline funktioniert und damit man versteht, wie streams funktionieren.

**Beispiel:**
```js
const { Readable, Transform } = require("stream");
const { once } = require("events");
const catchAsync = require("../../../utils/catchAsync");
const services = require("../services");

module.exports = catchAsync(async (req, res) => {
    const userId = req.user.id;
    let streamError = null;

    // --------------------------------------------------
    // Get cursor (Async Iterable)
    // --------------------------------------------------
    const cursor = await services.getTasks({ userId });

    // --------------------------------------------------
    // Readable stream from cursor
    // --------------------------------------------------
    const readable = Readable.from(cursor, {
        objectMode: true,
    });

    // --------------------------------------------------
    // Transform stream: objects -> JSON array chunks
    // --------------------------------------------------
    let isFirst = true;

    const transform = new Transform({
        writableObjectMode: true,

        transform(chunk, encoding, callback)
        {
            let data = "";

            if (!isFirst)
            {
                data += ",";
            }

            isFirst = false;
            data += JSON.stringify(chunk);

            callback(null, data);
        },
    });

    // --------------------------------------------------
    // Response headers
    // --------------------------------------------------
    res.setHeader("Content-Type", "application/json; charset=utf-8");

    // Write opening bracket manually
    res.write("[");

    // --------------------------------------------------
    // Stream wiring
    // --------------------------------------------------
    readable.pipe(transform).pipe(res);

    readable.on("error", onError);
    transform.on("error", onError);
    res.on("error", onError);

    // --------------------------------------------------
    // When writable finishes, close JSON array
    // --------------------------------------------------
    res.on("finish", () => {
        // finish fires after writable ends, so this is safe
        res.end("]");
    });

    // --------------------------------------------------
    // Wait until streaming is done
    // --------------------------------------------------
    try
    {
        await once(res, "finish");
    }
    catch (err)
    {
        throw err;
    }

    if (streamError)
    {
        throw streamError;
    }

    // --------------------------------------------------
    // Error handling
    // --------------------------------------------------
    function onError(err)
    {
        if (streamError)
        {
            return;
        }

        streamError = err;

        readable.destroy();
        transform.destroy();
        res.destroy();
    }
});
```

Überblick: Was macht der Code?

Der Code macht **manuell**, was `pipeline()` automatisch macht:
- Streams verbinden
- Backpressure wirken lassen
- auf das Ende warten
- **jeden Fehler korrekt abfangen**
- **alle Streams aufräumen**
- Fehler **sauber an `await` weiterreichen**


### 1️⃣ Vorbereitung

```js
const { once } = require("events");
let streamError = null;
```
- `once(emitter, event)`:
    - gibt ein Promise zurück
    - wird **genau einmal** erfüllt, wenn das Event eintritt
- `streamError`:
    - Speicherplatz für **den ersten Fehler**, der irgendwo im Stream-Graph auftritt

Warum speichern?  
👉 Weil Fehler **in Event-Callbacks passieren**, aber **außerhalb** von `await`.


### 2️⃣ Streams verbinden

```js
readable.pipe(transform).pipe(res);
```
Bedeutung:
- Daten fließen:
    `readable → transform → res`
- Backpressure funktioniert automatisch:
    - wenn `res` langsam ist → alles davor pausiert
- **Noch keine Fehlerbehandlung**, nur Datenfluss


### 3️⃣ Fehler abonnieren

`readable.on("error", onError); transform.on("error", onError); res.on("error", onError);`

Warum **alle drei**?
- Streams propagieren Fehler **nicht automatisch**
- ein Fehler kann entstehen in:
    - Quelle (`readable`)
    - Verarbeitung (`transform`)
    - Ziel (`res`)

👉 **Jeder Fehler führt zum gleichen Abbruchpfad**


### 4️⃣ Fehlerbehandlung (onError)

`function onError(err) {     if (streamError)     {         return;     }      streamError = err;      readable.destroy();     transform.destroy();     res.destroy(); }`

Was passiert hier logisch?

1. **Erster Fehler gewinnt**
    - weitere Fehler werden ignoriert
2. Fehler wird gespeichert
3. **Alle Streams werden sofort beendet**

Gedanklich:
> „Egal wo es kaputtgeht – alles stoppen.“

⚠️ Wichtig:
- **kein `throw` hier**
- weil das hier **asynchron** passiert


### 5️⃣ Warten bis alles fertig ist

`try {     await once(res, "finish"); } catch (err) {     throw err; }`

Was heißt das?
- Der Code pausiert hier, bis:
    - `res` **alle Daten geschrieben hat**
    - **oder** vorzeitig kaputtgeht
- `res` ist der **letzte Stream**
    - wenn er fertig ist → alle vorherigen auch

Warum `try/catch`?
- Falls `res` zerstört wird
- oder das Event nie sauber erreicht wird


### 6️⃣ Fehler an den Aufrufer weitergeben

`if (streamError) {     throw streamError; }`

Jetzt erst wird der Fehler geworfen.

Warum hier?
- Jetzt sind:
    - alle Streams beendet
    - Ressourcen freigegeben
- `throw` landet **sauber im `await`-Kontext**
- der Aufrufer kann mit `try/catch` reagieren


### 7️⃣ Gesamtfluss als Geschichte

`Streams starten ↓ Daten fließen ↓ entweder:   - alles läuft durch → finish   - irgendwo Fehler → alles zerstören ↓ await wird aufgelöst ↓ Fehler wird ggf. geworfen`


### 8️⃣ Warum `pipeline()` besser ist

Dieser Code ist:
- korrekt
- lehrreich
- aber leicht falsch zu bauen

`pipeline()` macht **genau das hier**, aber:
- kürzer
- sicherer
- ohne Edge-Cases    


### Merksatz

> **Streams laufen über Events,  
> Fehler aber über Kontrolle danach.**

### Was `pipeline()` übernimmt:

`pipe() + Backpressure + Error-Propagation + destroy() + Promise`

---

# Pipeline

**Beispiel:**
```js
    res.setHeader("Content-Type", "application/json; charset=utf-8");

    const readable = Readable.from(cursor, { objectMode: true });

    let isFirst = true;

    const transform = new Transform({
        writableObjectMode: true,
        transform(task, enc, cb) {
            try {
                const chunk = (isFirst ? "" : ",") + JSON.stringify(task);
                isFirst = false;
                cb(null, chunk);
            } catch (err) {
                cb(err);
            }
        }
    });

    await pipeline(readable, transform, res);
```


```js
const readable = Readable.from(cursor, { objectMode: true });
```

```js
await pipeline(readable, transform, res);
```
- writable, also res, signalisiert, wenn es einen chunk verarbeitet hat, das es wieder daten annehmen kann (wie signalisiert das res? mit cb?).
- transform (ist das ein readable oder writable?), sagt, ich kann wieder lesen (wie sagt das transform? durch ein cb?).
- readable, ruft cursor.next() auf (was macht readable danach?)