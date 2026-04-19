
# utils/

Ist ein Vrezeichnis für generische Funktionen.

### Eigenschaften von utilities:

- pure functions  
- keine side effects  
- keine API calls  
- keine state mutation

**Beispiel:**
```
utils/
    array/
        groupBy.js
        unique.js
        sortBy.js

    string/
        slugify.js
        capitalize.js
        truncate.js

    date/
        formatDate.js
        isToday.js

    function/
        debounce.js
        throttle.js

    object/
        deepClone.js
        omit.js
```

---

# services/

Services enthalten Geschäftslogik die sich zwischen dern Anwendung und der Infrastruktur befinden.

Beispiel:
```
UI / Store / Controller
        │
        ▼
     Services
        │
        ▼
   Infrastruktur
(API, DB, Storage usw.)
```

