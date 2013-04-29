<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<!--
	CivCraft Nether Roads Map
	Managed at https://github.com/hpoom/Nether-Roads-Map
	Hosted at http://www.hpoom.co.uk/CivCraft/map.php
	
	Town List
	-->
  <xsl:variable name="scale" select=".1" />
  <xsl:variable name="mapsize" select="10000" />
	<svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink">
		<xsl:attribute name="width">
		      <xsl:value-of select="2 * $mapsize * $scale" />
		</xsl:attribute>
		<xsl:attribute name="height">
		      <xsl:value-of select="2 * $mapsize * $scale" />
		</xsl:attribute>
		<style type="text/css">
		<![CDATA[

			text.title {
				fill: black;
				font-weight: bold;
				font-size: 24px;
				font-family: sans-serif;
				text-anchor: middle;
			}
			
			text.link {
				text-decoration: underline;
				fill: navy;
				font-weight: bold;
				font-size: 14px;
				font-family: serif;
				text-anchor: middle;
			}

			circle.Town {
				stroke: black;
				stroke-width: 1.5;
				fill: lightcyan;
			}
			
			circle.Town_abandoned {
				stroke: #8b8989;
				stroke-width: 1.5;
				stroke-dasharray: 6,2;
				fill: white;
			}
			
			circle.railwayr {
				stroke: #FF0000;
				stroke-width: 5;
				fill: #FF0000;
			}
			
			circle.railwayy {
				stroke: #FFFF00;
				stroke-width: 5;
				fill: #FFFF00;
			}
			
			circle.railwayg {
				stroke: #00FF00;
				stroke-width: 5;
				fill: #00FF00;
			}
			
			circle.railwayb {
				stroke: #000000;
				stroke-width: 5;
				fill: #000000;
			}
			
			circle.railwayp {
				stroke: #FF6EC7;
				stroke-width: 5;
				fill: #FF6EC7;
			}
			
			text.Town {
				fill: black;
				font-size: 17px;
				font-weight: bold;
				text-anchor: middle;
			}
			
			text.Town_abandoned {
				fill: #cdc9c9;
				font-size: 17px;
				font-weight: bold;
				text-anchor: middle;
				text-decoration: line-through;
			}
			
			text.Town_small {
				fill: black;
				font-size: 15px;
				font-weight: bold;
				text-anchor: middle;
			}
			
			text.Town_abandoned_small {
				fill: #cdc9c9;
				font-size: 15px;
				font-weight: bold;
				text-anchor: middle;
			}

			text.Town_name {
				fill: blue;
				font-size: 17px;
				font-weight: bold;
			}
			
			text.compass {
				fill: black;
				font-size: 28px;
				font-weight: bold;
				font-variant: small-caps;
				text-anchor: middle;
			}
			
			polygon.compass {
				fill: cyan;
				stroke: black;
				stroke-width: 2;
			}
			
			polygon.compass_north {
				fill: cyan;
				stroke: black;
				stroke-width: 1;
			}
			
			text.scale {
				fill: black;
				font-size: 12px;
				font-weight: bold;
			}
			
			text.scale_right {
				fill: black;
				font-size: 12px;
				font-weight: bold;
				text-anchor: end;
			}
			
			rect.scale_light {
				fill: white;
				stroke: black;
				stroke-width: 1;
			}
			
			rect.scale_dark {
				fill: cyan;
				stroke: black;
				stroke-width: 1;
			}
			
			line.road {
				stroke: #066;
				stroke-width: 3;
			}
			
			line.road_unofficial {
				stroke: #770;
				stroke-width: 3;
				stroke-dasharray: 8, 1, 4, 1;
			}
			
			line.road_historic {
				stroke: #ADA96E;
				stroke-width: 1.25;
				stroke-dasharray: 4, 1, 4, 1;
			}
			
			line.rail_liney {
				stroke: #FFFF00;
				stroke-width: 6;
			}
			
			line.rail_lineg {
				stroke: #00FF00;
				stroke-width: 6;
			}
			
			line.rail_liner {
				stroke: #FF0000;
				stroke-width: 6;
			}
			
			line.rail_lineb {
				stroke: #000000;
				stroke-width: 6;
			}
			
			line.rail_linep {
				stroke: #FF6EC7;
				stroke-width: 6;
			}
			
			rect.underpass {
				fill: white;
			}
			
			rect.background {
				fill: white;
				stroke: lightgreen;
				stroke-width: 1.5;
			}
			
			text.range {
				fill: green;
				font-size: 11px;
				text-anchor: end;
			}
			
			text.range_v {
				fill: green;
				font-size: 11px;
				text-anchor: end;
			}
			
			.key_gradient_start {
				stop-color:rgb(255,255,0);
				stop-opacity:1;
			}
			
			.key_gradient_middle {
				stop-color:rgb(255,255,0);
				stop-opacity:0.4;
			}
			
			.key_gradient_end {
				stop-color:rgb(255,255,0);
				stop-opacity:0;
			}
			
			text.griefed {
				font-size:32px;
				font-weight:bold;
				text-anchor:middle;
				fill: #f30;
			}

			circle.griefed {
				stroke: #f30;
				stroke-width: 4;
				fill: none;
			}

      circle.map {
				stroke: blue;
				stroke-width: 1.5;
				stroke-opacity: .1;
				fill: honeydew;
				fill-opacity:0.5;
			}
			
			text.roadcrew_sign {
				fill:black;
				font-weight:bold;
				font-size:48px;
				font-family:sans-serif;
				text-anchor:middle;
			}
			
			path.roadcrew_sign_background {
				fill: #E87600;
			}
			
			path.roadcrew_sign_border {
				stroke: black;
				stroke-width: 4;
				fill: none;			
			}
			
			line.offset {
				stroke: red;
				stroke-width: 2;
				stroke-dasharray: 2,1;
			}
			
			circle.offset {
				fill: black;
			}
			
			path.lock {
				stroke: none;
				stroke-width: 1;
				fill: darkred;
			}
			
			path.lock_shackle {
				stroke: darkred;
				stroke-width: 4;
				fill: none;
			}
			
			rect.Town_coords {
				fill: White;
				stroke-width:2;
				stroke: black;
				fill-opacity:1;
        			stroke-opacity:.1;
			}
			
			text.Town_coords {
				font-size: 17px;
				fill: Black;
				text-anchor:middle;
			}
			
			text.Town_coords_name {
				font-size: 17px;
				font-weight: bold;
				fill: black;
				text-anchor: middle;
			}
			
			rect.toggleButton {
				fill: silver;
			}
		]]>
		</style>
		
		<script type="text/ecmascript">
		<![CDATA[
		
			function show_Town_coords(evt, x, y, scale, name)
			{
				Town_coords_name.textContent = name;
				Town_coords_nether.textContent = "N: " + x + "," + y;
				Town_coords_overworld.textContent = "O: " + (x * 8) + "," + (y * 8);
				Town_coords.setAttribute("transform", "translate(" + ( x * scale)+ "," + (y * scale + 34) + ")");
				Town_coords.setAttributeNS(null, "visibility", "visible");
			}
	 
			function hide_Town_coords()
			{
				Town_coords.setAttributeNS(null, "visibility", "hidden");
			}
			
		]]>
		</script>
		
				<script type="text/ecmascript">
		<![CDATA[
		
			function show_Town_coords_key(evt, x, y, name,c,r)
			{
				Town_coords_name_key.textContent = name;
				Town_coords_nether_key.textContent = "N: " + x + "," + y;
				Town_coords_overworld_key.textContent = "O: " + (x * 8) + "," + (y * 8);
				Town_coords_key.setAttribute("transform", "translate(" + c + "," + (r + 34) + ")");
				Town_coords_key.setAttributeNS(null, "visibility", "visible");
			}
	 
			function hide_Town_coords_key()
			{
				Town_coords_key.setAttributeNS(null, "visibility", "hidden");
			}
			
		]]>
		</script>
		
		<script type="text/ecmascript">
		<![CDATA[
			function toggleVisibility() 
			{
				var roadhistoric = document.getElementById("roadhistoric");
				roadhistoric.style.display = "";
				if(roadhistoric.style.visibility == "hidden" ) {
				roadhistoric.style.visibility = "visible";
				}else{
					roadhistoric.style.visibility = "hidden";
				}
				
				var invert1 = document.getElementById("invert1");
				invert1.style.display = "";
				if(invert1.style.stroke == "white" ) {
				invert1.style.stroke = "black";
				}else{
					invert1.style.stroke = "white";
				}
				
				var invert2 = document.getElementById("invert2");
				invert2.style.display = "";
				if(invert2.style.stroke == "black" ) {
				invert2.style.stroke = "white";
				}else{
					invert2.style.stroke = "black";
				}
			}
		]]>
		</script>


  	<script type="text/ecmascript">
		<![CDATA[
			function toggleVisibilityUnofficial() 
			{
				var roadhistoric = document.getElementById("roadunofficial");
				roadhistoric.style.display = "";
				if(roadhistoric.style.visibility == "hidden" ) {
				roadhistoric.style.visibility = "visible";
				}else{
					roadhistoric.style.visibility = "hidden";
				}
				
				var invert1 = document.getElementById("invert5");
				invert1.style.display = "";
				if(invert1.style.stroke == "white" ) {
				invert1.style.stroke = "black";
				}else{
					invert1.style.stroke = "white";
				}
				
				var invert2 = document.getElementById("invert6");
				invert2.style.display = "";
				if(invert2.style.stroke == "black" ) {
				invert2.style.stroke = "white";
				}else{
					invert2.style.stroke = "black";
				}
			}
		]]>
		</script>
		
		  	<script type="text/ecmascript">
		<![CDATA[
			function toggleVisibilityUninhabited() 
			{
				var roadhistoric = document.getElementById("portaluninhabited");
				roadhistoric.style.display = "";
				if(roadhistoric.style.visibility == "hidden" ) {
				roadhistoric.style.visibility = "visible";
				}else{
					roadhistoric.style.visibility = "hidden";
				}
				
				var invert1 = document.getElementById("invert7");
				invert1.style.display = "";
				if(invert1.style.stroke == "white" ) {
				invert1.style.stroke = "black";
				}else{
					invert1.style.stroke = "white";
				}
				
				var invert2 = document.getElementById("invert8");
				invert2.style.display = "";
				if(invert2.style.stroke == "black" ) {
				invert2.style.stroke = "white";
				}else{
					invert2.style.stroke = "black";
				}
			}
		]]>
		</script>

		
		<script type="text/ecmascript">
		<![CDATA[
			function toggleVisibilityRail() 
			{
				document.getElementById("railline").style.display = "";
				if(document.getElementById("railline").style.visibility == "hidden" ) {
				document.getElementById("railline").style.visibility = "visible";
				}else{
					document.getElementById("railline").style.visibility = "hidden";
				}
				
				document.getElementById("invert3").style.display = "";
				if(document.getElementById("invert3").style.stroke == "white" ) {
				document.getElementById("invert3").style.stroke = "black";
				}else{
					document.getElementById("invert3").style.stroke = "white";
				}
				
				document.getElementById("invert4").style.display = "";
				if(document.getElementById("invert4").style.stroke == "black" ) {
				document.getElementById("invert4").style.stroke = "white";
				}else{
					document.getElementById("invert4").style.stroke = "black";
				}
			}
		]]>
		</script>
		
		<!-- Drop shadow used for a couple of things below -->
		<defs>
			<filter id="dropshadow" height="130%">
				<feGaussianBlur in="SourceAlpha" stdDeviation="2"/> 
				<feOffset dx="2" dy="2" result="offsetblur"/> 
				<feMerge> 
					<feMergeNode/>
					<feMergeNode in="SourceGraphic"/> 
				</feMerge>
			</filter>
		</defs>
		
		
		
		<!-- Background -->
		<defs>
			<pattern id="background" patternUnits="userSpaceOnUse">
			  <xsl:attribute name="width">
		      <xsl:value-of select="1000 * $scale" />
		    </xsl:attribute>
				<xsl:attribute name="height">
		      <xsl:value-of select="1000 * $scale" />
		    </xsl:attribute>
				
				<rect class="background" x="0" y="0" width="101" height="101">
				  <xsl:attribute name="width">
		        <xsl:value-of select="1000 * $scale+1" />
		      </xsl:attribute>
				  <xsl:attribute name="height">
		       <xsl:value-of select="1000 * $scale+1" />
		      </xsl:attribute>
				</rect>
				
			</pattern>
		</defs>
		<g>
		    <rect fill="url(#background)" x="0" y="0" width="100%" height="100%"/>
		    <circle transform="translate(1000,1000)" class="map">
		      <xsl:attribute name="r">
		        <xsl:value-of select="$mapsize * $scale" />
		      </xsl:attribute>
		      <xsl:attribute name="transform">
		        <xsl:value-of select="concat('translate(',$mapsize * $scale,',',$mapsize * $scale,')')" />
		      </xsl:attribute>
		    </circle>
		</g>
		<!-- Key -->
		<g transform="translate(1300, 60) scale(.7)">
			<defs>
				<linearGradient id="key_gradient" x1="0%" y1="0%" x2="100%" y2="0%">
					<stop offset="0%" class="key_gradient_start" />
					<stop offset="90%" class="key_gradient_middle" />
					<stop offset="100%" class="key_gradient_end" />
				</linearGradient>
			</defs>
			<rect x="-20" y="-20" height="585" fill="url(#key_gradient)">
				<xsl:attribute name="width">
					<xsl:value-of select="200 * ceiling(count(/map/Towns/Town[not(contains(@status, 'uninhabited'))]) div 16.0) + 20" />
				</xsl:attribute>
			</rect>
			
			<xsl:for-each select="map/Towns/Town[not(contains(@status, 'uninhabited'))]">
				<xsl:variable name="i"><xsl:number count="map/Towns/Town[not(contains(@status, 'uninhabited'))]" /></xsl:variable>
				<xsl:variable name="x" select="floor(($i - 1) div 16.0)" />
				<xsl:variable name="y" select="($i - 1) - ($x * 16.0)" />
				<g onmouseout="hide_Town_coords_key()">
					<xsl:attribute name="onmousemove">
						<xsl:value-of select="concat('show_Town_coords_key(evt,',@x,',',@z,',&quot;',@name,'&quot;,',200 * $x,',',36 * $y,')')" />
					</xsl:attribute>
					<xsl:attribute name="transform">
						<xsl:value-of select="concat('translate(',200 * $x,',',36 * $y,')')" />
					</xsl:attribute>
					<circle r="16">
						<xsl:attribute name="class">
							<xsl:if test="contains(@status, 'uninhabited')">Town_abandoned</xsl:if>
							<xsl:if test="not(contains(@status, 'uninhabited'))">Town</xsl:if>
						</xsl:attribute>
					</circle>
					<xsl:if test="contains(@status, 'griefed')">
						<g transform="translate(-16,-16) scale(.4)" filter="url(#dropshadow)">
							<circle r="16" class="griefed" />
							<text y="10" class="griefed">!</text>
						</g>
					</xsl:if>
					<xsl:if test="contains(@status, 'locked')">
						<g transform="translate(8,-16) scale(.4)" filter="url(#dropshadow)">
							<path class="lock" d="M0 0 L 28 0 L 28 20 L 0 20 Z" />
							<path class="lock_shackle" d="M6 0 L 6 -7 Q 14 -20 22 -7 L 22 0" />f
						</g>
					</xsl:if>
					<text y="5">
						<xsl:attribute name="class">
							<xsl:if test="string-length(@abbr) &gt; 2">Town_small</xsl:if>
							<xsl:if test="string-length(@abbr) &lt; 3">Town</xsl:if>
						</xsl:attribute>
						<xsl:value-of select="@abbr" />
					</text>
					<text class="Town_name" x="25" y="5"><xsl:value-of select="@name" /></text>
				</g>
			</xsl:for-each>
		  <g id="Town_coords_key" visibility="hidden" x="0" y="0">
				<rect class="Town_coords" x="-100" y="-17" width="200" height="55" filter="url(#dropshadow)"/>
				<text class="Town_coords_name" id="Town_coords_name_key" >Unknown</text>
				<text class="Town_coords" y="18" id="Town_coords_nether_key">N: 0,0</text>
				<text class="Town_coords" y="34" id="Town_coords_overworld_key">O: 0,0</text>
			</g>
		</g>
		<script type="text/ecmascript">
		<![CDATA[
			Town_coords_key = document.getElementById('Town_coords_key');
			Town_coords_nether_key = document.getElementById('Town_coords_nether_key');
			Town_coords_overworld_key = document.getElementById('Town_coords_overworld_key');
			Town_coords_name_key = document.getElementById('Town_coords_name_key');
		]]>
		</script>script>
		
		
		<!-- Title Block -->
		<g transform="translate(10, 60)">
			<!-- Roadcrew Sign -->
			<g transform="scale(.3)">
				<g transform="translate(810,210)" filter="url(#dropshadow)">
					<path class="roadcrew_sign_background" d="M-200 0 L0 200 L200 0 L0 -200 Z" />
					<path transform="scale(0.97)" class="roadcrew_sign_border" d="M-190 -10 Q -200 0 -190 10 L -10 190 Q 0 200 10 190 L 190 10 Q 200 0 190 -10 L 10 -190 Q 0 -200 -10 -190 Z" />
					<g transform="translate(0,-45)">
						<text class="roadcrew_sign">
							<tspan x="0" y="25">CIVCRAFT</tspan>
							<tspan x="0" y="85">ROADCREW</tspan>
						</text>
					</g>
				</g>
			</g>
			
			<!-- Historic Road Toggle Button -->
			<g transform="translate(80, 250)" onclick="toggleVisibility();" filter="url(#dropshadow)" >
			<rect class="toggleButton" x="-50" y="-25" width="100" height="50" />
			
				<g id="invert1" style="stroke: white">
					<line x1="-50" y1="-25" x2="49" y2="-25" stroke-width="2" /> <!-- Top Line -->
					<line x1="-50" y1="-25" x2="-50" y2="24" stroke-width="2" /> <!-- Left Line -->
				</g>
				<g id="invert2" style="stroke: black">
					<line x1="50" y1="-25" x2="50" y2="25" stroke-wdith="2" /> <!-- Right Line -->
					<line x1="-50" y1="25" x2="50" y2="25" stroke-wdith="2" /> <!-- Bottom Line -->
				</g>
			
				<g>
				<text class="scale">
					<tspan x="-30" y="-7">Show</tspan>
					<tspan x="-30" y="5">Historic</tspan>
					<tspan x="-30" y="17">Roads</tspan>
				</text>
				</g>
			</g>
			
			<!--Rail Toggle Button-->
			
			<g transform="translate(440, 250)" onclick="toggleVisibilityRail();" filter="url(#dropshadow)" >
			<rect class="toggleButton" x="-50" y="-25" width="100" height="50" />
			
				<g id="invert3" style="stroke: white">
					<line x1="-50" y1="-25" x2="49" y2="-25" stroke-width="2" /> <!-- Top Line -->
					<line x1="-50" y1="-25" x2="-50" y2="24" stroke-width="2" /> <!-- Left Line -->
				</g>
				<g id="invert4" style="stroke: black">
					<line x1="50" y1="-25" x2="50" y2="25" stroke-wdith="2" /> <!-- Right Line -->
					<line x1="-50" y1="25" x2="50" y2="25" stroke-wdith="2" /> <!-- Bottom Line -->
				</g>
			
				<g>
				<text class="scale">
					<tspan x="-30" y="-7">Hide</tspan>
					<tspan x="-30" y="5">Railway</tspan>
					<tspan x="-30" y="17">Lines</tspan>
				</text>
				</g>
			</g>
			
			<!-- Unofficial Road Toggle Button -->
			<g transform="translate(200, 250)" onclick="toggleVisibilityUnofficial();" filter="url(#dropshadow)" >
			<rect class="toggleButton" x="-50" y="-25" width="100" height="50" />
			
				<g id="invert5" style="stroke: white">
					<line x1="-50" y1="-25" x2="49" y2="-25" stroke-width="2" /> <!-- Top Line -->
					<line x1="-50" y1="-25" x2="-50" y2="24" stroke-width="2" /> <!-- Left Line -->
				</g>
				<g id="invert6" style="stroke: black">
					<line x1="50" y1="-25" x2="50" y2="25" stroke-wdith="2" /> <!-- Right Line -->
					<line x1="-50" y1="25" x2="50" y2="25" stroke-wdith="2" /> <!-- Bottom Line -->
				</g>
			
				<g>
				<text class="scale">
					<tspan x="-30" y="-7">Show</tspan>
					<tspan x="-30" y="5">Unofficial</tspan>
					<tspan x="-30" y="17">Roads</tspan>
				</text>
				</g>
			</g>
			
			
			<!-- Uninhabited Toggle Button -->
			<g transform="translate(320, 250)" onclick="toggleVisibilityUninhabited();" filter="url(#dropshadow)" >
			<rect class="toggleButton" x="-50" y="-25" width="100" height="50" />
			
				<g id="invert7" style="stroke: white">
					<line x1="-50" y1="-25" x2="49" y2="-25" stroke-width="2" /> <!-- Top Line -->
					<line x1="-50" y1="-25" x2="-50" y2="24" stroke-width="2" /> <!-- Left Line -->
				</g>
				<g id="invert8" style="stroke: black">
					<line x1="50" y1="-25" x2="50" y2="25" stroke-wdith="2" /> <!-- Right Line -->
					<line x1="-50" y1="25" x2="50" y2="25" stroke-wdith="2" /> <!-- Bottom Line -->
				</g>
			
				<g>
				<text class="scale">
					<tspan x="-40" y="-7">Show</tspan>
					<tspan x="-40" y="5">Uninhabited</tspan>
					<tspan x="-40" y="17">Towns</tspan>
				</text>
				</g>
			</g>
			
			
			<!-- Compass and Scale -->
			<!--- <g transform="translate(320, 100)">
				<text class="compass" y="-72">North</text>
				<g transform="translate(0, 20)">
					<polygon class="compass_north" transform="translate(0, -10) rotate(180,0,-40) scale(2.0)" points="0,0 -20,-20 -17,-23 -3,-9 -3,-40 3,-40 3,-9 17,-23 20,-20" />
					<polygon class="compass" transform="translate(10, 25) rotate(270,0,-40)" points="0,0 -20,-20 -17,-23 -3,-9 -3,-40 3,-40 3,-9 17,-23 20,-20" />
					<polygon class="compass" transform="translate(0,  35) rotate(  0,0,-40)" points="0,0 -20,-20 -17,-23 -3,-9 -3,-40 3,-40 3,-9 17,-23 20,-20" />
					<polygon class="compass" transform="translate(-10,25) rotate( 90,0,-40)" points="0,0 -20,-20 -17,-23 -3,-9 -3,-40 3,-40 3,-9 17,-23 20,-20" />
				</g>
				<g transform="translate(72,35)">
					<rect class="scale_light" x="0" width="10" height="10" />
					<rect class="scale_dark" x="10" width="10" height="10" />
					<rect class="scale_light" x="20" width="10" height="10" />
					<rect class="scale_dark" x="30" width="10" height="10" />
					<rect class="scale_light" x="40" width="10" height="10" />
					<rect class="scale_dark" x="50" width="10" height="10" />
					<rect class="scale_light" x="60" width="10" height="10" />
					<rect class="scale_dark" x="70" width="10" height="10" />
					<rect class="scale_light" x="80" width="10" height="10" />
					<rect class="scale_dark" x="90" width="10" height="10" />
					<rect class="scale_dark" y="-10" width="10" height="10" />
					<rect class="scale_light" y="-20" width="10" height="10" />
					<rect class="scale_dark" y="-30" width="10" height="10" />
					<rect class="scale_light" y="-40" width="10" height="10" />
					<rect class="scale_dark" y="-50" width="10" height="10" />
					<rect class="scale_light" y="-60" width="10" height="10" />
					<rect class="scale_dark" y="-70" width="10" height="10" />
					<rect class="scale_light" y="-80" width="10" height="10" />
					<rect class="scale_dark" y="-90" width="10" height="10" />
					<text class="scale" x="0" y="24">0 Meters</text>
					<text class="scale_right" x="100" y="24">100</text>
				</g>
			</g>
			
			-->
			
			<g transform="translate(250, 150)">
				<text class="title">
					<tspan x="0" y="0">Civcraft Road Map</tspan>
				</text>
			</g>
			
			<g transform="translate(260, 200)">
				<a xlink:href="http://www.reddit.com/r/CivcraftRoads" target="_blank">
					<text class="link">
						W W W . R E D D I T . C O M / R / C I V C R A F T R O A D S
					</text>
				</a>
			</g>
		</g>
			
		
		<!--
			Change this translation to subtract the top left Town of the map.
			If the top left corner is 50, 70 then this translation should be
			-50, -70; likewise 200, -4400 is a translation of -200, 4400.
			
			If you want it to line up with the grid, make it a multiple of 100
			(or the grid size).

			Remember to check the width and height of the SVG at the top.
		-->
		<g>
		  <xsl:attribute name="transform">
		    <xsl:value-of select="concat('translate(',($mapsize * $scale),',',($mapsize * $scale),')')" />
		  </xsl:attribute>

			<!-- Range indicators -->
			<g>
			  <xsl:attribute name="transform">
		      <xsl:value-of select="concat('translate(',(-5),',',(-$mapsize * $scale+15),')')" />
		    </xsl:attribute>		    
		    		    
 				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-15000*$scale" />
		    </xsl:attribute>
				-15000
				</text>

		    		    
 				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-14000*$scale" />
		    </xsl:attribute>
				-14000
				</text>
		    
 				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-13000*$scale" />
		    </xsl:attribute>
				-13000
				</text>
		    
		    <text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-12000*$scale" />
		    </xsl:attribute>
				-12000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-11000*$scale" />
		    </xsl:attribute>
				-11000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-10000*$scale" />
		    </xsl:attribute>
				-10000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-9000*$scale" />
		    </xsl:attribute>
				-9000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-8000*$scale" />
		    </xsl:attribute>
				-8000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-7000*$scale" />
		    </xsl:attribute>
				-7000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-6000*$scale" />
		    </xsl:attribute>
				-6000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-5000*$scale" />
		    </xsl:attribute>
				-5000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-4000*$scale" />
		    </xsl:attribute>
				-4000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-3000*$scale" />
		    </xsl:attribute>
				-3000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-2000*$scale" />
		    </xsl:attribute>
				-2000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-1000*$scale" />
		    </xsl:attribute>
				-1000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="0*$scale" />
		    </xsl:attribute>
				0
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="1000*$scale" />
		    </xsl:attribute>
				1000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="2000*$scale" />
		    </xsl:attribute>
				2000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="3000*$scale" />
		    </xsl:attribute>
				3000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="4000*$scale" />
		    </xsl:attribute>
				4000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="5000*$scale" />
		    </xsl:attribute>
				5000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="6000*$scale" />
		    </xsl:attribute>
				6000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="7000*$scale" />
		    </xsl:attribute>
				7000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="8000*$scale" />
		    </xsl:attribute>
				8000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="9000*$scale" />
		    </xsl:attribute>
				9000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="10000*$scale" />
		    </xsl:attribute>
				10000
				</text>

				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="11000*$scale" />
		    </xsl:attribute>
				11000
				</text>

				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="12000*$scale" />
		    </xsl:attribute>
				12000
				</text>
					
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="13000*$scale" />
		    </xsl:attribute>
				13000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="14000*$scale" />
		    </xsl:attribute>
				14000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="15000*$scale" />
		    </xsl:attribute>
				15000
				</text>
				
			</g>
			<g>
			  <xsl:attribute name="transform">
		      <xsl:value-of select="concat('translate(',(-5),',',($mapsize * $scale)-5,')')" />
		    </xsl:attribute>

		    		    
 				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-15000*$scale" />
		    </xsl:attribute>
				-15000
				</text>

		    		    
 				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-14000*$scale" />
		    </xsl:attribute>
				-14000
				</text>
		    
 				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-13000*$scale" />
		    </xsl:attribute>
				-13000
				</text>
		    
		    <text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-12000*$scale" />
		    </xsl:attribute>
				-12000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-11000*$scale" />
		    </xsl:attribute>
				-11000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-10000*$scale" />
		    </xsl:attribute>
				-10000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-9000*$scale" />
		    </xsl:attribute>
				-9000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-8000*$scale" />
		    </xsl:attribute>
				-8000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-7000*$scale" />
		    </xsl:attribute>
				-7000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-6000*$scale" />
		    </xsl:attribute>
				-6000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-5000*$scale" />
		    </xsl:attribute>
				-5000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-4000*$scale" />
		    </xsl:attribute>
				-4000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-3000*$scale" />
		    </xsl:attribute>
				-3000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-2000*$scale" />
		    </xsl:attribute>
				-2000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="-1000*$scale" />
		    </xsl:attribute>
				-1000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="0*$scale" />
		    </xsl:attribute>
				0
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="1000*$scale" />
		    </xsl:attribute>
				1000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="2000*$scale" />
		    </xsl:attribute>
				2000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="3000*$scale" />
		    </xsl:attribute>
				3000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="4000*$scale" />
		    </xsl:attribute>
				4000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="5000*$scale" />
		    </xsl:attribute>
				5000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="6000*$scale" />
		    </xsl:attribute>
				6000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="7000*$scale" />
		    </xsl:attribute>
				7000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="8000*$scale" />
		    </xsl:attribute>
				8000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="9000*$scale" />
		    </xsl:attribute>
				9000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="10000*$scale" />
		    </xsl:attribute>
				10000
				</text>

				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="11000*$scale" />
		    </xsl:attribute>
				11000
				</text>

				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="12000*$scale" />
		    </xsl:attribute>
				12000
				</text>
					
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="13000*$scale" />
		    </xsl:attribute>
				13000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="14000*$scale" />
		    </xsl:attribute>
				14000
				</text>
				
				<text class="range">
				<xsl:attribute name="x">
		      <xsl:value-of select="15000*$scale" />
		    </xsl:attribute>
				15000
				</text>
				
			</g>
			<g transform="translate(1380,4)">
				<xsl:attribute name="transform">
		      <xsl:value-of select="concat('translate(',($mapsize * $scale)-5,',',(-5),')')" />
		    </xsl:attribute>
		    
		    <text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-15000*$scale" />
		    </xsl:attribute>
				-15000
				</text>
				
		    <text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-14000*$scale" />
		    </xsl:attribute>
				-14000
				</text>
				
		    <text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-13000*$scale" />
		    </xsl:attribute>
				-13000
				</text>
				
		    <text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-12000*$scale" />
		    </xsl:attribute>
				-12000
				</text>
				
		    <text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-11000*$scale" />
		    </xsl:attribute>
				-11000
				</text>
				
		    <text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-10000*$scale" />
		    </xsl:attribute>
				-10000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-9000*$scale" />
		    </xsl:attribute>
				-9000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-8000*$scale" />
		    </xsl:attribute>
				-8000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-7000*$scale" />
		    </xsl:attribute>
				-7000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-6000*$scale" />
		    </xsl:attribute>
				-6000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-5000*$scale" />
		    </xsl:attribute>
				-5000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-4000*$scale" />
		    </xsl:attribute>
				-4000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-3000*$scale" />
		    </xsl:attribute>
				-3000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-2000*$scale" />
		    </xsl:attribute>
				-2000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-1000*$scale" />
		    </xsl:attribute>
				-1000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="0*$scale" />
		    </xsl:attribute>
				0
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="1000*$scale" />
		    </xsl:attribute>
				1000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="2000*$scale" />
		    </xsl:attribute>
				2000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="3000*$scale" />
		    </xsl:attribute>
				3000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="4000*$scale" />
		    </xsl:attribute>
				4000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="5000*$scale" />
		    </xsl:attribute>
				5000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="6000*$scale" />
		    </xsl:attribute>
				6000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="7000*$scale" />
		    </xsl:attribute>
				7000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="8000*$scale" />
		    </xsl:attribute>
				8000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="9000*$scale" />
		    </xsl:attribute>
				9000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="10000*$scale" />
		    </xsl:attribute>
				10000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="11000*$scale" />
		    </xsl:attribute>
				11000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="12000*$scale" />
		    </xsl:attribute>
				12000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="13000*$scale" />
		    </xsl:attribute>
				13000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="14000*$scale" />
		    </xsl:attribute>
				14000
				</text>
				

				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="15000*$scale" />
		    </xsl:attribute>
				15000
				</text>
			</g>
			
			<g>
				<xsl:attribute name="transform">
		      <xsl:value-of select="concat('translate(',(-$mapsize * $scale+35),',',(-5),')')" />
		    </xsl:attribute>
		    
				
		    <text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-15000*$scale" />
		    </xsl:attribute>
				-15000
				</text>
				
		    <text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-14000*$scale" />
		    </xsl:attribute>
				-14000
				</text>
				
		    <text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-13000*$scale" />
		    </xsl:attribute>
				-13000
				</text>
				
		    <text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-12000*$scale" />
		    </xsl:attribute>
				-12000
				</text>
				
		    <text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-11000*$scale" />
		    </xsl:attribute>
				-11000
				</text>
				
		    <text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-10000*$scale" />
		    </xsl:attribute>
				-10000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-9000*$scale" />
		    </xsl:attribute>
				-9000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-8000*$scale" />
		    </xsl:attribute>
				-8000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-7000*$scale" />
		    </xsl:attribute>
				-7000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-6000*$scale" />
		    </xsl:attribute>
				-6000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-5000*$scale" />
		    </xsl:attribute>
				-5000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-4000*$scale" />
		    </xsl:attribute>
				-4000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-3000*$scale" />
		    </xsl:attribute>
				-3000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-2000*$scale" />
		    </xsl:attribute>
				-2000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="-1000*$scale" />
		    </xsl:attribute>
				-1000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="0*$scale" />
		    </xsl:attribute>
				0
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="1000*$scale" />
		    </xsl:attribute>
				1000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="2000*$scale" />
		    </xsl:attribute>
				2000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="3000*$scale" />
		    </xsl:attribute>
				3000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="4000*$scale" />
		    </xsl:attribute>
				4000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="5000*$scale" />
		    </xsl:attribute>
				5000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="6000*$scale" />
		    </xsl:attribute>
				6000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="7000*$scale" />
		    </xsl:attribute>
				7000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="8000*$scale" />
		    </xsl:attribute>
				8000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="9000*$scale" />
		    </xsl:attribute>
				9000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="10000*$scale" />
		    </xsl:attribute>
				10000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="11000*$scale" />
		    </xsl:attribute>
				11000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="12000*$scale" />
		    </xsl:attribute>
				12000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="13000*$scale" />
		    </xsl:attribute>
				13000
				</text>
				
				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="14000*$scale" />
		    </xsl:attribute>
				14000
				</text>
				

				<text class="range_v">
				<xsl:attribute name="y">
		      <xsl:value-of select="15000*$scale" />
		    </xsl:attribute>
				15000
				</text>				
			</g>
		
			<!-- Roads -->
			<!-- Historic Roads -->
			<g id="roadhistoric" style="visibility: hidden;">
				<line class="road_historic" x1="-593" y1="237" x2="-438" y2="237" /><!-- Obsidian Plains Road -->
			</g>
			<!--Official Roads-->
			
			<!--<g id="roads" style="visibility: visible;">
				<xsl:for-each select="map/Towns/Town[contains(@status, 'uninhabited')]">
					<g>
						<xsl:attribute name="transform">
							<xsl:value-of select="concat('translate(',@x * $scale,',',@z * $scale,')')" />
						</xsl:attribute>
					<g onmouseout="hide_Town_coords()">
							<xsl:attribute name="onmousemove">
								<xsl:value-of select="concat('show_Town_coords(evt,',@x,',',@z,',',$scale,',','&quot;',@name,'&quot;)')" />
							</xsl:attribute>
							<xsl:if test="@offset">
								<xsl:attribute name="transform">
									<xsl:value-of select="concat('translate(',@offset,')')" />
								</xsl:attribute>
							</xsl:if>
							<circle r="16">
								<xsl:attribute name="class">
									<xsl:if test="contains(@status, 'uninhabited')">Town_abandoned</xsl:if>
									<xsl:if test="not(contains(@status, 'uninhabited'))">Town</xsl:if>
								</xsl:attribute>
							</circle>
							<xsl:if test="contains(@status, 'griefed')">
								<g transform="translate(-16,-16) scale(.6)" filter="url(#dropshadow)">
									<circle r="16" class="griefed" />
									<text y="10" class="griefed">!</text>
								</g>
							</xsl:if>
							<xsl:if test="contains(@status, 'locked')">
								<g transform="translate(10,-18) scale(.5)" filter="url(#dropshadow)">
									<path class="lock" d="M0 0 L 28 0 L 28 20 L 0 20 Z" />
									<path class="lock_shackle" d="M6 0 L 6 -7 Q 14 -20 22 -7 L 22 0" />
								</g>
							</xsl:if>
							<text y="5">
								<xsl:attribute name="class">
									<xsl:if test="string-length(@abbr) &gt; 2">Town_abandoned_small</xsl:if>
									<xsl:if test="string-length(@abbr) &lt; 3">Town_abandoned</xsl:if>	
								</xsl:attribute>
								<xsl:value-of select="@abbr" />
							</text>
						</g>
					</g>
				</xsl:for-each>
			</g>
			-->
			<g>
				<line class="road" x1="409" y1="-518" x2="409" y2="-545" /><!-- North Road/Lazuli -->
			</g>
			
			<!--Unofficial Roads-->
			<g id="roadunofficial" style="visibility: hidden;">
				<line class="road_unofficial" x1="-90" y1="-125" x2="-200" y2="-125" /><!-- Rothbard Shortcut -->
			</g>
			
			<g id="railline" style="visibility: visible;">
			<!-- Railway -->
			
				<!-- Lines -->
				<line class="rail_lineb" x1="-168" y1="1" x2="-1840" y2="10" /><!-- Liberty to NotHCF -->
			
				<!-- Stations -->
				<g>
					<circle class="railwayy" r="20" cx="-811" cy="492" /><!-- Columbia -->
				</g>
			</g>
				
			<!-- Towns Inhabited -->
			<g>
				<xsl:for-each select="map/Towns/Town[not(contains(@status, 'uninhabited'))]">
					<g>
						<xsl:attribute name="transform">
							<xsl:value-of select="concat('translate(',@x * $scale,',',@z * $scale,')')" />
						</xsl:attribute>
						
	 				<g onmouseout="hide_Town_coords()">
							<xsl:attribute name="onmousemove">
								<xsl:value-of select="concat('show_Town_coords(evt,',@x,',',@z,',',$scale,',','&quot;',@name,'&quot;)')" />
							</xsl:attribute>
							<circle r="16">
								<xsl:attribute name="class">
									<xsl:if test="contains(@status, 'uninhabited')">Town_abandoned</xsl:if>
									<xsl:if test="not(contains(@status, 'uninhabited'))">Town</xsl:if>
								</xsl:attribute>
							</circle>
							<xsl:if test="contains(@status, 'griefed')">
								<g transform="translate(-16,-16) scale(.6)" filter="url(#dropshadow)">
									<circle r="16" class="griefed" />
									<text y="10" class="griefed">!</text>
								</g>
							</xsl:if>
							<xsl:if test="contains(@status, 'locked')">
								<g transform="translate(10,-18) scale(.5)" filter="url(#dropshadow)">
									<path class="lock" d="M0 0 L 28 0 L 28 20 L 0 20 Z" />
									<path class="lock_shackle" d="M6 0 L 6 -7 Q 14 -20 22 -7 L 22 0" />
								</g>
							</xsl:if>
							<text y="5">
								<xsl:attribute name="class">
									<xsl:if test="string-length(@abbr) &lt; 3">Town</xsl:if>
									<xsl:if test="string-length(@abbr) &gt; 2">Town_small</xsl:if>
								</xsl:attribute>
								<xsl:value-of select="@abbr" />
							</text>
						</g>
					</g>
				</xsl:for-each>
			</g>
			
						<!-- Towns Uninhabited -->
			<g id="portaluninhabited" style="visibility: hidden;">
				<xsl:for-each select="map/Towns/Town[contains(@status, 'uninhabited')]">
					<g>
						<xsl:attribute name="transform">
							<xsl:value-of select="concat('translate(',@x * $scale,',',@z * $scale,')')" />
						</xsl:attribute>
					<g onmouseout="hide_Town_coords()">
							<xsl:attribute name="onmousemove">
								<xsl:value-of select="concat('show_Town_coords(evt,',@x,',',@z,',',$scale,',','&quot;',@name,'&quot;)')" />
							</xsl:attribute>
							<xsl:if test="@offset">
								<xsl:attribute name="transform">
									<xsl:value-of select="concat('translate(',@offset,')')" />
								</xsl:attribute>
							</xsl:if>
							<circle r="16">
								<xsl:attribute name="class">
									<xsl:if test="contains(@status, 'uninhabited')">Town_abandoned</xsl:if>
									<xsl:if test="not(contains(@status, 'uninhabited'))">Town</xsl:if>
								</xsl:attribute>
							</circle>
							<xsl:if test="contains(@status, 'griefed')">
								<g transform="translate(-16,-16) scale(.6)" filter="url(#dropshadow)">
									<circle r="16" class="griefed" />
									<text y="10" class="griefed">!</text>
								</g>
							</xsl:if>
							<xsl:if test="contains(@status, 'locked')">
								<g transform="translate(10,-18) scale(.5)" filter="url(#dropshadow)">
									<path class="lock" d="M0 0 L 28 0 L 28 20 L 0 20 Z" />
									<path class="lock_shackle" d="M6 0 L 6 -7 Q 14 -20 22 -7 L 22 0" />
								</g>
							</xsl:if>
							<text y="5">
								<xsl:attribute name="class">
									<xsl:if test="string-length(@abbr) &gt; 2">Town_abandoned_small</xsl:if>
									<xsl:if test="string-length(@abbr) &lt; 3">Town_abandoned</xsl:if>	
								</xsl:attribute>
								<xsl:value-of select="@abbr" />
							</text>
						</g>
					</g>
				</xsl:for-each>
			</g>

			
			<g id="Town_coords" visibility="hidden" x="0" y="0">
				<rect class="Town_coords" x="-100" y="-17" width="200" height="55" filter="url(#dropshadow)"/>
				<text class="Town_coords_name" id="Town_coords_name" >Unknown</text>
				<text class="Town_coords" y="18" id="Town_coords_nether">N: 0,0</text>
				<text class="Town_coords" y="34" id="Town_coords_overworld">O: 0,0</text>
			</g>
		</g>
		<script type="text/ecmascript">
		<![CDATA[
			Town_coords = document.getElementById('Town_coords');
			Town_coords_nether = document.getElementById('Town_coords_nether');
			Town_coords_overworld = document.getElementById('Town_coords_overworld');
			Town_coords_name = document.getElementById('Town_coords_name');
		]]>
		</script>	
	</svg>
</xsl:template>
</xsl:stylesheet> 
