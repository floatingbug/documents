<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

	<script type="text/javascript">
		
		/*
			eine variable hat die referenz auf ein objekt.
			das objekt hat die variablen und methoden der konstruktorfunktion und 
			eine referenz __proto__ auf das prototyp-objekt der konstruktorfunktion.
		*/





		function Test1(){
			this.nameTest1 = "test2";
		}
		Test1.prototype = {
			sagHallo: function(){
				console.log("hallo");
			}
		}


		function Test2(){
			//die konstruktorfunktion von Test1 wird ausgeführt.
			//der ausführungskontext soll in der Konstruktorfunktion von Test2 sein.
			//in Test2 werden alle Methoden und Variablen von Test1	konstruiert (Konstruktorfunktion Test1).	
			Test1.call(this);
		
			//die konstruktorfunktion von Test2 wird in dem neuem Objekt ausgeführt.
			//this ist der ausführungskontext { { this.nameTest1 } } die äußere klammer ist das neue objekt, this zeigt auf das neue objekt.
			this.nameTest1 = "test2";
		}

		//nur die referenz __proto__ wird in prototype gespeichert.
		//__proto__ zeigt auf prototype von Test1.
		Test2.prototype = Object.create(Test1.prototype);
		Test2.prototype.funcTest2 = function(){console.log("das ist die funktion von Test2")};


		//in test2 wird dir referenz auf das neu erstellte objekt gespeichert.
		//das neu erstellte objekt hat die properties nameTest1 und nameTest2.
		//zusätzlich besitzt das objekt die referenz __proto__ die auf das Prototyp-Objekt der Konstruktorfunktion von Test2 zeigt.
		//in dem Prototyp-Objekt von Test2 ist eine referenz __proto__ auf das Prototyp-Opjekt der Konstruktorfunktion von Test1.
		var test2 = new Test2();

		function Test3(){
			this.test = "test";
		}
		var test3 = new Test3();
		console.log(test3);


		console.dir(test2);






		

	</script>
</body>
</html>