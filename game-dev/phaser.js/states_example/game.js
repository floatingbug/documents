let config = {
	type: Phaser.Auto,
	width: 800,
	height: 600,
	physics: {
		default: 'arcade',
		arcade: {
			gravity: {y: 200}
		}
	},
	scene: [ scene1 ]
};

let game = new Phaser.Game(config);