# Swagger Editor
**Im Swagger-Editor wird mit der OpenAPI-Spezifikation und dem YAML Format eine interaktive API-Dokumentation erstellt.**

Beispiel:
```openapi
openapi: 3.0.0 
info:
  version: '1'
  title: shop_api
  description: API for online shops
  contact:
    name: Thomas Hof
    email: thomas.hof1984@gmail.com
servers:
  # Added by API Auto Mocking Plugin
  - description: SwaggerHub API Auto Mocking
    url: https://virtserver.swaggerhub.com/THOMASHOF1984/shop_api/1

paths:
  /add-articles:
    post:
      tags: 
        - articles
      summary: add one or more articles
      requestBody:
        $ref: '#/components/requestBodies/add-articles'
      responses:
        201:
          description: ok
  /get-articles/{gender}/{age}:
    parameters:
      - name: gender
        in: path
        required: true
        schema:
          type: string
      - name: age
        in: path
        required: true
        schema:
          type: string
    get:
      tags:
        - articles
      summary: get one or more articles
      responses:
        201:
          description: ok
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/articlesResponse'
                
          
components:
  requestBodies:
    add-articles:
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/articlesRequest'
  schemas:
    articlesRequest:
      type: array
      items:
        type: object
        properties:
          gender:
            type: string
            example: "male | female | unisex"
          season:
            type: string
            example: "winter | spring | summer | autumn"
          age:
            type: string
            example: "baby | child | mature"
    
    articlesResponse:
      type: array
      items:
        type: object
        properties:
          gender:
            type: string
            example: "male | female | unisex"
          season:
            type: string
            example: "winter | spring | summer | autumn"
          age:
            type: string
            example: "baby | child | mature"
```
## 1 Openapi:
Version der OpenAPI-Spezifikation.
## 2 info:
Informationen zur API.
- title: 


## paths
**In paths werden alle API-Ressourcen, bspw.  /get-articles, angegeben.**

