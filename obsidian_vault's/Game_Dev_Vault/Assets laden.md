##### Ein einzelnes Asset laden
```javascript
//ein asset laden
let bild = pixi.Assets.load('bild.png');
```

---
##### Liste von Assets die pixi.js out-of-the-box unterstützt
- Textures (`avif`, `webp`, `png`, `jpg`, `gif`)
- Sprite sheets (`json`)
- Bitmap fonts (`xml`, `fnt`, `txt`)
- Web fonts (`ttf`, `woff`, `woff2`)
- Json files (`json`)
- Text files (`txt`)

---

##### Assets asynchron laden
```javascript
//asynchron assets laden
let bild = await pixi.Assets.load('bild.png');
```

##### Mehrere Assets auf einmal laden
```javascript
//mehrere assets laden
  PIXI.Assets.addBundle('animals', {
    bunny: 'bunny.png',
    chicken: 'chicken.png',
    thumper: 'thumper.png',
  });

 const assets = await PIXI.Assets.loadBundle('animals');
```

