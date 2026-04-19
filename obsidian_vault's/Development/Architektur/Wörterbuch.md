### Features

Features sind **fachliche Bereiche (Domains)** und kapseln Verhalten + UI + Logik:
```text
/features
	/user
	/auth
	/settings
```

features = was kann das System

### Entities

Entities sind **fachliche Objekte (Daten + Regeln)** und sind **feature-unabhängig**:
```js
// src/entities/space/model/space.entity.js

export function createSpaceEntity(data = {}){
    return {
        id: data.id ?? null,
        name: data.name ?? '',
        description: data.description ?? '',
        ownerId: data.ownerId ?? null,

        members: Array.isArray(data.members) ? data.members : [],

        isPrivate: data.isPrivate ?? false,

        createdAt: data.createdAt ? new Date(data.createdAt) : null,
        updatedAt: data.updatedAt ? new Date(data.updatedAt) : null,
    };
}

export function mapSpaceFromApi(data = {}){
    return createSpaceEntity({
        id: data._id || data.id,
        name: data.name,
        description: data.description,
        ownerId: data.owner_id || data.ownerId,

        members: data.members,

        isPrivate: data.is_private ?? data.isPrivate,

        createdAt: data.created_at,
        updatedAt: data.updated_at,
    });
}

export function mapSpaceToApi(space = {}){
    return {
        name: space.name,
        description: space.description,
        owner_id: space.ownerId,
        members: space.members,
        is_private: space.isPrivate,
    };
}

export function isSpaceOwner(space, userId){
    if(!space || !userId){
        return false;
    }
    else{
        return space.ownerId === userId;
    }
}

export function isSpaceMember(space, userId){
    if(!space || !userId){
        return false;
    }
    else{
        return space.members.includes(userId);
    }
}
```

entities = **single source of truth für Domain-Daten im Frontend**

##### Was kommt in ein Entity
- **Was ein Space/User/etc. ist**
- **Wie sich dieses Objekt verhält (fachlich)**
- **Welche Regeln gelten**

##### Beispiele:
```js
createSpaceEntity()
mapSpaceFromApi()
isSpaceOwner()
isSpaceMember()
```

##### Beispiel: 
“so sieht ein User aus und so wird er im Frontend verwendet”
```js
// src/entities/user/model/user.entity.js

export function createUser(data){
  return {
    id: data.id,
    email: data.email,
    firstName: data.first_name,
    lastName: data.last_name,
    fullName: `${data.first_name} ${data.last_name}`,
    avatar: data.avatar_url || null,
    createdAt: new Date(data.created_at)
  };
}
```

