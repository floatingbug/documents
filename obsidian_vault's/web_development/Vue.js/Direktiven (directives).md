## Definition
- Daten im JavaScript-Code werden mit dem DOM verbunden.
	- Dadurch reagieren die DOM-Elemente auf änderungen der Daten (Reaktivität).

Beispiel:
```vue
<script setup>
input {ref} from "vue";

const userName = ref("Gandalf");
</ script>

//userName wird durch Gandalf ersetzt.
//ändert sich die Variable userName, erhält der Wert der Eigenschaft (name) des //DOM-Elements (input) den Wert der Variable im JavaScript-Code (das DOM-Element //reagiert auf die Änderung der Daten im JavaScript-Code).
<template>
	<input v-bind:name="userName" />
</template>
```

---

## v-bind
- Mit v-bind bindet man JavaScript Variablen an Eigenschaften von HTML-Elementen, sodass der Wert der Eigenschaften der HTML Elemente immer der der JavaScript Variablen ist.