
# Bedingung

Es werden reCAPTCHA-Skripte von google benötigt, die beim laden der Webseite von google angefordert werden.
Diese Skripte dienen als Client mit dem der zu lösende captcha von google geladen wird, sobald der captcha benötigt wird. wurde das captcha gelöst, wird die antwort von dem Client an google gesendet. Google überprüft die Antwort, speichert diese zwischen und sendet ein token an den Client zurück. Der Client sendet dann den token an das backend. In einer Anfrage sendet das Backend den Token an die Google reCAPTCHA-Server, um den Token zu verifizieren. Diese Anfrage enthält den Token und den `secret key`, der von Google stammt. Google überprüft den Token und gibt eine Antwort zurück, die angibt, ob die Verifikation erfolgreich war. In der Antwort ist auserdem das Ergebnis enthalten, das angibt, ob das Captcha korrekt gelöst wurde oder nicht.
# Ablauf

#### **Schritt 1:** Der Browser lädt die reCAPTCHA-Skripte von Google per HTTP-Request, sobald die Seite geladen ist.

- **Laden der Skripte:**
    - Der Browser sendet eine HTTP-Request an Google, um die reCAPTCHA-Skripte zu laden.
    - Dies geschieht durch das Einfügen eines `<script>`-Tags in der HTML-Datei.
    - **Site key in der Anfrage:**
        - Der `site key` wird in dieser Anfrage als Parameter übergeben. Er ermöglicht es Google, die Webseite zu identifizieren, die das reCAPTCHA-Widget anfordert.
        - Basierend auf diesem `site key` stellt Google sicher, dass die Webseite autorisiert ist, das reCAPTCHA zu verwenden.

#### **Schritt 1:** Rendering und Benutzerinteraktion mit dem reCAPTCHA-Widget.

- **Rendering des Widgets:**
    - Der `site key` wird im HTML-Tag oder im JavaScript-Code verwendet, um das Widget auf der Seite zu rendern. Das Captcha-Widget soll erscheinen, wenn der Nutzer ein captcha lösen soll. Damit das Widget gerendert werden kann, Sendet der Browser eine Anfrage mit dem site key an google, der dann das entsprechende Widget an den Browser sendet, der dieses dann rendert.
    - Google verwendet den `site key`, um das Widget mit den korrekten Einstellungen und Konfigurationen zu rendern.

- **Schritt 2:** Der Benutzer interagiert mit dem reCAPTCHA-Widget.
	- Das Ergebnis wird per HTTP an google gesendet.
- **Schritt 3:** Google speichert das Ergebnis, ob die Antwort korrekt war oder nicht, zwischen und generiert einen token der zurück an den Browser gesendet wird.
- **Schritt 4:** Der Browser sendet den `token` an das Backend.
- **Schritt 5:** Das Backend sendet den `token` an Google reCAPTCHA und wird dort verifiziert.
	- google sendet zurück, ob die verifikation erfolgreich war und die Antwort, ob das captcha korrekt gelößt wurde.