//referenc to canvas object.
var c = document.getElementById('c');

//set canvas size over whole browser-screen.
c.width = window.innerWidth;
c.height= window.innerHeight;

//getContext returns an object, with methods
//and properties for drawing on the canvas.
//after the object is created, it will automaticly be
//on the canvas with coordinates(0,0,0,0), so it
//will be invisable.
var ctx = c.getContext('2d');

//give the color property of the object a color
ctx.fillStyle = 'orange';

//draw a rectangle (x,y,width,height).
ctx.fillRect(0,0,80,80);

//draw more rectangles.
ctx.fillStyle = 'rgba(255, 0, 0, 0.5';
ctx.fillRect(200, 200, 100, 100);

ctx.fillStyle = 'rgba(0, 0, 255, 0.5';
ctx.fillRect(400, 400, 150, 150);

//////////////////drawing lines/////////////////////
//start point of the line.
ctx.beginPath();
ctx.moveTo(100, 200);

//end point of the lines.
ctx.lineTo(500, 200);
ctx.lineTo(20, 500);

//give the lines a color.
ctx.strokeStyle = 'green';

//with the stroke method the line will be drawn
ctx.stroke();

/////////////////drawing arcs (bogen)////////////////
ctx.beginPath();
//parameters: x, y, radius, arc start, arc end, richtung
ctx.arc(100, 100, 30, 0, Math.PI * 2, false);
ctx.strokeStyle = 'rgba(255, 0, 0, 1)';
ctx.stroke();

////////////////////////sprites//////////////////////
var sprite = new Image();
sprite.src = 'player.png';
//load sprite if the image is loaded up complete in sprite.src.
//draw the image.
//(sx, sy)->frame position.
//(swidth, sheight)->frame size.
//(x, y)->context position.
//(width, height)->stretch image.
sprite.onload = function(){
  c.drawImage(sprite, sx, sy, swidth, sheight
              x, y, width, height);
}

///////////////////text//////////////////////////
ctx.font('1.5em');
ctx.fillStyle = 'orange';
ctx.textAlign = 'center';
ctx.fillText("text draw on canvas", x, y);
