# Vue 3 modulare Projektstruktur

```plaintext
project-root/
├── package.json
├── public/
│   └── index.html
└── src/
    ├── main.js              // Einstiegspunkt der Anwendung
    ├── App.vue              // Haupt-Layout
    ├── router/
    │   └── index.js         // Globale Router-Konfiguration
    └── modules/
        └── auth/
            ├── index.vue    // Layout mit <router-view>
            ├── router/      // Modul-spezifische Routen
            │   └── index.js
            ├── signIn/      // Untermodule für SignIn
            │   ├── index.vue
            │   ├── router/
			|   └── index.js
	        |   ├── components/  // UI-Komponenten
            │   ├── views/       // Seiten
            │   ├── composables/ // Composition API Hooks
            │   └── services/    // API-Interaktionen
            └── signUp/         // Untermodule für SignUp
                ├── index.vue
                ├── router/
			    └── index.js
                ├── components/
                ├── views/
                ├── composables/
                └── services/

```


### /auth/index.vue

- Durch `<router-view>` werden hier die views des Moduls und der Untermodule geladen.

### /auth/router/

**Beispiel:** /auth/router/index.js 
```js
import Index from "../index.vue";
import signInRoutes from "../signIn/router/index.js";
import signUpRoutes from "../signUp/router/index.js";


export default [
  {
    path: "/auth",
    component: Index,
    children: [
      ...signInRoutes,
      ...signUpRoutes,
    ],
  },
];
```

### /auth/signIn/router/

**Beispiel:** /auth/signIn/router/index.js
```js
// signIn/router/index.js
import SignInView from "../views/SignInView.vue";

export default [
  {
    path: "sign-in",
    component: SignInView,
  },
];

```

Die routes werden in den globalen router verwendet

**Beispiel:**
```js
import { createRouter, createWebHistory } from 'vue-router';                     
import authRoutes from "../modules/auth/router/index.js";


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
        ...authRoutes,
  ],
})


export default router

```

