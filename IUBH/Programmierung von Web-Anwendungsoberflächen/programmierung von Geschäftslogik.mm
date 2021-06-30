<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="programmierung von Gesch&#xe4;ftslogik" FOLDED="false" ID="ID_1585493965" CREATED="1583997325001" MODIFIED="1586857611580" STYLE="oval">
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
<hook NAME="AutomaticEdgeColor" COUNTER="12" RULE="ON_BRANCH_CREATION"/>
<node TEXT="Validierung von Benutzereingaben" POSITION="right" ID="ID_1925017492" CREATED="1584030686965" MODIFIED="1586857611579" HGAP_QUANTITY="23.749999709427364 pt" VSHIFT_QUANTITY="-27.74999917298558 pt">
<edge COLOR="#ff0000"/>
<node TEXT="eingebaute standart Validierer" ID="ID_1205471020" CREATED="1586857461447" MODIFIED="1586857607218" HGAP_QUANTITY="33.49999941885471 pt" VSHIFT_QUANTITY="-42.74999872595076 pt">
<node TEXT="eingebaute Standart-Validierungen" ID="ID_1690906966" CREATED="1584030884046" MODIFIED="1586853313579">
<node TEXT="existieren als Komponente oder Attribut" ID="ID_1640385298" CREATED="1584031190600" MODIFIED="1586853313574" HGAP_QUANTITY="15.499999955296518 pt" VSHIFT_QUANTITY="-30.74999908357861 pt"/>
<node TEXT="required" ID="ID_116537299" CREATED="1584030903490" MODIFIED="1586852868636">
<node TEXT="true oder false" ID="ID_1035210772" CREATED="1584030907751" MODIFIED="1584030912861"/>
<node TEXT="wird einem jsf-Element als Attribut zugeordnet z.B. h:inputText" ID="ID_1582076019" CREATED="1584030924713" MODIFIED="1586853050965"/>
<node TEXT="Beispiel:&#xa;&lt;h:inputText required=&quot;true&quot;/&gt;" ID="ID_1773832134" CREATED="1586852937161" MODIFIED="1586853317456">
<node TEXT="Feld muss ausgef&#xfc;llt werden, andererseits Fehlermeldung" ID="ID_166551902" CREATED="1586852977431" MODIFIED="1586853317452" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="12.7499996200204 pt"/>
</node>
</node>
<node TEXT="rendered" ID="ID_1788423177" CREATED="1586853067853" MODIFIED="1586853309071" HGAP_QUANTITY="19.999999821186073 pt" VSHIFT_QUANTITY="24.749999262392542 pt">
<node TEXT="ist ebenfalls eine Attribut" ID="ID_1620384951" CREATED="1586853102196" MODIFIED="1586853111498"/>
<node TEXT="Beispiel:&#xa;&lt;h:commandLink value=&quot;zur&#xfc;ck&quot; rendered=&quot;#{artikelController.index &gt; 0}&quot; /&gt;" ID="ID_200257805" CREATED="1586853112340" MODIFIED="1586853297972">
<node TEXT="Link wird nur gerenderd, wenn Bedingung true ist" ID="ID_286627972" CREATED="1586853225674" MODIFIED="1586853270895"/>
</node>
</node>
</node>
<node TEXT="Pflichtfeld-Validierung" ID="ID_1847358994" CREATED="1584031044497" MODIFIED="1586853311327" HGAP_QUANTITY="16.999999910593036 pt" VSHIFT_QUANTITY="22.499999329447768 pt">
<node TEXT="&#xfc;berpr&#xfc;fen ob Benutzer die Eingabe eines Pflichfeldes gemacht hat" ID="ID_272951755" CREATED="1584031063827" MODIFIED="1584031104509">
<node TEXT="Beispiel: Das Attribut required" ID="ID_1442383323" CREATED="1584377082520" MODIFIED="1586855560790"/>
</node>
</node>
<node TEXT="Format-Validierung" ID="ID_983396832" CREATED="1584031293781" MODIFIED="1584031453448" VSHIFT_QUANTITY="10.499999687075624 pt">
<node TEXT="&#xfc;berpr&#xfc;fen ob Benutzer ein bestimmtes Format eingehalten hat" ID="ID_1907598427" CREATED="1584031331275" MODIFIED="1584031445789">
<node TEXT="z.B. email oder Auto-Kennzeichen" ID="ID_504464492" CREATED="1584031380086" MODIFIED="1584031445787" HGAP_QUANTITY="18.499999865889553 pt" VSHIFT_QUANTITY="13.49999959766866 pt"/>
<node TEXT="f:validateRegex" ID="ID_1602655615" CREATED="1584032723019" MODIFIED="1584032737688"/>
<node TEXT="z.B.&#xa;&lt;f:inputText validatorMessage=&quot;das ist kein Dateiname f&#xfc;r ein Bild&quot;&gt;&#xa;    &lt;f:validateRegex pattern=&quot;[a-zA-Z0-9]+.(jpg|jpeg|png|gif)&quot;&#xa;     /&gt;&#xa;&lt;/f:inputText&gt;" ID="ID_614375226" CREATED="1584377354212" MODIFIED="1584377830529"/>
</node>
</node>
<node TEXT="Fachliche Validierung" ID="ID_766677029" CREATED="1584032911094" MODIFIED="1584032921649">
<node TEXT="z.B. Artikelnummern d&#xfc;rfen erst ab 1000 beginnen, Geburtsdatum darf nicht in der Zukunft liegen, Datum der Anreise muss vor Datum der Abreise liegen..." ID="ID_453167622" CREATED="1584032923504" MODIFIED="1584033193608">
<node TEXT="" ID="ID_1607362011" CREATED="1584033268615" MODIFIED="1584033268615">
<hook NAME="FirstGroupNode"/>
</node>
<node TEXT="f:validateLongRange" ID="ID_351755219" CREATED="1584033147636" MODIFIED="1584033189241" HGAP_QUANTITY="19.999999821186073 pt" VSHIFT_QUANTITY="39.74999881535772 pt">
<node TEXT="Ganzzahl" ID="ID_614060330" CREATED="1584033199971" MODIFIED="1584033212901"/>
</node>
<node TEXT="f:validateDoubleRange" ID="ID_1967886384" CREATED="1584033154578" MODIFIED="1584033193608" HGAP_QUANTITY="19.24999984353781 pt" VSHIFT_QUANTITY="1.4999999552965182 pt">
<node TEXT="Flie&#xdf;kommazahl" ID="ID_12223583" CREATED="1584033214579" MODIFIED="1584033226682"/>
</node>
<node TEXT="f:validateLength" ID="ID_404048392" CREATED="1584033168530" MODIFIED="1584033178284">
<node TEXT="String" ID="ID_970510761" CREATED="1584033228243" MODIFIED="1584033231794"/>
</node>
<node TEXT="" ID="ID_728253469" CREATED="1584033268611" MODIFIED="1584033268614">
<hook NAME="SummaryNode"/>
<hook NAME="AlwaysUnfoldedNode"/>
<node TEXT="alle Komponenten werden mit dem Attribut minimum und maximum konfiguriert" ID="ID_1712134943" CREATED="1584033268616" MODIFIED="1584033315519"/>
</node>
</node>
<node TEXT="z.B.&#xa;&lt;h:inputText validatorMessage=&quot;Zahl muss gr&#xf6;&#xdf;er sein als 1000&quot;&gt;&#xa;&lt;f:validatorLongRange minimum=&quot;1000&quot;/&gt;&#xa;&lt;/h:inputText&gt;" ID="ID_1536533175" CREATED="1584377860501" MODIFIED="1584377993850"/>
</node>
</node>
<node TEXT="benutzerdefinierte Validierung" ID="ID_923123386" CREATED="1584033450864" MODIFIED="1586857601952" HGAP_QUANTITY="32.74999944120647 pt" VSHIFT_QUANTITY="-36.74999890476469 pt">
<node TEXT="z.B. Pr&#xfc;fziffer von Barcode berechnen" ID="ID_1776143824" CREATED="1584033462896" MODIFIED="1584033478486"/>
<node TEXT="validierung findet im controller statt" ID="ID_217632801" CREATED="1584033517983" MODIFIED="1584033530765">
<node TEXT="Attribut validator verkn&#xfc;pft die jsf-komponente mit dem controller" ID="ID_1860918340" CREATED="1584033532047" MODIFIED="1584033564412">
<node TEXT="&lt;h:inputText validator=&quot;#{controller.validatorFunktion()}&quot; /&gt;" ID="ID_90319686" CREATED="1584455766956" MODIFIED="1584455835545"/>
</node>
<node TEXT="schl&#xe4;gt Validierung fehl wird eine ValidatorException ausgel&#xf6;st" ID="ID_998216065" CREATED="1584033588670" MODIFIED="1584033612894">
<node TEXT="wird von jsf interpretiert und als Fehlermeldung auf der Webseite ausgegeben" ID="ID_1051327578" CREATED="1584033639606" MODIFIED="1584033665587"/>
</node>
</node>
</node>
</node>
<node TEXT="regul&#xe4;re Audr&#xfc;cke" POSITION="right" ID="ID_648778461" CREATED="1584031775316" MODIFIED="1584032642831">
<edge COLOR="#00ff00"/>
<node TEXT="beschreibung von Regeln wie ein String auszusehen hat" ID="ID_1606454490" CREATED="1584031787415" MODIFIED="1584032642828" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="20.999999374151248 pt">
<node TEXT="werden im Attribut pattern=&quot;&quot; eingetragen" ID="ID_1978186110" CREATED="1584035499803" MODIFIED="1584035513414"/>
</node>
</node>
<node TEXT="Seitennavigation mit JSF-Anwendungen" POSITION="right" ID="ID_910063010" CREATED="1584036925687" MODIFIED="1584036954600" HGAP_QUANTITY="-22.749998904764688 pt" VSHIFT_QUANTITY="83.24999751895673 pt">
<edge COLOR="#00007c"/>
<node TEXT="mit UEL in Kommponenten wie h:commandLink oder h:commandButton Methoden aufrufen die einen R&#xfc;ckgabewert haben, der den Namen der anzusteuernen View enth&#xe4;lt" ID="ID_209252573" CREATED="1584036960166" MODIFIED="1584037370720"/>
<node TEXT="Startseite in web.xml anpassen" ID="ID_824983746" CREATED="1584037670451" MODIFIED="1584037680681"/>
</node>
<node TEXT="Konvertierung von Zahlen, W&#xe4;hrung, Datumsfelder" POSITION="left" ID="ID_179166774" CREATED="1584034344778" MODIFIED="1584091781177">
<edge COLOR="#ff00ff"/>
<node TEXT="jsf hat eingebaute standart-Konventierer" ID="ID_740187344" CREATED="1584034561138" MODIFIED="1584091781175" HGAP_QUANTITY="29.749999530613437 pt" VSHIFT_QUANTITY="-30.749999083578615 pt">
<node TEXT="erkenne anhand des bean-attributes in welchen Typ der html-string umgewandelt werden muss" ID="ID_1128128256" CREATED="1584034591371" MODIFIED="1584034654767"/>
</node>
<node TEXT="will man bspw. nur das Jahr eines Datum-Strings anzeigen lassen, reichen das explezite aufrufen des standart-Konventierer nicht aus" ID="ID_671522295" CREATED="1584034808028" MODIFIED="1584091785268">
<node TEXT="standart-Konventierer m&#xfc;ssen explizit angegeben und konfiguriert werden" ID="ID_465706343" CREATED="1584034843044" MODIFIED="1584091779446" HGAP_QUANTITY="22.249999754130847 pt" VSHIFT_QUANTITY="84.74999747425325 pt"/>
<node TEXT="Komponenten sind" ID="ID_554496266" CREATED="1584034970444" MODIFIED="1584091813979" HGAP_QUANTITY="13.250000022351742 pt" VSHIFT_QUANTITY="21.749999351799506 pt">
<node TEXT="f:convertDateTime" ID="ID_194849338" CREATED="1584034979204" MODIFIED="1584455641098">
<node TEXT="konvertiert zu java.util.Date" ID="ID_1076434279" CREATED="1584035064866" MODIFIED="1584035074458"/>
<node TEXT="Attribute" ID="ID_313250589" CREATED="1584035121281" MODIFIED="1584091810763" HGAP_QUANTITY="15.499999955296518 pt" VSHIFT_QUANTITY="17.249999485909953 pt">
<node TEXT="type=&quot;date&quot;" ID="ID_1556862907" CREATED="1584035128737" MODIFIED="1584035142521">
<node TEXT="Datum wird ohne Uhrzeit gespeichert" ID="ID_1247426337" CREATED="1584035143246" MODIFIED="1584035178783"/>
</node>
<node TEXT="dateStyle=&quot;&quot;" ID="ID_1155314731" CREATED="1584035221095" MODIFIED="1584091810763" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="15.749999530613437 pt">
<node TEXT="short" ID="ID_290498388" CREATED="1584035233615" MODIFIED="1584035243092"/>
<node TEXT="medium" ID="ID_532067796" CREATED="1584035243847" MODIFIED="1584035249150"/>
<node TEXT="long" ID="ID_1359105070" CREATED="1584035249358" MODIFIED="1584035257950"/>
<node TEXT="full" ID="ID_410534400" CREATED="1584035258141" MODIFIED="1584035259253"/>
</node>
</node>
<node TEXT="z.B.&#xa;&lt;h:inputText&gt;&#xa;    &lt;f:convertDateTime type=&quot;date&quot; dateStyle=&quot;medium&quot; /&gt;&#xa;&lt;/h:inputText&gt;" ID="ID_951781806" CREATED="1584455036880" MODIFIED="1584455641095"/>
</node>
<node TEXT="f:convertNumber" ID="ID_173709522" CREATED="1584034986443" MODIFIED="1584091813978" HGAP_QUANTITY="20.74999979883433 pt" VSHIFT_QUANTITY="19.49999941885473 pt">
<node TEXT="Attribute" ID="ID_1471690405" CREATED="1584035633697" MODIFIED="1584091816459">
<node TEXT="type=&quot;&quot;" ID="ID_747421639" CREATED="1584035639265" MODIFIED="1584091819509">
<node TEXT="currency" ID="ID_320767230" CREATED="1584035643026" MODIFIED="1584091819507" HGAP_QUANTITY="22.249999754130847 pt" VSHIFT_QUANTITY="16.499999508261695 pt"/>
</node>
<node TEXT="currencySymbol=&quot;&quot;" ID="ID_1565605" CREATED="1584035726208" MODIFIED="1584091817936" VSHIFT_QUANTITY="6.74999979883433 pt">
<node TEXT="EUR" ID="ID_618540759" CREATED="1584035756798" MODIFIED="1584091817935" HGAP_QUANTITY="13.250000022351742 pt" VSHIFT_QUANTITY="15.749999530613437 pt"/>
</node>
</node>
<node TEXT="z.B.&#xa;&lt;h:inputText&gt;&#xa;    &lt;f:confertNumber type=&quot;currency&quot; currencySymbot=&quot;EUR&quot;/&gt;&#xa;&lt;/h:inputText&gt;" ID="ID_1421807766" CREATED="1584454677278" MODIFIED="1584454786316">
<node TEXT="eingabe muss folgendes format haben:&#xa;99,99 EUR" ID="ID_1260500636" CREATED="1584454788329" MODIFIED="1584454819509"/>
</node>
</node>
</node>
</node>
</node>
<node TEXT="Definition von Fehlermeldungen" POSITION="left" ID="ID_1097432733" CREATED="1584035922476" MODIFIED="1586002695162">
<edge COLOR="#7c0000"/>
<node TEXT="eigene validator-message" ID="ID_166358293" CREATED="1584455669255" MODIFIED="1584455684486">
<node TEXT="&lt;h:inputText validatorMessage=&quot;eigene message&quot;&gt;" ID="ID_1395913632" CREATED="1584455685438" MODIFIED="1584455713706"/>
</node>
<node TEXT="h:message" ID="ID_20279612" CREATED="1584036032587" MODIFIED="1584036036466">
<node TEXT="Fehlermeldung tauch an der stelle auf, an der das Element f:message steht" ID="ID_1739588509" CREATED="1584036037187" MODIFIED="1586870594478">
<node TEXT="for=&quot;id des Elementes&quot;" ID="ID_547080932" CREATED="1584036286104" MODIFIED="1584036299260"/>
</node>
</node>
<node TEXT="h:messages" ID="ID_1977531297" CREATED="1584036063371" MODIFIED="1584036107256">
<node TEXT="alle Fehlermeldungen tauchen am Ende der Seite auf" ID="ID_1221013600" CREATED="1584036111546" MODIFIED="1584036138881"/>
</node>
<node TEXT="mit Attribut Label im eingabe-Element kann der Anfangsteil einer Fehlermeldung angepasst werden" ID="ID_1595332987" CREATED="1584036527053" MODIFIED="1584036591379"/>
<node TEXT="Properties-Dateien" ID="ID_1688037272" CREATED="1584036660435" MODIFIED="1586002695160" HGAP_QUANTITY="16.249999932944775 pt" VSHIFT_QUANTITY="23.249999307096026 pt">
<node TEXT="Textdateien mit beliebigen Namen" ID="ID_764946026" CREATED="1586871717473" MODIFIED="1586871740274"/>
<node TEXT="k&#xf6;nnen jsf-spezifische System-Parameter &#xfc;berschreiben" ID="ID_188266927" CREATED="1584036667979" MODIFIED="1584036714115"/>
<node TEXT="z.B. javax.faces.component.UIInput.REQUIRED=die gew&#xfc;nschte Nachricht" ID="ID_782684057" CREATED="1584377188970" MODIFIED="1584377261679"/>
<node TEXT="muss in der JSF-Kofigurationsdatei (faces-config.xml) registriert werden" ID="ID_1651168475" CREATED="1584036736842" MODIFIED="1584036782873"/>
</node>
</node>
<node TEXT="JSF-Lebenszyklus und Eventhandling" POSITION="left" ID="ID_1001490946" CREATED="1584037764618" MODIFIED="1584037794417" HGAP_QUANTITY="25.249999664723884 pt" VSHIFT_QUANTITY="89.99999731779107 pt">
<edge COLOR="#007c00"/>
<node TEXT="Validierung der Benutzereingaben (Phase im jsf-Lebenszyklus)" ID="ID_1878969685" CREATED="1584037863257" MODIFIED="1586881552816">
<node TEXT="alle Komponenten werden nacheinander einzeln validiert" ID="ID_905918649" CREATED="1584037875479" MODIFIED="1586881477196" HGAP_QUANTITY="17.749999888241295 pt" VSHIFT_QUANTITY="-17.249999485909953 pt">
<node TEXT="validiert man das Passwort einer Komponente, hat man kein zugriff auf die Komponente mit den Benutzernamen" ID="ID_1527653447" CREATED="1586881863724" MODIFIED="1586881919777"/>
<node TEXT="greift man im Password-Validierer auf die Benutzer-Bean zu, in der das Passwort gespeichert wird, stellt man fest, dass das Passwort noch nicht in der Bean angekommen ist" ID="ID_520542045" CREATED="1586881920372" MODIFIED="1586881998658">
<node TEXT="Grund:&#xa;die Phase: Datenmodell aktualisieren, findet erst nach der Phase: Validierung der Benutzereingaben statt" ID="ID_253590620" CREATED="1586881999787" MODIFIED="1586882190968"/>
</node>
</node>
</node>
<node TEXT="Feld&#xfc;bergreifende Validierung" ID="ID_358645094" CREATED="1584038017086" MODIFIED="1586881343678">
<node TEXT="Validierung von zwei oder mehreren Komponenten" ID="ID_628227465" CREATED="1584037970575" MODIFIED="1586881793082">
<node TEXT="mit Events" ID="ID_65910881" CREATED="1586883512582" MODIFIED="1586883528391">
<node TEXT="Event-Listener k&#xf6;nnen von einer Komponente aufgerufen werden und &#xfc;ber das Event-Objekt werte z.B. Benutzername an die Bean &#xfc;bergeben werden noch vor der Phase: Validierung der Benutzereingaben" ID="ID_1872067461" CREATED="1586883529430" MODIFIED="1586883691158"/>
</node>
</node>
<node TEXT="PostValidate-Event" ID="ID_1845194556" CREATED="1586881293300" MODIFIED="1586881343675" HGAP_QUANTITY="31.99999946355821 pt" VSHIFT_QUANTITY="11.999999642372142 pt">
<node TEXT="wird immer nach der Validierung einer Komponente erzeugt" ID="ID_1667219183" CREATED="1586881304067" MODIFIED="1586881341686" VSHIFT_QUANTITY="11.249999664723884 pt">
<node TEXT="ist bspw. die Validierung der Komponente mit Benutzernamen abgeschlossen, kann das Event, in dem der Benutzername als Attribut gespeichert ist, von einem Event-Listerner abgefangen werden." ID="ID_1787603083" CREATED="1586882444485" MODIFIED="1586882550962"/>
<node TEXT="das Event wird mit &lt;f:event/&gt; erzeugt" ID="ID_230958562" CREATED="1586883910713" MODIFIED="1586883938103">
<node TEXT="Beispiel:&#xa; &lt;h:inputText id=&quot;name&quot; value=&quot;#{loginController.benutzer.name}&quot; size=&quot;25&quot; &gt;&#xa;          &lt;f:event type=&quot;javax.faces.event.PostValidateEvent&quot;&#xa;                   listener=&quot;#{loginController.postValidateName}&quot;/&gt;&#xa;        &lt;/h:inputText&gt;" ID="ID_286956235" CREATED="1586883719980" MODIFIED="1586883870963"/>
</node>
</node>
</node>
<node TEXT="Vorgehensweise" ID="ID_248912613" CREATED="1584090568285" MODIFIED="1586002698133" HGAP_QUANTITY="13.250000022351742 pt" VSHIFT_QUANTITY="23.999999284744284 pt">
<node TEXT="Attribut zum Zwischenspeichern im Controller festlegen" ID="ID_1460799037" CREATED="1584090579605" MODIFIED="1584090604121"/>
<node TEXT="Listener im Controller zum Abfangen des PostValidate-Event implementieren" ID="ID_275475948" CREATED="1584090606140" MODIFIED="1584090641736"/>
<node TEXT="Listener-Methode in der view f&#xfc;r das PostValidate-Event registrieren" ID="ID_669939439" CREATED="1584090666004" MODIFIED="1584090703823">
<node TEXT="Registrierung durch f:event in der komponenten-Quelle" ID="ID_1720269705" CREATED="1584090840560" MODIFIED="1584090861840"/>
</node>
<node TEXT="im Password-Validator des Controllers anhand des gespeicherten Attributs validieren (Benutzername)" ID="ID_170852380" CREATED="1584090727207" MODIFIED="1584092127627"/>
</node>
</node>
</node>
<node TEXT="ereignisgesteuerte Architektur" POSITION="right" ID="ID_733711673" CREATED="1584038378626" MODIFIED="1584038400536" HGAP_QUANTITY="-72.24999742954977 pt" VSHIFT_QUANTITY="110.24999671429406 pt">
<edge COLOR="#7c007c"/>
<node TEXT="Architektur besteht aus Komponenten die:" ID="ID_928065450" CREATED="1586879559035" MODIFIED="1586879785611">
<node TEXT="Ereignisse erzeugen" ID="ID_282686795" CREATED="1586879580778" MODIFIED="1586879769621">
<node TEXT="Event-Quelle erzeugt Event-Objekt (Ereignis)" ID="ID_705472658" CREATED="1584038545158" MODIFIED="1586879773281" HGAP_QUANTITY="16.999999910593036 pt" VSHIFT_QUANTITY="-23.999999284744284 pt">
<node TEXT="z.B. click auf commandButton erzeugt ein ActionEvent" ID="ID_835300957" CREATED="1584038581543" MODIFIED="1586879773280" VSHIFT_QUANTITY="-20.24999939650299 pt"/>
</node>
</node>
<node TEXT="Ereignisse Abfangen und darauf reagieren" ID="ID_612110391" CREATED="1586879588786" MODIFIED="1586879785610" HGAP_QUANTITY="13.250000022351742 pt" VSHIFT_QUANTITY="14.999999552965178 pt">
<node TEXT="Listener-Objekte werden bei Event-Quellen z.B. commandButton registriert und fangen Event-Objekte ab" ID="ID_304308986" CREATED="1584038665870" MODIFIED="1586879788738" VSHIFT_QUANTITY="13.49999959766866 pt">
<node TEXT="Listener-Interface muss implementiert werden bzw. eine Methode mit vorgegebenen Parametern" ID="ID_1583371297" CREATED="1584038763653" MODIFIED="1586881020087" HGAP_QUANTITY="12.500000044703482 pt" VSHIFT_QUANTITY="23.249999307096026 pt"/>
<node TEXT="Methode wird von der Event-Quelle automatisch aufgerufen" ID="ID_825945824" CREATED="1586881040718" MODIFIED="1586881055966">
<node TEXT="der Methode wird als Parameter das Event &#xfc;bergeben" ID="ID_755822053" CREATED="1586881100574" MODIFIED="1586881120316"/>
</node>
</node>
</node>
<node TEXT="System-Event" ID="ID_1384506186" CREATED="1586879822895" MODIFIED="1586879833040">
<node TEXT="tritt vor und nach jeder jsf-Phase auf" ID="ID_582528143" CREATED="1586879833727" MODIFIED="1586879866585"/>
<node TEXT="durch die Event-Objekte kann in den jsf-Lebenszyklus eingegruffen werden" ID="ID_24025619" CREATED="1586879866804" MODIFIED="1586879902632"/>
</node>
</node>
</node>
</node>
</map>
