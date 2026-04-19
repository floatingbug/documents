
# Was sind Streams?

**Streams** verarbeiten Daten **stückweise (Chunks)** statt alles auf einmal in den Speicher zu laden.

Typische Use-Cases:
- Dateien lesen/schreiben
- Netzwerk (TCP / HTTP)
- Kompression
- Parsing großer Datenmengen

Ein Readable Stream liest Daten aus einer Quelle und produziert durch das Lesen, daten im Stream, deshalb ist ein Readable Stream der Produzent.  
Ein Writable Stream empfängt diese Daten und konsumiert sie, daher ist ein Writable Stream ein Konsument.

## Merksatz

**Lesen erzeugt Daten im Stream,  
Schreiben verbraucht Daten aus dem Stream.**

---

### Events

##### `"data"`

- Node ruft intern die **V8-API** auf, um das `"data"`-Event im JS-Heap auszulösen.
- Alle JS-Callbacks, die via `readable.on("data", callback)` registriert wurden, werden dann auf dem **Main Thread** aufgerufen.

##### `"end"`

- Wird ausgelöst, **wenn ein Readable Stream keine weiteren Daten mehr liefern kann**.
- Node informiert JS über die V8-API, dass der Stream abgeschlossen ist.
- Alle Callbacks, die via `readable.on("end", callback)` registriert wurden, werden ausgeführt.

##### `"error"`

- Wird ausgelöst, wenn ein Fehler im Stream auftritt (z. B. Lesefehler, Schreibfehler, Transform-Fehler).
- Node ruft die V8-API auf, um das Event zu emittieren.
- JS-Callbacks via `stream.on("error", callback)` werden auf dem **Main Thread** aufgerufen.
- Wichtig: Wird kein Listener registriert, beendet Node den Prozess.

##### `"close"`

- Wird ausgelöst, wenn ein Stream geschlossen wird (z. B. FileDescriptor freigegeben).
- Tritt auch nach `"end"` auf, wenn der Stream sauber beendet wurde.
- JS-Callbacks via `stream.on("close", callback)` werden aufgerufen.

##### `"drain"` (leer geworden/abgeflossen)

- Relevant für Writable Streams.
- Wird ausgelöst, **wenn der interne Write-Buffer wieder Platz hat**, nachdem er voll war.
- Node ruft die V8-API auf, um JS zu informieren, dass weitere Writes möglich sind.
- JS-Callbacks via `writable.on("drain", callback)` können darauf reagieren, z. B. um `stream.resume()` aufzurufen.

##### `"finish"`

- Relevant für Writable Streams.
- Wird ausgelöst, **wenn alle `write()`-Aufrufe verarbeitet und der Stream geschlossen wurde** (`stream.end()` aufgerufen).
- Node emittiert das Event über V8, alle JS-Callbacks via `writable.on("finish", callback)` werden aufgerufen.

##### `"pipe"`

- Wird bei Readable Streams ausgelöst, **wenn der Stream mit `.pipe(writable)` verbunden wird**.
- JS-Callbacks via `readable.on("pipe", callback)` erhalten den Writable Stream als Argument.

##### `"unpipe"`

- Wird ausgelöst, **wenn ein Stream vom Ziel-Stream getrennt wird** (`readable.unpipe(writable)` oder automatisch am Ende).
- Node informiert JS über V8-API, Callbacks erhalten das betroffene Writable-Objekt.

---

# Wer macht was in Streams

### JS-Code

Im JS-Code kann man node durch Funktionsaufrufe mitteilen, was gemacht werden soll.

### Node

Node nutzt Buffer, in die node Daten Schreiben und Lesen kann.
Node nutzt libuv, wenn Daten aus dem Buffer an einen anderen Ort des Dateisystems gespeichert werden soll, bspw. in eine Datei oder in einen Socket-Buffer des OS.

### libuv

libuv wird von node dann verwendet, wenn mit dem OS kommuniziert wird, bspw. wenn Daten aus dem Buffer im User-Space in eine Datei geschrieben werden soll.

---

# Funktionsweise
### Readable Stream

- Node hält einen **internen Read-Buffer** (User-Space)
    - Hier landen Daten, die **von libuv / OS gelesen wurden**, bevor Node sie JS zur Verfügung stellt.
    - JS kann sofort `read()` aufrufen oder den `data` Event empfangen.

### Writable Stream

- Node hält einen **internen Write-Buffer**
    - JS schreibt Daten über `write()` in den Node-Buffer, **libuv schreibt sie dann asynchron ins OS**.
    - Wenn der Buffer voll ist → Backpressure → `write()` gibt `false` zurück → Node pausiert weitere Writes.
    - libuv verarbeitet den Buffer Stück für Stück, bis alle Daten im OS angekommen sind.

💡 **Merksatz:**

> Read-Buffer = „Daten aus der Quelle, noch nicht gelesen“  
> Write-Buffer = „Daten, die JS schon geschrieben hat, noch nicht im OS“


Ruft man im JS-Code eine **Stream-Funktion** auf (z. B. `readable.read()`, `writeStream.write(chunk)`, `readable.pipe(transform)`), wird Node aktiv. Node übernimmt die Ausführung und macht Folgendes:

### Daten lesen aus einem Readable Stream

- **Situation**: JS will Daten vom Readable Stream lesen (z. B. Datei, HTTP-Request, DB-Cursor)
- **Node-Verhalten**:
    - Prüft, ob **interner Buffer schon Daten enthält**
        - ja → gibt sofort Chunk zurück
        - nein → Node ruft **libuv** auf, um Daten asynchron vom OS oder externen Source zu lesen
    - Node speichert die Daten in **User-Space Buffer**
    - Wenn Daten verfügbar → löst `data` Event aus oder erfüllt `read()` Promise
    - Bei Fehler → `error` Event ausgelöst

---

### Daten in einen Writable Stream schreiben

- **Situation**: JS ruft `writeStream.write(chunk)` auf    
- **Node-Verhalten**:
    - Speichert Chunk zuerst im **Node-internen Writable Buffer**
    - Prüft, ob **libuv bereits schreiben kann**
        - ja → libuv ruft OS-Funktionen (`write(fd, buffer, ...)`) auf
        - nein → Node pausiert weitere Writes
    - Wenn libuv fertig → Node löst ggf. `drain` Event aus
    - JS kann über `write()` Rückgabewert (`true`/`false`) erkennen, ob Backpressure wirkt
    - Bei Fehler → `error` Event ausgelöst

---

###  Transform / Duplex Streams

- **Situation**: Stream transformiert Daten zwischen Readable und Writable (z. B. JSON → String)
- **Node-Verhalten**:
    - Ist **Readable + Writable gleichzeitig**
    - Wenn **Writable zu langsam** → Transform pausiert automatisch (`pause()` / `resume()`)
    - Wenn Transform verarbeitet → `push()` auf Readable-Seite → nächste Stufe erhält Chunk
    - Fehler → `error` Event auf Transform ausgelöst


### Pipes (Verkettung von Streams)

- **Situation**: `readable.pipe(transform).pipe(res)`
- **Node-Verhalten**:
    - Stellt **Backpressure automatisch** her
    - Leitet `error` Events korrekt weiter
    - Sorgt dafür, dass **Writable erst schreibt, wenn es kann**
    - `end` Event am letzten Stream → alle vorherigen Streams automatisch beendet


### Abbruch oder Fehler

- **Situation**: Irgendein Stream wirft Fehler (`error`) oder wird zerstört
- **Node-Verhalten**:
    - Unterbricht alle verbundenen Streams (bei `pipe` automatisch, sonst manuell nötig)
    - Interner Buffer wird freigegeben
    - JS kann über Event oder `await pipeline()` reagieren


### Backpressure

- **Situation**: Ziel-Writable kann Daten nicht sofort aufnehmen    
- **Node-Verhalten**:
    - Pausiert Readable / Transform
    - Wartet auf `drain` Event
    - Sobald Writable wieder bereit → Resume


💡 **Kurz zusammengefasst:**

| Situation                 | Node-Verhalten                                                                    |
| ------------------------- | --------------------------------------------------------------------------------- |
| Readable: Daten abrufen   | Prüft Buffer → ggf. libuv aufrufen → Daten ins User-Space-Buffer → Event auslösen |
| Writable: Daten schreiben | Node-Buffer füllen → libuv schreibt ins OS → `drain` Event bei Backpressure       |
| Transform / Duplex        | Kombiniert Lesen + Schreiben → Backpressure + Push/Transform                      |
| Pipes                     | Automatisches Verbinden → Backpressure + Fehler → End → Cleanup                   |
| Fehler / Abbruch          | Streams zerstören → Buffer freigeben → Event auslösen                             |

---

# Stream-Typen

### Readable Stream

➡️ produziert Daten (durch Lesen entstehen Daten im Stream)

```js
const fs = require("fs");

const readStream = fs.createReadStream("input.txt");

readStream.on("data", chunk => {
  console.log(chunk.toString());
});

readStream.on("end", () => {
  console.log("Done");
});
```

Events:

- `data` → neuer Chunk    
- `end` → keine Daten mehr
- `error` → Fehler

---

### Writable Stream

⬅️ konsumiert Daten (Durch Schreiben, werden Daten verbraucht und gelangen so aus den Stream)

```js
const fs = require("fs");

const writeStream = fs.createWriteStream("output.txt");

writeStream.write("Hello\n");
writeStream.end("World\n");

```

Events:

- `finish` → alle Daten geschrieben    
- `error`

---

### Duplex Stream

↔️ Readable + Writable  
(z. B. TCP-Socket)

```js
socket.on("data", chunk => {
  socket.write(chunk);
});
```

---

### Transform Stream

🔁 verändert Daten

```js
const { Transform } = require("stream");

class UppercaseTransform extends Transform {
  _transform(chunk, encoding, callback) {
    const result = chunk.toString().toUpperCase();
    callback(null, result);
  }
}
```

---

# Pipes (wichtig!)

### Einfaches Pipe

```js
readStream.pipe(writeStream);
```

- verbindet Readable → Writable
- Backpressure automatisch geregelt
- **kein manuelles `data`-Handling nötig**

### Ohne pipe

Manuell müsste man das **Datenfluss-, Backpressure- und End-Handling selbst machen**:
```js
readStream.on("data", (chunk) => {
    // write gibt false zurück, wenn Writable-Puffer voll ist
    if (!writeStream.write(chunk)) {
        // Readable pausieren, bis Writable wieder frei ist
        readStream.pause();

        writeStream.once("drain", () => {
            readStream.resume();
        });
    }
});

readStream.on("end", () => {
    // alles gelesen, Writable schließen
    writeStream.end();
});

readStream.on("error", (err) => {
    writeStream.destroy();
    console.error("Error in readStream:", err);
});

writeStream.on("error", (err) => {
    readStream.destroy();
    console.error("Error in writeStream:", err);
});
```

---

### Pipe Chaining

```js
readStream
  .pipe(new UppercaseTransform())
  .pipe(writeStream);
```

➡️ Daten fließen durch mehrere Streams

---

# File → File (Best Practice)

```js
const fs = require("fs");

const readStream = fs.createReadStream("input.txt");
const writeStream = fs.createWriteStream("output.txt");

readStream.pipe(writeStream);
```

✔️ speicherschonend  
✔️ schnell  
✔️ robust

---

# Error Handling

⚠️ **Streams emittieren Errors selbstständig**

### Klassisch (pipe)

```js
readStream.on("error", console.error);
writeStream.on("error", console.error);
```

❌ fehleranfällig bei mehreren Streams

---

# `pipeline()` – empfohlen ✅

```js
const fs = require("fs");
const { pipeline } = require("stream");

pipeline(
  fs.createReadStream("input.txt"),
  new UppercaseTransform(),
  fs.createWriteStream("output.txt"),
  err => {
    if (err) {
      console.error("Pipeline failed", err);
    }
  }
);

```

✔️ kümmert sich um:
- Error Propagation
- Stream Cleanup
- sauberes Beenden

👉 **Immer `pipeline()` statt `.pipe()` in produktivem Code**

---

# Backpressure (kurz erklärt)

- Writable ist langsamer als Readable
	- Buffer ist voll, aber das schreiben von vorherigen Daten ist noch nicht abgeschlossen.
- Stream stoppt automatisch das Lesen
- Kein Memory Overflow

💡 **Pipe + pipeline lösen das für dich**

---

## 8️⃣ Custom Readable / Writable (kurz)

### Custom Readable

```js
const { Readable } = require("stream");

class MyReadable extends Readable {
  _read() {
    this.push("data");
    this.push(null);
  }
}
```

### Custom Writable

```js
const { Writable } = require("stream");

class MyWritable extends Writable {
  _write(chunk, encoding, callback) {
    console.log(chunk.toString());
    callback();
  }
}
```

---

# Wichtigste Events (Spickzettel)

| Stream | Event    | Bedeutung               |
| ------ | -------- | ----------------------- |
| Read   | `data`   | Chunk verfügbar         |
| Read   | `end`    | fertig                  |
| Write  | `finish` | Schreiben abgeschlossen |
| All    | `error`  | Fehler                  |

---

## 🔑 Merksätze

- **Streams = Datenfluss**
- **pipe = automatisch + sicher**
- **pipeline = produktionsreif**
- **Nie große Dateien mit `readFile()`**
- **Backpressure passiert automatisch**

# 🔁 Streams vs Buffers

## Buffer

- **Alles auf einmal**    
- Blockiert Speicher proportional zur Größe
- Einfach, aber gefährlich bei großen Daten

```js
const data = fs.readFileSync("bigfile.txt");
```

❌ lädt komplette Datei in den RAM

---

## Stream

- **Daten fließen in Chunks**
- Konstanter Speicherverbrauch
- Ideal für große Daten & IO

```js
fs.createReadStream("bigfile.txt");
```

✅ RAM bleibt klein  
✅ sofortige Verarbeitung

### Merksatz

> **Buffer = Eimer**  
> **Stream = Wasserleitung**

---

# 🌊 Streams im HTTP-Server

## Request = Readable

## Response = Writable

```js
http.createServer((req, res) => {
  req.pipe(res);
});
```

- Client sendet Daten → `req` produziert Chunks
- Server sendet Antwort → `res` konsumiert Chunks

---

### Datei streamen (Best Practice)

```js
http.createServer((req, res) => {
  fs.createReadStream("video.mp4").pipe(res);
});
```

✔️ kein `readFile`  
✔️ Backpressure automatisch  
✔️ skaliert

---

## Uploads (Readable nutzen)

```js
req.on("data", chunk => {
  // chunkweise verarbeiten
});
```

Oder besser:

```js
req.pipe(fs.createWriteStream("upload.bin"));
```

---

# 🧠 Backpressure intern erklärt (ohne Tiefenbohrung)

## Problem

- Quelle schneller als Senke
- Speicher würde explodieren

## Lösung

- Writable sagt: **„Stopp, ich bin voll“**
- Readable pausiert automatisch

```js
readable.pipe(writable);
```

Node/libuv regelt:
- `highWaterMark`
- Pause / Resume
- kein manuelles Timing nötig

### Merksatz

> **Backpressure = Selbstregulierender Datenfluss**

---

# 🧪 Streams testen

## Readable testen

```js
const { Readable } = require("stream");

const stream = Readable.from(["a", "b", "c"]);

stream.on("data", chunk => {
  console.log(chunk.toString());
});
```

---

## Writable mocken

```js
const { Writable } = require("stream");

const writable = new Writable({
  write(chunk, enc, cb) {
    console.log("got:", chunk.toString());
    cb();
  }
});
```

---

## Transform testen

```js
const { pipeline } = require("stream");

pipeline(
  Readable.from(["hello"]),
  new UppercaseTransform(),
  writable,
  err => {
    if (err) throw err;
  }
);
```

---

# 🔗 Pipes vs Pipeline (wichtig!)

### pipe

```js
read.pipe(write);
```
- simpel
- ❌ Fehlerhandling manuell

---

### pipeline ✅

```js
pipeline(readable, transform, res);
```

- Errors propagieren korrekt
- Streams werden sauber geschlossen
- **Produktion → immer pipeline**

---

# Wie funktionieren pipelines?

```js
pipeline(readable, transform, res);
```

- readable, transform und res sind JS-Objects.
- Wenn Node daten ließt, speichert Node sie in ein Backing-Store-Buffer.
- Node erstellt für die Bytes im Backing-Store ein Buffer-Object (ein Buffer-Object ist ein JS-Object, es wird auch als chunk bezeichnet).
- Node speichert das Buffer-Object im JS-Heap und die Referenz in readable.
- Wenn transform bereits mehr bytes enthält als durch die highWaterMark angegeben, pausiert Node readable, wodurch Node keine weiteren Bytes ließt und somit auch keine weiteren Backing-stores und Buffer-Objects, die Referenzen auf diese Stores halten, erstellt.
- Wenn transform unter die highWaterMark gelangt, speichert node die nächste Referenz aus readable in transform, gleichzeitig wird die Referenz aus readable entfernt.
- Wenn transform ein Buffer-Object/chunk tranformiert hat, wird push() aufgerufen, bspw.:
```js
_transform(chunk, encoding, callback) {
    const transformed = doSomething(chunk);
    this.push(transformed); // gibt den neuen Chunk auf der Readable-Seite aus
    callback();             // signalisiert Node, dass der Chunk fertig verarbeitet ist
}
```
- this.push(transformed) veranlast Node, einen neue Backing-Store zu erstellen, und dort die transformierten bytes zu speichert.
- Node erstellt ein Buffer-Object, speichert dieses in den JS-Heap und in transform die Referenz darau.
- Node prüft, ob res unterhalb der highWaterMark ist, wenn ja, speichert Node die Referenz in res.
- Wenn die Referenz in res als nächstes an der reihe ist, ruft Node res.write(chunk) auf.