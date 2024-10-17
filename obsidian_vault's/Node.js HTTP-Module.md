### The HTTP Module Uses the Net Module

The HTTP module utilizes the Net module, which is responsible for establishing TCP connections. By calling `http.listen(3000)`, the HTTP module instructs the operating system, with the help of the Net module, to create a server socket. Once a TCP connection is established, the HTTP module can write to and read from the socket using the Net module.

### Processing HTTP Requests

##### Web Server Object:
```javascript
const http = require('http'); 
const server = http.createServer((request, response) => {  });
```

The `createServer` method creates the web server object. The web server object returned by `createServer` is an [[EventEmitter]]. The web server object created above is a shorthand notation for:

```javascript
const server = http.createServer(); 
server.on('request', (request, response) => {  });
```


1. **libuv instructs the operating system to create a server socket.**
    
    - This happens by calling `server.listen()`, during which libuv invokes `socket()` from the glibc library.
2. **After a successful TCP handshake, the operating system notifies libuv, prompting libuv to call the `accept()` function.**
    
    - `accept()` signals to the operating system that libuv is accepting the incoming connection.
    - `accept()` returns the file descriptor (fd) of the newly created client socket.
    - Libuv stores this fd and uses it for communication with the client socket.
3. **Once the operating system has received data and written it into the client socket, it notifies libuv through a mechanism such as epoll (Linux), kqueue (macOS/BSD), or IOCP (Windows) that data is available for reading in the client socket.**
    
4. **After libuv receives the signal and reads the data from the client socket, it inserts an I/O event into the event queue.**
    
    - This event contains a pointer to the buffer where the data read from the socket is stored by libuv.
5. **The Node.js event loop removes this event from the event queue, storing the pointer in the "data" event and triggering the "data" event.**
    
6. **The event loop retrieves the "data" event and passes the pointer as an argument to the callback registered for the "data" event.**
    
7. **The event loop then places the callback in the callback queue.**
    
8. **When the callback is executed on the stack, it can directly access the data through the pointer.**
    

##### Processing the HTTP Request

- **"request" Event is Triggered**:
    
    - The **"request"** event is emitted by the **`http.createServer()`** object when a complete HTTP request has been received. This means that the HTTP header has been fully received, and the request can now be processed.
- **Role of the Net Module**:
    
    - The **Net module** is responsible for lower-level network operations (TCP sockets) and receives the raw data from the socket.
    - Once the data arrives, the Net module hands it off to the HTTP module for further processing.
- **Checking Data for HTTP Request Characters**:
    
    - The **HTTP module** takes on the role of parsing the incoming data to determine if it constitutes a valid HTTP request.
    - It analyzes the headers and checks if the request complies with HTTP specifications.
- **Creating `req` and `res` Objects** **and Emitting the `request` Event**:
    
    - The **http.createServer object** creates the **`req`** and **`res`** objects after the request has been successfully parsed and stores them.
    - The **http.createServer object** emits the `request` event.
        - **The references to the `req` and `res` objects are stored in the `request` event.**
- **Calling the Request Handler**:
    
    - The event loop removes the request event from the event queue, passes the references to the req and res objects to the request handler, and places the request handler in the callback queue.

##### What Happens During an Asynchronous Operation?

1. When an asynchronous operation is called within a request handler, the execution of the handler is paused.
    
    - The JavaScript engine saves information to allow it to resume the paused request handler at the correct point in the call stack after the asynchronous operation completes.
    - While the request handler is paused, a new instance of the request handler can be invoked.
2. Once the callback of the asynchronous operation is called, the JavaScript engine resumes the paused request handler at the point it was paused.
    

When the asynchronous operation is complete:

1. The callback function of the asynchronous operation is placed in the callback queue.
2. The callback function contains the result of the asynchronous operation, as well as a reference to the request handler instance and information about where execution should resume for that instance.
3. The callback function is moved from the callback queue to the call stack by the event loop when it is empty.
4. The execution of the instance of the request handler resumes from where it was interrupted.