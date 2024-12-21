### Elemente aus einem array entfernen

##### Beispiel: 

**Ausgangspunkt:**
Ein document hat ein array movies. Die Elemente sind Objekte. Jedes Objekt hat die property movieId.

**Problem:**
Wenn movieId mit einer ID aus movieIdsArray übereinstimmt, soll das Objekt gelöscht werden.

**Lösung:**
`$pull`: 
`$in:`

```javascript

        // Entferne Elemente aus dem Array `movies`, deren `movieId` im Array `movieIdsArray` enthalten ist
        const result = await collection.updateMany(
            {}, // Leeres Filterkriterium bedeutet, dass alle Dokumente berücksichtigt werden
            {
                $pull: {
                    movies: {
                        movieId: { $in: movieIdsArray }
                    }
                }
            }
        );


const movieIdsToDelete = [1100782, 1234567];
deleteMoviesByIds(movieIdsToDelete);

```