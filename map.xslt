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
			
			circle.Town_Uninhabited {
			stroke: #8b8989;
			stroke-width: 1.5;
			stroke-dasharray: 6,2;
			fill: white;
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
			fill: Black;
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
			
			polygon.ocean {
			fill:#D6ECF2;
			fill-opacity:1;
			stroke: #D6ECF2;
			stroke-width: 2;
			stroke-opacity: 1;
			}
			
			polygon.island {
			stroke: white;
			stroke-width: 2;
			stroke-opacity: 1;
			fill: white;
			fill-opacity:1;
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
			
			polyline.road {
			fill:none;
			
			stroke: #f6f;
			stroke-width: 3;
			}
			
			polyline.road_unofficial {
			fill:none;
			stroke: #770;
			stroke-width: 3;
			stroke-dasharray: 8, 1, 4, 1;
			}
			
			polyline.road_historic {
			fill:none;
			stroke: #ADA96E;
			stroke-width: 1.25;
			stroke-dasharray: 4, 1, 4, 1;
			}
			
			polyline.rail {
			fill:none;
			stroke-width: 6;
			}
			
			
			polyline.river {
			fill:none;
			stroke:#D6ECF2;
			stroke-width: 2;
			}
			
			polyline.canal {
			fill:none;
			stroke:#008080;
			stroke-width: 3;
			}
			
			rect.background {
			fill: none;
			stroke: gray;
			stroke-width: 1;
			}
			
			text.range {
			fill: gray;
			font-size: 11px;
			text-anchor: end;
			}
			
			text.range_v {
			fill: gray;
			font-size: 11px;
			text-anchor: end;
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
			stroke: none;
			stroke-width: 1.5;
			stroke-opacity: 1;
			fill: #D6ECF2;
			fill-opacity:1;
			}
			
			circle.mapborder {
			stroke: lightblue;
			stroke-width: 1.5;
			stroke-opacity: 1;
			fill: none;
			fill-opacity:1;
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
			
			rect.citylist {
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
		
		function show_Town_coords_citylist(evt, x, y, name,c,r)
		{
		Town_coords_name_citylist.textContent = name;
		Town_coords_nether_citylist.textContent = "N: " + x + "," + y;
		Town_coords_overworld_citylist.textContent = "O: " + (x * 8) + "," + (y * 8);
		Town_coords_citylist.setAttribute("transform", "translate(" + c + "," + (r + 34) + ")");
		Town_coords_citylist.setAttributeNS(null, "visibility", "visible");
		}
		
		function hide_Town_coords_citylist()
		{
		Town_coords_citylist.setAttributeNS(null, "visibility", "hidden");
		}
		
			]]>
		</script>
		
		<script type="text/ecmascript">
			<![CDATA[
			function toggleVisibility() 
			{
			var road_historic = document.getElementById("road_historic");
			road_historic.style.display = "";
			if(road_historic.style.visibility == "hidden" ) {
			road_historic.style.visibility = "visible";
			}else{
			road_historic.style.visibility = "hidden";
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
				var road_historic = document.getElementById("road_unofficial");
				road_historic.style.display = "";
				if(road_historic.style.visibility == "hidden" ) {
				road_historic.style.visibility = "visible";
				}else{
				road_historic.style.visibility = "hidden";
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
					var road_historic = document.getElementById("town_uninhabited");
					road_historic.style.display = "";
					if(road_historic.style.visibility == "hidden" ) {
					road_historic.style.visibility = "visible";
					}else{
					road_historic.style.visibility = "hidden";
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
			function toggleVisibilitycitylist() 
			{
			document.getElementById("citylist").style.display = "";
			if(document.getElementById("citylist").style.visibility == "hidden" ) {
			document.getElementById("citylist").style.visibility = "visible";
			}else{
			document.getElementById("citylist").style.visibility = "hidden";
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
			
			<script type="text/ecmascript">
				<![CDATA[
				function changeScale(scale change) 
				{
				
				
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
				
				<rect fill="white" x="0" y="0" width="100%" height="100%"/>
				
				<g>
					<xsl:attribute name="transform">
						<xsl:value-of select="concat('translate(',$mapsize * $scale,',',$mapsize * $scale,')')" />
					</xsl:attribute>
										
					<circle class="map">
						<xsl:attribute name="r">
							<xsl:value-of select="$mapsize * $scale" />
						</xsl:attribute>
					</circle>
					
					<!-- Islands -->
					
					<g id="island">
						<xsl:for-each select="map/Nature/Islands/Island">
							<polygon class="island">
								<xsl:attribute name="points">
									<xsl:for-each select="Point">
										<xsl:value-of select="@x*$scale"/>
										<xsl:text>,</xsl:text>
										<xsl:value-of select="@z*$scale"/>
										<xsl:text>
										</xsl:text>
									</xsl:for-each>
								</xsl:attribute>
							</polygon>
						</xsl:for-each>
					</g>
					
					<!-- Oceans -->
					
					<g id="ocean">
						<xsl:for-each select="map/Nature/Oceans/Ocean">
							<polygon class="ocean">
								<xsl:attribute name="points">
									<xsl:for-each select="Point">
										<xsl:value-of select="@x*$scale"/>
										<xsl:text>,</xsl:text>
										<xsl:value-of select="@z*$scale"/>
										<xsl:text>
										</xsl:text>
									</xsl:for-each>
								</xsl:attribute>
							</polygon>
						</xsl:for-each>
					</g>
					
					<!-- Rivers -->
					
					<g id="river">
						<xsl:for-each select="map/Nature/Rivers/River">
							<polyline class="river">
								<xsl:attribute name="points">
									<xsl:for-each select="Point">
										<xsl:value-of select="@x*$scale"/>
										<xsl:text>,</xsl:text>
										<xsl:value-of select="@z*$scale"/>
										<xsl:text>
										</xsl:text>
									</xsl:for-each>
								</xsl:attribute>
							</polyline>
						</xsl:for-each>
					</g>
					
					<!-- mapborder -->
					
					<circle class="mapborder">
						<xsl:attribute name="r">
							<xsl:value-of select="$mapsize * $scale" />
						</xsl:attribute>
					</circle>
					
					
				</g>
				
				
				
				
				<!--Grid-->
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
				</g>
				
				<g>
					<xsl:attribute name="transform">
						<xsl:value-of select="concat('translate(',($mapsize * $scale),',',($mapsize * $scale),')')" />
					</xsl:attribute>
					
					<xsl:for-each select="map/Lables/Mapmarkers/Marker">
							<text class="range">
								<xsl:attribute name="transform">
									<xsl:value-of select="concat('translate(',(-5),',',(-$mapsize * $scale+15),')')" />
								</xsl:attribute>
								<xsl:attribute name="x">
									<xsl:value-of select="@value*$scale" />
								</xsl:attribute>
								<xsl:value-of select="@value" />
							</text>
							
							<text class="range">
								<xsl:attribute name="transform">
									<xsl:value-of select="concat('translate(',(-5),',',($mapsize * $scale)-5,')')" />
								</xsl:attribute>
								<xsl:attribute name="x">
									<xsl:value-of select="@value*$scale" />
								</xsl:attribute>
								<xsl:value-of select="@value" />
							</text>
							
							<text class="range_v">
								<xsl:attribute name="transform">
									<xsl:value-of select="concat('translate(',($mapsize * $scale)-5,',',(-5),')')" />
								</xsl:attribute>							
								<xsl:attribute name="y">
									<xsl:value-of select="@value*$scale" />
								</xsl:attribute>
								<xsl:value-of select="@value" />
							</text>
						
							<text class="range_v">
								<xsl:attribute name="transform">
									<xsl:value-of select="concat('translate(',(-$mapsize * $scale+35),',',(-5),')')" />
								</xsl:attribute>							
								<xsl:attribute name="y">
									<xsl:value-of select="@value*$scale" />
								</xsl:attribute>
								<xsl:value-of select="@value" />
							</text>
							
							<text class="range">
								<xsl:attribute name="transform">
									<xsl:value-of select="concat('translate(',(-5),',',(-$mapsize * $scale+15),')')" />
								</xsl:attribute>
								<xsl:attribute name="x">
									<xsl:value-of select="-@value*$scale" />
								</xsl:attribute>
								<xsl:value-of select="-@value" />
							</text>
							
							<text class="range">
								<xsl:attribute name="transform">
									<xsl:value-of select="concat('translate(',(-5),',',($mapsize * $scale)-5,')')" />
								</xsl:attribute>
								<xsl:attribute name="x">
									<xsl:value-of select="-@value*$scale" />
								</xsl:attribute>
								<xsl:value-of select="-@value" />
							</text>
							
							<text class="range_v">
								<xsl:attribute name="transform">
									<xsl:value-of select="concat('translate(',($mapsize * $scale)-5,',',(-5),')')" />
								</xsl:attribute>							
								<xsl:attribute name="y">
									<xsl:value-of select="-@value*$scale" />
								</xsl:attribute>
								<xsl:value-of select="-@value" />
							</text>
						
							<text class="range_v">
								<xsl:attribute name="transform">
									<xsl:value-of select="concat('translate(',(-$mapsize * $scale+35),',',(-5),')')" />
								</xsl:attribute>							
								<xsl:attribute name="y">
									<xsl:value-of select="-@value*$scale" />
								</xsl:attribute>
								<xsl:value-of select="-@value" />
							</text>
							
					</xsl:for-each>
				</g>
				
				<!-- citylist -->
				<g id="citylist" transform="translate(550, 60) scale(1)" style="visibility: hidden;">
					<rect x="-30" y="-30" height="585" class="citylist" filter="url(#dropshadow)">
						<xsl:attribute name="width">
							<xsl:value-of select="200 * ceiling(count(map/Towns/Inhabited/Town) div 16.0) + 30" />
						</xsl:attribute>
					</rect>
					
					<xsl:for-each select="map/Towns/Inhabited/Town">
					<xsl:variable name="i">
						<xsl:number count="map/Towns/Inhabited/Town" />
					</xsl:variable>
					<xsl:variable name="x" select="floor(($i - 1) div 16.0)" />
					<xsl:variable name="y" select="($i - 1) - ($x * 16.0)" />
					<g onmouseout="hide_Town_coords_citylist()">
						<xsl:attribute name="onmousemove">
				<xsl:value-of select="concat('show_Town_coords_citylist(evt,',@x,',',@z,',&quot;',@name,'&quot;,',200 * $x,',',36 * $y,')')" />
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
						<text class="Town_name" x="25" y="5">
				<xsl:value-of select="@name" />
						</text>
					</g>
				</xsl:for-each>
				<g id="Town_coords_citylist" visibility="hidden" x="0" y="0">
					<rect class="Town_coords" x="-100" y="-17" width="200" height="55" filter="url(#dropshadow)"/>
					<text class="Town_coords_name" id="Town_coords_name_citylist" >Unknown</text>
					<text class="Town_coords" y="18" id="Town_coords_nether_citylist">N: 0,0</text>
					<text class="Town_coords" y="34" id="Town_coords_overworld_citylist">O: 0,0</text>
				</g>
			</g>
			<script type="text/ecmascript">
				<![CDATA[
				Town_coords_citylist = document.getElementById('Town_coords_citylist');
				Town_coords_nether_citylist = document.getElementById('Town_coords_nether_citylist');
				Town_coords_overworld_citylist = document.getElementById('Town_coords_overworld_citylist');
				Town_coords_name_citylist = document.getElementById('Town_coords_name_citylist');
					]]>
				</script>script>
				
				
					<!-- Title Block -->
					<g transform="translate(-20,0) scale(1)">
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
							<g transform="translate(80, 200)" onclick="toggleVisibility();" filter="url(#dropshadow)" >
								<rect class="toggleButton" x="-50" y="-25" width="100" height="50" />
				
								<g id="invert1" style="stroke: white">
									<line x1="-50" y1="-25" x2="49" y2="-25" stroke-width="2" />
									<!-- Top Line -->
									<line x1="-50" y1="-25" x2="-50" y2="24" stroke-width="2" />
									<!-- Left Line -->
								</g>
								<g id="invert2" style="stroke: black">
									<line x1="50" y1="-25" x2="50" y2="25" stroke-wdith="2" />
									<!-- Right Line -->
									<line x1="-50" y1="25" x2="50" y2="25" stroke-wdith="2" />
									<!-- Bottom Line -->
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
						
						<g transform="translate(440, 200)" onclick="toggleVisibilitycitylist();" filter="url(#dropshadow)" >
				<rect class="toggleButton" x="-50" y="-25" width="100" height="50" />
				
				<g id="invert3" style="stroke: white">
				<line x1="-50" y1="-25" x2="49" y2="-25" stroke-width="2" />
				<!-- Top Line -->
				<line x1="-50" y1="-25" x2="-50" y2="24" stroke-width="2" />
				<!-- Left Line -->
				</g>
				<g id="invert4" style="stroke: black">
				<line x1="50" y1="-25" x2="50" y2="25" stroke-wdith="2" />
				<!-- Right Line -->
				<line x1="-50" y1="25" x2="50" y2="25" stroke-wdith="2" />
				<!-- Bottom Line -->
				</g>
				
				<g>
					<text class="scale">
						<tspan x="-30" y="-7">Show</tspan>
						<tspan x="-30" y="5">City List</tspan>
						<tspan x="-30" y="17"></tspan>
					</text>
				</g>
						</g>
						
						<!-- Unofficial Road Toggle Button -->
						<g transform="translate(200, 200)" onclick="toggleVisibilityUnofficial();" filter="url(#dropshadow)" >
				<rect class="toggleButton" x="-50" y="-25" width="100" height="50" />
				
				<g id="invert5" style="stroke: white">
				<line x1="-50" y1="-25" x2="49" y2="-25" stroke-width="2" />
				<!-- Top Line -->
				<line x1="-50" y1="-25" x2="-50" y2="24" stroke-width="2" />
				<!-- Left Line -->
				</g>
				<g id="invert6" style="stroke: black">
				<line x1="50" y1="-25" x2="50" y2="25" stroke-wdith="2" />
				<!-- Right Line -->
				<line x1="-50" y1="25" x2="50" y2="25" stroke-wdith="2" />
				<!-- Bottom Line -->
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
						<g transform="translate(320, 200)" onclick="toggleVisibilityUninhabited();" filter="url(#dropshadow)" >
				<rect class="toggleButton" x="-50" y="-25" width="100" height="50" />
				
				<g id="invert7" style="stroke: white">
				<line x1="-50" y1="-25" x2="49" y2="-25" stroke-width="2" />
				<!-- Top Line -->
				<line x1="-50" y1="-25" x2="-50" y2="24" stroke-width="2" />
				<!-- Left Line -->
				</g>
				<g id="invert8" style="stroke: black">
				<line x1="50" y1="-25" x2="50" y2="25" stroke-wdith="2" />
				<!-- Right Line -->
				<line x1="-50" y1="25" x2="50" y2="25" stroke-wdith="2" />
				<!-- Bottom Line -->
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
						<!--<g transform="translate(320, 100)">
						<text class="compass" y="-72">North</text>
						<g transform="translate(0, 20)">
				<polygon class="compass_north" transform="translate(0, -10) rotate(180,0,-40) scale(2.0)" points="0,0 -20,-20 -17,-23 -3,-9 -3,-40 3,-40 3,-9 17,-23 20,-20" />
				<polygon class="compass" transform="translate(10, 25) rotate(270,0,-40)" points="0,0 -20,-20 -17,-23 -3,-9 -3,-40 3,-40 3,-9 17,-23 20,-20" />
				<polygon class="compass" transform="translate(0,	35) rotate(	0,0,-40)" points="0,0 -20,-20 -17,-23 -3,-9 -3,-40 3,-40 3,-9 17,-23 20,-20" />
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
					
					
						<g transform="translate(250, 145)">
				<text class="title">
					<tspan x="0" y="0">Civcraft Road Map</tspan>
				</text>
						</g>
						
						<g transform="translate(255, 165)">
				<a xlink:href="http://www.reddit.com/r/CivcraftRoads" target="_blank">
					<text class="link">
						w w w . r e d d i t . c o m / r / C i v c r a f t R o a d s
					</text>
				</a>
						</g>
					</g>
					
				<g>
					<xsl:attribute name="transform">
						<xsl:value-of select="concat('translate(',($mapsize * $scale),',',($mapsize * $scale),')')" />
					</xsl:attribute>
					
					<!-- Roads -->
					<!--Official Roads-->
					
					<g id="road_offical">
						<xsl:for-each select="map/Roads/Offical/Road">
							<polyline class="road">
					<xsl:attribute name="points">
						<xsl:for-each select="Point">
							<xsl:value-of select="@x*$scale"/>
							<xsl:text>,</xsl:text>
							<xsl:value-of select="@z*$scale"/>
							<xsl:text>
							</xsl:text>
						</xsl:for-each>
					</xsl:attribute>
							</polyline>
						</xsl:for-each>
					</g>
					
					<!--Unofficial Roads-->
					<g id="road_unofficial" style="visibility: hidden;">
						<xsl:for-each select="map/Roads/Unoffical/Road">
							<polyline class="road_unofficial">
					<xsl:attribute name="points">
						<xsl:for-each select="Point">
							<xsl:value-of select="@x*$scale"/>
							<xsl:text>,</xsl:text>
							<xsl:value-of select="@z*$scale"/>
							<xsl:text>
							</xsl:text>
						</xsl:for-each>
					</xsl:attribute>
							</polyline>
						</xsl:for-each>
					</g>
					
					<!--Historic Roads-->
					<g id="road_historic" style="visibility: hidden;">
						<xsl:for-each select="map/Roads/Historic/Road">
							<polyline class="road_historic">
					<xsl:attribute name="points">
						<xsl:for-each select="Point">
							<xsl:value-of select="@x*$scale"/>
							<xsl:text>,</xsl:text>
							<xsl:value-of select="@z*$scale"/>
							<xsl:text>
							</xsl:text>
						</xsl:for-each>
					</xsl:attribute>
							</polyline>
						</xsl:for-each>
					</g>
					
					<!--Rails-->
					
					<g id="railline">
						<xsl:for-each select="map/Roads/Rails/Rail">
							<polyline class="rail">
					<xsl:attribute name="points">
						<xsl:for-each select="Point">
							<xsl:value-of select="@x*$scale"/>
							<xsl:text>,</xsl:text>
							<xsl:value-of select="@z*$scale"/>
							<xsl:text>
							</xsl:text>
						</xsl:for-each>
					</xsl:attribute>
					<xsl:attribute name="stroke">
						<xsl:value-of select="@color"/>
					</xsl:attribute>
							</polyline>
						</xsl:for-each>
					</g>					 
					
					
					<!--Canals-->
					<g id="road_canal">
						<xsl:for-each select="map/Roads/Canals/Road">
							<polyline class="canal"> 
					<xsl:attribute name="points">
						<xsl:for-each select="Point">
							<xsl:value-of select="@x*$scale"/>
							<xsl:text>,</xsl:text>
							<xsl:value-of select="@z*$scale"/>
							<xsl:text>
							</xsl:text>
						</xsl:for-each>
					</xsl:attribute>
							</polyline>
						</xsl:for-each>
					</g>
					
					
					<!-- Towns Inhabited -->
					<g id="town_inhabited">
						<xsl:for-each select="map/Towns/Inhabited/Town">					
							<g onmouseout="hide_Town_coords()" >
					<xsl:attribute name="transform">
						<xsl:value-of select="concat('translate(',@x * $scale,',',@z * $scale,')')" />
					</xsl:attribute>
					
					<xsl:attribute name="onmousemove">
						<xsl:value-of select="concat('show_Town_coords(evt,',@x,',',@z,',',$scale,',','&quot;',@name,'&quot;)')" />
					</xsl:attribute>
					
					<circle r="16" class="Town" />
					
					<xsl:if test="contains(@status, 'griefed')">
						<g transform="translate(-16,-16) scale(.4)">
							<circle r="16" class="griefed" />
							<text y="10" class="griefed">!</text>
						</g>
					</xsl:if>
					<xsl:if test="contains(@status, 'locked')">
						<g transform="translate(8,-18) scale(.4)">
							<path class="lock" d="M0 0 L 28 0 L 28 20 L 0 20 Z" />
							<path class="lock_shackle" d="M6 0 L 6 -7 Q 14 -20 22 -7 L 22 0" />f
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
						</xsl:for-each>
					</g>
					
					<!-- Towns Uninhabited -->
					
					<g id="town_uninhabited" style="visibility: hidden;">
						<xsl:for-each select="map/Towns/Uninhabited/Town">					
							<g onmouseout="hide_Town_coords()" >
					<xsl:attribute name="transform">
						<xsl:value-of select="concat('translate(',@x * $scale,',',@z * $scale,')')" />
					</xsl:attribute>
					
					<xsl:attribute name="onmousemove">
						<xsl:value-of select="concat('show_Town_coords(evt,',@x,',',@z,',',$scale,',','&quot;',@name,'&quot;)')" />
					</xsl:attribute>
					
					<circle r="16" class="Town_Uninhabited" />
					
					<xsl:if test="contains(@status, 'griefed')">
						<g transform="translate(-16,-16) scale(.4)">
							<circle r="16" class="griefed" />
							<text y="10" class="griefed">!</text>
						</g>
					</xsl:if>
					<xsl:if test="contains(@status, 'locked')">
						<g transform="translate(8,-18) scale(.4)">
							<path class="lock" d="M0 0 L 28 0 L 28 20 L 0 20 Z" />
							<path class="lock_shackle" d="M6 0 L 6 -7 Q 14 -20 22 -7 L 22 0" />f
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
