# Unterscheidung Mikro- Makro-Architektur

- **Makro-Architektur** = Systemdesign (Monolith, Microservices, SSR usw.)
- **Mikro-Architektur** = Code-Struktur, Projekt-Organisation, Komponentendesign

---

# Makro-Architektur

### 🖼 Frontend-Architekturen

##### 1. **SPA (Single Page Application)**

- Klassiker mit Vue, React, Angular.
- Wird noch lange bleiben, aber oft mit SSR/SSG kombiniert.


##### 2. **SSR (Server-Side Rendering)**

- Beispiel: **Next.js (React)**, **Nuxt (Vue)**.
- Wichtig für SEO, Performance, schnelle TTFB.
- Kombination aus Server & Client wichtig für fast jede moderne Web-App.

##### 3. **SSG (Static Site Generation)**

- Für Content-Websites, Blogs, Marketing.
- KI kann Content generieren → Devs orchestrieren Build-Prozesse.

##### 4. **Islands Architecture / Partial Hydration**

- Moderne Alternative zu Voll-SPA (Astro, Qwik).
- Nur Teile der Seite interaktiv → bessere Performance.

##### 5. **Micro-Frontends**

- Große Teams, die unabhängig am Frontend arbeiten.
- Tools: Module Federation, Webpack 5, Vite Federation.
- Vor allem in Enterprises relevant.

##### 6. **Design-Systeme & Component Driven Development**

- Storybook, Design-Tokens, UI-Libraries.
- Wichtig, da KI zwar Komponenten schreiben kann, aber **Consistency & UX** musst du sicherstellen.



### ⚙️ Backend-Architekturen

##### 1. **Monolith**

- Schnell, simpel, oft mit Express/Nest oder Rails/Django.
- Auch 2030 noch relevant, besonders bei MVPs und KMUs.

##### 2. **Modular Monolith**

- Monolith, aber klar getrennte Module.
- Gute Zwischenstufe zwischen Monolith ↔ Microservices.
- Sehr gefragt, weil es **Komplexität spart**, aber skalierbar bleibt.

##### 3. **Microservices**

- Services pro Fachbereich, kommunizieren via API/Event-Bus.
- Tooling: Kubernetes, Kafka, gRPC, REST/GraphQL.
- Wichtig, aber in kleinen Projekten Overkill → du musst verstehen, **wann ja und wann nein**.

##### 4. **Serverless / Functions as a Service**

- AWS Lambda, Vercel Functions, Cloudflare Workers.
- Für kleine, unabhängige Services → stark wachsend.

##### 5. **Event-Driven Architecture**

- Systeme reagieren auf Events (Kafka, RabbitMQ, NATS).
- Sehr wichtig für Echtzeit & skalierbare Systeme (z. B. Streaming, IoT, E-Commerce).

##### 6. **Hexagonal / Clean Architecture**

- Business-Logik entkoppeln von Frameworks/DB.
- Sehr zukunftssicher, weil KI zwar Code schreibt, aber **gute Boundaries & Layers** nur du designst.

##### 7. **CQRS & Event Sourcing** (optional für Spezialfälle)

- Commands & Queries trennen, Event-Sourcing für Audit/History.
- Eher advanced, aber gut zu kennen für FinTech, kritische Systeme.



### 🌍 Übergreifend (Fullstack)

##### 1. **API-Architekturen**

- **REST** (Standard, einfach)
- **GraphQL** (flexible Abfragen, aber komplexer)
- **gRPC** (binary, High-Performance, Microservices)

##### 2. **BFF (Backend for Frontend)**

- Ein spezielles API-Gateway für jede App (z. B. Web, Mobile).
- Wichtig, weil Frontends sonst an Backend-Komplexität ersticken.

##### 3. **Edge Computing**

- Code läuft nah am User (Cloudflare Workers, Vercel Edge).
- Wird immer wichtiger für Low-Latency.

##### 4. **Cloud-Native Architekturen**

- Kubernetes, Docker, Service Mesh (Istio).
- Nicht alles selbst machen → aber die **Konzepte** verstehen.


### 🚀 Fazit: Must-Have vs. Nice-to-Have

✅ **Muss man kennen (Future-Proof)**

- SPA + SSR/SSG (Next/Nuxt, Astro, Qwik)
- Modular Monolith & Microservices (inkl. Event-Driven)
- Clean/Hexagonal Architecture
- REST & GraphQL APIs
- BFF (Backend for Frontend)
- Serverless Basics

⚡ **Nice-to-Have (für Enterprise / Spezialfälle)**

- Micro-Frontends
- CQRS/Event Sourcing
- Service Mesh / gRPC
- Edge Computing

---

# Mikro-Architektur

### 🔹 Frontend (Vue/React/Angular)

- **Atomic Design / Component Driven Development** → Atome, Moleküle, Organismen, Seiten.
- **Feature-Sliced Design (FSD)** → Strukturierung nach Features statt nach technischen Layern.
- **Container-Presenter Pattern** → Container (Logik) und Presentational Components (UI).
- **Module-based Structuring** → `features/`, `widgets/`, `entities/` usw.


### 🔹 Backend (Node/Express/Nest/etc.)

- **Layered Architecture (Controller → Service → Repository/Model)**  
    → du nutzt das ja schon 👍
- **Hexagonal / Ports & Adapters** → Business-Logik entkoppelt von Frameworks und Datenbank.
- **Domain-Driven Design (DDD Light)** → Strukturen nach Bounded Contexts, Entities, Aggregates.
- **Vertical Slice Architecture** → Jede Funktionalität von API → Service → DB in einem „Slice“.


### 🔹 Cross-Cutting

- **Separation of Concerns** (UI, State, Business, Persistence klar trennen).
- **Feature-First vs. Layer-First** → Wissen, wann man was nutzt.
- **Monorepo vs. Multirepo** (z. B. mit Turborepo, Nx).