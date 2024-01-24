var player;
function startGame(){
	gameArea.start();
	player = new GameEentity(40,40,'red',40,40);
}

var gameArea = {
	canvas: document.createElement('canvas'),
	keys: [],	

	start: function(){
		this.canvas.width = 800;
		this.canvas.height = 600;
		this.context = this.canvas.getContext('2d');
		document.body.insertBefore(this.canvas, document.body.childNodes[0]);
		this.interval = setInterval(update, 20);		
		window.addEventListener('keydown', function(e){
			gameArea.keys.push(e.keyCode);
			console.log(e.keyCode);
		});
		window.addEventListener('keyup', function(e){
			for(var i in gameArea.keys){
				if(gameArea.keys[i] === e.keyCode){
					gameArea.keys[i] = e.keyCode + "false";
				}
			}
		});
	},
	clear: function(){
		this.context.clearRect(0 ,0 , this.canvas.width, this.canvas.height);
	}
}

function GameEentity(x, y, color, w, h){
	this.x = x;
	this.y = y;
	this.speed_x = 0;
	this.speed_y = 0;
	this.w = w;
	this.h = h;

	this.render = function(){
		ctx = gameArea.context;
		ctx.fillStyle = color;
		ctx.fillRect(this.x, this.y, this.w, this.h);	
	}
	this.move = function(){
		this.x += this.speed_x;
		this.y += this.speed_y;
	}
	
}


function update(){
	gameArea.clear();
	for(i in gameArea.keys){
		if(gameArea.keys[i] === 40){
			player.speed_y = 1;
		}
		if(gameArea.keys[i] === 37){
			player.speed_x = -1;
		}
		if(gameArea.keys[i] === 38){
			player.speed_y = -1;
		}
		if(gameArea.keys[i] === 39){
			player.speed_x = 1;
		}
		if(gameArea.keys[i] === "38false" || gameArea.keys[i] == "40false"){
			player.speed_y = 0;
			delete gameArea.keys[i];
		}
		if(gameArea.keys[i] === "37false" || gameArea.keys[i] === "39false"){
			player.speed_x = 0;
			delete gameArea.keys[i];
		}
	}

	player.move();
	player.render();
}















