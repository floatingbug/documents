var config = {
  type: Phaser.AUTO,
  width: 800,
  height: 600,

  physics: {
    default: 'arcade',
    arcade: {
      gravity: {y: 200}
    }
  },

  scene: [example1, example2]
};

//Loads automatically the first scene/state (example1-object).
var game = new Phaser.Game(config);
