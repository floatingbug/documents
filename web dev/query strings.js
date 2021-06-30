app.get.('index:name', function(req, res){
	res.end('your name is' + req.url.params);
});

/*
	Gibt man im Browser: www.'adress'.de/'tommy' ein, sendet der server: 
	your name is tommy zurück.
*/

/////////////////////////////////////////////////////
app.get('index', function(req, res){
	console.log(req.query);
});

/*
	query string wird als object in req.query gespeichert.
*/