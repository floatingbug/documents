### Syntaktische Zucker

Vue generiert aus:

```vue
<AuthForm v-model="credentials" />
```

folgendes:

```vue
<AuthForm 
  :modelValue="credentials"
  @update:modelValue="(val) => credentials = val"
/>
```

Wenn man in der Kindkomponente ein prop namens modelValue hat, stehen in der Kindkomponente auch die daten in credentials zur Verfügung.
Wenn man in der Kindkomponente das Event `update:modelValue` emitiert, bspw: `emit("update:modelValue", newData)`, dann wird newData in credentials gespeichert.

### ⚙️ Wichtig:

Das funktioniert **nur**, wenn man sich exakt an diese Konvention hält:
- Prop heißt `modelValue`
- Event heißt `update:modelValue`