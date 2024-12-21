# Einer Variable ein Computed Property zuweißen

computed() gibt hier ein ref zurück, dass im Template genutzt werden kann, mit der ausnahme, dass .value nicht benötigt wird.
Ändert sich der Wert von count zu 0, wird isCountZero auf true gesetzt.

```javascript
import { ref, computed } from 'vue';

const count = ref(5);  // Reaktive Variable

const isCountZero = computed(() => {
  return count.value === 0;
});

console.log(isCountZero.value); // false

// Ändern des Wertes von count
count.value = 0;

console.log(isCountZero.value); // true, da Vue die Änderung verfolgt und isCountZero automatisch aktualisiert
```

count muss eine reactive Variable sein, damit vue die Änderung verfolgen kann.

```javascript
import { computed } from 'vue'; 

let count = 5; // Nicht-reaktive Variable 

const isCountZero = computed(() => { 
	return count === 0; 
}); 

console.log(isCountZero.value); // false

// Ändern des Wertes von count 
count = 0; 

console.log(isCountZero.value); // Es bleibt false, weil Vue die Änderung nicht verfolgt
```

```javascript

```