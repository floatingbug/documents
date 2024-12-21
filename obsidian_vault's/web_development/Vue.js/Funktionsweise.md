# Proxys und Reaktivität

Vue nutzt `Proxy`-Objekte für Reaktivität, um Änderungen und Zugriffe zu überwachen.

In Vue befinden sich die `Proxy`-Objekte innerhalb einer weiteren Wrapper-Struktur, wie `ref` oder `reactive`.

Der Zugriff auf reactive Variablen erfolgt durch das value property, also varname.value = "value";

### 1. **`ref`-Wrapper**:

- `ref` ist eine Funktion, die ein Objekt zurückgibt, das den reaktiven Wert unter der `value`-Eigenschaft speichert.
    
- Dieses `ref`-Objekt enthält intern einen `Proxy`, der auf den `get`- und `set`-Zugriff auf `value` reagiert.

```javascript
import { ref } from 'vue';

const count = ref(0);   // Ein Proxy wird erstellt, aber er ist in `count.value` gekapselt
console.log(count.value); // Ausgabe: 0
count.value = 1; // `set`-Handler des Proxy löst reaktive Updates aus
```

- Hier umschließt `ref` den `Proxy`, sodass Änderungen und Zugriffe auf `value` den `Proxy` aktivieren, der wiederum die Reaktivität handhabt.
    

### 2. **`reactive`-Wrapper**:

- `reactive` funktioniert ähnlich, aber es wandelt **komplexe Objekte** direkt in Proxys um.
    
- Bei `reactive` gibt es keinen `value`-Zugriff, sondern die Reaktivität wird direkt auf die Eigenschaften des Objekts angewendet:
    
```javascript
import { reactive } from 'vue';

const user = reactive({
  name: 'Alice',
  age: 30
});

console.log(user.name); // Zugriff durch `get` des Proxy
user.age = 31;          // Änderung durch `set` des Proxy

```
