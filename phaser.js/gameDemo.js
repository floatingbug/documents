var config = {
  type: Phaser.AUTO,
  width: 800,
  height: 600,

  physics: {
    default: 'arcade',
    arcade: {
      gravity: {y: 0}
    }
  },

  scene: {
    key: 'main',
    preload: preload,
    create: create,
    update: update
  }
}

var player;
var cursors;

var game = new Phaser.Game(config);

function preload(){

  //Load player sprite.
  this.load.spritesheet('player', '/assets/player.png', {frameWidth: 200, frameHeight: 200});

  //Load tileset image.
  this.load.image('tiles', '/assets/tiles.png');

  //Load tileset map.
  this.load.tilemapCSV('trees', '/assets/test_trees.csv');
  this.load.tilemapCSV('ground', '/assets/test_ground.csv');
}

function create(){

  //Create tileset layers
  var map_ground = this.make.tilemap({key: 'ground', tileWidth: 16, tileHeight: 16});
  var img_ground = map_ground.addTilesetImage('tiles');
  var layerGround = map_ground.createStaticLayer(0, img_ground, 0, 0);

  var map_trees = this.make.tilemap({key: 'trees', tileWidth: 16, tileHeight: 16});
  var img_trees = map_trees.addTilesetImage('tiles');
  var layerTrees = map_trees.createStaticLayer(0, img_trees, 0, 0);

  //Create player
  player = this.physics.add.sprite(50, 50, 'player', null);
  player.setScale(0.2);

  //Set collision
  map_trees.setCollisionBetween(270, 271, 358, 359);
  this.physics.add.collider(player, layerTrees);

  //Movement
  cursors = this.input.keyboard.createCursorKeys();

  //Camera
  this.cameras.main.setBounds(0, 0, map_ground.widthInPixels, map_ground.heightInPixels);
  this.cameras.main.startFollow(player);
}

function update(delta){

  //Movement
  player.body.setVelocity(0);

  if(cursors.right.isDown){
    player.body.setVelocityX(100);
  }
  if(cursors.down.isDown){
    player.body.setVelocityY(100);
  }
  if(cursors.left.isDown){
    player.body.setVelocityX(-100);
  }
  if(cursors.up.isDown){
    player.body.setVelocityY(-100);
  }
}
