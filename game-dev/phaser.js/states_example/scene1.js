function Scene1(){
	//Konstruktorfunktion von Phaser.Scene wird im Konstruktor Scene1 beim erstellen eines 
	//neuen Objekts aufgerufen und konstruiert alle Methoden und Variablen von
	//der Konstruktorfunktion Phaser.Scene.
	Phaser.Scene.call(this, {key: "scene1"});
}



Scene1.prototype = Object.create(Phaser.Scene.prototype);

Scene1.prototype.preload = function(){
	this.load.image('img1', 'jpg.png');
}


Scene1.prototype.create = function(){
	this.image = this.add.image(300, 300, 'img1');
}


Scene1.prototype.update = function(){

}







scene1 = new Scene1();



