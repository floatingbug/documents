let express = require('express');
let app = express();
let http = require('http');
let httpServer = http.createServer(app);
let fs = require('fs');


app.set('views', './');
app.set('view engine', 'ejs');


app.use(express.static('./'));


app.get('/', function(req, res){
	res.render('index');
});



httpServer.listen(8000);