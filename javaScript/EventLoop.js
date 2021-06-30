/*
-> javaScript ist single threaded und asynchron.
-> wird eine Funktion im thread ausgeführt, muss eine andere Funktion warten,
 	bis die erste Funktion beendet ist. Der thread ist für die nächste Funktion blockiert.
-> Lösung: Die Funktion an anderer Stelle ausführen, damit der thread frei ist und nicht blockiert.
-> Möglichkeiten: callbacks, promises, async/await

-> callbacks im Browser: In setTimeout definierte callbackfunctions werde, wenn sie im thread aufgerufen werden, 
	in den web-apis geschoben (durch event-loop) dort verbleibt sie gemäß der angegebenen zeit. 
	Dadurch ist der thread nicht länger blockiert.
	Nach ablauf der Zeit, schiebt der event-loop die callbackfunction in die task-queue.
	Dort können sich viele cbs und events befinden.
	Ist der stack frei, schiebt der event-loop die cb in den stack (stack = thread). 

-> Der JS Interpreter z.B. V8 besteht nur aus dem Heap und dem Stack (Thread). Die Web-APIs wie setTimeout sind nicht 
	Teil des Interpreters, aber wie V8 in dem Browser implementiert. setTimeout ist ein Befehl, von dem aus, 
	aus dem Stack heraus, auf die entsprechende Funktion des Browsers zugreifen werden kann.
	Als Parameter wird setTimeout die Callback "mitgegeben" Die Funktion des Browsers (setTimeout) "schiebt" die 
	Callback in die Callback-Queue. Wenn der stack frei ist, wird die Callback von dem Event-Loop auf den Stack
	"geschoben". SetTimeout ist nur eine Funktion des Browserts, es gib bspw. ajax-request. dabei wird ein Server-Request 
	gemacht, wärend der Stack frei bleibt. Erhält die Browser-Funktion ein Response, Schiebt sie die entsprechende
	Callback in die Callback-Queue, die dann, von dem Event-Loop, in den Stack geschoben wird.
	
-> Node funktioniert genauso, nur dass statt den Web-APIs C++ funktionen aufgerufen werden und tatsächlich weitere 
	Stacks (Threads) ausgeführt werden.
*/
