just think of a protocol as a text file. in this text file are information for example:

```http
GET /ressource
content-type application/json

payload
```

the url for example is: http://localhost:3000/ressource

-  thats is a http request, a client like a browser send it to the server.
-  the http-module from nodejs take this information and parse it into an object like req.
-  now you decide accordingly the http protocol how to handle the request for example:

```javascript
const http = require("http");
//with fs your webserver can read files from the filesystem
const fs = require("fs").promises;

// Request listener function must be defined before being used
const requestListener = async function (req, res) {
    switch (req.url) {
        case "/ressource":
            await readAndMakeResponse(req, res);
            break;
        case "/other-route":
            // Handle other routes if needed
            res.writeHead(200);
            res.end("Other route response.");
            break;
        default:
            res.writeHead(404);
            res.end(JSON.stringify({ error: "Resource not found" }));
    }
};

//if your webserver receives a http-request, the server parses the req and res objects and serve this objects as arguments to the requestListener function where you can handle the request accordingly the http-protocol.
const server = http.createServer(requestListener);

//read file from filesystem and make response to client
async function readAndMakeResponse(req, res) {
    try {
        const content = await fs.readFile("./someRessource", "utf8"); // You need to await and specify encoding
        res.writeHead(200, { "Content-Type": "text/plain" }); // Set appropriate headers
        res.end(content);
    } catch (err) {
        console.error(err);
        res.writeHead(500);
        res.end("Internal server error.");
    }
}

// Start the server
server.listen(3000, () => {
    console.log("Server is listening on port 3000");
});

```

i show u this code without a framework, bc a framework hide the most things away from you an if you only use frameworks u will never know how it rly works.
