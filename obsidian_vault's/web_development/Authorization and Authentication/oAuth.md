# Wichtige Begriffe

- **Resource Owner** → der User
- **Client** → deine App
- **Authorization Server** → z. B. Google
- **Access Token** → Schlüssel für APIs
- **Refresh Token** → um neue Tokens zu holen

---

# Ablauf Überblick

- Google liefert:
    - **verifizierbare Identitätsdaten des Users**:
	    - im `id_token`
- Backend:
    - validiert das `id_token`
    - extrahiert Daten aus dem `id_token`
        - email
        - name
        - google_id
    - erstellt oder findet den User in der DB
    - erstellt **eigenes JWT**
- System:
    - läuft ab dann komplett eigenständig mit deiner Auth

---

# Ablauf Detail

### 1. User startet Login

- User klickt „Login mit Google“
- Frontend:
    - Redirect zu Google OAuth Endpoint
    - Sendet:
        - client_id
        - redirect_uri
        - scope (z. B. email, profile)

### 2. Google Login + Consent

- User loggt sich bei Google ein
- Google fragt:
    - „Darf diese App auf deine Daten zugreifen?“
- User bestätigt

### 3. Redirect zurück zur App

- Google → redirect zur `redirect_uri` (Backend)
- App bekommt:
    - **authorization_code**

### 4. Backend tauscht Code gegen Tokens

- Backend:
    - sendet request an Google Token Endpoint
- App bekommt:
    - **access_token**
    - **id_token** (JWT mit User-Daten)
    - optional: **refresh_token**

### 5. User-Daten extrahieren

- App:
    - liest aus dem **id_token**:
        - email
        - name
        - google_id

### 6. User in DB synchronisieren

- App:
    - sucht User mit `google_id` oder `email`

```js
if user exists:  
    continue  
else:  
    create user
```

### 7. Eigene Auth erstellen (dein System!)

- App:
    - erstellt **eigenes JWT** (nicht das von Google!)
    - enthält z. B.:
        - userId
        - roles
        - permissions

### 8. Token an Frontend schicken

- Backend → Frontend:
    - den von der App erstellten JWT (z. B. im Cookie oder Response)

### 9. Folge-Requests

- Frontend:
    - sendet dein JWT bei jedem Request
- Backend:
    - validiert JWT
    - kennt User

---

# Validierung des id_tokens

### Ablauf:

```text
Backend bekommt id_token
→ Header lesen
→ passenden Google Public Key holen
→ Signatur prüfen
→ iss prüfen
→ aud prüfen
→ exp prüfen
→ optional email_verified prüfen
→ Claims vertrauen
```

## 1. Signatur prüfen

Google signiert das `id_token` mit seinem privaten Schlüssel.

Dein Backend:

- liest den `kid` aus dem Token-Header
- lädt den passenden **öffentlichen Schlüssel** von Google
- prüft damit die Signatur

Wenn die Signatur gültig ist:

- das Token wurde nicht manipuliert
- es wurde sehr wahrscheinlich wirklich von Google ausgestellt

---

## 2. `iss` prüfen

`iss` = issuer

Damit prüfst du, ob der Aussteller wirklich Google ist.

Typische erlaubte Werte:

accounts.google.com  
https://accounts.google.com

Wenn `iss` nicht passt:

- Token ablehnen

---

## 3. `aud` prüfen

`aud` = audience

Damit prüfst du, ob das Token wirklich für **deine Google OAuth App** ausgestellt wurde.

Der Wert muss deiner `GOOGLE_CLIENT_ID` entsprechen.

Wenn `aud` nicht deine Client-ID ist:

- Token ablehnen

---

## 4. Ablaufzeit prüfen

`exp` = expiration time

Damit prüfst du, ob das Token noch gültig ist.

Wenn `exp` in der Vergangenheit liegt:

- Token ablehnen

---

## 5. Optional: `email_verified` prüfen

Wenn du dich auf die Google-Mail-Adresse verlassen willst, prüfst du zusätzlich:

- `email_verified === true`

---

# Was danach passiert

Erst **nach erfolgreicher Validierung** darfst du diese Daten benutzen:

- `sub` → stabile Google User ID
- `email`
- `name`

Wichtig:

- **`sub`** ist die eigentliche Google-ID
- nicht `email` als primären technischen Identifier verwenden
- `sub` ist stabiler

---

# Praktisch in Node.js

Am einfachsten machst du das mit der Google-Library.

## Beispiel

**File:** `services/auth/verifyGoogleIdToken.js`

```js
import { OAuth2Client } from 'google-auth-library';

const client = new OAuth2Client(process.env.GOOGLE_CLIENT_ID);

async function verifyGoogleIdToken({ idToken }){
	const ticket = await client.verifyIdToken({
		idToken,
		audience: process.env.GOOGLE_CLIENT_ID,
	});

	const payload = ticket.getPayload();

	if(!payload){
		throw new Error('Google ID token payload is missing');
	}

	if(!payload.sub){
		throw new Error('Google ID token subject is missing');
	}

	if(!payload.email){
		throw new Error('Google ID token email is missing');
	}

	if(payload.email_verified !== true){
		throw new Error('Google email is not verified');
	}

	return {
		googleId: payload.sub,
		email: payload.email,
		name: payload.name || '',
		givenName: payload.given_name || '',
		familyName: payload.family_name || '',
		picture: payload.picture || '',
	};
}

export default verifyGoogleIdToken;
```

# Was die Library intern für dich macht

`verifyIdToken()` übernimmt im Wesentlichen:

- Google Public Keys laden
- richtige Signatur prüfen
- `aud` prüfen
- `iss` prüfen
- `exp` prüfen

Du musst danach nur noch prüfen, ob dir die Claims reichen, zum Beispiel:

- `email_verified`
- `sub`
- `email`