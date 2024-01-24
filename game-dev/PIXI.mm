<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="PIXI" FOLDED="false" ID="ID_1970122199" CREATED="1580800768637" MODIFIED="1580803384260" STYLE="oval">
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
<hook NAME="AutomaticEdgeColor" COUNTER="5" RULE="ON_BRANCH_CREATION"/>
<node TEXT="Application" POSITION="right" ID="ID_1620984810" CREATED="1580801259205" MODIFIED="1580801268965">
<edge COLOR="#00ff00"/>
<node TEXT="erstellt automatisch ein canvas" ID="ID_529339249" CREATED="1580801270559" MODIFIED="1580801310925">
<node TEXT="const app = new PIXI.Application({&#xa;width: window.innerWidth,&#xa;height: window.innerHeight&#xa;});" ID="ID_806869430" CREATED="1580801313022" MODIFIED="1580801316788"/>
</node>
<node TEXT="canvas befindet sich unter app.view" ID="ID_834163545" CREATED="1580801326304" MODIFIED="1580801347687">
<node TEXT="dem document hinzuf&#xfc;gen" ID="ID_1277834981" CREATED="1580801351136" MODIFIED="1580801359367">
<node TEXT="document.body.appendChild(app.view);" ID="ID_155704867" CREATED="1580801360126" MODIFIED="1580801386173"/>
</node>
</node>
</node>
<node TEXT="Stage" POSITION="right" ID="ID_1612216055" CREATED="1580800795617" MODIFIED="1580800821410">
<edge COLOR="#ff0000"/>
<node TEXT="container-object" ID="ID_998805909" CREATED="1580800839955" MODIFIED="1580800845679">
<node TEXT="root-container" ID="ID_1263234771" CREATED="1580800876451" MODIFIED="1580800881098">
<node TEXT="beinhaltet alles was pixi darstellen soll" ID="ID_322026014" CREATED="1580800884242" MODIFIED="1580800900461"/>
</node>
</node>
</node>
<node TEXT="Sprite-class" POSITION="left" ID="ID_1525588131" CREATED="1580802138735" MODIFIED="1580803384259" HGAP_QUANTITY="59.74999863654379 pt" VSHIFT_QUANTITY="-59.999998211860714 pt">
<edge COLOR="#ff00ff"/>
<node TEXT="drei Wege sprites zu erstellen" ID="ID_1188122701" CREATED="1580802149089" MODIFIED="1580803392396">
<node TEXT="aus einzelnem Bild" ID="ID_267232255" CREATED="1580802163513" MODIFIED="1580803392395" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="-13.49999959766866 pt"/>
<node TEXT="von einem tileset (alle Bilder in einer Datei)" ID="ID_1897568294" CREATED="1580802184674" MODIFIED="1580802215046"/>
<node TEXT="texture atlas" ID="ID_1384266439" CREATED="1580802219772" MODIFIED="1580803390113" HGAP_QUANTITY="18.499999865889553 pt" VSHIFT_QUANTITY="12.7499996200204 pt">
<node TEXT="ein Json-file in dem die Positionen und gr&#xf6;&#xdf;en eines tilesets definiert sind" ID="ID_1600111644" CREATED="1580802228116" MODIFIED="1580803387991" VSHIFT_QUANTITY="15.749999530613437 pt"/>
</node>
</node>
</node>
<node TEXT="Texturen" POSITION="left" ID="ID_1401139354" CREATED="1580802414768" MODIFIED="1580803380889">
<edge COLOR="#00ffff"/>
<node TEXT="Images werden von der GPU gerendert (WebGL)" ID="ID_316738821" CREATED="1580802421746" MODIFIED="1580803380888" HGAP_QUANTITY="28.99999955296518 pt" VSHIFT_QUANTITY="-20.999999374151248 pt">
<node TEXT="damit die GPU ein Image rendern kann, muss es in eine andere Form namens Texture gebracht werden" ID="ID_731526658" CREATED="1580802494495" MODIFIED="1580802548689"/>
</node>
<node TEXT="texture-cache" ID="ID_331257217" CREATED="1580802606457" MODIFIED="1580803401492" HGAP_QUANTITY="31.249999485909953 pt" VSHIFT_QUANTITY="-50.9999984800816 pt">
<node TEXT="speicherung aller Texturen" ID="ID_808790833" CREATED="1580802612150" MODIFIED="1580803401492" HGAP_QUANTITY="15.499999955296518 pt" VSHIFT_QUANTITY="-2.9999999105930355 pt">
<node TEXT="PIXI.loader.resources" ID="ID_1803616455" CREATED="1580804212480" MODIFIED="1580804257960">
<node TEXT="Referenzen aller Texturen" ID="ID_4570798" CREATED="1580802620945" MODIFIED="1580803397812" HGAP_QUANTITY="16.999999910593036 pt" VSHIFT_QUANTITY="4.499999865889553 pt"/>
</node>
</node>
</node>
<node TEXT="loader-object" ID="ID_230145499" CREATED="1580802768924" MODIFIED="1580803370183">
<node TEXT="l&#xe4;d image-files" ID="ID_1037922003" CREATED="1580802797484" MODIFIED="1580803370182" HGAP_QUANTITY="105.49999727308759 pt" VSHIFT_QUANTITY="-34.499998971819906 pt"/>
<node TEXT="wandelt image-files in textures um" ID="ID_414283792" CREATED="1580802820558" MODIFIED="1580803363581" HGAP_QUANTITY="92.74999765306718 pt" VSHIFT_QUANTITY="-26.99999919533732 pt"/>
<node TEXT="Beispiel" ID="ID_315164412" CREATED="1580802888892" MODIFIED="1580803359593">
<node TEXT="//Create a Pixi Application&#xa;let app = new PIXI.Application({&#xa;    width: 256,&#xa;    height: 256,                      &#xa;    antialias: true,&#xa;    transparent: false,&#xa;    resolution: 1&#xa;  }&#xa;);&#xa;&#xa;//Add the canvas that Pixi automatically created for you to the HTML document&#xa;document.body.appendChild(app.view);&#xa;&#xa;//load an image and run the `setup` function when it&apos;s done&#xa;PIXI.loader&#xa;  .add(&quot;images/cat.png&quot;)&#xa;  .load(setup);&#xa;&#xa;//This `setup` function will run when the image has loaded&#xa;function setup() {&#xa;&#xa;  //Create the cat sprite&#xa;  let cat = new PIXI.Sprite(PIXI.loader.resources[&quot;images/cat.png&quot;].texture);&#xa; &#xa;  //Add the cat to the stage&#xa;  app.stage.addChild(cat);&#xa;}" ID="ID_239767606" CREATED="1580804073987" MODIFIED="1580804077567"/>
</node>
</node>
</node>
</node>
</map>
