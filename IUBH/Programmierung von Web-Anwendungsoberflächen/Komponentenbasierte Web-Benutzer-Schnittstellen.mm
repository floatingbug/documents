<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Komponentenbasierte Web-Benutzer-Schnittstellen" FOLDED="false" ID="ID_708784594" CREATED="1583134602049" MODIFIED="1586435279657" STYLE="oval">
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
<hook NAME="AutomaticEdgeColor" COUNTER="9" RULE="ON_BRANCH_CREATION"/>
<node TEXT="JSF-Laufzeitumgebung (Runtime Environment)" POSITION="right" ID="ID_440911646" CREATED="1583409443481" MODIFIED="1586000722490">
<edge COLOR="#7c0000"/>
<node TEXT="ben&#xf6;tigt wird ein servlet-container z.B. Tomcat (Java-Webserver)" ID="ID_1258744720" CREATED="1583409470873" MODIFIED="1586000722487" HGAP_QUANTITY="13.250000022351742 pt" VSHIFT_QUANTITY="-18.749999441206473 pt"/>
<node TEXT="jsf ist in der library javax.faces****.jar enthalten" ID="ID_814865068" CREATED="1583431242263" MODIFIED="1586000731276">
<node TEXT="muss runtergeladen werden" ID="ID_1750210932" CREATED="1583431550165" MODIFIED="1586000731275" HGAP_QUANTITY="13.250000022351742 pt" VSHIFT_QUANTITY="11.249999664723884 pt"/>
</node>
</node>
<node TEXT="xmlns=&quot;&quot;&#xa;(xml-namespace)" POSITION="right" ID="ID_519533583" CREATED="1583318296988" MODIFIED="1586000728086" HGAP_QUANTITY="16.249999932944775 pt" VSHIFT_QUANTITY="14.999999552965178 pt">
<edge COLOR="#00ff00"/>
<node TEXT="Verwis zu den JSF-Komponenten (Definitionen) in einer xml-Datei" ID="ID_967446328" CREATED="1583318326180" MODIFIED="1586000984384" HGAP_QUANTITY="16.249999932944775 pt" VSHIFT_QUANTITY="21.749999351799506 pt">
<node TEXT="JSF-Komponenten m&#xfc;ssen wieder in HTML-Komponenten umgewandelt werden" ID="ID_23405887" CREATED="1583318477826" MODIFIED="1586000865822" HGAP_QUANTITY="12.500000044703482 pt" VSHIFT_QUANTITY="5.999999821186071 pt">
<node TEXT="die programme zur umwandlung ben&#xf6;tigen die definition, damit sie wissen, wie die JSF-Komponenten zu interpretieren sind" ID="ID_1312618921" CREATED="1583318528083" MODIFIED="1586000865819" VSHIFT_QUANTITY="7.499999776482589 pt"/>
</node>
</node>
</node>
<node TEXT="JSF-Lebenszyklus" POSITION="right" ID="ID_1159751442" CREATED="1583136480863" MODIFIED="1586000738460" VSHIFT_QUANTITY="11.249999664723884 pt">
<edge COLOR="#ff0000"/>
<node TEXT="Schritte die zur Verarbeitung eines HTTP-Requests gemacht werden" ID="ID_1960525533" CREATED="1583136496844" MODIFIED="1586000738458" HGAP_QUANTITY="16.249999932944775 pt" VSHIFT_QUANTITY="8.249999754130847 pt">
<node TEXT="" ID="ID_1735477864" CREATED="1583139195032" MODIFIED="1586000772508" HGAP_QUANTITY="13.250000022351742 pt" VSHIFT_QUANTITY="238.4999928921463 pt">
<hook URI="jsf-lebenszyklus.png" SIZE="0.5586592" NAME="ExternalObject"/>
<node TEXT="aufbau Komponentenbaum" ID="ID_175535705" CREATED="1583139357638" MODIFIED="1583139367416">
<node TEXT="f&#xfc;r jede HTML-Komponente (h1, input, p...) wird ein Java-Objekt erstellt" ID="ID_807203182" CREATED="1583139468304" MODIFIED="1586000747636">
<node TEXT="alle Objekte ergeben ein Modell als Baumstruktur" ID="ID_1886890518" CREATED="1583139624978" MODIFIED="1586000747635" HGAP_QUANTITY="13.250000022351742 pt" VSHIFT_QUANTITY="16.499999508261695 pt">
<node TEXT="durch session-id (cookie) wird die view (jsf-file) wieder hergestellt bzw der Komponentenbaum" ID="ID_23494126" CREATED="1583651460744" MODIFIED="1583651537666"/>
</node>
</node>
</node>
<node TEXT="Benutzereingaben aus HTTP-Anfrage auslesen" ID="ID_1914674277" CREATED="1583139367947" MODIFIED="1586000749601" VSHIFT_QUANTITY="12.7499996200204 pt">
<node TEXT="anschlie&#xdf;end werden Parameter wie Eingaben in einem form in ein Objekt gespeichert" ID="ID_580501054" CREATED="1583139692953" MODIFIED="1583139757351"/>
</node>
<node TEXT="Validierung der Benutzerdaten" ID="ID_1383414566" CREATED="1583139400495" MODIFIED="1586000755665" HGAP_QUANTITY="16.249999932944775 pt" VSHIFT_QUANTITY="14.999999552965178 pt">
<node TEXT="dann werden Benutzereingaben validiert" ID="ID_1035313985" CREATED="1583139788156" MODIFIED="1586000755664" HGAP_QUANTITY="13.250000022351742 pt" VSHIFT_QUANTITY="14.999999552965178 pt"/>
</node>
<node TEXT="Datenmodell aktualisieren" ID="ID_1063791968" CREATED="1583139425940" MODIFIED="1586000762997" VSHIFT_QUANTITY="5.249999843537812 pt">
<node TEXT="aktuallisierung des Datenmodells: Kunde, Artikel, Rechnung..." ID="ID_1124639098" CREATED="1583140191148" MODIFIED="1586000762994" VSHIFT_QUANTITY="11.999999642372142 pt"/>
</node>
<node TEXT="Zus&#xe4;tzliche Methoden aufrufen" ID="ID_1942300224" CREATED="1583139444024" MODIFIED="1586000768718" VSHIFT_QUANTITY="6.74999979883433 pt">
<node TEXT="bei Bedarf" ID="ID_884442851" CREATED="1583140266654" MODIFIED="1586000765804" HGAP_QUANTITY="11.750000067055224 pt" VSHIFT_QUANTITY="12.7499996200204 pt"/>
</node>
<node TEXT="HTML-Seite generieren" ID="ID_1731854371" CREATED="1583139455035" MODIFIED="1586000775156" HGAP_QUANTITY="17.749999888241295 pt" VSHIFT_QUANTITY="15.749999530613437 pt">
<node TEXT="Komponentenbaum wir in HTML-Seite umgewandelt" ID="ID_431596047" CREATED="1583140274177" MODIFIED="1583140300777"/>
<node TEXT="HTML-Seite wird dem servlet-container &#xfc;bergeben (Tomcat) der die Antwort an den client liefert" ID="ID_1680160673" CREATED="1583140318996" MODIFIED="1586000775153" HGAP_QUANTITY="16.249999932944775 pt" VSHIFT_QUANTITY="8.249999754130847 pt"/>
</node>
</node>
</node>
</node>
<node TEXT="JSF-Elemente beginnen mit dem pr&#xe4;fix h:" POSITION="left" ID="ID_1890287098" CREATED="1583136510982" MODIFIED="1586435273578" HGAP_QUANTITY="184.999994903803 pt" VSHIFT_QUANTITY="131.24999608844533 pt">
<edge COLOR="#0000ff"/>
</node>
<node TEXT="css-files Einbinden" POSITION="left" ID="ID_807211664" CREATED="1586435237783" MODIFIED="1586435293014" HGAP_QUANTITY="190.9999947249891 pt" VSHIFT_QUANTITY="118.4999964684249 pt">
<edge COLOR="#7c007c"/>
<node TEXT="&lt;h:outputStylesheet library=&quot;css&quot; name=&quot;style.css&quot;  /&gt;" ID="ID_503962057" CREATED="1586435296259" MODIFIED="1586435297885">
<node TEXT="die Datei wird under projectname/WebContent/resources/css/style.css abgelegt damit sie eingebunden werden kann" ID="ID_1150390434" CREATED="1586435299722" MODIFIED="1586435400976"/>
</node>
</node>
<node TEXT="JSF-Komponenten" POSITION="left" ID="ID_1359120606" CREATED="1583318702229" MODIFIED="1586435278358" HGAP_QUANTITY="37.999999284744284 pt" VSHIFT_QUANTITY="90.74999729543933 pt">
<edge COLOR="#ff00ff"/>
<node TEXT="Java-Klassen die auf managed-beans zugreifen k&#xf6;nnen" ID="ID_697414300" CREATED="1583650745767" MODIFIED="1586001695549"/>
<node TEXT="&lt;h:outputText value=&quot;Hello world&quot;&gt;&lt;/h:outputText&gt;" ID="ID_1512952989" CREATED="1583318710195" MODIFIED="1586000675807" HGAP_QUANTITY="18.499999865889553 pt" VSHIFT_QUANTITY="9.749999709427366 pt"/>
<node TEXT="Tabellen" ID="ID_374665749" CREATED="1583737690811" MODIFIED="1586000685458" HGAP_QUANTITY="16.249999932944775 pt" VSHIFT_QUANTITY="13.49999959766866 pt">
<node TEXT="&lt;h:dataTable var=&#x201c;artikel&#x201c; value=&#x201c;#{shop.sortiment}&#x201c;&gt;&#xa;&lt;h:column&gt;&#xa;&lt;f:facet name=&#x201c;header&#x201c;&gt;Nr&lt;/f:facet&gt;&#xa;&lt;h:outputText value=&#x201c;#{artikel.nr}&#x201c;/&gt;&#xa;&lt;/h:column&gt;&#xa;&#x2026;&#xa;&lt;/h:dataTable&gt;" ID="ID_449067144" CREATED="1583737740170" MODIFIED="1583737742508">
<node TEXT="dataTable hat Atribute um in CSS-Dateien auf die Tabelle zu zugreifen" ID="ID_1331322632" CREATED="1583738142060" MODIFIED="1583738286925">
<node TEXT="styleClass" ID="ID_1150112331" CREATED="1583738291321" MODIFIED="1583738301372">
<node TEXT="gilt f&#xfc;r gesammte Tabelle" ID="ID_316766509" CREATED="1583738327391" MODIFIED="1583738335038"/>
</node>
<node TEXT="rowClasses" ID="ID_162244035" CREATED="1583738301984" MODIFIED="1583738310836">
<node TEXT="gelten nur f&#xfc;r die Zeilen" ID="ID_1515956930" CREATED="1583738337275" MODIFIED="1583738355647"/>
</node>
</node>
<node TEXT="var (Referenz des aktuellen Elements)" ID="ID_582882231" CREATED="1583737761153" MODIFIED="1583737845177"/>
<node TEXT="value (Collections im Bean)" ID="ID_1059118242" CREATED="1583737845476" MODIFIED="1583737876552"/>
<node TEXT="h:column (Spalte )" ID="ID_1562475295" CREATED="1583737895426" MODIFIED="1583737926316"/>
<node TEXT="f:facet (&#xfc;berschrift mit name=&quot;header&quot; oder footer mit name=&quot;footer&quot;" ID="ID_1696451840" CREATED="1583737927727" MODIFIED="1583737981611">
<node TEXT="namensraum xmlns:f" ID="ID_605828532" CREATED="1583738019594" MODIFIED="1583738024894"/>
</node>
</node>
<node TEXT="Bilder einbinden" ID="ID_701919722" CREATED="1583742308227" MODIFIED="1586000685457" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="19.49999941885473 pt">
<node TEXT="&lt;h:graphicImage library=&quot;img&quot; name=&quot;img.jpg&quot;&gt;&lt;/h:graphicImage&gt;" ID="ID_1334221996" CREATED="1583742323709" MODIFIED="1583742325645"/>
</node>
</node>
</node>
<node TEXT="UEL &quot;Unified Expression Language" POSITION="left" ID="ID_1104869003" CREATED="1583318837491" MODIFIED="1586000688851" HGAP_QUANTITY="16.999999910593036 pt" VSHIFT_QUANTITY="22.499999329447768 pt">
<edge COLOR="#00ffff"/>
<node TEXT="Formulierung von Ausdr&#xfc;cken die JSF-Komponenten mit Java-Objekten verkn&#xfc;pft" ID="ID_1888212705" CREATED="1583318858418" MODIFIED="1586000693205">
<node TEXT="Verkn&#xfc;pfung der view- und model-Komponenten" ID="ID_357229724" CREATED="1583318952470" MODIFIED="1586000693204" VSHIFT_QUANTITY="-11.249999664723884 pt"/>
<node TEXT="Managed Beans" ID="ID_1534364565" CREATED="1583319116301" MODIFIED="1586000691000">
<node TEXT="Java-Klassen die zur Laufzeit von JSF erzeugt und wieder zerst&#xf6;rt werden" ID="ID_972731861" CREATED="1583319129959" MODIFIED="1586000702406" VSHIFT_QUANTITY="20.999999374151248 pt">
<node TEXT="sie k&#xf6;nnen mit JSF-Komponenten verkn&#xfc;pft werden" ID="ID_1590630094" CREATED="1583319183948" MODIFIED="1586000702405" HGAP_QUANTITY="13.250000022351742 pt" VSHIFT_QUANTITY="22.499999329447768 pt"/>
</node>
</node>
</node>
</node>
<node TEXT="managed-beans" POSITION="right" ID="ID_1651906821" CREATED="1583650514920" MODIFIED="1583650522401">
<edge COLOR="#00007c"/>
<node TEXT="Model (Datenhaltung)" ID="ID_1024847835" CREATED="1583650524012" MODIFIED="1583650551434"/>
<node TEXT="Controller (Logik)" ID="ID_587764516" CREATED="1583650551898" MODIFIED="1583650587880"/>
</node>
</node>
</map>
