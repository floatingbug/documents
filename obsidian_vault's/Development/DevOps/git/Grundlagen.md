# Remotes

1. **Definition von Remotes**:    
    - Remotes sind Verbindungen zu entfernten (nicht lokalen) Git-Repositories, die es ermöglichen, Änderungen zwischen lokalen Repository und entfernten Repositories zu synchronisieren (gleicher commit sowohl auf dem lokalen als auch entfernten repository).
    
1. **Remotes**:
    - Es können beliebig viele Remotes hinzufügen werden, aber typischerweise gibt es:
        - **`origin`**: Das ist standardmäßig das Remote-Repository, das geklont wurde, meistens das persönliche entfernte repository/fork.
        - **`upstream`**: Wird typischerweise verwendet, um das originale Repository zu bezeichnen, von dem bspw. der Fork erstellt wurde.

### Beispiel: **Upstream-Repository** richtig verwenden:

```bash
# Upstream-Remote hinzufügen (Original-Repository, von dem geforkt wurde)
git remote add upstream https://github.com/original-username/original-repository.git

# Änderungen vom Upstream-Repository holen (synchronisieren)
git fetch upstream

# Den Fork auf den Stand des Upstream-Repositories bringen.
# main ist der main branch in dem entfernten repository
git merge upstream/main

# (Optional) oder stattdessen rebasen, um die Historie sauberer zu halten:
git rebase upstream/main

```

**Wichtig:** Niemals Änderungen direkt zum Upstream-Repository pushen, es sei denn, man hat Schreibrechte darauf.

3. **`push upstream` ist fast nie korrekt**:
    - Der Befehl **`git push upstream`** wird in der Regel nicht genutzt, da man auf das Upstream-Repository (das ursprüngliche Projekt) normalerweise keine Push-Berechtigung hat.
    - Stattdessen pusht man auf **`origin`** (den Fork) und reicht dann einen **Pull Request** ein, um Änderungen zurück zum Original-Repository zu bringen.

### Beispiel: **Origin-Repository** richtig verwenden:

```bash
# Origin-Remote hinzufügen (typischerweise dein eigener Fork)
git remote add origin https://github.com/dein-username/dein-fork.git

# Änderungen vom Fork holen (falls notwendig)
git fetch origin

# Änderungen zum Fork pushen
git push origin main

# Pull, um Änderungen vom Fork in dein lokales Repository zu holen
git pull origin main

```

### Zusammenfassung der Befehle:

- **`git fetch upstream`**: Holt Änderungen vom Original-Repository (Upstream).
- **`git rebase upstream/main`** oder **`git merge upstream/main`**: Synchronisiert den lokalen Fork mit dem Upstream.
- **`git push origin main`**: Pusht die Änderungen zu dem Fork auf GitHub.

### Weitere Befehle:

**git remote -v**

Dieser Befehl zeigt alle konfigurierten Remotes (wie `origin` und `upstream`) sowie die zugehörigen URLs.
```shell
git remote -v
```

**git remote set-url origin**

Speichert die URL des remote repository in origin:
```shell
git remote set-url origin git@github.com:<benutzer>/<repository>.git
```

---

# Branches

### Branch erstellen

```shell

```

---

# Commits

### Commits löschen

---

# staging area 

### staging area anzeigen

```shell
git status
```

### resetten

```shell
git reset
```




