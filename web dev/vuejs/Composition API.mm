<map version="freeplane 1.7.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Composition API" FOLDED="false" ID="ID_1492255190" CREATED="1669971970779" MODIFIED="1669990845464" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle">
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
<node TEXT="Setup-Methode" POSITION="right" ID="ID_1891470757" CREATED="1669971988620" MODIFIED="1669971999155">
<edge COLOR="#ff0000"/>
<node TEXT="Beinhaltet Funktionen der Komponente" ID="ID_1290042099" CREATED="1669972002007" MODIFIED="1669972075552"/>
<node TEXT="Zugangspunkt (API) zur Komponente" ID="ID_102763634" CREATED="1669972098901" MODIFIED="1669972113883"/>
<node TEXT="Wird aufgerufen" ID="ID_1844229728" CREATED="1669972128056" MODIFIED="1669972228967">
<node TEXT="Bevor die Komponente erstellt wurde" ID="ID_602094497" CREATED="1669972228972" MODIFIED="1669972249096"/>
<node TEXT="Nachdem properties erstellt wurden" ID="ID_419547675" CREATED="1669972249361" MODIFIED="1669972291826"/>
</node>
<node TEXT="Parameter sind" ID="ID_1232543447" CREATED="1669972325147" MODIFIED="1669972346252">
<node TEXT="Properties" ID="ID_303585341" CREATED="1669972348554" MODIFIED="1669972355677">
<node TEXT="Enthalten Werte von Daten" ID="ID_1473769685" CREATED="1669972422576" MODIFIED="1669972593782"/>
</node>
<node TEXT="Context" ID="ID_1167301286" CREATED="1669972596607" MODIFIED="1669972606720">
<node TEXT="Erm&#xf6;glicht Zugriff auf" ID="ID_610763664" CREATED="1669972606725" MODIFIED="1669972657987">
<node TEXT="Komponenten-" ID="ID_68962438" CREATED="1669972657991" MODIFIED="1669972684558">
<node TEXT="Attribute" ID="ID_596435424" CREATED="1669972684562" MODIFIED="1669972693823"/>
<node TEXT="Slots" ID="ID_161520713" CREATED="1669972694309" MODIFIED="1669972700358"/>
<node TEXT="Emits" ID="ID_197780027" CREATED="1669972701125" MODIFIED="1669972707911"/>
</node>
</node>
</node>
</node>
<node TEXT="Enth&#xe4;lt" ID="ID_283411823" CREATED="1669972373501" MODIFIED="1669972382764">
<node TEXT="Logik der Komponente" ID="ID_1415038896" CREATED="1669972382769" MODIFIED="1669972400111"/>
</node>
<node TEXT="Gibt Objekt zur&#xfc;ck" ID="ID_281227191" CREATED="1669972751316" MODIFIED="1669972779316">
<node TEXT="Objekt erm&#xf6;glicht" ID="ID_1289213396" CREATED="1669972779320" MODIFIED="1669972823304">
<node TEXT="Zugriff innerhalb des Templates" ID="ID_1403012419" CREATED="1669972831326" MODIFIED="1669972976809"/>
</node>
<node TEXT="Beinhaltet-" ID="ID_1869691480" CREATED="1669974738899" MODIFIED="1669974748180">
<node TEXT="Funktionen" ID="ID_1759099943" CREATED="1669974748184" MODIFIED="1669974758644"/>
<node TEXT="Reaktive Variablen" ID="ID_1740795286" CREATED="1669974759822" MODIFIED="1669974780311">
<node TEXT="Erstellt mit ref()" ID="ID_1421512817" CREATED="1669974780314" MODIFIED="1669974785880"/>
</node>
</node>
</node>
</node>
<node TEXT="Reaktive Variable" POSITION="right" ID="ID_974626579" CREATED="1669974043510" MODIFIED="1669974056571">
<edge COLOR="#00ff00"/>
<node TEXT="Erstellung" ID="ID_459929499" CREATED="1669974202106" MODIFIED="1669974214535">
<node TEXT="durch Aufruf von ref()" ID="ID_558109107" CREATED="1669974214540" MODIFIED="1669974277307"/>
</node>
<node TEXT="ref()" ID="ID_1847410966" CREATED="1669974278997" MODIFIED="1669974501838">
<node TEXT="Parameter" ID="ID_1209399311" CREATED="1669974415646" MODIFIED="1669974552173">
<node TEXT="Value" ID="ID_1045835606" CREATED="1669974553347" MODIFIED="1669974564933"/>
<node TEXT="Speichert  Value in-" ID="ID_834844652" CREATED="1669974600770" MODIFIED="1669974643478">
<node TEXT="Objekt" ID="ID_1710817930" CREATED="1669974643481" MODIFIED="1669974650017">
<node TEXT="Wird zur&#xfc;ckgegeben" ID="ID_316136806" CREATED="1669974650021" MODIFIED="1669974671543"/>
<node TEXT="Kann im Template ausgegeben werden" ID="ID_1841445302" CREATED="1669975006665" MODIFIED="1669975019637">
<node TEXT="{{Objekt}}" ID="ID_1990568009" CREATED="1669975019641" MODIFIED="1669975034799"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node TEXT="Lifecycle Hooks(Lebenscyclus Harken)" POSITION="right" ID="ID_1070563741" CREATED="1669973078240" MODIFIED="1669973159773">
<edge COLOR="#0000ff"/>
<node TEXT="Funktionen" ID="ID_479435384" CREATED="1669973242153" MODIFIED="1669973276669">
<node TEXT="Wird ausgef&#xfc;hrt wenn-" ID="ID_1402237200" CREATED="1669973308188" MODIFIED="1669973712543">
<node TEXT="event auftrat" ID="ID_1863075913" CREATED="1669973712546" MODIFIED="1669973763794">
<node TEXT="bspw. onMount-event" ID="ID_1432971672" CREATED="1669973763797" MODIFIED="1669973772538"/>
</node>
</node>
</node>
<node TEXT="CB als Parameter" ID="ID_907572671" CREATED="1669973276673" MODIFIED="1669973433814">
<node TEXT="Beinhaltet was geschehen soll-" ID="ID_150740943" CREATED="1669973908146" MODIFIED="1669973967836">
<node TEXT="Bei Aufruff" ID="ID_236994235" CREATED="1669973943973" MODIFIED="1669973959724"/>
</node>
</node>
<node TEXT="Beispiel:" ID="ID_369926625" CREATED="1669973172926" MODIFIED="1669973191895">
<node TEXT="onMount(cb)" ID="ID_411124476" CREATED="1669973330591" MODIFIED="1669973793143"/>
</node>
</node>
<node TEXT="Watch-Function" POSITION="right" ID="ID_326954254" CREATED="1669975088443" MODIFIED="1669975120363">
<edge COLOR="#ff00ff"/>
<node TEXT="Parameter" ID="ID_946292725" CREATED="1669975120367" MODIFIED="1669975126343">
<node TEXT="Variable die beobachtet werden soll" ID="ID_870596828" CREATED="1669975126346" MODIFIED="1669975569446">
<node TEXT="Bei &#xc4;nderungen" ID="ID_90116889" CREATED="1669975162282" MODIFIED="1669975171220"/>
</node>
<node TEXT="CB" ID="ID_1601091538" CREATED="1669975172969" MODIFIED="1669975193874">
<node TEXT="Zwei Parameter" ID="ID_1606951410" CREATED="1669975195317" MODIFIED="1669975201633">
<node TEXT="Aktueller Wert" ID="ID_41272685" CREATED="1669975201635" MODIFIED="1669975253422">
<node TEXT="Beispiel:" ID="ID_1759400774" CREATED="1669975381452" MODIFIED="1669975388361">
<node TEXT="Bei bestimmten Wert Aktion ausf&#xfc;hren" ID="ID_698738426" CREATED="1669975388365" MODIFIED="1669975415254"/>
</node>
</node>
<node TEXT="Wert vor dem Aktuellen Wert" ID="ID_1590860035" CREATED="1669975260319" MODIFIED="1669975341684"/>
</node>
</node>
</node>
</node>
<node TEXT="Beispiel ohne build" POSITION="left" ID="ID_1894335449" CREATED="1669990742264" MODIFIED="1670320908153" HGAP_QUANTITY="51.499998882412946 pt" VSHIFT_QUANTITY="-260.2499922439458 pt">
<edge COLOR="#7c7c00"/>
<node TEXT="" ID="ID_1523946124" CREATED="1669989495192" MODIFIED="1669989551674" HGAP_QUANTITY="88.24999778717763 pt" VSHIFT_QUANTITY="-5.999999821186066 pt">
<hook URI="Auswahl_020.png" SIZE="0.72289157" NAME="ExternalObject"/>
</node>
<node TEXT="" ID="ID_1810397950" CREATED="1669989518323" MODIFIED="1669989538004" HGAP_QUANTITY="88.99999776482589 pt" VSHIFT_QUANTITY="17.249999485909953 pt">
<hook URI="Auswahl_019.png" SIZE="1.0" NAME="ExternalObject"/>
<node TEXT="createApp" ID="ID_1509317847" CREATED="1669989643144" MODIFIED="1669989651199">
<node TEXT="Parameter" ID="ID_1024784354" CREATED="1669989655248" MODIFIED="1669989667243">
<node TEXT="Komponenten" ID="ID_1445670657" CREATED="1669989670920" MODIFIED="1669989680127"/>
</node>
</node>
</node>
<node TEXT="" ID="ID_1330975894" CREATED="1669989558166" MODIFIED="1669989571665" HGAP_QUANTITY="92.74999765306718 pt" VSHIFT_QUANTITY="17.99999946355821 pt">
<hook URI="web-service.png" SIZE="1.0" NAME="ExternalObject"/>
</node>
</node>
<node TEXT="Beispiel mit build" POSITION="left" ID="ID_721677103" CREATED="1669990848430" MODIFIED="1670320901511">
<edge COLOR="#007c7c"/>
</node>
</node>
</map>
