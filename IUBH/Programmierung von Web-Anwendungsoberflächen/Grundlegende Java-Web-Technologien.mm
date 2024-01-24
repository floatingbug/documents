<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Grundlegende Java-Web-Technologien" FOLDED="false" ID="ID_770559057" CREATED="1582971069867" MODIFIED="1585999914870" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle" zoom="1.5">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" fit_to_viewport="false"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ICON_SIZE="12.0 pt" COLOR="#000000" STYLE="fork">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10.0 pt" SHAPE_VERTICAL_MARGIN="10.0 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="6" RULE="ON_BRANCH_CREATION"/>
<node TEXT="Java-Servlet" POSITION="right" ID="ID_1073164619" CREATED="1582971272112" MODIFIED="1585999912479">
<edge COLOR="#ff0000"/>
<node TEXT="Sind Java-Klassen die in dem Servlet-Container ausgef&#xfc;hrt werden" ID="ID_351900149" CREATED="1582972771640" MODIFIED="1583406868868" HGAP_QUANTITY="35.74999935179951 pt" VSHIFT_QUANTITY="-26.999999195337317 pt"/>
<node TEXT="in web.xml steht welches servlet bei welcher url aufgerufen werden soll" ID="ID_1684816400" CREATED="1583442796873" MODIFIED="1583442854228" HGAP_QUANTITY="56.74999872595075 pt" VSHIFT_QUANTITY="-44.999998658895535 pt"/>
<node TEXT="in der Servlet-Klasse kann dynamisch html-text generiert werden und dann per out.write(&quot;html-code&quot;); der dynamische html-code zu einer html-seite gerendert werden." ID="ID_489071978" CREATED="1583406857537" MODIFIED="1583407037280" HGAP_QUANTITY="55.999998748302495 pt" VSHIFT_QUANTITY="-2.99999991059304 pt">
<node TEXT="html-code befindet sich im body des response-object" ID="ID_949982705" CREATED="1586000137851" MODIFIED="1586000164286"/>
</node>
<node TEXT="Erweitern einen Webserver" ID="ID_815105507" CREATED="1582972831891" MODIFIED="1582972869738" HGAP_QUANTITY="55.24999877065423 pt" VSHIFT_QUANTITY="18.749999441206484 pt">
<node TEXT="Der Webserver reicht Anfragen an Servlets weiter und Servlets leiten Antwort and Webserver weiter." ID="ID_781226623" CREATED="1582973274437" MODIFIED="1582973330820"/>
</node>
<node TEXT="erzeugt, je nach http-Anfrage, dynamisch HTML-Seiten" ID="ID_426251452" CREATED="1582971287679" MODIFIED="1585999905162" HGAP_QUANTITY="45.49999906122687 pt" VSHIFT_QUANTITY="79.49999763071544 pt"/>
<node TEXT="Servlet-Klassen m&#xfc;ssen von der abstrakten Klasse HttpServlet erben" ID="ID_1446555747" CREATED="1582993478867" MODIFIED="1585999909324" HGAP_QUANTITY="70.99999830126768 pt" VSHIFT_QUANTITY="27.749999172985575 pt">
<node TEXT="ist im package javax.servlet.http enthalten&#xa;das sich im Tomcat-Verzeichnis in tomcat-api.jar befindet" ID="ID_1571939488" CREATED="1582993576537" MODIFIED="1583135379981"/>
</node>
<node TEXT="" ID="ID_885701432" CREATED="1582971617820" MODIFIED="1585999912479" HGAP_QUANTITY="31.99999946355821 pt" VSHIFT_QUANTITY="18.74999944120647 pt">
<hook URI="servlet.png" SIZE="0.921659" NAME="ExternalObject"/>
<node TEXT="Servlet-Container" ID="ID_1160137676" CREATED="1582971658289" MODIFIED="1585999898528" HGAP_QUANTITY="25.999999642372142 pt" VSHIFT_QUANTITY="-170.999994903803 pt">
<node TEXT="Komponente der Java-EE-Web-Architektur" ID="ID_204382614" CREATED="1582971750922" MODIFIED="1582971787249"/>
<node TEXT="Ist durch eine URL erreichbar" ID="ID_680931394" CREATED="1582971788464" MODIFIED="1582971819692"/>
<node TEXT="ruft zur HTTP-Anfrage das passende Servlet auf" ID="ID_1955207760" CREATED="1582971819941" MODIFIED="1582971841660"/>
<node TEXT="Schickt den erzeugten HTML-Code an den Browser zur&#xfc;ck" ID="ID_1498167903" CREATED="1582971986772" MODIFIED="1582972014516"/>
</node>
</node>
</node>
<node TEXT="Java Server Pages (JSP)" POSITION="right" ID="ID_1399714027" CREATED="1582992215944" MODIFIED="1586000360079" HGAP_QUANTITY="8.750000156462189 pt" VSHIFT_QUANTITY="26.249999217689062 pt">
<edge COLOR="#ff00ff"/>
<node TEXT="Java-Programme werden in den HTML-Code eingebettet" ID="ID_335884815" CREATED="1582992229808" MODIFIED="1585999919381">
<node TEXT="durch spezielle tags" ID="ID_552162451" CREATED="1582994129842" MODIFIED="1585999919379" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="14.999999552965178 pt">
<node TEXT="f&#xfc;r einfache ausgaben &lt;%= var %&gt;" ID="ID_158813909" CREATED="1586425434420" MODIFIED="1586425469948"/>
<node TEXT="f&#xfc;r umfanreicheren java-code &lt;% java-code %&gt;" ID="ID_1132515928" CREATED="1586425470817" MODIFIED="1586425500651"/>
</node>
</node>
<node TEXT="Dateien enden mit .jsp" ID="ID_1281165631" CREATED="1582992327446" MODIFIED="1582992338141"/>
<node TEXT=".jsp-Dateien werden in servlets umgewandelt" ID="ID_1034575812" CREATED="1582994025202" MODIFIED="1586000360078" HGAP_QUANTITY="11.750000067055224 pt" VSHIFT_QUANTITY="16.499999508261695 pt">
<node TEXT="dadurch kann man in den .jsp-Dateien auf out und request zugreifen" ID="ID_1150920704" CREATED="1586425510010" MODIFIED="1586425543478"/>
</node>
</node>
<node TEXT="Tomcat als Vermittler" POSITION="left" ID="ID_776193362" CREATED="1582977406055" MODIFIED="1585999890624">
<edge COLOR="#0000ff"/>
<node TEXT="implementiert den Servlet-Container" ID="ID_1691563359" CREATED="1582993298169" MODIFIED="1585999879876" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="-26.99999919533732 pt"/>
<node TEXT="ist &#xfc;ber eine URL erreichbar" ID="ID_213570555" CREATED="1582993317209" MODIFIED="1585999883037" HGAP_QUANTITY="27.499999597668662 pt" VSHIFT_QUANTITY="-20.24999939650299 pt"/>
<node TEXT="ruft passende Servlets auf" ID="ID_617662910" CREATED="1582993327680" MODIFIED="1585999886795" HGAP_QUANTITY="28.99999955296518 pt" VSHIFT_QUANTITY="-40.49999879300598 pt"/>
<node TEXT="sendet erzeugten HTML-Code zur&#xfc;ck" ID="ID_1799653052" CREATED="1582993351137" MODIFIED="1582993370570"/>
<node TEXT="Der Webserver, z.B. Tomcat, parst den http-text als Java-Objekte und &#xfc;bergibt sie dem Servlet-Container.&#xa;Diese sind die Objekte: request und response" ID="ID_1066674032" CREATED="1582977422407" MODIFIED="1585999890620" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="17.249999485909953 pt"/>
</node>
<node TEXT="Ablauf einer HTTP-Anfrage und HTTP-Request" POSITION="left" ID="ID_1989527844" CREATED="1583405857238" MODIFIED="1585999876320" HGAP_QUANTITY="13.250000022351742 pt" VSHIFT_QUANTITY="44.999998658895535 pt">
<edge COLOR="#7c0000"/>
<node TEXT="Browser sendet HTTP-Request" ID="ID_1312526349" CREATED="1583405889347" MODIFIED="1583485911588"/>
<node TEXT="Request landet im Servlet-Container des Tomcat-Servers" ID="ID_380405037" CREATED="1583405930223" MODIFIED="1585999870393" HGAP_QUANTITY="22.249999754130847 pt" VSHIFT_QUANTITY="16.499999508261695 pt"/>
<node TEXT="der Servlet-Container leitet den request, als java-object zu einen Servlet weiter. Durch die URL im http-request-header wei&#xdf; der Servlet-Container, an welchen Servlet das request-object gesendet werden soll" ID="ID_138778893" CREATED="1583406262201" MODIFIED="1585999873017" HGAP_QUANTITY="28.99999955296518 pt" VSHIFT_QUANTITY="32.24999903887513 pt">
<node TEXT="das routing wird in web.xml eingetragen" ID="ID_989122146" CREATED="1583486424424" MODIFIED="1583486457590"/>
</node>
<node TEXT="der Servlet ruft seine Funktion: doGet oder doPost auf und verarbeitet den http-request mit hilfe des http-request-object der der Funktion &#xfc;bergeben wurde" ID="ID_1449620867" CREATED="1583406327908" MODIFIED="1585999874363" HGAP_QUANTITY="25.249999664723884 pt" VSHIFT_QUANTITY="23.249999307096026 pt">
<node TEXT="html-code wird erzeugt und in das response-object geschrieben" ID="ID_211620541" CREATED="1583486819307" MODIFIED="1583486864465"/>
</node>
<node TEXT="anschlie&#xdf;end sendet das Servlet ein response-object an den Servlet-Container, der ihn an den client sendet" ID="ID_1338781306" CREATED="1583486552421" MODIFIED="1585999876316" HGAP_QUANTITY="19.999999821186073 pt" VSHIFT_QUANTITY="20.999999374151248 pt"/>
</node>
</node>
</map>
