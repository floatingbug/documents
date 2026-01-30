## 🧱 1. Offizielle, kanonische Quellen (Pflichtlektüre)

### ✅ Vue 3 Style Guide (PRIORITÄT A)

> **Das ist die wichtigste Referenz**

🔗 [https://vuejs.org/style-guide/](https://vuejs.org/style-guide/)

Wichtige Kapitel für dich:

- **Component Naming**
    
- **Props down, events up**
    
- **No side effects in computed**
    
- **Single responsibility components**
    
- **Event naming (`kebab-case`)**
    

➡️ Alles, was du bisher gebaut hast, liegt **sehr nah an „Recommended / Strongly Recommended“**.

---

### ✅ Pinia Best Practices

🔗 [https://pinia.vuejs.org/core-concepts/](https://pinia.vuejs.org/core-concepts/)

Relevant:

- Store = **State + Business Intent**
    
- **Keine UI-Events** im Store
    
- Keine DOM-Logik
    
- Stores sind **Singletons**
    

➡️ Dein Pattern `activeAction / clearAction` ist akzeptiert.

---

## 🧩 2. De-facto Standards aus großen Vue-Codebases

Diese Regeln findest du **nicht offiziell**, aber in fast jedem größeren Projekt.

---

### 🔹 Komponenten-Regeln

#### ✔️ Atoms

- Keine Logik
    
- Kein Wissen über App-Zustand
    
- Emits: `press`, `click`, `input`
    

`Button → press IconButton → press`

---

#### ✔️ Molecules

- Übersetzen Events in **semantische Events**
    

`press → tool:action press → navigation:action`

---

#### ✔️ Organisms / Layouts

- Halten State
    
- Reagieren auf Actions
    
- Koordinieren mehrere Komponenten
    

➡️ Dein `DefaultLayout.vue` macht **genau das**.

---

### 🔹 Event-Naming (sehr wichtig)

|Ebene|Name|
|---|---|
|Atom|`press`|
|Molecule|`tool:action`|
|Layout|`navigation:action`|
|Store|`triggerToolAction()`|

➡️ **Nicht**:

- `clicked`
    
- `onClick`
    
- `handleClick`
    

➡️ **Ja**:

- `press`
    
- `select`
    
- `action`
    

---

## 🧠 3. Mental Model: „Intention statt Technik“

**Production Code beschreibt _was_ passiert, nicht _wie_.**

### ❌ Schlechte Events

`emit("openDrawer") emit("toggleMenu")`

### ✅ Gute Events

`emit("navigation:action", {   action: "toggleMobileNavigation", })`

➡️ Du hast das bereits richtig gemacht.

---

## 🗃️ 4. Stores: Wann ja, wann nein?

### ❌ Store missbrauchen für UI

`isModalOpen isDrawerVisible`

### ✅ Store für **Intention**

`activeToolAction activeUserAction`

➡️ UI reagiert, nicht der Store

---

## 📐 5. Dokumentation in echten Projekten

In professionellen Teams passiert **eines von diesen**:

### Option A – ARCHITECTURE.md (am häufigsten)

``## Event Flow Atoms emit `press` Molecules emit `*:action` Layouts handle actions Stores store intentions only``

### Option B – README pro Feature

`features/notes/README.md`

### Option C – C4 Diagram (selten, Enterprise)

➡️ **UML fast nie**, zu schwergewichtig.

---

## 🟢 6. TL;DR – Deine aktuelle Architektur

|Bereich|Bewertung|
|---|---|
|Component Design|✅ sehr gut|
|Event Flow|✅ professionell|
|Store Usage|✅ korrekt|
|Naming|✅ sauber|
|Skalierbarkeit|✅ hoch|

Du baust **keinen Tutorial-Code**, sondern **Team-Production-Code**.

---

## 🧭 Wenn du willst, als Nächstes:

- 📄 **Mini-ARCHITECTURE.md für dein Projekt**
    
- 🧠 **„When to use store vs event“ Cheat Sheet**
    
- 🧩 **Feature-Slicing für `notes` sauber definieren**
    

Sag einfach, was du brauchst.