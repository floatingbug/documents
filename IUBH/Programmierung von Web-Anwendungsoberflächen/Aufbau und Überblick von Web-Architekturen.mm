<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Aufbau und &#xdc;berblick von Web-Architekturen" FOLDED="false" ID="ID_1374453525" CREATED="1582647562655" MODIFIED="1582720748444" STYLE="oval">
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
<hook NAME="AutomaticEdgeColor" COUNTER="11" RULE="ON_BRANCH_CREATION"/>
<node TEXT="Software Strukturen" POSITION="right" ID="ID_1151872154" CREATED="1582721355427" MODIFIED="1582970135352">
<edge COLOR="#007c00"/>
<node TEXT="Software mit einfacher Struktur" ID="ID_1123469306" CREATED="1582720972330" MODIFIED="1583135549053" HGAP_QUANTITY="22.249999754130847 pt" VSHIFT_QUANTITY="-27.74999917298558 pt">
<font SIZE="16"/>
<node TEXT="Komponenten sind nicht nach unterschiedlichen Aufgaben unterteilt" ID="ID_1062754510" CREATED="1582721002738" MODIFIED="1582721070804"/>
<node TEXT="bei &#xc4;nderungen muss gesamte Software ge&#xe4;ndert werden, statt einzelne Komponenten" ID="ID_306607922" CREATED="1582721168926" MODIFIED="1582721205768"/>
<node TEXT="Wie eine einzelne Klasse die bei jeder &#xc4;nderung neu Kompiliert werden muss" ID="ID_1726544923" CREATED="1582721232892" MODIFIED="1582721259591"/>
<node TEXT="hohe Wartungskosten f&#xfc;r komplexe Projekte" ID="ID_1795717949" CREATED="1582721309394" MODIFIED="1582721327471"/>
</node>
<node TEXT="3-Schichten-Architektur" ID="ID_1699346727" CREATED="1582721391046" MODIFIED="1585999354236" HGAP_QUANTITY="17.749999888241295 pt" VSHIFT_QUANTITY="2.2499999329447764 pt">
<node TEXT="Darstellungsschicht" ID="ID_1856745108" CREATED="1582721406471" MODIFIED="1582721499387">
<node TEXT="visuelle Repr&#xe4;sentation von Daten" ID="ID_983286329" CREATED="1582721544460" MODIFIED="1582721603107"/>
<node TEXT="Entgegennahme von Benutzereingaben" ID="ID_846385910" CREATED="1582721557683" MODIFIED="1582721593688"/>
<node TEXT="Schnittstelle zum Anwender der Software" ID="ID_1423042731" CREATED="1582721639152" MODIFIED="1583315763548"/>
</node>
<node TEXT="Logikschicht" ID="ID_1096387523" CREATED="1582721499639" MODIFIED="1585999348556" HGAP_QUANTITY="25.999999642372142 pt" VSHIFT_QUANTITY="17.249999485909953 pt">
<node TEXT="Durchf&#xfc;hrung der Gesch&#xe4;ftsprozesse" ID="ID_1261886368" CREATED="1582721678504" MODIFIED="1582721688985"/>
<node TEXT="z.B. bestellung eines Artikels" ID="ID_1289782139" CREATED="1582721689216" MODIFIED="1582721716706"/>
</node>
<node TEXT="Datenhaltungsschicht" ID="ID_99744159" CREATED="1582721504159" MODIFIED="1585999374530" HGAP_QUANTITY="16.999999910593036 pt" VSHIFT_QUANTITY="10.499999687075624 pt">
<node TEXT="Datens&#xe4;tze" ID="ID_854869133" CREATED="1582721737007" MODIFIED="1585999374527" HGAP_QUANTITY="15.499999955296518 pt" VSHIFT_QUANTITY="8.249999754130847 pt">
<node TEXT="" ID="ID_630117032" CREATED="1582721810805" MODIFIED="1582721810806">
<hook NAME="FirstGroupNode"/>
</node>
<node TEXT="Erzeugen" ID="ID_1141319719" CREATED="1582721741957" MODIFIED="1582721752008"/>
<node TEXT="Laden" ID="ID_1511251989" CREATED="1582721752360" MODIFIED="1582721755103"/>
<node TEXT="Aktuallisierung" ID="ID_1773747979" CREATED="1582721755275" MODIFIED="1582721762479"/>
<node TEXT="L&#xf6;schen" ID="ID_753006079" CREATED="1582721762912" MODIFIED="1582721765947"/>
<node TEXT="" ID="ID_147076052" CREATED="1582721810802" MODIFIED="1585999385256">
<hook NAME="SummaryNode"/>
<hook NAME="AlwaysUnfoldedNode"/>
<node TEXT="werden in der Logikschicht verarbeitet und vom Benutzer auf der Darstellungsschicht verw&#xe4;ndet" ID="ID_375254500" CREATED="1582721810807" MODIFIED="1585999385249" HGAP_QUANTITY="23.749999709427364 pt"/>
</node>
</node>
</node>
<node TEXT="zwischen den Komponenten der einzelnen Schichten d&#xfc;rfen nur Informationen ausgetauscht werden. Zugriff ist nicht erlaubt" ID="ID_1772501193" CREATED="1582722057524" MODIFIED="1585999354233" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="18.749999441206473 pt">
<node TEXT="Vorteile" ID="ID_1531540805" CREATED="1582722164733" MODIFIED="1582722169676">
<node TEXT="Austauschbarkeit der Schichten" ID="ID_153869910" CREATED="1582722170535" MODIFIED="1582722189639">
<node TEXT="z.B. unterschiedliche Darsellungen f&#xfc;r den Benutzer" ID="ID_464906428" CREATED="1582722209342" MODIFIED="1582722231097"/>
</node>
</node>
</node>
</node>
<node TEXT="Client/Server-Architektur" ID="ID_797574623" CREATED="1582722290060" MODIFIED="1582970125970" HGAP_QUANTITY="15.499999955296518 pt" VSHIFT_QUANTITY="23.249999307096026 pt">
<node TEXT="Server" ID="ID_939547081" CREATED="1582722313133" MODIFIED="1582722367233">
<node TEXT="Bietet Komponenten/Dienste f&#xfc;r den Client/Benutzer an" ID="ID_1078099619" CREATED="1582722368375" MODIFIED="1582722392988">
<node TEXT="Nachteil" ID="ID_1437058262" CREATED="1582722617906" MODIFIED="1582722622523">
<node TEXT="Ausfall des servers" ID="ID_661956230" CREATED="1582722622531" MODIFIED="1582722628255">
<node TEXT="Verhindern durch Verteilung der Server-Komponenten durch Virtualisierung oder Clout-Computing" ID="ID_1466141736" CREATED="1582722628854" MODIFIED="1582722717951"/>
</node>
</node>
</node>
</node>
<node TEXT="Client" ID="ID_437666847" CREATED="1582722414750" MODIFIED="1582722418403">
<node TEXT="Komponenten die Dienste des Servers in Anspruch nehmen" ID="ID_1414625520" CREATED="1582722418972" MODIFIED="1582722444221"/>
</node>
<node TEXT="Fat- und Thin-Client" ID="ID_1113638871" CREATED="1582722795760" MODIFIED="1582722817018">
<node TEXT="Fat Client" ID="ID_1914062776" CREATED="1582722819603" MODIFIED="1582722829010">
<node TEXT="Logikschicht befindet sich auf dem Client" ID="ID_1876801170" CREATED="1582722830545" MODIFIED="1582722850150"/>
</node>
<node TEXT="Thin Client" ID="ID_1352744603" CREATED="1582722852970" MODIFIED="1582722857131">
<node TEXT="nur die Darstellungsschicht befindet sich auf dem Client" ID="ID_59553529" CREATED="1582722860262" MODIFIED="1582722877407"/>
</node>
</node>
</node>
<node TEXT="Model-View-Controller-Architektur" ID="ID_670502101" CREATED="1582724253009" MODIFIED="1585999500961" HGAP_QUANTITY="18.499999865889553 pt" VSHIFT_QUANTITY="31.499999061226873 pt">
<node TEXT="Variante der 3-Schichten-Architektur" ID="ID_1074051134" CREATED="1582724329788" MODIFIED="1585999500959" HGAP_QUANTITY="13.250000022351742 pt" VSHIFT_QUANTITY="-14.249999575316918 pt"/>
<node TEXT="sehr n&#xfc;tzlich zur strukturierung von Web-Anwendungen" ID="ID_594352581" CREATED="1582724274081" MODIFIED="1585999499356" HGAP_QUANTITY="18.499999865889553 pt" VSHIFT_QUANTITY="-11.249999664723884 pt"/>
<node TEXT="Funktionsweise" ID="ID_998722273" CREATED="1582724437566" MODIFIED="1585999526102">
<node TEXT="View" ID="ID_1864925433" CREATED="1582724444240" MODIFIED="1585999496088" HGAP_QUANTITY="11.000000089406964 pt" VSHIFT_QUANTITY="45.74999863654379 pt">
<node TEXT="Pr&#xe4;sentation der Daten" ID="ID_1570422120" CREATED="1582724461549" MODIFIED="1586418320562"/>
<node TEXT="kann direkt vom Model Daten abrufen" ID="ID_1595238702" CREATED="1582724508782" MODIFIED="1586418343027"/>
<node TEXT="HTTP-Request landet hier" ID="ID_1605146728" CREATED="1582726579634" MODIFIED="1582726589066"/>
</node>
<node TEXT="Model" ID="ID_672943512" CREATED="1582724447182" MODIFIED="1585999526100" HGAP_QUANTITY="16.999999910593033 pt" VSHIFT_QUANTITY="8.999999731779106 pt">
<node TEXT="wie Datenhaltungsschicht und Logikschicht" ID="ID_1382697925" CREATED="1582724832489" MODIFIED="1582724922665"/>
<node TEXT="Bereitstellung der Daten und fachliche Funktionen" ID="ID_1069830645" CREATED="1582724795053" MODIFIED="1582724810803"/>
<node TEXT="Abfrage der daten durch Informationsabfrage der View Komponenten an die Model Komponenten" ID="ID_485467690" CREATED="1582724610230" MODIFIED="1582724720704"/>
<node TEXT="Daten k&#xf6;nnen direkt an View-Komponenten weitergeleitet werden" ID="ID_1237132284" CREATED="1582724869810" MODIFIED="1582724890436"/>
<node TEXT="unabh&#xe4;ngig von controller und view" ID="ID_1536687770" CREATED="1583479704739" MODIFIED="1583479719413"/>
</node>
<node TEXT="Controller" ID="ID_1947402533" CREATED="1582724454616" MODIFIED="1585999486226" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="23.249999307096026 pt">
<node TEXT="verarbeitet Benutzereingaben" ID="ID_1032541199" CREATED="1582725084855" MODIFIED="1582725093656">
<node TEXT="auch Validierung der Benutzereingaben" ID="ID_1349494939" CREATED="1586418099797" MODIFIED="1586418138266"/>
</node>
<node TEXT="Navigation zu anderen Seiten" ID="ID_1789070498" CREATED="1582725138989" MODIFIED="1582725171598"/>
<node TEXT="Manipulation der Daten im Modell nur &#xfc;ber den Controller" ID="ID_566944262" CREATED="1586418162714" MODIFIED="1586418192996">
<node TEXT="Benutzereingaben im Modell eintragen" ID="ID_1724030435" CREATED="1582725216473" MODIFIED="1582725224758">
<node TEXT="durch Aufruf von Funktionen im Modell" ID="ID_1503165303" CREATED="1586418194079" MODIFIED="1586418217481"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node TEXT="Web-Services" POSITION="right" ID="ID_1365384855" CREATED="1582724023005" MODIFIED="1582724033030">
<edge COLOR="#7c007c"/>
<node TEXT="Server Kommunizieren untereinander" ID="ID_1415431048" CREATED="1582724035716" MODIFIED="1582724058609"/>
<node TEXT="Web-Services bieten Dienste f&#xfc;r Server an" ID="ID_260176705" CREATED="1582724059056" MODIFIED="1582724107643"/>
<node TEXT="Kommunikation mittels Web-Service-Protokolle" ID="ID_1409145292" CREATED="1582724128749" MODIFIED="1582724151520"/>
<node TEXT="Darstellungsschicht wird nicht ben&#xf6;tigt" ID="ID_1143760812" CREATED="1582724174683" MODIFIED="1582724189654"/>
</node>
<node TEXT="typische Java Enterprise (Java EE)-Architekturen" POSITION="left" ID="ID_826822114" CREATED="1582725405833" MODIFIED="1582725458543">
<edge COLOR="#007c7c"/>
<node TEXT="" ID="ID_1951546172" CREATED="1582726247944" MODIFIED="1582726260153">
<hook URI="Bildschirmfoto%20von%202020-02-26%2015-06-51.png" SIZE="0.54545456" NAME="ExternalObject"/>
</node>
<node TEXT="Application Server" ID="ID_1817684657" CREATED="1582726262320" MODIFIED="1582726272860">
<node TEXT="besteht aus 3 Komponenten" ID="ID_578137393" CREATED="1582726276841" MODIFIED="1586419086167">
<node TEXT="view" ID="ID_737450114" CREATED="1586419088077" MODIFIED="1586419090384">
<node TEXT="jsf" ID="ID_1465453190" CREATED="1586419663692" MODIFIED="1586419670358"/>
</node>
<node TEXT="modell" ID="ID_451034445" CREATED="1586419090619" MODIFIED="1586419098312">
<node TEXT="beans" ID="ID_1043402518" CREATED="1586419673617" MODIFIED="1586419674994"/>
</node>
<node TEXT="controller" ID="ID_1033635767" CREATED="1586419098501" MODIFIED="1586419100595">
<node TEXT="servlets" ID="ID_1100582171" CREATED="1586419676275" MODIFIED="1586419680005"/>
</node>
</node>
</node>
<node TEXT="Java Server Faces" ID="ID_731132260" CREATED="1582726667558" MODIFIED="1582726685197">
<node TEXT="Framework" ID="ID_1640169454" CREATED="1582726690905" MODIFIED="1583135913856"/>
</node>
</node>
<node TEXT="&#xdc;berblick von Web-Architekturen" POSITION="left" ID="ID_393773542" CREATED="1582726926525" MODIFIED="1582726985924">
<edge COLOR="#7c7c00"/>
<node TEXT="" ID="ID_212791067" CREATED="1582726940435" MODIFIED="1582726985923" HGAP_QUANTITY="49.99999892711642 pt" VSHIFT_QUANTITY="181.49999459087866 pt">
<hook URI="Bildschirmfoto%20von%202020-02-26%2015-20-31.png" SIZE="0.5489479" NAME="ExternalObject"/>
<node TEXT="Model auch (Beans): Artikel, Kunden usw." ID="ID_1417019734" CREATED="1582727072825" MODIFIED="1582728549115">
<node TEXT="Model = Datenhaltung" ID="ID_1803494040" CREATED="1583394139809" MODIFIED="1583394147934"/>
<node TEXT="und Logik" ID="ID_235679203" CREATED="1583394149671" MODIFIED="1583394178020"/>
</node>
<node TEXT="Controller auch (Servlet): tr&#xe4;gt mittels &quot;Servlet&quot; Daten im Model ein" ID="ID_1995815451" CREATED="1582727362008" MODIFIED="1582970963262"/>
<node TEXT="View: JSF das HTML erzeugt" ID="ID_263605192" CREATED="1582728581661" MODIFIED="1583482766396"/>
</node>
</node>
</node>
</map>
