<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Programmierung von Datenbankanbindungen" FOLDED="false" ID="ID_413938028" CREATED="1584457451036" MODIFIED="1586016819641" STYLE="oval">
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
<hook NAME="AutomaticEdgeColor" COUNTER="23" RULE="ON_BRANCH_CREATION"/>
<node TEXT="AKID (Anforderung an eine Persistenzl&#xf6;sung)" POSITION="right" ID="ID_1554635783" CREATED="1584457483047" MODIFIED="1586003741163" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="-35.249998949468164 pt">
<edge COLOR="#ff0000"/>
<node TEXT="A(Automarit&#xe4;t)" ID="ID_33095994" CREATED="1584457528345" MODIFIED="1584457542680">
<node TEXT="&#xc4;nderung werden ganz oder garnicht ausgef&#xfc;hrt" ID="ID_171294114" CREATED="1584457579912" MODIFIED="1584457682895">
<node TEXT="tritt ein Fehler beim Speichern eines Artikels auf, wird die &#xc4;nderung wieder r&#xfc;ckg&#xe4;ngig gemacht" ID="ID_431338017" CREATED="1584457683623" MODIFIED="1584457730421"/>
</node>
</node>
<node TEXT="K(Konsistenz)" ID="ID_497957503" CREATED="1584457543409" MODIFIED="1584457558010">
<node TEXT="zusammengeh&#xf6;rige Datens&#xe4;tze sind eindeutig identifizierbar" ID="ID_1741426311" CREATED="1584457732814" MODIFIED="1584457833615">
<node TEXT="dadurch k&#xf6;nnen Datens&#xe4;tze auf andere verweisen" ID="ID_1194678900" CREATED="1584457834164" MODIFIED="1584457863080"/>
<node TEXT="Datens&#xe4;tze d&#xfc;rfen nicht auf nicht existierende Datens&#xe4;tze verwie&#xdf;en werden" ID="ID_827912446" CREATED="1584457863364" MODIFIED="1584457936379"/>
</node>
</node>
<node TEXT="i(isolation)" ID="ID_219902566" CREATED="1584457558191" MODIFIED="1584457569046">
<node TEXT="glichzeitiger Zugriff auf persistenter Speicher darf nicht zu Beeinflussung f&#xfc;hren" ID="ID_488794270" CREATED="1584457982403" MODIFIED="1584458017450">
<node TEXT="z.B.&#xa;zwei Mitarbeiter speichern zur gleichen Zeit gleiche Attribute ab" ID="ID_1979913839" CREATED="1584458172489" MODIFIED="1584458224439"/>
</node>
</node>
<node TEXT="D(Dauerhaftigkeit)" ID="ID_1993673223" CREATED="1584457569280" MODIFIED="1584457577334">
<node TEXT="best&#xe4;ndig gespeichert und f&#xfc;r alle lesenden Zugriff sichtbar" ID="ID_1692923645" CREATED="1584458246807" MODIFIED="1584458286652"/>
</node>
</node>
<node TEXT="Datenbankmanagementsysteme (DBMS)" POSITION="right" ID="ID_1257686212" CREATED="1584458402460" MODIFIED="1586003737567" HGAP_QUANTITY="16.999999910593036 pt" VSHIFT_QUANTITY="-19.49999941885473 pt">
<edge COLOR="#ff00ff"/>
<node TEXT="z.B. MySql" ID="ID_829088641" CREATED="1584640886245" MODIFIED="1584640899389"/>
<node TEXT="verwaltet einen persistenten Speicher auf der Festplatte, als Prozess im RAM" ID="ID_168809555" CREATED="1584609813145" MODIFIED="1584609858927">
<node TEXT="Zugriff vom eigenen Programm &#xfc;ber API des DBMS" ID="ID_1421282459" CREATED="1584609860693" MODIFIED="1584609896372"/>
</node>
<node TEXT="verwaltet die Speicherung und Zugriff von persistenten Daten unter ber&#xfc;cksichtigung von AKID" ID="ID_1149784647" CREATED="1584458434597" MODIFIED="1586005284772"/>
<node TEXT="eigenst&#xe4;ndiges Programm" ID="ID_142611938" CREATED="1584458531332" MODIFIED="1584458554345">
<node TEXT="verf&#xfc;gt &#xfc;ber eine Schnittstelle um mit anderen Programmen zu Kommunizieren" ID="ID_271238280" CREATED="1584458555075" MODIFIED="1584458578938"/>
</node>
</node>
<node TEXT="relationale Datenbanken" POSITION="right" ID="ID_1401209226" CREATED="1584609958121" MODIFIED="1584609970410">
<edge COLOR="#00ffff"/>
<node TEXT="legt Daten in Tabelle ab" ID="ID_71189386" CREATED="1584609971288" MODIFIED="1584609981504">
<node TEXT="eine Zeile ist ein Datensatz" ID="ID_74110373" CREATED="1584609982169" MODIFIED="1584610011318"/>
<node TEXT="jede Spalte representiert ein Attribut" ID="ID_1719272403" CREATED="1584610037525" MODIFIED="1584610069612"/>
</node>
<node TEXT="eindeutige Zuordnung &#xfc;ber Schl&#xfc;sselattribute" ID="ID_1284556123" CREATED="1584610146437" MODIFIED="1584610158690">
<node TEXT="jeder Datensatz in einer Tabelle ist durch ein Schl&#xfc;ssel eindeutig identifizierbar" ID="ID_1561317368" CREATED="1587031705815" MODIFIED="1587031759425"/>
<node TEXT="ein Attribut in einer Tabelle k&#xf6;nnte bspw. Nr hei&#xdf;en" ID="ID_962419503" CREATED="1587031761805" MODIFIED="1587031787476">
<node TEXT="die Werte werden in der Tabelle f&#xfc;r jede n&#xe4;chste Spalte um eins erh&#xf6;t" ID="ID_24103678" CREATED="1587031788858" MODIFIED="1587031828832"/>
</node>
<node TEXT="Schl&#xfc;ssel referenziert einen Datensatz (eine Zeile)" ID="ID_780124141" CREATED="1584610201990" MODIFIED="1584610217647"/>
</node>
<node TEXT="Fremdschl&#xfc;ssel" ID="ID_193769916" CREATED="1584610287316" MODIFIED="1584610291813">
<node TEXT="Steht in einem Datensatz als Attribut und verweist auf einen anderen Datensatz in einer anderen Tabelle" ID="ID_1079461872" CREATED="1584610313777" MODIFIED="1584610544829"/>
</node>
</node>
<node TEXT="SQL" POSITION="right" ID="ID_421256894" CREATED="1584610722730" MODIFIED="1586003734780" HGAP_QUANTITY="20.74999979883433 pt" VSHIFT_QUANTITY="35.249998949468164 pt">
<edge COLOR="#7c0000"/>
<node TEXT="ist eine Sprache, mit der man mit einer Datenbank kommunizieren kann" ID="ID_946708946" CREATED="1584610728561" MODIFIED="1584610804683"/>
<node TEXT="Ablauf einer Anfrage" ID="ID_1737271664" CREATED="1584616594373" MODIFIED="1584616601644">
<node TEXT="Programm sendet SQL-Abfrage an DBMS" ID="ID_1280536467" CREATED="1584616602325" MODIFIED="1584616633508"/>
<node TEXT="DBMS holt Daten von Festplatte" ID="ID_1311429253" CREATED="1584616634876" MODIFIED="1584616653366"/>
<node TEXT="standartisierte Antwort der Anfrage wird von DBMS an Programm gesendet" ID="ID_1936666809" CREATED="1584616654268" MODIFIED="1584616749049"/>
<node TEXT="Programm erstellt aus Antwort die Datenstruktur um auf Daten zugreifen zu k&#xf6;nnen" ID="ID_1636257337" CREATED="1584616749690" MODIFIED="1584616791728"/>
</node>
<node TEXT="Beispiel einer Abfrage" ID="ID_1984851403" CREATED="1584616809577" MODIFIED="1584616815976">
<node TEXT="select Name form Artikel where Verf&#xfc;gbar &gt; &apos;2013-12-01&apos;;" ID="ID_1426647832" CREATED="1584616816601" MODIFIED="1584616882334"/>
</node>
</node>
<node TEXT="Objektrelationales Mapping" POSITION="left" ID="ID_669186388" CREATED="1584617014839" MODIFIED="1586003745014" HGAP_QUANTITY="21.49999977648259 pt" VSHIFT_QUANTITY="-31.499999061226873 pt">
<edge COLOR="#007c00"/>
<node TEXT="relationale und objektorientierte Sicht" ID="ID_1054191585" CREATED="1584617039107" MODIFIED="1584632177973" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="-13.49999959766866 pt">
<node TEXT="Klassen stehen f&#xfc;r Tabellen" ID="ID_1837403445" CREATED="1584617065893" MODIFIED="1584617124049"/>
<node TEXT="Datens&#xe4;tze (Zeilen) f&#xfc;r Objekte" ID="ID_1864955539" CREATED="1584617071940" MODIFIED="1584617093797"/>
<node TEXT="Spalten f&#xfc;r Attribute" ID="ID_500521450" CREATED="1584617094509" MODIFIED="1584617115678"/>
</node>
<node TEXT="Beziehungen werden &#xfc;ber Fremdschl&#xfc;ssel abgebildet" ID="ID_398787189" CREATED="1584617333130" MODIFIED="1584617347984"/>
<node TEXT="referentielle Integrit&#xe4;t" ID="ID_1268707567" CREATED="1584617619358" MODIFIED="1584632181739" HGAP_QUANTITY="15.499999955296518 pt" VSHIFT_QUANTITY="11.999999642372142 pt">
<node TEXT="gew&#xe4;rleistet dadurch: Das ein Fremdschl&#xfc;ssel immer auf ein Datensatz verweist, andererseits entsteht Inkonsistenz" ID="ID_1303962508" CREATED="1584617642087" MODIFIED="1584617759184"/>
</node>
</node>
<node TEXT="Umwandlung relationaler- und Objekt-Daten" POSITION="left" ID="ID_953782244" CREATED="1584621874684" MODIFIED="1584632184930" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="14.249999575316918 pt">
<edge COLOR="#007c7c"/>
<node TEXT="Zuordnung von Klasse und Tabelle" ID="ID_1407338534" CREATED="1584632378487" MODIFIED="1584632395908">
<node TEXT="Objekte m&#xfc;ssen in richtige Tabelle abgelegt werden" ID="ID_1267930684" CREATED="1584632399710" MODIFIED="1584632435881"/>
<node TEXT="Objekte m&#xfc;ssen aus der richtigen Tabelle gelesen werden" ID="ID_1009538099" CREATED="1584632437790" MODIFIED="1584632466455"/>
</node>
<node TEXT="Konvertierung zwischen Java und Datenbanktdatentypen" ID="ID_1816451168" CREATED="1584621935779" MODIFIED="1584632167881" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="22.499999329447768 pt">
<node TEXT="konventieren von Objekt-Attribute in Datenbank-Attribute und umgekehrt" ID="ID_1646408767" CREATED="1584632492893" MODIFIED="1584632670546"/>
<node TEXT="konventierung von Objekt-Attribut-Werte in Datenbank-Attribut-Werte und umgekehrt" ID="ID_646777820" CREATED="1584632610003" MODIFIED="1584632659810"/>
</node>
<node TEXT="ORM-Bibliotheken (ObjektRelationale Mapping)" ID="ID_1923811932" CREATED="1584632994395" MODIFIED="1584633030235">
<node TEXT="&#xfc;bernehmen die &#xdc;bersetzung von objektorientierten- in rationale-Daten und umgekehrt" ID="ID_1988449455" CREATED="1584633031635" MODIFIED="1584633101578"/>
</node>
</node>
<node TEXT="Datenbankpersistenz mit JPA und Hibernate als Persistence Provider" POSITION="left" ID="ID_1055895890" CREATED="1584633112242" MODIFIED="1586003748118" HGAP_QUANTITY="26.7499996200204 pt" VSHIFT_QUANTITY="22.499999329447768 pt">
<edge COLOR="#7c7c00"/>
<node TEXT="JPA = Java Persistenz API" ID="ID_1690081547" CREATED="1584633221240" MODIFIED="1584633248439"/>
<node TEXT="Schnittstelle f&#xfc;r Java-Anwendungen zur Speicherung von Objekten in relationalen Datenbanken" ID="ID_1801693310" CREATED="1584633249239" MODIFIED="1584633283406"/>
<node TEXT="JPA Provider" ID="ID_1470764204" CREATED="1584633293487" MODIFIED="1584633299301">
<node TEXT="Java-Bibliotheken, die die in der JPA-Schnittstelle definierte Funktionalit&#xe4;t konkret implementiert, werden JPA-Provider genannt" ID="ID_195201930" CREATED="1584633300662" MODIFIED="1584633399318"/>
</node>
<node TEXT="Hibernate" ID="ID_402055139" CREATED="1584633449476" MODIFIED="1584633456371">
<node TEXT="ist ein JPA-Provider" ID="ID_915957106" CREATED="1584633457659" MODIFIED="1584633462762"/>
</node>
</node>
<node TEXT="Vorgehensweise" POSITION="left" ID="ID_1321769317" CREATED="1584637735622" MODIFIED="1586003755571" HGAP_QUANTITY="226.24999367445727 pt" VSHIFT_QUANTITY="26.99999919533732 pt">
<edge COLOR="#ff0000"/>
<node TEXT="in der Anwendung muss ein Treiber implementiert sein z.B. als library die hinzugef&#xfc;gt wird" ID="ID_178254437" CREATED="1584637744633" MODIFIED="1584637801318"/>
<node TEXT="&#xfc;ber den Treiber kommuniziert die Anwendung mit der Datenbank" ID="ID_6382675" CREATED="1584637805360" MODIFIED="1584637831538"/>
<node TEXT="eine ORM-library z.B. hibernate &#xfc;bernimmt das object relational mapping (Objekte in Datenbank-Typ konventieren und umgekehrt)" ID="ID_1717103301" CREATED="1584637832006" MODIFIED="1584637938196"/>
</node>
<node TEXT="Hibernate" POSITION="left" ID="ID_1764197568" CREATED="1584638649153" MODIFIED="1586003758482" HGAP_QUANTITY="97.24999751895675 pt" VSHIFT_QUANTITY="26.24999921768906 pt">
<edge COLOR="#0000ff"/>
<node TEXT="Konfigurationsdatei" ID="ID_1931538390" CREATED="1584638653210" MODIFIED="1584638659769">
<node TEXT="hibernate.cfg.xml" ID="ID_1596763188" CREATED="1584638660912" MODIFIED="1584638671257">
<node TEXT="im src-folder anlegen" ID="ID_1609637472" CREATED="1584638678137" MODIFIED="1584638685375"/>
</node>
</node>
</node>
<node TEXT="JPA Persistence Unit" POSITION="left" ID="ID_753503486" CREATED="1585041625215" MODIFIED="1586003760813" HGAP_QUANTITY="45.49999906122687 pt" VSHIFT_QUANTITY="21.749999351799506 pt">
<edge COLOR="#ff00ff"/>
<node TEXT="Einstellung zwischen Verbindung von Web-Anwerndung und Datenbank" ID="ID_1480527036" CREATED="1585041647879" MODIFIED="1585041679919"/>
</node>
<node TEXT="Annotation @Entity" POSITION="left" ID="ID_1230319470" CREATED="1585052415667" MODIFIED="1586003762314" HGAP_QUANTITY="32.74999944120647 pt" VSHIFT_QUANTITY="26.249999217689062 pt">
<edge COLOR="#00ffff"/>
<node TEXT="Kennzeichnet Klasse deren Daten in eine Datenbank geschrieben werden sollen" ID="ID_982873077" CREATED="1585052433154" MODIFIED="1585052467837"/>
<node TEXT="Tabelle mit dem gleichen Namen wie die Klasse wird ben&#xf6;tigt" ID="ID_1339644828" CREATED="1585052518809" MODIFIED="1585052545312"/>
</node>
<node TEXT="parameterloser Konstruktor muss implementiert sein" POSITION="left" ID="ID_312078321" CREATED="1585052617616" MODIFIED="1586003764032" HGAP_QUANTITY="35.7499993517995 pt" VSHIFT_QUANTITY="36.74999890476469 pt">
<edge COLOR="#007c00"/>
</node>
<node TEXT="Annotation @Id &#xfc;ber dem Klassen-Attribut des Schl&#xfc;ssels" POSITION="left" ID="ID_336071432" CREATED="1585052753998" MODIFIED="1587030128284" HGAP_QUANTITY="23.749999709427364 pt" VSHIFT_QUANTITY="29.999999105930357 pt">
<edge COLOR="#00007c"/>
</node>
<node TEXT="Annotation @Temporal" POSITION="left" ID="ID_1610427616" CREATED="1585052860573" MODIFIED="1586003768910" HGAP_QUANTITY="18.499999865889553 pt" VSHIFT_QUANTITY="29.249999128282095 pt">
<edge COLOR="#7c0000"/>
<node TEXT="Kennzeichnet zeitliche Angaben" ID="ID_490289642" CREATED="1585052868012" MODIFIED="1585052876805"/>
<node TEXT="z.B.&#xa;&#xfc;ber einem Klassen-Attribut:&#xa;@Temporal(TemporalType.DATE)" ID="ID_1330836578" CREATED="1585052953467" MODIFIED="1585053004226"/>
</node>
<node TEXT="Verbindung zur Datenbank (Netbeans)" POSITION="left" ID="ID_1471814408" CREATED="1585053126321" MODIFIED="1586003770270" HGAP_QUANTITY="10.250000111758705 pt" VSHIFT_QUANTITY="26.99999919533732 pt">
<edge COLOR="#007c7c"/>
<node TEXT="EntityManager" ID="ID_1330141250" CREATED="1585053146025" MODIFIED="1585053153171">
<node TEXT="stellt Vebindung von Anwendung zur Datenbank her" ID="ID_382559856" CREATED="1585053153729" MODIFIED="1585053181039"/>
<node TEXT="bietet Grundlegene Funktionen" ID="ID_1372350611" CREATED="1585053194288" MODIFIED="1585053213865">
<node TEXT="Speicherung von Objekten in die Datenbank" ID="ID_464329179" CREATED="1585053214688" MODIFIED="1585053235655"/>
<node TEXT="Aktualisierung" ID="ID_1704335323" CREATED="1585053236136" MODIFIED="1585053250753"/>
<node TEXT="L&#xf6;schen" ID="ID_4473483" CREATED="1585053252344" MODIFIED="1585053257598"/>
</node>
</node>
<node TEXT="Instanzen der EntityManager-Klasse werden von EntityManagerFactory erzeugt" ID="ID_1469999752" CREATED="1585053395396" MODIFIED="1585053459726">
<node TEXT="wird mit Persistence Unit initalisiert" ID="ID_1330058912" CREATED="1585053607664" MODIFIED="1585053633811">
<node TEXT="erstellte EntityManager k&#xf6;nnen dann verbindung zur DB aufbauen" ID="ID_437738764" CREATED="1585053636651" MODIFIED="1585053666443"/>
</node>
</node>
</node>
</node>
</map>
