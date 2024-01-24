
``` javascript
// application helper erstellen und ein canvas element
// (app.view) dem body hinzufügen.
const app = new PIXI.Application({ width: 640, height: 360 });  
document.body.appendChild(app.view);  
  
// container erstellen und in der mitte platzieren.  
const container = new PIXI.Container();  
container.x = app.screen.width / 2;  
container.y = app.screen.height / 2;  
app.stage.addChild(container);  
  
// 3 sprites erstellen, jedes sprite wird als kind
// dem vorgänger sprite hinzugefügt.
const sprites = [];  
let parent = container;  
for (let i = 0; i < 3; i++) {  
let sprite = PIXI.Sprite.from('assets/images/sample.png');  
sprite.anchor.set(0.5);  
parent.addChild(sprite);  
sprites.push(sprite);  
parent = sprite;  
}  
  
// Set all sprite's properties to the same value, animated over time  
let elapsed = 0.0;  
app.ticker.add((delta) => {  
elapsed += delta / 60;  
const amount = Math.sin(elapsed);  
const scale = 1.0 + 0.25 * amount;  
const alpha = 0.75 + 0.25 * amount;  
const angle = 40 * amount;  
const x = 75 * amount;  
for (let i = 0; i < sprites.length; i++) {  
const sprite = sprites[i];  
sprite.scale.set(scale);  
sprite.alpha = alpha;  
sprite.angle = angle;  
sprite.x = x;  
}  
});
```