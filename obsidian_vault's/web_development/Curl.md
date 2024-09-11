  ## Anwendung
- Download und Upload von Daten auf einem Server via HTTP, FTP usw.
- Testen von REST APIs

---

## Verwendung
#### Syntax
```bash
curl Optionen... URL
```

---

## Optionen und Beispiele

- Mit -X gibt man die HTTP-Methode an.
	- default ist get, daher kann man bei get Requests -X weglassen.
	- der Header wird gesetzt, bspw. HTTP 1.0 /ressource POST.
- -d steht für data.
	- -d ist die kurzschreibweise für --data.
	- die Daten werden in den Payload geschrieben.
	- für urlencoding muss --data-urlencoding angegeben werden.
```shell
curl -X post -d "{'json-data'}" URL
```

##### JSON Daten Senden
- -H steht für Header.
	- header-Daten können kofiguriert werden.
```shell
curl -X post -H "content-type: application/json" -d '{"property": "value"}' URL
```

##### Authorization
```shell
curl -X POST \
https://some-web-url/api/v1/users \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer {ACCESS_TOKEN}' \
-H 'cache-control: no-cache' \
-d '{
"username" : "myusername",
"email" : "myusername@gmail.com",
"password" : "Passw0rd123!"
}'
```

##### Nur Header ausgeben
- -I ist die kurzschreibweise für --header
	- gibt nur den response-header aus
```shell
curl -I URL
```

##### Response Header mit ausgeben
- mit der Option -i wird die Antwort inklussive des Response Headers angezeigt.
	- die Antwort enthält sowohl den Header gefolgt von dem Payload.
```shell
tom@tom:~$ curl -i -X POST -H "content-type: application/json" -d '{"name": "tom", "password": "k"}' http://localhost:8000/login 

HTTP/1.1 200 OK 
X-Powered-By: Express 
Content-Type: application/json; charset=utf-8 
Content-Length: 52 
ETag: W/"34-jxv/qg5TqKOOjyCKli9i1Xd+lWg" 
Date: Sat, 04 Nov 2023 09:28:11 GMT 
Connection: keep-alive Keep-Alive: timeout=5 

{"name":"tom","email":"dia@blo.hell","password":"k"}
tom@tom:~$
```

