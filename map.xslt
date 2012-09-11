<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
	<!--
	CivCraft Nether Roads Map
	Managed at https://github.com/hpoom/Nether-Roads-Map
	Hosted at http://www.hpoom.co.uk/CivCraft/map.php
	
	Town/Portal List
	-->
	<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="2300" height="2450" xmlns:xlink="http://www.w3.org/1999/xlink">
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
				stroke: black;
				stroke-width: 1.5;
				stroke-dasharray: 6,2;
				fill: silver;
			}
			
			text.portal {
				fill: black;
				font-size: 17px;
				font-weight: bold;
				text-anchor: middle;
			}
			
			text.portal_abandoned {
				fill: black;
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
				fill: black;
				font-size: 15px;
				font-weight: bold;
				text-anchor: middle;
			}

			text.portal_name {
				fill: black;
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
				fill: black;
			}
			
			text.portal_coords {
				font-size: 17px;
				fill: white;
				text-anchor: middle;
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
				document.getElementById("toggleMe").style.display = "";
				if(document.getElementById("toggleMe").style.visibility == "hidden" ) {
				document.getElementById("toggleMe").style.visibility = "visible";
				}else{
					document.getElementById("toggleMe").style.visibility = "hidden";
				}
				
				document.getElementById("invert1").style.display = "";
				if(document.getElementById("invert1").style.stroke == "white" ) {
				document.getElementById("invert1").style.stroke = "black";
				}else{
					document.getElementById("invert1").style.stroke = "white";
				}
				
				document.getElementById("invert2").style.display = "";
				if(document.getElementById("invert2").style.stroke == "black" ) {
				document.getElementById("invert2").style.stroke = "white";
				}else{
					document.getElementById("invert2").style.stroke = "black";
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
		<g transform="translate(1100, 60) scale(.9)">
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
		<g transform="translate(500, 60)">
			<!-- Roadcrew Sign -->
			<g transform="scale(.6)">
				<g transform="translate(210,210)" filter="url(#dropshadow)">
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
			
			<!-- RoadToggle Button -->
			<g transform="translate(280, 330)" onclick="toggleVisibility();" filter="url(#dropshadow)" >
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
					<tspan x="-18" y="-7">Toggle</tspan>
					<tspan x="-18" y="5">Historic</tspan>
					<tspan x="-18" y="17">Roads</tspan>
				</text>
				</g>
			</g>
			
			<!-- Compass and Scale -->
			<g transform="translate(320, 100)">
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
			
			<g transform="translate(320, 200)">
				<text class="title">
					<tspan x="0" y="0">Nether Road Map</tspan>
					<tspan x="0" y="30">With Public Portals</tspan>
				</text>
			</g>
			
			<g transform="translate(270, 280)">
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
		<g transform="translate(1200,1300)">
		
			<!-- Range indicators -->
			<g transform="translate(0,-1280)">
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
			</g>
			<g transform="translate(1080,4)">
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
				<line class="road_historic" x1="-583" y1="416" x2="-583" y2="395" /><!-- Kizantium Road to Nether Fort leg 2 -->
				<line class="road_historic" x1="-583" y1="395" x2="-685" y2="395" /><!-- Kizantium Road to Nether Fort leg 2 -->
				<line class="road_historic" x1="-634" y1="395" x2="-634" y2="480" /><!-- Nether Fort to Rapture leg 1 -->
				<line class="road_historic" x1="-634" y1="480" x2="-685" y2="480" /><!-- Nether Fort to Rapture leg 2 -->
				<line class="road_historic" x1="-615" y1="477" x2="-615" y2="259" /><!-- Nether Fort to Tigerstaden Intersection -->
				<line class="road_historic" x1="-208" y1="-277" x2="-73" y2="-142" /><!-- Liberty/Atlantis Road to North Hub -->
				<line class="road_historic" x1="-432" y1="308" x2="-298" y2="308" /><!-- Jack's Hold to Kinzantium Road leg 1 -->
				<line class="road_historic" x1="-298" y1="308" x2="-298" y2="316" /><!-- Jack's Hold to Kinzantium Road leg 2 -->
				<line class="road_historic" x1="1" y1="-34" x2="-8" y2="-34" /><!-- Liberty/Atlantis to Rothbard Road leg 1 -->
				<line class="road_historic" x1="-8" y1="-34" x2="-54" y2="-125" /><!-- Liberty/Atlantis to Rothbard Road leg 2 -->
			</g>
			<g>
				<line class="road_unofficial" x1="-418" y1="390" x2="-367" y2="424" /><!-- Melonwood Road leg 1 -->
				<line class="road_unofficial" x1="-367" y1="424" x2="-369" y2="500" /><!-- Melonwood Road leg 2 -->
				<line class="road" x1="-1180" y1="-545" x2="-1180" y2="-273" /><!-- North Road/Vilvos -->
				<line class="road" x1="-1178" y1="-272" x2="-1180" y2="-273" /><!-- North Road/Vilvos -->
				<line class="road" x1="-1178" y1="-151" x2="-1178" y2="-272" /><!-- North Road/Vilvos -->
				<line class="road" x1="-1169" y1="-151" x2="-1178" y2="-151" /><!-- North Road/Vilvos -->
				<line class="road" x1="-1169" y1="-151" x2="-1169" y2="-158" /><!-- North Road/Vilvos -->
				<line class="road" x1="409" y1="-518" x2="409" y2="-545" /><!-- North Road/Lazuli -->
				<line class="road_unofficial" x1="411" y1="-517" x2="531" y2="-517" /><!-- Lazuli/Atlantis -->
				<line class="road_unofficial" x1="531" y1="-680" x2="531" y2="-517" /><!-- Lazuli/Atlantis -->
				<rect x="453" y="-521" width="8" height="7" class="underpass" /><!-- Lazuli/Winterfell Underpass -->
				<line class="road" x1="57" y1="-376" x2="57" y2="-545" /><!-- North Road/Hoyt -->
				<line class="road" x1="-1" y1="-522" x2="-1" y2="-658" /><!-- North Road/Gorgeview -->
				<line class="road_unofficial" x1="4" y1="-690" x2="-1" y2="-658" /><!-- North Road/Gorgeview -->
				<line class="road" x1="15" y1="-522" x2="-8" y2="-522" /><!-- Tinto/Gorgeview -->
				<line class="road_unofficial" x1="-76" y1="-522" x2="-76" y2="-370" /><!-- In Kind/New Krumsville -->
				<line class="road_unofficial" x1="-62" y1="-370" x2="-76" y2="-370" /><!-- In Kind/New Krumsville -->
				<line class="road_unofficial" x1="-75" y1="-522" x2="-8" y2="-522" /><!-- In Kind/Tinto -->
				<line class="road" x1="-1061" y1="-709" x2="-1061" y2="-492" /><!-- Tokiestan/Immelopolis -->
				<line class="road" x1="-1180" y1="-545" x2="409" y2="-545" /><!-- North Road -->
				<line class="road" x1="-821" y1="-448" x2="-821" y2="-545" /><!-- North Road/Derpenshire -->
				<line class="road" x1="-1082" y1="-492" x2="-1061" y2="-492" /><!-- North Road/Tokiestan -->
				<line class="road" x1="-981" y1="-263" x2="-981" y2="-545" /><!-- North Road/Cutlasso's Fort -->
				<line class="road" x1="-981" y1="-263" x2="-863" y2="-145" /><!-- Cutlasso's Fort/Io -->
				<line class="road" x1="-889" y1="-171" x2="-841" y2="-171" /><!-- Cutlasso's Fort/Io -->
				<line class="road" x1="-863" y1="-145" x2="-467" y2="-145" /><!-- Io/Saga Road -->
				<line class="road" x1="-777" y1="-895" x2="-777" y2="-545" /><!-- North Road/Central City -->
				<line class="road_unofficial" x1="-808"  y1="-596" x2="-777" y2="-596" /><!-- Haven -->
				<line class="road" x1="-782" y1="-831" x2="-701" y2="-831" /><!-- Prisma -->
				<line class="road_unofficial" x1="-777"  y1="-679" x2="-706" y2="-679" /><!-- Yellow Flower / Mt Augusta -->
				<line class="road" x1="-715" y1="-721" x2="-715" y2="-679" /><!-- Yellow Flower -->
				<rect x="-717" y="-692" width="7" height="7" class="underpass" /><!-- Yellow Flower Underpass -->
				<line class="road" x1="-980" y1="-953" x2="-614" y2="-587" /><!-- Wolvania / Mt Augusta -->
				<line class="road" x1="-980" y1="-953" x2="-980" y2="-1208" /><!-- Fraustengard -->
				<line class="road" x1="-741" y1="-714" x2="-741" y2="-766" /><!-- Avernum -->
				<line class="road" x1="-614" y1="-621" x2="-616" y2="258" /><!-- Mt Augusta Road  -->
				<line class="road" x1="-614" y1="-540" x2="-159" y2="-84" /><!-- Mt Augusta Road / Liberty -->
				<line class="road" x1="-538" y1="-464" x2="-538" y2="-417" /><!-- Alpha Sierra -->
				<line class="road_unofficial" x1="148" y1="-365" x2="179" y2="-365" /><!-- Agora -->
				<line class="road_unofficial" x1="182" y1="-368" x2="179" y2="-365" /><!-- Agora -->
				<line class="road_unofficial" x1="182" y1="-368" x2="251" y2="-368" /><!-- Agora -->
				<line class="road_unofficial" x1="255" y1="-372" x2="251" y2="-368" /><!-- Agora -->
				<line class="road_unofficial" x1="255" y1="-372" x2="379" y2="-372" /><!-- Agora -->
				<line class="road_unofficial" x1="379" y1="-421" x2="379" y2="-372" /><!-- Agora -->
				<line class="road_unofficial" x1="379" y1="-421" x2="390" y2="-432" /><!-- Agora -->
				<line class="road_unofficial" x1="418" y1="-432" x2="390" y2="-432" /><!-- Agora -->
				<line class="road" x1="-159" y1="-58" x2="466" y2="-683" /><!-- Liberty/Atlantis Road -->
				<line class="road" x1="523" y1="-683" x2="466" y2="-683" /><!-- Liberty/Atlantis Road -->
				<line class="road" x1="-159" y1="-84" x2="-159" y2="-1" /><!-- Hub road near Liberty -->
				<line class="road" x1="-357" y1="-36" x2="-467" y2="-145" /><!-- Saga/Avalon -->
				<line class="road" x1="-357" y1="-121" x2="-357" y2="-1" /><!-- Saga/Avalon -->
				<line class="road" x1="-357" y1="-121" x2="-385" y2="-121" /><!-- Epicus/Avalon -->
				<line class="road" x1="-357" y1="-1" x2="0" y2="-1" /><!-- Avalon/0,0 -->
				<line class="road" x1="-92" y1="-125" x2="0" y2="-125" /><!-- Rothbard/Liberty -->
				<line class="road" x1="-920" y1="289" x2="-645" y2="289" /><!-- Atmora Road -->
				<line class="road_unofficial" x1="-436" y1="79" x2="-436" y2="308" /><!-- JH/OP North/South road -->
				<line class="road_unofficial" x1="-664" y1="308" x2="-436" y2="308" /><!-- JH East/West road -->
				<line class="road" x1="-357" y1="1" x2="-725" y2="369" /><!-- Avalon/Columbia Road -->
				<line class="road" x1="-737" y1="369" x2="-725" y2="369" /><!-- Avalon/Columbia Road Leg 1 -->
				<line class="road" x1="-737" y1="369" x2="-811" y2="443" /><!-- Avalon/Columbia Road Leg 2 -->
				<line class="road" x1="-811" y1="493" x2="-811" y2="443" /><!-- Avalon/Columbia Road Leg 3 -->
				<line class="road" x1="0" y1="-1" x2="191" y2="-187" /><!-- 0,0/Road Kink -->
				<line class="road" x1="191" y1="-187" x2="395" y2="-263" /><!-- Road Kink/Cress -->
				<line class="road" x1="395" y1="-263" x2="413" y2="-263" /><!-- Cress Road -->
				<line class="road" x1="395" y1="-263" x2="418" y2="-291" /><!-- Cress Junction -->
				<line class="road" x1="418" y1="-291" x2="418" y2="-430" /><!-- Old Rift Road -->
				<line class="road_unofficial" x1="438" y1="-498" x2="438" y2="-457" /><!-- Old Rift/Winterfell -->
				<line class="road_unofficial" x1="438" y1="-498" x2="470" y2="-530" /><!-- Old Rift/Winterfell -->
				<line class="road_unofficial" x1="470" y1="-540" x2="470" y2="-530" /><!-- Old Rift/Winterfell -->
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
				<line class="road" x1="-593" y1="237" x2="-244" y2="237" /><!-- Obsidian Plains Road -->
				<line class="road" x1="-237" y1="237" x2="-237" y2="255" /><!-- Vanahiemer Road -->
				<line class="road" x1="-244" y1="237" x2="-244" y2="0" /><!-- Vanahiemer Road -->
				<line class="road" x1="-615" y1="92" x2="-665" y2="92" /><!-- Sovngarde Road -->
				<line class="road" x1="-980" y1="-321" x2="-916" y2="-321" /><!-- Icengrad Road -->
				<line class="road" x1="0" y1="-1" x2="0" y2="850" /><!-- Valenwood/Civitivecchia -->
				<line class="road" x1="260" y1="232" x2="260" y2="150" /><!-- Fyfe -->			
				<line class="road_unofficial" x1="-782" y1="-830" x2="-782" y2="-1096" /><!-- Fraustengard -->
				<line class="road_unofficial" x1="-782" y1="-1096" x2="-879" y2="-1194" /><!-- Fraustengard -->
				<line class="road_unofficial" x1="-879" y1="-1194" x2="-985" y2="-1194" /><!-- Fraustengard -->
				<line class="road_unofficial" x1="-985" y1="-1194" x2="-985" y2="-1208" /><!-- Fraustengard -->
				<line class="road_unofficial" x1="-782" y1="-938" x2="-926" y2="-938" /><!-- Wolvania -->
				<line class="road" x1="-613" y1="-374" x2="-738" y2="-374" /><!-- Panda Towers Road -->
				<line class="road" x1="-801" y1="-816" x2="-778" y2="-816" /><!-- Xanadu Road -->
				<line class="road" x1="56" y1="-272" x2="56" y2="-332" /><!-- Liberty/Lazuli to Hoyt (official) -->
				<line class="road_unofficial" x1="56" y1="-332" x2="56" y2="-374" /><!-- Lower Hoyt Road -->
				<line class="road_unofficial" x1="-432" y1="310" x2="-432" y2="352" /><!-- Jack's Hold to Melonwood/Kinzantium road leg 1 -->
				<line class="road_unofficial" x1="-432" y1="352" x2="-418" y2="390" /><!-- Jack's Hold to Melonwood/Kinzantium road leg 2 -->
				<line class="road_unofficial" x1="-418" y1="390" x2="-411" y2="429" /><!-- Jack's Hold to Melonwood/Kinzantium road leg 3 -->
				<line class="road" x1="556" y1="543" x2="556" y2="664" /><!-- Danzig Road leg 1 -->
				<line class="road" x1="556" y1="664" x2="865" y2="974" /><!-- Danzig Road leg 2 -->
				<line class="road" x1="865" y1="974" x2="913" y2="974" /><!-- Danzig Road leg 3 -->
				<line class="road" x1="913" y1="974" x2="957" y2="1018" /><!-- Danzig Road leg 4 -->
				<line class="road" x1="957" y1="1018" x2="957" y2="1023" /><!-- Danzig Road leg 5 -->
				<line class="road_unofficial" x1="957" y1="1023" x2="935" y2="1023" /><!-- Danzig Road leg 6 -->
			</g>
			
			<!-- Portals -->
			<g>
				<xsl:for-each select="map/portals/portal">
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
									<xsl:if test="string-length(@abbr) &gt; 2">portal_small</xsl:if>
									<xsl:if test="string-length(@abbr) &lt; 3">portal</xsl:if>
								</xsl:attribute>
								<xsl:value-of select="@abbr" />
							</text>
						</g>
					</g>
				</xsl:for-each>
			</g>
			
			<g id="portal_coords" visibility="hidden" x="0" y="0">
				<text class="portal_coords_name" y="-60" id="portal_coords_name" filter="url(#dropshadow)">Unknown</text>
				<rect class="portal_coords" x="-60" y="-17" width="120" height="36" />
				<text class="portal_coords" id="portal_coords_nether">N: 0,0</text>
				<text class="portal_coords" y="14" id="portal_coords_overworld">O: 0,0</text>
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

