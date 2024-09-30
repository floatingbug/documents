
# Funktionsweise:

```javascript
<html>
  <body>
    <div id="app"></div>
    <script src="https://unpkg.com/react@18/umd/react.development.js"></script>
    <script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
    <!-- Babel Script -->
    <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
    <script type="text/jsx">
      const domNode = document.getElementById('app');
      const root = ReactDOM.createRoot(domNode);
      root.render(<h1>Develop. Preview. Ship.</h1>);
    </script>
  </body>
</html>
```

**ReactDOM.createRoot(domNode):**
- Ein Dom-Element wird ausgewählt, in dem alle React-Components angezeigt werden sollen.

**root.render():** 
- Code der dieser Funktion hinzugefügt wird, wird im DOM gerendert, und zwar im Element mit der id app.

**JSX:**
- Der Code `<h1>Develop. Preview. Ship.</h1>` ist JSX-Code und muss erst in JavaScript geparst werden.
- Das übersetzen übernimmt babel.
- Der script-type muss text/jsx sein.

---

# Components

**In react sind components JavaScript functions:**
- In den functions/components wird JSX-code mit return zurückgegeben.
- Components müssen groß geschrieben werden, damit sie von react bzw. root.render() als components erkannt werden.
- Components müssen in tags stehen.

```javascript
<script type="text/jsx">
  const app = document.getElementById("app")
 
  function Header() {
     return (<h1>Develop. Preview. Ship.</h1>)
   }
 
  const root = ReactDOM.createRoot(app);
  root.render(<Header />);
</script>
```

### Nesting components

```javascript
function Header() {
  return <h1>Develop. Preview. Ship.</h1>;
}
 
function HomePage() {
  return (
    <div>
      {/* Nesting the Header component */}
      <Header />
    </div>
  );
}
 
const root = ReactDOM.createRoot(app);
root.render(<HomePage />);
```

---

# Props

**Einem child-component kann ein object mit properties übergeben werden:**

```javascript
function HomePage() {
  return (
    <div>
      <Header title="React" />
    </div>
  );
}
```

**Die child-component kann auf das property zugreifen:**

```javascript
function Header({ title }) {
  console.log(title);
  return <h1>{title}</h1>;
}
```

- Die property title wird aus dem object {title: "React"} mit destructuring extrahiert.
- Damit title als variable und nicht als text interpretiert wird, muss title in `{}` stehen.

---

# Variables in JSX

**Mit `{}` kann man JavaScript in JSX-code schreiben:**

```javascript
function Header(props) {
  return <h1>{props.title}</h1>;
}
```

**Eine function in JSC-code ausführen und den Wert zurückgeben:**

```javascript
function createTitle(title) {
  if (title) {
    return title;
  } else {
    return 'Default title';
  }
}
 
function Header({ title }) {
  return <h1>{createTitle(title)}</h1>;
}
```

---

# Durch Listen iterieren

```javascript
function HomePage() {
  const names = ['Ada Lovelace', 'Grace Hopper', 'Margaret Hamilton'];
 
  return (
    <div>
      <Header title="Develop. Preview. Ship." />
      <ul>
        {names.map((name) => (
          <li key={name}>{name}</li>
        ))}
      </ul>
    </div>
  );
}
```

---

# Interactivity

```javascript
function HomePage() {
  // 	...
  function handleClick() {
    console.log('increment like count');
  }
 
  return (
    <div>
      {/* ... */}
      <button onClick={handleClick}>Like</button>
    </div>
  );
}
```

---

# State und hooks

### useState()

**Der React hook der genutzt wird um Zustände zu verwalten heißt useState():**
- useState() gibt ein array zurück.
- Das erste Element im array ist der state value (Zustands Wert).
- Das zweite Element ist eine Funktion, um den Zustand (das erste Element) zu updaten.
	- Konventionel wird die Funktion nach folgendem Schema benannt: set"name des ersten Elements". 

```javascript
function HomePage() {
  // ...
  const [likes, setLikes] = React.useState();
 
  // ...
}
```

**Initialer Wert:**

```javascript
function HomePage() {
  // ...
  const [likes, setLikes] = React.useState(0);
}
```

**Das erste Element ist reactive (Änderun haben Auswirkung auf das dom):**

```javascript
function HomePage() {
  // ...
  const [likes, setLikes] = React.useState(0);
 
  function handleClick() {
    setLikes(likes + 1);
  }
 
  return (
    <div>
      {/* ... */}
      <button onClick={handleClick}>Likes ({likes})</button>
    </div>
  );
}
```

