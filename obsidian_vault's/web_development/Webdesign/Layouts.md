
# Welche layouts gibt es

### Public-layout (Besucher)

##### Zweck
- Produkt erklären
- Vertrauen aufbauen
- CTA zur Registrierung

##### **Typische Seiten**
- Landing (`/`)
- Features (`/features`)
- Pricing (`/pricing`)

**Keine App-Funktionalität**

### Auth-layout (Anmelden / Registrieren)

##### Zweck
- Eine fokussierte Aktion

##### Typische Seiten
- `/auth/signin`
- `/auth/signup`
- `/auth/reset-password`

**Kein Public- oder App-Navi**

### App-layout (Arbeiten & Organisieren)

##### Zweck
- Inhalte organisieren
- Überblick behalten
- Zwischen Bereichen navigieren

##### Typische Seiten

- Notes-Liste (`/app/notes`)
- Ordner / Tags (`/app/tags`)
- Suche (`/app/search`)
- Einstellungen (`/app/settings`)

**Primäre Navigation sichtbar (Sidebar)**

### Editor-layout (Erstellen & Bearbeiten)

##### Zweck
- Inhalte erstellen
- Inhalte bearbeiten
- Fokus & Flow ermöglichen

##### Typische Seiten
- Note bearbeiten (`/app/notes/:id`)
- Neue Note (`/app/notes/new`)
- Fokus- / Vollbildmodus

**Keine globale Navigation, nur kontextbezogene Tools**

### Dashboard-layout (Überblick & Status)

##### Zweck
- Überblick verschaffen
- Status prüfen
- Entscheidungen vorbereiten

##### Typische Seiten
- Dashboard Home (`/dashboard`)
- Statistiken (`/dashboard/stats`)
- Reports (`/dashboard/reports`)

**Informations- statt Arbeitsfokus**

### Merken

**PublicLayout = Informieren**
**AuthLayout = fokussieren auf Authentication**
**AppLayout = Organisieren & Navigieren**  
**EditorLayout = Schreiben & Denken**
**DashboardLayout = Überblick verschaffen**

---

# Public-layout

**Topbar**
- Hauptnavigation (Pages)
	- Typische Topbar-Links (bewährt)
		**Minimal & Standard (SaaS-typisch)**
		- Home
		- Features
		- Pricing
		- Sign in
		- **Sign up** (CTA, hervorgehoben)

		**Erweitert (bei erklärungsbedürftigen Produkten)**
		- Home
		- Features
		- Use Cases
		- Pricing
		- Docs / Help
		- Sign in
		- **Sign up**

- Logo
- CTA (Sign up / Get started)


**Sidebar**
- ❌ keine

**Content Area**
- Marketing-Content
- Sections / Grids
- Storytelling

**Footer**
- Links
- Rechtliches
- Secondary Navigation

**Ziel**
- Informieren    
- Vertrauen aufbauen
- Conversion (der Moment, in dem ein Besucher, durch ui, das tut, was er tun soll)

---

# Auth-layout

**Topbar**
- ❌ keine

**Sidebar**
- ❌ keine

**Content Area**
- Formular (Sign in / Sign up)
- Validierung
- Fehlermeldungen

**Footer**
- ❌ keine (optional minimal)

**Ziel**
- Eine fokussierte Aktion
- Keine Ablenkung

---

# App-layout

**Topbar**
- Sekundäre Aktionen
- Suche
- User-Menü
- Globale Statusinfos

**Sidebar (Navigation)**
- Primäre Navigation
- Notes / Ordner / Tags
- Kontextwechsel

**Content Area**
- Listen
- Übersichten
- Detailansichten (read-only oder leicht interaktiv)

**Footer**
- ❌ keine

**Ziel**
- Navigieren
- Organisieren
- Überblick behalten

---

# Editor-layout

**Topbar (minimal)**
- Titel
- Save / Sync Status
- Back / Close
- Mode Switch (Preview / Edit)

**Sidebar links (Tools)**
- Schreib-Tools
- Block-Typen
- Formatierung
- Shortcuts

**Sidebar rechts (Context / Properties)**
- Tags
- Metadaten
- Outline
- Backlinks

**Content Area (Canvas)**
- Schreiben
- Bearbeiten
- Fokusmodus

**Footer**
- ❌ keine

### Mentales Modell (entscheidend)

✍️ EditorLayout

Fokus, Inhalt, Arbeit

➡️ Alles, wo der Nutzer aktiv an einer Sache arbeitet

👉 Nicht nach Seiten denken, sondern nach Nutzerzustand

---

# Dashboard-layout

**Topbar**
- Globaler Kontext
- Zeitfilter
- User / Account

**Sidebar (Navigation)**
- Dashboard-Bereiche
- Reports
- Statistiken

**Content Area**
- Widgets
- KPIs
- Charts
- Statuskarten

**Footer**
- ❌ keine

### Mentales Modell (entscheidend)

### 🧠 DashboardLayout

> **Überblick, Navigation, Kontext**

➡️ Alles, wo der Nutzer **entscheidet, was er tun will**

---
