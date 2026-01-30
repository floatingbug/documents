# Response Object

```js
{
  data,        // 👈 DAS ist der Payload (Response Body)
  status,      // HTTP Status Code
  statusText,
  headers,
  config,
  request
}
```

---

# Fehler Behandlung

Axios wirft einen Fehler, wenn der Status code außerhalb von 2xx liegt.

### Server Response im Error Object

im Error Object befindet sich die Eigenschaft **response.data**. Das ist der Payload, den der Server bei einem Fehler zurücksendet, wenn es sich um keinen Netzwerkfehler handelt. **error.response** existiert nur, wenn es sich nicht um ein Netzwerkfehler handelt und der Server auch einen Response zurück gesendet hat.