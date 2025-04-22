	_k:· ˝^## Definition
- Components sind Dateien die Javascript, HTML und CSS enthalten.
- Dateiendung ist .vue.
- Können in anderen components importiert werden.

---

# Props

-  Parant components können den properties einer child component werte zuweißen.

Beispiel:
```vue
//---Datei App.vue---

<script setup>
import BlogPost from "./Blog-Post.vue"; 

</script>                               

//Der Property title der Komponente BlogPost einen Wert zuweißen.
<template>                              
    <BlogPost title="title des Blogs" />
</template>                             

//---Datei Blog-Post.vue---
//Jede Komponente die diese Komponente importiert, kann auf die Property title //zugreifen und somit auch einen Wert zuweißen.
<script setup>
defineProps(["title"]);
</script>

<template>
    <h1>{{title}}</h1>
</template>
```

---

## Events
- Eltenrkomponenten können auf events von Kindkomponenten hören.
- Im Elternelement wird mit v-on oder @ angegeben, auf welches Event gehört werden soll:
	- v-on:eventName="hier kann eine Funktion oder code ausgeführt werden"
- Das Kindelement kann mit v-on:click="$emit('evenName')" events senden.

#### Im JavaScript-Code events versenden
- Beispiel: 
```vue
//Kindkomponente die ein event emitiert
<script setup>
const emit = defineEmits(['eventName1', 'eventName2'])

function emitEvent(){
	emit("eventName1")
}
</script>

<template>
	<button v-on:click="emitEvent">emit</button>
</template>

//Elternkomponente die auf
<template>
	<div v-on:eventName1="handleEvent"></div>
</template>
```

---

# Slots
#### Bestehen aus:

- **Slot Content:** Inhalt den die Elternkomponente zur Verfügung stellt.
	- Inhalt steht in der Kindkomponente: 
	```vue 
	<Kindkomponente>
		 <h1>Überschrift</h1>
		 <p>hier steht ein text</p>
	</Kindkomponente> 
	 ```

- **Slot Outlet:** Zeigt an, wo der Inahlt der Elternkomponente gerendert werden soll.
	- Dies geschiet mit dem slot-tag
 ```vue
<template>
	<button>
		//wird durch den Inhalt in der Elternkomponente ersetzt
		<slot><slot />
	</button>
</template>
```

Das gerenderte HTML Resultat:
```vue
<template>
	<button>
		<h1>Überschrift</h1>
		<p>hier steht ein text</p>
	</button>
</template>
```

### Named Slots
In der Kindkomponente kann bestimmt werden, wo der von der Elternkomponente zur verfügung gestellte Inhalt gerendert werden soll.
Dazu muss das Attribut name des slot-tag verwendet werden:
```vue
//Kindkomponente
<template>
	<div class="container">
		<header>
			<slot name="header"></slot>
		</header>
		<main>
			<slot name="main"></slot>
		</main>
		<footer>
			<slot name="footer"></slot>
		</footer>
	</div>
</template>

//Elternkomponente
<template>
	<Kindkomponente>
		<template v-slot:header>
			Inhalt für den header-slot
		</template>
		
		<template v-slot:main>
			Inhalt für den main-slot
		</template>
		
		<template v-slot:footer>
			Inhalt für den footer-slot
		</template>
	</Kindkomponente>
</template>

//statt v-slot:header kann auch #header geschrieben werden

```

### Scoped Slots
Wenn in der Kindkomponente Attribute erstellt werden, kann die Elternkomponente auf diese zugreifen:
```vue
//Kindkomponente
<template>
	<slot name="testSlot" testAttribute="blablabla">
	</slot>
</template>

//Elternkomponente
<template>
	<Kindkomponente>
		<template v-slot:testSlot="slotProps">
			{{slotProps.text}}
		</template>
	</Kindkomponente>
</template>

//Andere Variante
//Elternkomponente
<template>
	<Kindkomponente>
		<template v-slot:testSlot="{text, attribut1, attribut2, attribut3}">
			{{text}}
			{{attribut1}}
			{{attribut2}}
			{{attribut3}}
		</template>
	</Kindkomponente>
</template>

//Verkürzte Variante
//Elternkomponente
<template>
	<Kindkomponente>
		<template #testSlot="{text, attribut1, attribut2, attribut3}">
			{{text}}
			{{attribut1}}
			{{attribut2}}
			{{attribut3}}
		</template>
	</Kindkomponente>
</template>
```

---

## Komponenten dynamisch laden
- Beispiel
```vue
<script setup>
import Home from './Home.vue'
import Posts from './Posts.vue'
import Archive from './Archive.vue'

const currentComponent = ref("home");
const components = {
	Home,
	Posts,
	Archive
};
</script>

<template>
	//Im Attribut is wird die Komponente angegeben, die geladen werden soll.
	<component :is="components[currentComponent]"></component>
</template>
```
