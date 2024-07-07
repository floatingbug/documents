Mit einem watcher eine callback-function triggern, wenn sich eine Reaktive Variable ändert.
Es können mit ref und mit reactive deklarierte Variablen überwacht werden.

# Mit ref deklarierte Variablen überwachen

Beispiel mit einer ref deklarierten Variable:

```javascript
import {ref, watch}

const count = ref(5);

watch(count, (neuerWert) => {
	console.log(neuerWert)
})

//10 wird auf der Konsole ausgegeben.
count.value = 10;
```

# Mit reactive deklarierte Variablen überwachen

Will man alle Properties einer mit reactive deklarierter Variablen überwachen, kann einfach die Variable als Argument übergeben werden:

```javascript
import {reactive, watch}

const credentials = reactive({
	name: "",
	password: ""
});

watch(credentials, (neuerWert) => {
	console.log(neuerWert)
})

//Bob wird auf der Konsole ausgegeben.
credentials.name = "Bob";
```

Bei der Überwachung einer einzelnen property, muss ein getter der property als argument übergeben werden, da credentials.name nur ein Literal zurück geben würde, das nicht überwacht werden kann:

```javascript
import {reactive, watch}

const credentials = reactive({
	name: "",
	password: ""
});

watch(
	() => credentials.name, //gibt die reaktive Variable name zurück. 
	  (neuerWert) => {
	console.log(neuerWert)
	}
)

//Bob wird auf der Konsole ausgegeben.
credentials.name = "Bob";
```