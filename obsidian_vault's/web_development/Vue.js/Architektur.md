src/
├─ app/                       # App-Rahmen (globale Konfiguration)
│   ├─ router/                # Routen, Guards, Middlewares
│   ├─ store/                 # globale Stores, wenn wirklich nötig
│   ├─ config/                # Env, Theme, PrimeVue, i18n …
│   ├─ layouts/               # App-weite Layout-Komponenten
│   ├─ styles/                # SCSS, Tokens, Base Styles
│   └─ App.vue
│
├─ shared/                    # Framework-unabhängige, wiederverwendbare Dinge
│   ├─ components/            # z. B. Buttons, FormInputs, Loader etc.
│   ├─ composables/           # z. B. useFetch, useDebounce, useTheme
│   ├─ services/              # z. B. http.service.js, websocket.service.js
│   ├─ utils/                 # formatDate, parseError etc.
│   └─ lib/                   # Konstanten, EventBus, Exceptions
│
├─ entities/                  # Fachliche Basismodelle und APIs (User, Space, Task …)
│   ├─ user/
│   │   ├─ model/user.model.js
│   │   └─ api/user.api.js
│   └─ space/
│       ├─ model/space.model.js
│       └─ api/space.api.js
│
├─ features/                  # Konkrete Use-Cases (Login, CreateSpace, InviteUser …)
│   ├─ auth/
│   │   ├─ ui/
│   │   │   ├─ LoginView.vue
│   │   │   └─ RegisterView.vue
│   │   ├─ store/useAuthStore.js
│   │   ├─ service/auth.service.js
│   │   └─ api/auth.api.js
│   └─ createSpace/
│       ├─ ui/CreateSpaceForm.vue
│       └─ service/createSpace.service.js
│
├─ pages/                     # Route-Einstiegspunkte -> verbinden Features/Entities
│   ├─ DashboardPage.vue
│   ├─ SettingsPage.vue
│   └─ ProfilePage.vue
│
└─ main.js


## ⚙️ Tooling

- Testing
    - `vitest` → Units und Integration (z. B. Komponenten oder Composables)
    - `playwright` → E2E‑Flows (Login, Routing, Formulare)
- Linting & Formatierung
    - `eslint` + `prettier`
- Type Checking (optional)
    - Du bleibst bei JS → nutze `//@ts-check` und JSDoc‑Typen für besseren IntelliSense