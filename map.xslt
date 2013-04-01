<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
	<!--
	CivCraft Nether Roads Map
	Managed at https://github.com/hpoom/Nether-Roads-Map
	Hosted at http://www.hpoom.co.uk/CivCraft/map.php
	
	Town/Portal List
	-->
	<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="2900" height="2700" xmlns:xlink="http://www.w3.org/1999/xlink">
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

			circle.portal {
				stroke: black;
				stroke-width: 1.5;
				fill: lightcyan;
			}
			
			circle.portal_abandoned {
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
			
			circle.railwayb {
				stroke: #000000;
				stroke-width: 5;
				fill: #000000;
			}
			
			text.portal {
				fill: black;
				font-size: 17px;
				font-weight: bold;
				text-anchor: middle;
			}
			
			text.portal_abandoned {
				fill: #cdc9c9;
				font-size: 17px;
				font-weight: bold;
				text-anchor: middle;
				text-decoration: line-through;
			}
			
			text.portal_small {
				fill: black;
				font-size: 15px;
				font-weight: bold;
				text-anchor: middle;
			}
			
			text.portal_abandoned_small {
				fill: #cdc9c9;
				font-size: 15px;
				font-weight: bold;
				text-anchor: middle;
			}

			text.portal_name {
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
			
			line.rail_liner {
				stroke: #FF0000;
				stroke-width: 6;
			}
			
			line.rail_lineb {
				stroke: #000000;
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
				text-anchor: middle;
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
			
			rect.portal_coords {
				fill: White;
				stroke-width:2;
				stroke: black;
				fill-opacity:1;
        			stroke-opacity:.1;
			}
			
			text.portal_coords {
				font-size: 17px;
				fill: Black;
				text-anchor:middle;
			}
			
			text.portal_coords_name {
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
		
			function show_portal_coords(evt, x, y, name)
			{
				portal_coords_name.textContent = name;
				portal_coords_nether.textContent = "N: " + x + "," + y;
				portal_coords_overworld.textContent = "O: " + (x * 8) + "," + (y * 8);
				portal_coords.setAttribute("transform", "translate(" + x + "," + (y + 34) + ")");
				portal_coords.setAttributeNS(null, "visibility", "visible");
			}
	 
			function hide_portal_coords()
			{
				portal_coords.setAttributeNS(null, "visibility", "hidden");
			}
			
		]]>
		</script>
		
		<script type="text/ecmascript">
		<![CDATA[
			function toggleVisibility() 
			{
				var toggleMe = document.getElementById("toggleMe");
				toggleMe.style.display = "";
				if(toggleMe.style.visibility == "hidden" ) {
				toggleMe.style.visibility = "visible";
				}else{
					toggleMe.style.visibility = "hidden";
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
				var toggleMe = document.getElementById("toggleMe3");
				toggleMe.style.display = "";
				if(toggleMe.style.visibility == "hidden" ) {
				toggleMe.style.visibility = "visible";
				}else{
					toggleMe.style.visibility = "hidden";
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
				var toggleMe = document.getElementById("toggleMe4");
				toggleMe.style.display = "";
				if(toggleMe.style.visibility == "hidden" ) {
				toggleMe.style.visibility = "visible";
				}else{
					toggleMe.style.visibility = "hidden";
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
				document.getElementById("toggleMe2").style.display = "";
				if(document.getElementById("toggleMe2").style.visibility == "hidden" ) {
				document.getElementById("toggleMe2").style.visibility = "visible";
				}else{
					document.getElementById("toggleMe2").style.visibility = "hidden";
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
			<pattern id="background" width="100" height="100" patternUnits="userSpaceOnUse">
				<rect class="background" x="0" y="0" width="101" height="101" />
			</pattern>
		</defs>
		
		<rect fill="url(#background)" x="0" y="0" width="100%" height="100%"/>
		
		<!-- Key -->
		<g transform="translate(1400, 60) scale(.9)">
			<defs>
				<linearGradient id="key_gradient" x1="0%" y1="0%" x2="100%" y2="0%">
					<stop offset="0%" class="key_gradient_start" />
					<stop offset="90%" class="key_gradient_middle" />
					<stop offset="100%" class="key_gradient_end" />
				</linearGradient>
			</defs>
			<rect x="-20" y="-20" height="585" fill="url(#key_gradient)">
				<xsl:attribute name="width">
					<xsl:value-of select="180 * ceiling(count(/map/portals/portal) div 16.0) + 20" />
				</xsl:attribute>
			</rect>
			
			<xsl:for-each select="map/portals/portal">
				<xsl:variable name="i"><xsl:number /></xsl:variable>
				<xsl:variable name="x" select="floor(($i - 1) div 16.0)" />
				<xsl:variable name="y" select="($i - 1) - ($x * 16.0)" />
				<g>
					<xsl:attribute name="transform">
						<xsl:value-of select="concat('translate(',180 * $x,',',36 * $y,')')" />
					</xsl:attribute>
					<circle r="16">
						<xsl:attribute name="class">
							<xsl:if test="contains(@status, 'uninhabited')">portal_abandoned</xsl:if>
							<xsl:if test="not(contains(@status, 'uninhabited'))">portal</xsl:if>
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
							<xsl:if test="string-length(@abbr) &gt; 2">portal_small</xsl:if>
							<xsl:if test="string-length(@abbr) &lt; 3">portal</xsl:if>
						</xsl:attribute>
						<xsl:value-of select="@abbr" />
					</text>
					<text class="portal_name" x="25" y="5"><xsl:value-of select="@name" /></text>
				</g>
			</xsl:for-each>
		
		</g>
		
		
		
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
			
			<g transform="translate(320, 250)" onclick="toggleVisibilityRail();" filter="url(#dropshadow)" >
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
			<g transform="translate(440, 250)" onclick="toggleVisibilityUninhabited();" filter="url(#dropshadow)" >
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
					<tspan x="-40" y="-7">Hide</tspan>
					<tspan x="-40" y="5">Uninhabited</tspan>
					<tspan x="-40" y="17">Portals</tspan>
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
					<tspan x="0" y="0">Nether Road Map 2.0</tspan>
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
			Change this translation to subtract the top left portal of the map.
			If the top left corner is 50, 70 then this translation should be
			-50, -70; likewise 200, -4400 is a translation of -200, 4400.
			
			If you want it to line up with the grid, make it a multiple of 100
			(or the grid size).

			Remember to check the width and height of the SVG at the top.
		-->
		<g transform="translate(1500,1300)">
		
			<!-- Range indicators -->
			<g transform="translate(0,-1280)">
				<text class="range" x="-1400">-1400</text>
				<text class="range" x="-1300">-1300</text>
				<text class="range" x="-1200">-1200</text>
				<text class="range" x="-1100">-1100</text>
				<text class="range" x="-1000">-1000</text>
				<text class="range" x="-900">-900</text>
				<text class="range" x="-800">-800</text>
				<text class="range" x="-700">-700</text>
				<text class="range" x="-600">-600</text>
				<text class="range" x="-500">-500</text>
				<text class="range" x="-400">-400</text>
				<text class="range" x="-300">-300</text>
				<text class="range" x="-200">-200</text>
				<text class="range" x="-100">-100</text>
				<text class="range" x="0">0</text>
				<text class="range" x="100">+100</text>
				<text class="range" x="200">+200</text>
				<text class="range" x="300">+300</text>
				<text class="range" x="400">+400</text>
				<text class="range" x="500">+500</text>
				<text class="range" x="600">+600</text>
				<text class="range" x="700">+700</text>
				<text class="range" x="800">+800</text>
				<text class="range" x="900">+900</text>
				<text class="range" x="1000">+1000</text>
				<text class="range" x="1100">+1100</text>
				<text class="range" x="1200">+1200</text>
				<text class="range" x="1300">+1300</text>
			</g>
			<g transform="translate(1380,4)">
				<text class="range_v" y="-1200">-1200</text>
				<text class="range_v" y="-1100">-1100</text>
				<text class="range_v" y="-1000">-1000</text>
				<text class="range_v" y="-900">-900</text>
				<text class="range_v" y="-800">-800</text>
				<text class="range_v" y="-700">-700</text>
				<text class="range_v" y="-600">-600</text>
				<text class="range_v" y="-500">-500</text>
				<text class="range_v" y="-400">-400</text>
				<text class="range_v" y="-300">-300</text>
				<text class="range_v" y="-200">-200</text>
				<text class="range_v" y="-100">-100</text>
				<text class="range_v" y="0">0</text>
				<text class="range_v" y="100">+100</text>
				<text class="range_v" y="200">+200</text>
				<text class="range_v" y="300">+300</text>
				<text class="range_v" y="400">+400</text>
				<text class="range_v" y="500">+500</text>
				<text class="range_v" y="600">+600</text>
				<text class="range_v" y="700">+700</text>
				<text class="range_v" y="800">+800</text>
				<text class="range_v" y="900">+900</text>
				<text class="range_v" y="1000">+1000</text>
				<text class="range_v" y="1100">+1100</text>
				<text class="range_v" y="1200">+1200</text>
				<text class="range_v" y="1300">+1300</text>
			</g>
		
			<!-- Roads -->
			<!-- Historic Roads -->
			<g id="toggleMe" style="visibility: hidden;">
				<line class="road_historic" x1="-279" y1="-205" x2="-189" y2="-295" /><!-- Hub/Augusta to North hub leg 1 -->
				<line class="road_historic" x1="-189" y1="-295" x2="-41" y2="-295" /><!-- Hub/Augusta to North hub leg 2 -->
				<line class="road_historic" x1="-41" y1="-295" x2="-38" y2="-297" /><!-- North hub to Lib/Laz leg 1 -->
				<line class="road_historic" x1="-38" y1="-297" x2="-33" y2="-297" /><!-- North hub to Lib/Laz leg 2 -->
				<line class="road_historic" x1="-33" y1="-297" x2="97" y2="-353" /><!-- North hub to Lib/Laz leg 3 -->
				<line class="road_historic" x1="97" y1="-353" x2="120" y2="-365" /><!-- North hub to Lib/Laz leg 4 -->
				<line class="road_historic" x1="120" y1="-365" x2="157" y2="-365" /><!-- North hub to Lib/Laz leg 5 -->
				<line class="road_historic" x1="-212" y1="-272" x2="-212" y2="-544" /><!-- Hub/Augusta to Augusta/Lazuli -->
				<line class="road_historic" x1="-284" y1="-209" x2="-306" y2="-203" /><!-- Hub/Augusta to Epicus leg 1 -->
				<line class="road_historic" x1="-306" y1="-203" x2="-342" y2="-185" /><!-- Hub/Augusta to Epicus leg 2 -->
				<line class="road_historic" x1="-342" y1="-185" x2="-353" y2="-182" /><!-- Hub/Augusta to Epicus leg 3 -->
				<line class="road_historic" x1="-353" y1="-182" x2="-388" y2="-182" /><!-- Hub/Augusta to Epicus leg 4 , -->
				<line class="road_historic" x1="-388" y1="-182" x2="-388" y2="-164" /><!-- Hub/Augusta to Epicus leg 5 -->
				<line class="road_historic" x1="-388" y1="-164" x2="-356" y2="-132" /><!-- Hub/Augusta to Epicus leg 6 -->
				<line class="road_historic" x1="-356" y1="-132" x2="-356" y2="-121" /><!-- Hub/Augusta to Epicus leg 7 -->
				<line class="road_historic" x1="-410" y1="428" x2="-423" y2="416" /><!-- Kizantium Road to Nether Fort leg 1 -->
				<line class="road_historic" x1="-423" y1="416" x2="-583" y2="416" /><!-- Kizantium Road to Nether Fort leg 2 -->
				<line class="road_historic" x1="-583" y1="416" x2="-583" y2="395" /><!-- Kizantium Road to Nether Fort leg 3 -->
				<line class="road_historic" x1="-583" y1="395" x2="-714" y2="395" /><!-- Kizantium Road to Nether Fort leg 4 -->
				<line class="road_historic" x1="-634" y1="395" x2="-634" y2="480" /><!-- Nether Fort to Rapture leg 1 -->
				<line class="road_historic" x1="-634" y1="480" x2="-685" y2="480" /><!-- Nether Fort to Rapture leg 2 -->
				<line class="road_historic" x1="-615" y1="477" x2="-615" y2="259" /><!-- Nether Fort to Tigerstaden Intersection -->
				<line class="road_historic" x1="-208" y1="-277" x2="-73" y2="-142" /><!-- Liberty/Atlantis Road to North Hub -->
				<line class="road_historic" x1="-432" y1="308" x2="-298" y2="308" /><!-- Jack's Hold to Kinzantium Road leg 1 -->
				<line class="road_historic" x1="-298" y1="308" x2="-298" y2="316" /><!-- Jack's Hold to Kinzantium Road leg 2 -->
				<line class="road_historic" x1="1" y1="-34" x2="-8" y2="-34" /><!-- Liberty/Atlantis to Rothbard Road leg 1 -->
				<line class="road_historic" x1="-8" y1="-34" x2="-54" y2="-125" /><!-- Liberty/Atlantis to Rothbard Road leg 2 -->
				<line class="road_historic" x1="-827" y1="492" x2="-827" y2="289" /><!-- Atmora to Columbia Rd -->
				<line class="road_historic" x1="-735" y1="289" x2="-735" y2="369" /><!-- Atmora to Leningrad Rd -->
				<line class="road_historic" x1="-735" y1="289" x2="-735" y2="266" /><!-- Atmora to Sovengarde Leg 1 -->
				<line class="road_historic" x1="-735" y1="266" x2="-684" y2="215" /><!-- Atmora to Sovengarde Leg 2 -->
				<line class="road_historic" x1="-593" y1="237" x2="-438" y2="237" /><!-- Obsidian Plains Road -->
			</g>
			<!--Official Roads-->
			<g>
				<line class="road" x1="-1180" y1="-545" x2="-1180" y2="-273" /><!-- North Road/Vilvos -->
				<line class="road" x1="-1178" y1="-272" x2="-1180" y2="-273" /><!-- North Road/Vilvos -->
				<line class="road" x1="-1178" y1="-151" x2="-1178" y2="-272" /><!-- North Road/Vilvos -->
				<line class="road" x1="-1169" y1="-151" x2="-1178" y2="-151" /><!-- North Road/Vilvos -->
				<line class="road" x1="-1169" y1="-151" x2="-1169" y2="-158" /><!-- North Road/Vilvos -->
				<line class="road" x1="409" y1="-518" x2="409" y2="-545" /><!-- North Road/Lazuli -->
				<rect x="453" y="-521" width="8" height="7" class="underpass" /><!-- Lazuli/Winterfell Underpass -->
				<line class="road" x1="57" y1="-376" x2="57" y2="-545" /><!-- North Road/Hoyt -->
				<line class="road" x1="-1" y1="-522" x2="-1" y2="-658" /><!-- North Road/Gorgeview -->
				<line class="road" x1="15" y1="-522" x2="-8" y2="-522" /><!-- Tinto/Gorgeview -->
				<line class="road" x1="-1061" y1="-709" x2="-1061" y2="-492" /><!-- Tokiestan/Immelopolis -->
				<line class="road" x1="-1180" y1="-545" x2="409" y2="-545" /><!-- North Road -->
				<line class="road" x1="-821" y1="-448" x2="-821" y2="-545" /><!-- North Road/Derpenshire -->
				<line class="road" x1="-1082" y1="-492" x2="-1061" y2="-492" /><!-- North Road/Tokiestan -->
				<line class="road" x1="-981" y1="-263" x2="-981" y2="-545" /><!-- North Road/Cutlasso's Fort -->
				<line class="road" x1="-981" y1="-263" x2="-863" y2="-145" /><!-- Cutlasso's Fort/Io -->
				<line class="road" x1="-889" y1="-171" x2="-841" y2="-171" /><!-- Cutlasso's Fort/Io -->
				<line class="road" x1="-863" y1="-145" x2="-467" y2="-145" /><!-- Io/Saga Road -->
				<line class="road" x1="-777" y1="-895" x2="-777" y2="-545" /><!-- North Road/Central City -->
				<line class="road" x1="-782" y1="-831" x2="-701" y2="-831" /><!-- Prisma -->
				<line class="road" x1="-715" y1="-721" x2="-715" y2="-679" /><!-- Yellow Flower -->
				<rect x="-717" y="-692" width="7" height="7" class="underpass" /><!-- Yellow Flower Underpass -->
				<line class="road" x1="-980" y1="-953" x2="-614" y2="-587" /><!-- Wolvania / Mt Augusta -->
				<line class="road" x1="-980" y1="-953" x2="-980" y2="-1208" /><!-- Fraustengard -->
				<line class="road" x1="-741" y1="-714" x2="-741" y2="-766" /><!-- Avernum -->
				<line class="road" x1="-614" y1="-621" x2="-616" y2="258" /><!-- Mt Augusta Road  -->
				<line class="road" x1="-614" y1="-540" x2="-159" y2="-84" /><!-- Mt Augusta Road / Liberty -->
				<line class="road" x1="-538" y1="-464" x2="-538" y2="-417" /><!-- Alpha Sierra -->
				<line class="road" x1="-159" y1="-58" x2="466" y2="-683" /><!-- Liberty/Atlantis Road -->
				<line class="road" x1="523" y1="-683" x2="466" y2="-683" /><!-- Liberty/Atlantis Road -->
				<line class="road" x1="-159" y1="-84" x2="-159" y2="-1" /><!-- Hub road near Liberty -->
				<line class="road" x1="-357" y1="-36" x2="-467" y2="-145" /><!-- Saga/Avalon -->
				<line class="road" x1="-357" y1="-121" x2="-357" y2="-1" /><!-- Saga/Avalon -->
				<line class="road" x1="-357" y1="-121" x2="-385" y2="-121" /><!-- Epicus/Avalon -->
				<line class="road" x1="-357" y1="-1" x2="0" y2="-1" /><!-- Avalon/0,0 -->
				<line class="road" x1="-92" y1="-125" x2="0" y2="-125" /><!-- Rothbard/Liberty -->
				<line class="road" x1="-920" y1="289" x2="-645" y2="289" /><!-- Atmora Road -->
				<line class="road" x1="-357" y1="1" x2="-725" y2="369" /><!-- Avalon/Columbia Road -->
				<line class="road" x1="-737" y1="369" x2="-725" y2="369" /><!-- Avalon/Columbia Road Leg 1 -->
				<line class="road" x1="-737" y1="369" x2="-811" y2="443" /><!-- Avalon/Columbia Road Leg 2 -->
				<line class="road" x1="-811" y1="493" x2="-811" y2="443" /><!-- Avalon/Columbia Road Leg 3 -->
				<line class="road" x1="0" y1="-1" x2="191" y2="-187" /><!-- 0,0/Road Kink -->
				<line class="road" x1="191" y1="-187" x2="395" y2="-263" /><!-- Road Kink/Cress -->
				<line class="road" x1="395" y1="-263" x2="413" y2="-263" /><!-- Cress Road -->
				<line class="road" x1="395" y1="-263" x2="418" y2="-291" /><!-- Cress Junction -->
				<line class="road" x1="418" y1="-291" x2="418" y2="-430" /><!-- Old Rift Road -->
				<line class="road" x1="418" y1="-430" x2="439" y2="-457" /><!-- Old Rift Road -->
				<line class="road" x1="439" y1="-457" x2="408" y2="-457" /><!-- Lazuli Road -->
				<line class="road" x1="408" y1="-457" x2="410" y2="-545" /><!-- Lazuli Road -->
				<line class="road" x1="22" y1="-240" x2="75" y2="-187" /><!-- TGS/Qarth Road -->
				<line class="road" x1="75" y1="-187" x2="191" y2="-187" /><!-- TGS/Qarth Road -->
				<line class="road" x1="79" y1="-187" x2="79" y2="-200" /><!-- TGS/Qarth Road -->
				<line class="road" x1="16" y1="4" x2="0" y2="4" /><!-- Constantinople Road -->
				<line class="road" x1="16" y1="4" x2="558" y2="546" /><!-- Constantinople Road -->
				<line class="road" x1="499" y1="332" x2="499" y2="398" /><!-- Agraria/Gerald Road -->
				<line class="road" x1="540" y1="398" x2="410" y2="398" /><!-- Gerald Road -->
				<line class="road" x1="243" y1="231" x2="490" y2="231" /><!-- Communa Road -->
				<line class="road" x1="400" y1="144" x2="550" y2="144" /><!-- Havana Road -->
				<line class="road" x1="480" y1="144" x2="480" y2="294" /><!-- Havana/Agraria -->
				<line class="road" x1="498" y1="312" x2="480" y2="294" /><!-- Communa/Agraria -->
				<line class="road" x1="162" y1="149" x2="399" y2="149" /><!-- Kodiak Road -->
				<line class="road" x1="0" y1="0" x2="0" y2="18" /><!-- Kizantium Road -->
				<line class="road" x1="0" y1="18" x2="-575" y2="593" /><!-- Kizantium Road -->
				<line class="road" x1="-575" y1="593" x2="-575" y2="748" /><!-- Kizantium Road -->
				<line class="road" x1="-639" y1="756" x2="-639" y2="741" /><!-- Piedmont Road -->
				<line class="road" x1="-639" y1="756" x2="-518" y2="756" /><!-- Piedmont/Bjornstahl Road -->
				<line class="road" x1="-518" y1="756" x2="-468" y2="806" /><!-- Bjornstahl Road -->
				<line class="road" x1="-468" y1="806" x2="-457" y2="806" /><!-- Bjornstahl Road -->
				<line class="road" x1="-575" y1="724" x2="-787" y2="512" /><!-- Kizantium/Columbia Road -->
				<line class="road" x1="-786" y1="512" x2="-811" y2="512" /><!-- Kizantium/Columbia Road -->
				<line class="road" x1="-810" y1="512" x2="-810" y2="492" /><!-- Kizantium/Columbia Road -->
				<line class="road" x1="-800" y1="511" x2="-800" y2="593" /><!-- Alexandria Road -->
				<line class="road" x1="-810" y1="480" x2="-685" y2="480" /><!-- Rapture Road -->
				<line class="road" x1="-714" y1="358" x2="-714" y2="399" /><!-- Leningrad Road -->
				<line class="road" x1="-438" y1="237" x2="-244" y2="237" /><!-- Obsidian Plains Road -->
				<line class="road" x1="-438" y1="257" x2="-604" y2="257" /><!-- Obsidian Plains Road -->
				<line class="road" x1="-237" y1="237" x2="-237" y2="255" /><!-- Vanahiemer Road -->
				<line class="road" x1="-244" y1="237" x2="-244" y2="0" /><!-- Vanahiemer Road -->
				<line class="road" x1="-615" y1="92" x2="-665" y2="92" /><!-- Sovngarde Road -->
				<line class="road" x1="-980" y1="-321" x2="-916" y2="-321" /><!-- Icengrad Road -->
				<line class="road" x1="0" y1="-1" x2="0" y2="850" /><!-- Valenwood/Civitivecchia -->
				<line class="road" x1="260" y1="232" x2="260" y2="150" /><!-- Fyfe -->			
				<line class="road" x1="-613" y1="-374" x2="-738" y2="-374" /><!-- Panda Towers Road -->
				<line class="road" x1="-801" y1="-816" x2="-778" y2="-816" /><!-- Xanadu Road -->
				<line class="road" x1="56" y1="-272" x2="56" y2="-332" /><!-- Liberty/Lazuli to Hoyt (official) -->
				<line class="road" x1="556" y1="543" x2="556" y2="664" /><!-- Danzig Road leg 1 -->
				<line class="road" x1="556" y1="664" x2="865" y2="974" /><!-- Danzig Road leg 2 -->
				<line class="road" x1="865" y1="974" x2="913" y2="974" /><!-- Danzig Road leg 3 -->
				<line class="road" x1="913" y1="974" x2="957" y2="1018" /><!-- Danzig Road leg 4 -->
				<line class="road" x1="957" y1="1018" x2="957" y2="1031" /><!-- Danzig Road leg 5 -->
				<line class="road" x1="453" y1="440" x2="453" y2="609" /><!-- Mercer Road -->
				<line class="road" x1="-380" y1="398" x2="410" y2="398" /><!-- Gerald to Leningrad Rd -->
				<line class="road" x1="41" y1="-58" x2="41" y2="-75" /><!-- Freyrgard Road leg 1 -->
				<line class="road" x1="41" y1="-75" x2="0" y2="-75" /><!-- Freyrgard Road leg 1 -->
				<line class="road" x1="0" y1="-55" x2="-29" y2="-55" /><!-- Tombstone Road -->
				<line class="road" x1="573" y1="275" x2="506" y2="275" /><!-- Danziloa Road Leg 1 -->
				<line class="road" x1="506" y1="275" x2="506" y2="320" /><!-- Danziloa Road Leg 2 -->
				<line class="road" x1="49" y1="37" x2="102" y2="37" /><!-- Amnesty 1 -->
				<line class="road" x1="104" y1="4" x2="104" y2="92" /><!-- Amnesty 2 -->
				<line class="road" x1="-575" y1="695" x2="-507" y2="695" /><!-- Hudson Road -->
				<line class="road" x1="-212" y1="0" x2="-212" y2="-1227" /><!-- Central UpDown Road -->
				<line class="road" x1="1249" y1="1249" x2="673" y2="1249" /><!-- Datan-Kegeth Road Leg 1 -->
				<line class="road" x1="673" y1="782" x2="673" y2="1295" /><!-- Datan-Kegeth Road Leg 2 -->
				<line class="road" x1="1178" y1="1249" x2="956" y2="1031" /><!-- Nine Road -->				
				<line class="road" x1="1262" y1="1250" x2="1277" y2="1265" /><!-- Mushville Road Leg 1 -->
				<line class="road" x1="1277" y1="1265" x2="1277" y2="1284" /><!-- Mushville Road Leg 2 -->
				<line class="road" x1="1277" y1="1284" x2="1310" y2="1317" /><!-- Mushville Road Leg 3 -->
				<line class="road" x1="1310" y1="1317" x2="1325" y2="1317" /><!-- Mushville Road Leg 4 -->
			</g>
			
			<!--Unofficial Roads-->
			<g id="toggleMe3" style="visibility: hidden;">
				<line class="road_unofficial" x1="-90" y1="-125" x2="-200" y2="-125" /><!-- Rothbard Shortcut -->
				<line class="road_unofficial" x1="-418" y1="390" x2="-367" y2="424" /><!-- Melonwood Road leg 1 -->
				<line class="road_unofficial" x1="-367" y1="424" x2="-369" y2="500" /><!-- Melonwood Road leg 2 -->
				<line class="road_unofficial" x1="411" y1="-517" x2="531" y2="-517" /><!-- Lazuli/Atlantis -->
				<line class="road_unofficial" x1="531" y1="-680" x2="531" y2="-517" /><!-- Lazuli/Atlantis -->
				<line class="road_unofficial" x1="4" y1="-690" x2="-1" y2="-658" /><!-- North Road/Gorgeview -->
				<line class="road_unofficial" x1="-76" y1="-522" x2="-76" y2="-370" /><!-- In Kind/New Krumsville -->
				<line class="road_unofficial" x1="-62" y1="-370" x2="-76" y2="-370" /><!-- In Kind/New Krumsville -->
				<line class="road_unofficial" x1="-75" y1="-522" x2="-8" y2="-522" /><!-- In Kind/Tinto -->
				<line class="road_unofficial" x1="-808"  y1="-596" x2="-777" y2="-596" /><!-- Haven -->
				<line class="road_unofficial" x1="-777"  y1="-679" x2="-706" y2="-679" /><!-- Yellow Flower / Mt Augusta -->
				<line class="road_unofficial" x1="148" y1="-365" x2="179" y2="-365" /><!-- Agora -->
				<line class="road_unofficial" x1="182" y1="-368" x2="179" y2="-365" /><!-- Agora -->
				<line class="road_unofficial" x1="182" y1="-368" x2="251" y2="-368" /><!-- Agora -->
				<line class="road_unofficial" x1="255" y1="-372" x2="251" y2="-368" /><!-- Agora -->
				<line class="road_unofficial" x1="255" y1="-372" x2="379" y2="-372" /><!-- Agora -->
				<line class="road_unofficial" x1="379" y1="-421" x2="379" y2="-372" /><!-- Agora -->
				<line class="road_unofficial" x1="379" y1="-421" x2="390" y2="-432" /><!-- Agora -->
				<line class="road_unofficial" x1="418" y1="-432" x2="390" y2="-432" /><!-- Agora -->
				<line class="road_unofficial" x1="-436" y1="79" x2="-436" y2="308" /><!-- JH/OP North/South road -->
				<line class="road_unofficial" x1="-664" y1="308" x2="-436" y2="308" /><!-- JH East/West road -->
				<line class="road_unofficial" x1="438" y1="-498" x2="438" y2="-457" /><!-- Old Rift/Winterfell -->
				<line class="road_unofficial" x1="438" y1="-498" x2="470" y2="-530" /><!-- Old Rift/Winterfell -->
				<line class="road_unofficial" x1="470" y1="-540" x2="470" y2="-530" /><!-- Old Rift/Winterfell -->
				<line class="road_unofficial" x1="-782" y1="-830" x2="-782" y2="-1096" /><!-- Fraustengard -->
				<line class="road_unofficial" x1="-782" y1="-1096" x2="-879" y2="-1194" /><!-- Fraustengard -->
				<line class="road_unofficial" x1="-879" y1="-1194" x2="-985" y2="-1194" /><!-- Fraustengard -->
				<line class="road_unofficial" x1="-985" y1="-1194" x2="-985" y2="-1208" /><!-- Fraustengard -->
				<line class="road_unofficial" x1="-782" y1="-938" x2="-926" y2="-938" /><!-- Wolvania -->
				<line class="road_unofficial" x1="56" y1="-332" x2="56" y2="-374" /><!-- Lower Hoyt Road -->
				<line class="road_unofficial" x1="-432" y1="310" x2="-432" y2="352" /><!-- Jack's Hold to Melonwood/Kinzantium road leg 1 -->
				<line class="road_unofficial" x1="-432" y1="352" x2="-418" y2="390" /><!-- Jack's Hold to Melonwood/Kinzantium road leg 2 -->
				<line class="road_unofficial" x1="-418" y1="390" x2="-411" y2="429" /><!-- Jack's Hold to Melonwood/Kinzantium road leg 3 -->
				<line class="road_unofficial" x1="957" y1="1023" x2="935" y2="1023" /><!-- Danzig Road leg 6 -->
				<line class="road_unofficial" x1="541" y1="528" x2="766" y2="528" /><!-- Camp Maulgish Road -->
				<line class="road_unofficial" x1="131" y1="4" x2="16" y2="4" /><!-- Reid Dale Road -->
				<line class="road_unofficial" x1="-244" y1="247" x2="0" y2="247" /><!-- Ironwood Road -->					
				<line class="road_unofficial" x1="-110" y1="-106" x2="-44" y2="-106" /><!-- Hub to Rothbard Part Rd -->
				<line class="road_unofficial" x1="-129" y1="-21" x2="-15" y2="-135" /><!-- Liberty to Rothbard Leg 1 -->
				<line class="road_unofficial" x1="-129" y1="-21" x2="-140" y2="0" /><!-- Liberty to Rothbard Leg 2 -->
				<line class="road_unofficial" x1="-366" y1="-750" x2="-606" y2="-750" /><!-- Brandersbury Rd Leg 1 -->
				<line class="road_unofficial" x1="-606" y1="-750" x2="-606" y2="-672" /><!-- Brandersbury Rd Leg 2 -->
				<line class="road_unofficial" x1="-606" y1="-672" x2="-612" y2="-672" /><!-- Brandersbury Rd Leg 3 -->
				<line class="road_unofficial" x1="-612" y1="-672" x2="-612" y2="-609" /><!-- Brandersbury Rd Leg 4 -->
				<line class="road_unofficial" x1="0" y1="-1" x2="0" y2="-216" /><!-- Rothbard N/S Rd -->
				<line class="road_unofficial" x1="844" y1="1088" x2="844" y2="952" /><!-- Chiapas Road -->
				<line class="road_unofficial" x1="-87" y1="0" x2="-87" y2="30" /><!-- Vindictam Road -->
				<line class="road_unofficial" x1="-162" y1="2" x2="-162" y2="90" /><!-- Myra Road Leg 1 -->
				<line class="road_unofficial" x1="-162" y1="90" x2="-9" y2="243" /><!-- Myra Road Leg 2 -->
				<line class="road_unofficial" x1="2" y1="247" x2="256" y2="247" /><!-- Myra Road Leg 3 -->
				<line class="road_unofficial" x1="-611" y1="257" x2="-541" y2="257" /><!-- Wonderland Road -->
				<line class="road_unofficial" x1="316" y1="56" x2="316" y2="148" /><!-- Belgrade Road --> 
				<line class="road_unofficial" x1="-454" y1="-919" x2="-466" y2="-919" /><!-- Camp Dilison Road Leg 1 --> 
				<line class="road_unofficial" x1="-466" y1="-919" x2="-617" y2="-768" /><!-- Camp Dilison Road Leg 2 --> 
				<line class="road_unofficial" x1="-617" y1="-768" x2="-617" y2="-590" /><!-- Camp Dilison Road Leg 3 -->
				<line class="road_unofficial" x1="348" y1="149" x2="348" y2="231" /><!-- Lubeck Road -->
				<line class="road_unofficial" x1="-811" y1="499" x2="-862" y2="499" /><!-- Montagna Road Leg 1 -->
				<line class="road_unofficial" x1="-862" y1="499" x2="-936" y2="574" /><!-- Montagna Road Leg 2 -->
				<line class="road_unofficial" x1="-936" y1="574" x2="-966" y2="574" /><!-- Montagna Road Leg 3 -->
				<line class="road_unofficial" x1="-966" y1="574" x2="-1345" y2="952" /><!-- Montagna Road Leg 4 -->
				<line class="road_unofficial" x1="-1145" y1="-546" x2="-1153" y2="-546" /><!-- New Aerilon Leg 1 -->
				<line class="road_unofficial" x1="-1153" y1="-546" x2="-1157" y2="-542" /><!-- New Aerilon Leg 2 -->
				<line class="road_unofficial" x1="-1157" y1="-542" x2="-1260" y2="-542" /><!-- New Aerilon Leg 3 -->
				<line class="road_unofficial" x1="-1260" y1="-542" x2="-1293" y2="-575" /><!-- New Aerilon Leg 4 -->
				<line class="road_unofficial" x1="-1293" y1="-575" x2="-1378" y2="-575" /><!-- New Aerilon Leg 5 -->
				<line class="road_unofficial" x1="-1378" y1="-575" x2="-1378" y2="-601" /><!-- New Aerilon Leg 6 -->
				<line class="road_unofficial" x1="742" y1="850" x2="1050" y2="850" /><!-- Ephemerisle Leg 1 -->
				<line class="road_unofficial" x1="1050" y1="850" x2="1050" y2="839" /><!-- Ephemerisle Leg 2 -->
				<line class="road_unofficial" x1="593" y1="699" x2="699" y2="699" /><!-- Bay City/TuxHold Road -->	
				<line class="road_unofficial" x1="-716" y1="-831" x2="-716" y2="-839" /><!-- Prisma/Camp Dilison Road Leg 1 -->
				<line class="road_unofficial" x1="-716" y1="-839" x2="-661" y2="-839" /><!-- Prisma/Camp Dilison Road Leg 2 -->
				<line class="road_unofficial" x1="-661" y1="-839" x2="-474" y2="-1028" /><!-- Prisma/Camp Dilison Road Leg 3 -->
				<line class="road_unofficial" x1="-474" y1="-1028" x2="-463" y2="-1028" /><!-- Prisma/Camp Dilison Road Leg 4 -->
				<line class="road_unofficial" x1="-463" y1="-1028" x2="-459" y2="-1038" /><!-- Lugus Fens Road Leg 1 -->
				<line class="road_unofficial" x1="-459" y1="-1038" x2="-299" y2="-1196" /><!-- Lugus Fens Road Leg 2 -->
				<line class="road_unofficial" x1="-299" y1="-1196" x2="-299" y2="-1227" /><!-- Lugus Fens Road Leg 3 -->
				<line class="road_unofficial" x1="-299" y1="-1227" x2="-213" y2="-1227" /><!-- Lugus Fens Road Leg 4 -->
				<line class="road_unofficial" x1="673" y1="1177" x2="709" y2="1177" /><!-- Carbon Road -->
				<line class="road_unofficial" x1="-1180" y1="-325" x2="-1035" y2="-325" /><!-- Bereza Road -->
			</g>
			
			<g id="toggleMe2" style="visibility: visible;">
			<!-- Railway -->
			
				<!-- Lines -->
				<line class="rail_liney" x1="-168" y1="1" x2="-407" y2="237" /><!-- Liberty to Obsidian Plains -->
				<line class="rail_liney" x1="-168" y1="1" x2="2" y2="-137" /><!-- Liberty to Rothbard -->
				<line class="rail_liney" x1="-407" y1="237" x2="-543" y2="269" /><!-- Obsidian Plains to Wonderland -->
				<line class="rail_liney" x1="-543" y1="269" x2="-714" y2="398" /><!-- Wonderland to Leningrad -->
				<line class="rail_liney" x1="-714" y1="398" x2="-811" y2="492" /><!-- Leningrad to Columbia -->
				<line class="rail_liney" x1="2" y1="-137" x2="527" y2="-683" /><!-- Rothbard to Atlantis -->
				
				<line class="rail_liner" x1="-168" y1="1" x2="-" y2="247" /><!-- Liberty to Myra -->
				<line class="rail_liner" x1="-1" y1="247" x2="540" y2="400" /><!-- Myra to Gerald -->
				<line class="rail_liner" x1="-168" y1="1" x2="-614" y2="-618" /><!-- Liberty to Mt Augusta -->
				<line class="rail_liner" x1="-614" y1="-618" x2="-1121" y2="-547" /><!-- Mt Augusta to Aristopolis -->
				<line class="rail_liner" x1="540" y1="400" x2="934" y2="1021" /><!-- Gerald to Danzig -->
				<line class="rail_liner" x1="934" y1="1021" x2="1250" y2="1248" /><!-- Danzig to Nine -->
			
				<line class="rail_lineb" x1="-168" y1="1" x2="-1840" y2="10" /><!-- Liberty to NotHCF -->
			
				<!-- Stations -->
				<g>
					<circle class="railwayy" r="20" cx="-811" cy="492" /><!-- Columbia -->
					<circle class="railwayy" r="20" cx="-714" cy="398" /><!-- Leningrad -->
					<circle class="railwayy" r="20" cx="-543" cy="269" /><!-- Wonderland -->
					<circle class="railwayy" r="20" cx="-407" cy="237" /><!-- Obsidian Plains -->
					<circle class="railwayy" r="30" cx="-168" cy="1" /><!-- Liberty -->
					<circle class="railwayy" r="20" cx="2" cy="-137" /><!-- Rothbard -->
					<circle class="railwayy" r="20" cx="527" cy="-683" /><!-- Atlantis -->
					
					<circle class="railwayr" r="20" cx="-1121" cy="-547" /><!-- Aristopolis -->
					<circle class="railwayr" r="20" cx="-614" cy="-618" /><!-- Mt Augusta -->
					<circle class="railwayr" r="25" cx="-168" cy="1" /><!-- Liberty -->
					<circle class="railwayr" r="20" cx="-1" cy="247" /><!-- Myra -->
					<circle class="railwayr" r="20" cx="540" cy="400" /><!-- Gerald -->
					<circle class="railwayr" r="20" cx="934" cy="1021" /><!-- Danzig -->
					<circle class="railwayr" r="20" cx="1250" cy="1248" /><!-- Nine -->
					
					<circle class="railwayb" r="20" cx="-168" cy="1" /><!-- Liberty -->
					<circle class="railwayb" r="20" cx="-1840" cy="10" /><!-- NotHCF -->
				</g>
			</g>
				
			<!-- Portals Inhabited -->
			<g>
				<xsl:for-each select="map/portals/portal[not(contains(@status, 'uninhabited'))]">
					<g>
						<xsl:attribute name="transform">
							<xsl:value-of select="concat('translate(',@x,',',@z,')')" />
						</xsl:attribute>
						<xsl:if test="@offset">
							<line class="offset">
								<xsl:attribute name="x1">0</xsl:attribute>
								<xsl:attribute name="y1">0</xsl:attribute>
								<xsl:attribute name="x2">
									<xsl:value-of select="substring-before(concat(@offset,','),',')" />
								</xsl:attribute>
								<xsl:attribute name="y2">
									<xsl:value-of select="substring-after(@offset,',')" />
								</xsl:attribute>
							</line>
							<circle class="offset" r="6" />
						</xsl:if>
						<g onmouseout="hide_portal_coords()">
							<xsl:attribute name="onmousemove">
								<xsl:value-of select="concat('show_portal_coords(evt,',@x,',',@z,',&quot;',@name,'&quot;)')" />
							</xsl:attribute>
							<xsl:if test="@offset">
								<xsl:attribute name="transform">
									<xsl:value-of select="concat('translate(',@offset,')')" />
								</xsl:attribute>
							</xsl:if>
							<circle r="16">
								<xsl:attribute name="class">
									<xsl:if test="contains(@status, 'uninhabited')">portal_abandoned</xsl:if>
									<xsl:if test="not(contains(@status, 'uninhabited'))">portal</xsl:if>
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
									<xsl:if test="string-length(@abbr) &gt; 2 and contains(@status, 'uninhabited')">portal_abandoned_small</xsl:if>
									<xsl:if test="string-length(@abbr) &lt; 3 and contains(@status, 'uninhabited')">portal_abandoned</xsl:if>	
									<xsl:if test="string-length(@abbr) &lt; 3 and not(contains(@status, 'uninhabited'))">portal</xsl:if>
									<xsl:if test="string-length(@abbr) &gt; 2 and not(contains(@status, 'uninhabited'))">portal_small</xsl:if>
								</xsl:attribute>
								<xsl:value-of select="@abbr" />
							</text>
						</g>
					</g>
				</xsl:for-each>
			</g>
			
						<!-- Portals Uninhabited -->
			<g id="toggleMe4" style="visibility: visible;">
				<xsl:for-each select="map/portals/portal[contains(@status, 'uninhabited')]">
					<g>
						<xsl:attribute name="transform">
							<xsl:value-of select="concat('translate(',@x,',',@z,')')" />
						</xsl:attribute>
						<xsl:if test="@offset">
							<line class="offset">
								<xsl:attribute name="x1">0</xsl:attribute>
								<xsl:attribute name="y1">0</xsl:attribute>
								<xsl:attribute name="x2">
									<xsl:value-of select="substring-before(concat(@offset,','),',')" />
								</xsl:attribute>
								<xsl:attribute name="y2">
									<xsl:value-of select="substring-after(@offset,',')" />
								</xsl:attribute>
							</line>
							<circle class="offset" r="6" />
						</xsl:if>
						<g onmouseout="hide_portal_coords()">
							<xsl:attribute name="onmousemove">
								<xsl:value-of select="concat('show_portal_coords(evt,',@x,',',@z,',&quot;',@name,'&quot;)')" />
							</xsl:attribute>
							<xsl:if test="@offset">
								<xsl:attribute name="transform">
									<xsl:value-of select="concat('translate(',@offset,')')" />
								</xsl:attribute>
							</xsl:if>
							<circle r="16">
								<xsl:attribute name="class">
									<xsl:if test="contains(@status, 'uninhabited')">portal_abandoned</xsl:if>
									<xsl:if test="not(contains(@status, 'uninhabited'))">portal</xsl:if>
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
									<xsl:if test="string-length(@abbr) &gt; 2 and contains(@status, 'uninhabited')">portal_abandoned_small</xsl:if>
									<xsl:if test="string-length(@abbr) &lt; 3 and contains(@status, 'uninhabited')">portal_abandoned</xsl:if>	
									<xsl:if test="string-length(@abbr) &lt; 3 and not(contains(@status, 'uninhabited'))">portal</xsl:if>
									<xsl:if test="string-length(@abbr) &gt; 2 and not(contains(@status, 'uninhabited'))">portal_small</xsl:if>
								</xsl:attribute>
								<xsl:value-of select="@abbr" />
							</text>
						</g>
					</g>
				</xsl:for-each>
			</g>

			
			<g id="portal_coords" visibility="hidden" x="0" y="0">
				<rect class="portal_coords" x="-100" y="-17" width="200" height="55" filter="url(#dropshadow)"/>
				<text class="portal_coords_name" id="portal_coords_name" >Unknown</text>
				<text class="portal_coords" y="18" id="portal_coords_nether">N: 0,0</text>
				<text class="portal_coords" y="34" id="portal_coords_overworld">O: 0,0</text>
			</g>
		</g>
		<script type="text/ecmascript">
		<![CDATA[
			portal_coords = document.getElementById('portal_coords');
			portal_coords_nether = document.getElementById('portal_coords_nether');
			portal_coords_overworld = document.getElementById('portal_coords_overworld');
			portal_coords_name = document.getElementById('portal_coords_name');
		]]>
		</script>	
	</svg>
</xsl:template>
</xsl:stylesheet> 
