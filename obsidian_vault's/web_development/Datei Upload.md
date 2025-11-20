## 📂 Zusammenhang: File → MIME-Type → Content-Type → Server

```scss
[File / Blob]
     │
     │  JS liest die Datei
     │  z.B. file.type
     ▼
[MIME-Type]
 (image/jpeg, image/png, application/json, ...)
     │
     │  Browser oder Server benutzt diesen Typ, um zu wissen, was für Daten das sind
     ▼
[Content-Type Header]  ← in HTTP-Request oder HTTP-Response
 (Content-Type: image/jpeg)
 (Content-Type: application/json)
 (Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryXYZ)
     │
     │  Server weiß jetzt, wie er die Daten parsen soll
     ▼
[Server / API]
 verarbeitet die Daten korrekt
```


### 🔹 Kurz erklärt mit Upload-Beispiel

#### File in JS
```js
const file = input.files[0]; 
console.log(file.type); // "image/jpeg" → MIME-Type
```

#### FormData + fetch
```js
const formData = new FormData();
formData.append("image", file);

fetch("/api/upload", { method: "POST", body: formData });
```

#### Browser setzt automatisch
```http
Content-Type: multipart/form-data; boundary=----WebKitFormBoundary123
```

👉 Der `boundary` trennt die einzelnen Dateien im Body.  
Jede Datei innerhalb des FormData-Bodys hat weiterhin ihren **eigenen MIME-Type** (z. B. `image/jpeg`).  


### 🔹 Server-Verhalten
- Liest den `Content-Type` Header.  
- Erkennt: „Multipart, mehrere Teile, trenne sie am Boundary“.  
- Jeder Teil wird anhand seines **MIME-Types** verarbeitet (`image/jpeg`, `image/png`, …).  


### 📝 Merke
- **MIME-Type** → Typ der Datei selbst.  
- **Content-Type** → HTTP-Header, der MIME-Type + evtl. Infos (wie Boundary) beschreibt.  
- **FormData** → `multipart/form-data` + `boundary` im Header.  
  - Jede Datei behält ihren eigenen MIME-Type.  


---

## 📦 Beispiel: Mehrere Bilder mit `multipart/form-data`

### HTTP Request
```http
POST /api/upload HTTP/1.1
Host: example.com
Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryABC123
```

### Body
```http
------WebKitFormBoundaryABC123
Content-Disposition: form-data; name="images[]"; filename="bild1.jpg"
Content-Type: image/jpeg

<Binärdaten von bild1.jpg>
------WebKitFormBoundaryABC123
Content-Disposition: form-data; name="images[]"; filename="bild2.png"
Content-Type: image/png

<Binärdaten von bild2.png>
------WebKitFormBoundaryABC123--
```



### 🔑 Erklärung

**Content-Type (HTTP-Header)**  
```http
Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryABC123
```

**Boundary**  
Trenner zwischen den einzelnen Dateien/Feldern.  
Muss **exakt** so im Body vorkommen, wie im Header angegeben.

**Content-Disposition**  
```http
Content-Disposition: form-data; name="images[]"; filename="bild1.jpg"
```

**Content-Type (pro Datei)**  
```http
Content-Type: image/jpeg
Content-Type: image/png
```



### 🗂 Visuelles Schema (vereinfacht)
```pgsql
[Request]
   |
   └── Content-Type: multipart/form-data; boundary=XYZ
         |
         ├── --XYZ
         |    Content-Disposition: form-data; name="images[]"; filename="bild1.jpg"
         |    Content-Type: image/jpeg
         |    <JPEG-Binärdaten>
         |
         ├── --XYZ
         |    Content-Disposition: form-data; name="images[]"; filename="bild2.png"
         |    Content-Type: image/png
         |    <PNG-Binärdaten>
         |
         └── --XYZ--
```

---

## 📦 Struktur einer FormData-Variable

## Grundidee

`FormData` ist **keine normale JS-Variable**, kein Array und auch kein Objekt im klassischen Sinn.  
Es ist ein spezielles **Map-ähnliches Objekt**, das **Key-Value-Paare** speichert:

- Key = String (`"image"`, `"images[]"`, `"workspaceId"`, …)
    
- Value = entweder ein **String** oder ein **File / Blob**

### 1️⃣ Beispiel in JS

```js
const formData = new FormData();

const file1 = new File(["foo"], "bild1.jpg", { type: "image/jpeg" });
const file2 = new File(["bar"], "bild2.png", { type: "image/png" });

formData.append("images[]", file1);
formData.append("images[]", file2);

formData.append("workspaceId", "12345");
```



### 2️⃣ Interne Struktur (visualisiert)

```plaintext
formData
│
├─ "images[]" : File { name: "bild1.jpg", type: "image/jpeg", size: ... }
├─ "images[]" : File { name: "bild2.png", type: "image/png", size: ... }
└─ "workspaceId" : "12345"
```

- Keys können mehrfach vorkommen → erlaubt mehrere Dateien unter demselben Namen.  
- Jeder File-Eintrag behält **Name, MIME-Type, Größe, Binary-Daten**.  
- Strings sind normale Key-Value-Paare (`workspaceId` → `"12345"`).



### 3️⃣ Zugriff auf die Daten

```js
// Alle Key-Value-Paare iterieren
for (let [key, value] of formData.entries()) {
  console.log(key, value);
  // key: "images[]" oder "workspaceId"
  // value: File-Objekt oder String
}

// Alle Dateien unter einem Key abrufen
const allFiles = formData.getAll("images[]");
console.log(allFiles); // [File, File]
```



### 🔑 Merke

- FormData ist **wie eine Map**: Key → String|File  
- Kann **mehrere Werte pro Key** speichern  
- Enthält **keine normale JS-Struktur** wie Array oder Objekt  
- Wird von `fetch` automatisch in **multipart/form-data** umgewandelt  

---

## 📦 FormData → multipart/form-data (ASCII-Visualisierung)

### 1️⃣ Internes FormData (JS)

```plaintext
formData
│
├─ "images[]" : File { name: "bild1.jpg", type: "image/jpeg", size: ... }
├─ "images[]" : File { name: "bild2.png", type: "image/png", size: ... }
└─ "workspaceId" : "12345"
```

- Key = Feldname  
- Value = String oder File  
- Mehrere Files unter demselben Key sind erlaubt

---

### 2️⃣ Wie fetch daraus multipart/form-data macht

```plaintext
HTTP Request Body (vereinfacht)
Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryXYZ

------WebKitFormBoundaryXYZ
Content-Disposition: form-data; name="images[]"; filename="bild1.jpg"
Content-Type: image/jpeg

<Binärdaten von bild1.jpg>
------WebKitFormBoundaryXYZ
Content-Disposition: form-data; name="images[]"; filename="bild2.png"
Content-Type: image/png

<Binärdaten von bild2.png>
------WebKitFormBoundaryXYZ
Content-Disposition: form-data; name="workspaceId"

12345
------WebKitFormBoundaryXYZ--
```

---

### 🔑 Erklärung der Struktur

1. **Boundary**  
   - Trennt die einzelnen Teile im Body  
   - Wird automatisch vom Browser gesetzt  
   - Muss exakt mit dem `Content-Type` Header übereinstimmen  

2. **Content-Disposition**  
   - Name des Feldes (`images[]` oder `workspaceId`)  
   - Optional der Dateiname bei Files  

3. **Content-Type pro Teil**  
   - Jede Datei behält ihren eigenen MIME-Type  
   - Strings brauchen keinen Content-Type  

4. **Binärdaten**  
   - Die echten File-Daten werden direkt eingefügt, **nicht Base64**  

---

### 3️⃣ Merke

- FormData = Map-ähnliche Struktur in JS  
- fetch + FormData → multipart/form-data  
- Mehrere Werte pro Key sind erlaubt (`images[]`)  
- Browser setzt automatisch `boundary` und Content-Type  
