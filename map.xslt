<?xml version="1.0"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
 "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">

		<!--CivCraft Nether Roads Map -->
		<!--Managed at https://github.com/hpoom/Nether-Roads-Map -->
		<!--Hosted at http://www.hpoom.co.uk/CivCraft/map.php -->

		<!-- Town List -->

		<xsl:variable name="scale" select=".1" />
		<xsl:variable name="mapsize" select="10000" />
    <svg 
	    xmlns:svg="http://www.w3.org/2000/svg"
    	xmlns="http://www.w3.org/2000/svg" 
    	version="1.1"
			xmlns:xlink="http://www.w3.org/1999/xlink" 
			onload="init(evt)"
   	 	width="1024"
    	height="600"
			>
			
			<!-- onload="init(evt)"   	viewBox="0 0 100% 100%"-->
			
<!-- 			<xsl:attribute name="width"> -->
<!-- 				<xsl:value-of select="2 * $mapsize * $scale" /> -->
<!-- 			</xsl:attribute> -->
<!-- 			<xsl:attribute name="height"> -->
<!-- 				<xsl:value-of select="2 * $mapsize * $scale" /> -->
<!-- 			</xsl:attribute> -->
   
  <style type="text/css">
				<![CDATA[
			 		.territory:hover{
						fill:           #22aa44;
					}
					
				  .compass{
						fill:  #fff;
						stroke:  #000;
						stroke-width:  1.5;
					}

				  .button{
						fill:  #225EA8;
						stroke:  #0C2C84;
						stroke-miterlimit:	6;
						stroke-linecap:  round;
					}
				  .button:hover{
						stroke-width:  2;
					}
				  .plus-minus{
						fill:  #fff;
						pointer-events: none;
					}

					text.title {
						fill: black;
						font-weight: bold;
						font-size: 24px;
						font-family: sans-serif;
						text-anchor: middle;
					}

					text.link {
						fill: Black;
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
						font-family: sans-serif;
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

						stroke: #c0c;
						stroke-width: 4;
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
						stroke-width: 3;
						stroke-dasharray: 4, 1, 4, 1;
					}

					polyline.rail {
						fill:none;
						stroke-width: 6;
					}


					polyline.river {
						fill:none;
						stroke:#D6ECF2;
						stroke-width: 3;
					}

					polyline.canal {
						fill:none;
						stroke:#0060f0;
						stroke-width: 3;
					}

					rect.background {
						fill: none;
						stroke: gray;
						stroke-width: 1;
					}

					text.range {
						fill: gray;
						font-size: 25px;
						text-anchor: end;
					}

					text.range_v {
						fill: gray;
						font-size: 25px;
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
						stroke-opacity:1;
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
						fill: #E87600;
					}
					
					.draggable {
        		cursor: move;
      		}
				]]>
			</style>
			<script type="text/ecmascript"><![CDATA[

					var transMatrix = [.5,0,0,.5,12,-200];					
					var selectedElement = 0;
					var currentX = 0;
					var currentY = 0;
					var currentMatrix = 0;

					function selectElement(evt) {
						selectedElement = evt.target;
						currentX = evt.clientX;
						currentY = evt.clientY;
						currentMatrix = selectedElement.getAttributeNS(null, "transform").slice(7,-1).split(' ');
		
						for(var i=0; i<currentMatrix.length; i++) {
							currentMatrix[i] = parseFloat(currentMatrix[i]);
						}
				
						selectedElement.setAttributeNS(null, "onmousemove", "moveElement(evt)");
						selectedElement.setAttributeNS(null, "onmouseout", "deselectElement(evt)");
						selectedElement.setAttributeNS(null, "onmouseup", "deselectElement(evt)");
					}
				
					function moveElement(evt) {
						var dx = evt.clientX - currentX;
						var dy = evt.clientY - currentY;
						currentMatrix[4] += dx;
						currentMatrix[5] += dy;
			
						selectedElement.setAttributeNS(null, "transform", "matrix(" + currentMatrix.join(' ') + ")");
						currentX = evt.clientX;
						currentY = evt.clientY;
					}
				
					function deselectElement(evt) {
						if(selectedElement != 0){
							selectedElement.removeAttributeNS(null, "onmousemove");
							selectedElement.removeAttributeNS(null, "onmouseout");
							selectedElement.removeAttributeNS(null, "onmouseup");
							selectedElement = 0;
						}
					}
						
					function init(evt)
					{
						if ( window.svgDocument == null )
						{
							svgDoc = evt.target.ownerDocument;

						}
						            mapMatrix = svgDoc.getElementById("map-matrix");
												width  = evt.target.getAttributeNS(null, "width");
												height = evt.target.getAttributeNS(null, "height");
					}
						
	        function pan(dx, dy)
					{

						transMatrix[4] += dx;
						transMatrix[5] += dy;

						newMatrix = "matrix(" +  transMatrix.join(' ') + ")";
						mapMatrix.setAttributeNS(null, "transform", newMatrix);
					}
										
					function zoom(size)
					{
						for (var i=0; i<transMatrix.length; i++)
						{
							transMatrix[i] *= size;
						}
									transMatrix[4] += (1-size)*width/2;
									transMatrix[5] += (1-size)*height/2;

									newMatrix = "matrix(" +  transMatrix.join(' ') + ")";
									mapMatrix.setAttributeNS(null, "transform", newMatrix);
					}

					function show_Town_coords(evt, x, y, scale, name)
					{
						Town_coords_name.textContent = name;
						Town_coords_overworld.textContent = (x) + "," + (y);
						Town_coords.setAttribute("transform", "translate(" + ( x * scale)+ "," + (y * scale + 34) + ")");
						Town_coords.setAttributeNS(null, "visibility", "visible");
					}

					function hide_Town_coords()
					{
						Town_coords.setAttributeNS(null, "visibility", "hidden");
					}

					function show_Town_coords_citylist(evt, x, y, name,c,r)
					{
						Town_coords_name_citylist.textContent = name;
						Town_coords_overworld_citylist.textContent = (x) + "," + (y);
						Town_coords_citylist.setAttribute("transform", "translate(" + c + "," + (r + 34) + ")");
						Town_coords_citylist.setAttributeNS(null, "visibility", "visible");
					}

					function hide_Town_coords_citylist()
					{
						Town_coords_citylist.setAttributeNS(null, "visibility", "hidden");
					}

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
					
					function toggleVisibilitymapkey()
					{
						var road_historic = document.getElementById("mapkey");
						road_historic.style.display = "";
						if(road_historic.style.visibility == "hidden" ) {
							road_historic.style.visibility = "visible";
						}else{
							road_historic.style.visibility = "hidden";
						}

						var invert1 = document.getElementById("invert9");
						invert1.style.display = "";
						if(invert1.style.stroke == "white" ) {
							invert1.style.stroke = "black";
						}else{
							invert1.style.stroke = "white";
						}

						var invert2 = document.getElementById("invert10");
						invert2.style.display = "";
						if(invert2.style.stroke == "black" ) {
							invert2.style.stroke = "white";
						}else{
							invert2.style.stroke = "black";
						}
					}

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
			
			<!-- Drop shadow used for a couple of things below -->
			<defs>
				<filter id="dropshadow" height="130%">
					<feGaussianBlur in="SourceAlpha" stdDeviation="2" />
					<feOffset dx="2" dy="2" result="offsetblur" />
					<feMerge>
						<feMergeNode />
						<feMergeNode in="SourceGraphic" />
					</feMerge>
				</filter>
			</defs>
			
			<rect style="stroke: none; stroke-width:2; fill:white" x="1" y="1" width="1022" height="598"/>

			<g id="map-matrix"  transform="matrix(.5 0 0 .5 12 -200)" onmousedown="selectElement(evt)">        
				<rect style="fill:white">
					<xsl:attribute name="x">
						<xsl:value-of select="0"/>
					</xsl:attribute>
					<xsl:attribute name="y">
						<xsl:value-of select="0"/>
					</xsl:attribute>

					<xsl:attribute name="height">
						<xsl:value-of select="2 * $mapsize * $scale"/>
					</xsl:attribute>
					<xsl:attribute name="width">
						<xsl:value-of select="2 * $mapsize * $scale"/>
					</xsl:attribute>
				</rect>
				<g>
					<xsl:attribute name="transform">
						<xsl:value-of	select="concat('translate(',$mapsize * $scale,',',$mapsize * $scale,')')" />
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
										<xsl:value-of select="@x*$scale" />
										<xsl:text>,</xsl:text>
										<xsl:value-of select="@z*$scale" />
										<xsl:text> </xsl:text>
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
										<xsl:value-of select="@x*$scale" />
										<xsl:text>,</xsl:text>
										<xsl:value-of select="@z*$scale" />
										<xsl:text> </xsl:text>
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
										<xsl:value-of select="@x*$scale" />
										<xsl:text>,</xsl:text>
										<xsl:value-of select="@z*$scale" />
										<xsl:text> </xsl:text>
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

					<xsl:for-each select="map/Lables/Mapmarkers/Marker">
					
						<line style="stroke:gray;stroke-width:1">						
							<xsl:attribute name="x1">
								<xsl:value-of select="(@value * $scale)"/>
							</xsl:attribute>
							<xsl:attribute name="y1">
								<xsl:value-of select="($mapsize * $scale)"/>
							</xsl:attribute>							
							<xsl:attribute name="x2">
								<xsl:value-of select="(@value * $scale)"/>
							</xsl:attribute>
							<xsl:attribute name="y2">
								<xsl:value-of select="(-$mapsize * $scale)"/>
							</xsl:attribute>						
						</line>
						
						<line style="stroke:gray;stroke-width:1">						
							<xsl:attribute name="x1">
								<xsl:value-of select="-(@value * $scale)"/>
							</xsl:attribute>
							<xsl:attribute name="y1">
								<xsl:value-of select="($mapsize * $scale)"/>
							</xsl:attribute>							
							<xsl:attribute name="x2">
								<xsl:value-of select="(-@value * $scale)"/>
							</xsl:attribute>
							<xsl:attribute name="y2">
								<xsl:value-of select="(-$mapsize * $scale)"/>
							</xsl:attribute>						
						</line>
						
						<line style="stroke:gray;stroke-width:1">						
							<xsl:attribute name="y1">
								<xsl:value-of select="(@value * $scale)"/>
							</xsl:attribute>
							<xsl:attribute name="x1">
								<xsl:value-of select="($mapsize * $scale)"/>
							</xsl:attribute>							
							<xsl:attribute name="y2">
								<xsl:value-of select="(@value * $scale)"/>
							</xsl:attribute>
							<xsl:attribute name="x2">
								<xsl:value-of select="(-$mapsize * $scale)"/>
							</xsl:attribute>						
						</line>

						
						<line style="stroke:gray;stroke-width:1">						
							<xsl:attribute name="y1">
								<xsl:value-of select="-(@value * $scale)"/>
							</xsl:attribute>
							<xsl:attribute name="x1">
								<xsl:value-of select="($mapsize * $scale)"/>
							</xsl:attribute>							
							<xsl:attribute name="y2">
								<xsl:value-of select="(-@value * $scale)"/>
							</xsl:attribute>
							<xsl:attribute name="x2">
								<xsl:value-of select="(-$mapsize * $scale)"/>
							</xsl:attribute>						
						</line>
						
						<text class="range">
							<xsl:attribute name="transform">
								<xsl:value-of select="concat('translate(',(-5),',',(-$mapsize * $scale+25),')')" />
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
								<xsl:value-of select="concat('translate(',(-$mapsize * $scale+95),',',(-5),')')" />
							</xsl:attribute>
							<xsl:attribute name="y">
								<xsl:value-of select="@value*$scale" />
							</xsl:attribute>
							<xsl:value-of select="@value" />
						</text>

						<text class="range">
							<xsl:attribute name="transform">
								<xsl:value-of select="concat('translate(',(-5),',',(-$mapsize * $scale+25),')')" />
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
								<xsl:value-of select="concat('translate(',(-$mapsize * $scale+95),',',(-5),')')" />
							</xsl:attribute>
							<xsl:attribute name="y">
								<xsl:value-of select="-@value*$scale" />
							</xsl:attribute>
							<xsl:value-of select="-@value" />
						</text>

					</xsl:for-each>
					
					<line style="stroke:gray;stroke-width:2">						
						<xsl:attribute name="x1">
							<xsl:value-of select="0"/>
						</xsl:attribute>
						<xsl:attribute name="y1">
							<xsl:value-of select="($mapsize * $scale)"/>
						</xsl:attribute>							
						<xsl:attribute name="x2">
							<xsl:value-of select="0"/>
						</xsl:attribute>
						<xsl:attribute name="y2">
							<xsl:value-of select="(-$mapsize * $scale)"/>
						</xsl:attribute>						
					</line>
					
					<line style="stroke:gray;stroke-width:2">						
						<xsl:attribute name="y1">
							<xsl:value-of select="0"/>
						</xsl:attribute>
						<xsl:attribute name="x1">
							<xsl:value-of select="($mapsize * $scale)"/>
						</xsl:attribute>							
						<xsl:attribute name="y2">
							<xsl:value-of select="0"/>
						</xsl:attribute>
						<xsl:attribute name="x2">
							<xsl:value-of select="(-$mapsize * $scale)"/>
						</xsl:attribute>						
					</line>
					
					<rect style="stroke: gray; stroke-width:1; fill:none">
						<xsl:attribute name="x">
							<xsl:value-of select="-$mapsize * $scale"/>
						</xsl:attribute>
						<xsl:attribute name="y">
							<xsl:value-of select="-$mapsize * $scale"/>
						</xsl:attribute>

						<xsl:attribute name="height">
							<xsl:value-of select="2 * $mapsize * $scale"/>
						</xsl:attribute>
						<xsl:attribute name="width">
							<xsl:value-of select="2 * $mapsize * $scale"/>
						</xsl:attribute>
					</rect>
					
				</g>

				

				<g>
					<xsl:attribute name="transform">
						<xsl:value-of select="concat('translate(',($mapsize * $scale),',',($mapsize * $scale),')')" />
					</xsl:attribute>

					<!-- Roads -->
					<!--Official Roads -->

					<g id="road_offical">
						<xsl:for-each select="map/Roads/Offical/Road">
							<polyline class="road">
								<xsl:attribute name="points">
									<xsl:for-each select="Point">
										<xsl:value-of select="@x*$scale" />
										<xsl:text>,</xsl:text>
										<xsl:value-of select="@z*$scale" />
										<xsl:text> </xsl:text>
									</xsl:for-each>
								</xsl:attribute>
							</polyline>
						</xsl:for-each>
					</g>

					<!--Unofficial Roads -->
					<g id="road_unofficial" style="visibility: hidden;">
						<xsl:for-each select="map/Roads/Unoffical/Road">
							<polyline class="road_unofficial">
								<xsl:attribute name="points">
									<xsl:for-each select="Point">
										<xsl:value-of select="@x*$scale" />
										<xsl:text>,</xsl:text>
										<xsl:value-of select="@z*$scale" />
										<xsl:text> </xsl:text>
									</xsl:for-each>
								</xsl:attribute>
							</polyline>
						</xsl:for-each>
					</g>

					<!--Historic Roads -->
					<g id="road_historic" style="visibility: hidden;">
						<xsl:for-each select="map/Roads/Historic/Road">
							<polyline class="road_historic">
								<xsl:attribute name="points">
									<xsl:for-each select="Point">
										<xsl:value-of select="@x*$scale" />
										<xsl:text>,</xsl:text>
										<xsl:value-of select="@z*$scale" />
										<xsl:text> </xsl:text>
									</xsl:for-each>
								</xsl:attribute>
							</polyline>
						</xsl:for-each>
					</g>

					<!--Rails -->

					<g id="railline">
						<xsl:for-each select="map/Roads/Rails/Rail">
							<polyline class="rail">
								<xsl:attribute name="points">
									<xsl:for-each select="Point">
										<xsl:value-of select="@x*$scale" />
										<xsl:text>,</xsl:text>
										<xsl:value-of select="@z*$scale" />
										<xsl:text> </xsl:text>
									</xsl:for-each>
								</xsl:attribute>
								<xsl:attribute name="stroke">
									<xsl:value-of select="@color" />
								</xsl:attribute>
							</polyline>
						</xsl:for-each>
					</g>


					<!--Canals -->
					<g id="roadcanal">
						<xsl:for-each select="map/Roads/Canals/Road">
							<polyline class="canal">
								<xsl:attribute name="points">
									<xsl:for-each select="Point">
										<xsl:value-of select="@x*$scale" />
										<xsl:text>,</xsl:text>
										<xsl:value-of select="@z*$scale" />
										<xsl:text> </xsl:text>
									</xsl:for-each>
								</xsl:attribute>
							</polyline>
						</xsl:for-each>
					</g>


					<!-- Towns Inhabited -->
					<g id="town_inhabited">
						<xsl:for-each select="map/Towns/Inhabited/Town">
							<g onmouseout="hide_Town_coords()">
								<xsl:attribute name="transform">
									<xsl:value-of select="concat('translate(',@x * $scale,',',@z * $scale,')')" />
								</xsl:attribute>

								<xsl:attribute name="onmousemove">
									<xsl:value-of	select="concat('show_Town_coords(evt,',@x,',',@z,',',$scale,',','&quot;',@name,'&quot;)')" />
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
										<path class="lock_shackle" d="M6 0 L 6 -7 Q 14 -20 22 -7 L 22 0" />
										f
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
							<g onmouseout="hide_Town_coords()">
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
										<path class="lock_shackle" d="M6 0 L 6 -7 Q 14 -20 22 -7 L 22 0" />
										f
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

					<g id="Town_coords" visibility="hidden">
						<rect class="Town_coords" x="-100" y="-17" width="200" height="55"
							filter="url(#dropshadow)" />
						<text class="Town_coords_name" y="5" id="Town_coords_name">Unknown</text>
						<text class="Town_coords" y="28" id="Town_coords_overworld">O: 0,0</text>
					</g>
				</g>
				<script type="text/ecmascript">
				<![CDATA[
					Town_coords = document.getElementById('Town_coords');
					Town_coords_overworld = document.getElementById('Town_coords_overworld');
					Town_coords_name = document.getElementById('Town_coords_name');
				]]>
				</script>
			</g>
			
			<!--navigation-->
			<g transform="translate(30,30)" filter="url(#dropshadow)">
				<g transform="translate(69,69) scale(.3)" filter="url(#dropshadow)">
					<path class="roadcrew_sign_background" d="M-200 0 L0 200 L200 0 L0 -200 Z" />
					<path transform="scale(0.97)" class="roadcrew_sign_border"
					d="M-190 -10 Q -200 0 -190 10 L -10 190 Q 0 200 10 190 L 190 10 Q 200 0 190 -10 L 10 -190 Q 0 -200 -10 -190 Z" />
					<g transform="translate(0,-45)">
						<text class="roadcrew_sign">
							<tspan x="0" y="25">CIVCRAFT</tspan>
							<tspan x="0" y="85">ROADCREW</tspan>
						</text>
					</g>
				</g>
				<g transform="translate(19,-22)">
					<path class="button" onclick="pan( 0, 50)" d="M50 10 l12   20 a40, 70 0 0,0 -24,  0z" />
				</g>
				<g transform="translate(-22,19)">
					<path class="button" onclick="pan( 50, 0)" d="M10 50 l20  -12 a70, 40 0 0,0   0, 24z" />
				</g>
				<g transform="translate(19,60)">
					<path class="button" onclick="pan( 0,-50)" d="M50 90 l12  -20 a40, 70 0 0,1 -24,  0z" />
				</g>
				<g transform="translate(60,19)">
					<path class="button" onclick="pan(-50, 0)" d="M90 50 l-20 -12 a70, 40 0 0,1   0, 24z" />
				</g>
				
				<circle class="button"  cx="69" cy="103" r="8" onclick="zoom(0.8)"/>
				<circle class="button"  cx="69" cy="35" r="8" onclick="zoom(1.25)"/>
	
				<rect class="plus-minus" x="65" y="101.5" width="8" height="3"/>
				<rect class="plus-minus" x="65" y="33.5" width="8" height="3"/>
				<rect class="plus-minus" x="67.5" y="31" width="3" height="8"/>
			</g>
			
						<!-- Buttons -->

			<g transform="translate(925,65) scale(1)">
				<!--CityList -->
				<g transform="translate(0, 0)" onclick="toggleVisibilitycitylist();"
					filter="url(#dropshadow)">
					<rect class="toggleButton" x="-50" y="-25" width="100" height="50" />
					<rect style="stroke: black; stroke-width:2; fill:none" x="-48" y="-23" width="96" height="46"/>
					<g id="invert3" style="stroke: white">
						<line x1="-50" y1="-25" x2="49" y2="-25" stroke-width="1" />
						<!-- Top Line -->
						<line x1="-50" y1="-25" x2="-50" y2="24" stroke-width="1" />
						<!-- Left Line -->
					</g>
					<g id="invert4" style="stroke: black">
						<line x1="50" y1="-25" x2="50" y2="25" stroke-width="1" />
						<!-- Right Line -->
						<line x1="-50" y1="25" x2="50" y2="25" stroke-width="1" />
						<!-- Bottom Line -->
					</g>

					<g>
						<text class="scale">
							<tspan x="-30" y="-2">Show</tspan>
							<tspan x="-30" y="12">City List</tspan>
							<tspan x="-30" y="17">
							</tspan>
						</text>
					</g>
				</g>
			
				<g transform="translate(0, 70)" onclick="toggleVisibilitymapkey();"
					filter="url(#dropshadow)">
					<rect class="toggleButton" x="-50" y="-25" width="100" height="50" />
					<rect style="stroke: black; stroke-width:2; fill:none" x="-48" y="-23" width="96" height="46"/>
					<g id="invert9" style="stroke: white">
						<line x1="-50" y1="-25" x2="49" y2="-25" stroke-width="1" />
						<!-- Top Line -->
						<line x1="-50" y1="-25" x2="-50" y2="24" stroke-width="1" />
						<!-- Left Line -->
					</g>
					<g id="invert10" style="stroke: black">
						<line x1="50" y1="-25" x2="50" y2="25" stroke-width="1" />
						<!-- Right Line -->
						<line x1="-50" y1="25" x2="50" y2="25" stroke-width="1" />
						<!-- Bottom Line -->
					</g>

					<g>
						<text class="scale">
							<tspan x="-30" y="-2">Show</tspan>
							<tspan x="-30" y="12">Map Key</tspan>
							<tspan x="-30" y="17">
							</tspan>
						</text>
					</g>
				</g>

				<!-- Unofficial Road Toggle Button -->
				<g transform="translate(0, 140)" onclick="toggleVisibilityUnofficial();"
					filter="url(#dropshadow)">
					<rect class="toggleButton" x="-50" y="-25" width="100" height="50" />
					<rect style="stroke: black; stroke-width:2; fill:none" x="-48" y="-23" width="96" height="46"/>
					<g id="invert5" style="stroke: white">
						<line x1="-50" y1="-25" x2="49" y2="-25" stroke-width="1" />
						<!-- Top Line -->
						<line x1="-50" y1="-25" x2="-50" y2="24" stroke-width="1" />
						<!-- Left Line -->
					</g>
					<g id="invert6" style="stroke: black">
						<line x1="50" y1="-25" x2="50" y2="25" stroke-width="1" />
						<!-- Right Line -->
						<line x1="-50" y1="25" x2="50" y2="25" stroke-width="1" />
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
			
				<!-- Historic Road Toggle Button -->
				<g transform="translate(1, 210)" onclick="toggleVisibility();" filter="url(#dropshadow)">
					<rect class="toggleButton" x="-50" y="-25" width="100" height="50" />
					<rect style="stroke: black; stroke-width:2; fill:none" x="-48" y="-23" width="96" height="46"/>

					<g id="invert1" style="stroke: white">
						<line x1="-50" y1="-25" x2="49" y2="-25" stroke-width="1" />
						<!-- Top Line -->
						<line x1="-50" y1="-25" x2="-50" y2="24" stroke-width="1" />
						<!-- Left Line -->
					</g>
					<g id="invert2" style="stroke: black">
						<line x1="50" y1="-25" x2="50" y2="25" stroke-width="1" />
						<!-- Right Line -->
						<line x1="-50" y1="25" x2="50" y2="25" stroke-width="1" />
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


			<!-- Uninhabited Toggle Button -->

			<g transform="translate(0, 280)" onclick="toggleVisibilityUninhabited();"
				filter="url(#dropshadow)">
				<rect class="toggleButton" x="-50" y="-25" width="100" height="50" />
				<rect style="stroke: black; stroke-width:2; fill:none" x="-48" y="-23" width="96" height="46"/>
				<g id="invert7" style="stroke: white">
					<line x1="-50" y1="-25" x2="49" y2="-25" stroke-width="1" />
					<!-- Top Line -->
					<line x1="-50" y1="-25" x2="-50" y2="24" stroke-width="1" />
					<!-- Left Line -->
				</g>
				<g id="invert8" style="stroke: black">
					<line x1="50" y1="-25" x2="50" y2="25" stroke-width="1" />
					<!-- Right Line -->
					<line x1="-50" y1="25" x2="50" y2="25" stroke-width="1" />
					<!-- Bottom Line -->
				</g>
				<g>
					<text class="scale">
						<tspan x="-43" y="-7">Show</tspan>
						<tspan x="-43" y="5">Uninhabited</tspan>
						<tspan x="-43" y="17">Towns</tspan>
					</text>
				</g>
			</g>
		</g>


			<!-- citylist -->
			<g id="citylist" transform="translate(230, 70) scale(1)" style="visibility: hidden;">
				<rect x="-30" y="-30" height="490" class="citylist" filter="url(#dropshadow)">
					<xsl:attribute name="width">
						<xsl:value-of select="630" />
					</xsl:attribute>
				</rect>

				<xsl:for-each select="map/Towns/Inhabited/Town">
					<xsl:variable name="i">
						<xsl:number count="map/Towns/Inhabited/Town" />
					</xsl:variable>
					<xsl:variable name="x" select="floor(($i - 1) div 13.0)" />
					<xsl:variable name="y" select="($i - 1) - ($x * 13.0)" />
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
								<path class="lock_shackle" d="M6 0 L 6 -7 Q 14 -20 22 -7 L 22 0" />
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
			</g>
			
			<!-- mapkey -->
			
			<g id="mapkey" transform="translate(230, 70) scale(1)" style="visibility: hidden;">
				<rect x="-30" y="-30" height="490" width ="630" class="citylist" filter="url(#dropshadow)"/>
				<g transform="translate(0,100)">
					<g transform="translate(0,0)">
						<polyline class="road" points="0,0 470,0"/>
						<g transform="translate(465, 5)">
							<rect style="fill: #E87600;" x="-10" y="-22" width="120" height="32" filter="url(#dropshadow)"/>
							<rect style="stroke: black; stroke-width:2; fill:none" x="-8" y="-20" width="117" height="29"/>
							<text class="scale">
								<tspan x="0" y="-1">Offical Road</tspan>
							</text>
						</g>
					</g>
				
					<g transform="translate(0,50)">
						<polyline class="rail" stroke="#669966" points="0,0 470,0"/>
						<g transform="translate(465, 5)">
							<rect style="fill: #E87600;" x="-10" y="-22" width="120" height="32" filter="url(#dropshadow)"/>
							<rect style="stroke: black; stroke-width:2; fill:none" x="-8" y="-20" width="117" height="29"/>
							<text class="scale">
								<tspan x="0" y="-1">Rail Road</tspan>
							</text>
						</g>
					</g>
				
					<g transform="translate(0,100)">
						<polyline class="canal" points="0,0 470,0"/>
						<g transform="translate(465, 5)">
							<rect style="fill: #E87600;" x="-10" y="-22" width="120" height="32" filter="url(#dropshadow)"/>
							<rect style="stroke: black; stroke-width:2; fill:none" x="-8" y="-20" width="117" height="29"/>
							<text class="scale">
								<tspan x="0" y="-1">Canal</tspan>
							</text>
						</g>
					</g>
				
					<g transform="translate(0,150)">
						<polyline class="road_unofficial" points="0,0 470,0"/>
						<g transform="translate(465, 5)">
							<rect style="fill: #E87600;" x="-10" y="-22" width="120" height="32" filter="url(#dropshadow)"/>
							<rect style="stroke: black; stroke-width:2; fill:none" x="-8" y="-20" width="117" height="29"/>
							<text class="scale">
								<tspan x="0" y="-1">Unoffical Road</tspan>
							</text>
						</g>
					</g>
				
					<g transform="translate(0,200)">
						<polyline class="road_historic" points="0,0 470,0"/>
						<g transform="translate(465, 5)">
							<rect style="fill: #E87600;" x="-10" y="-22" width="120" height="32" filter="url(#dropshadow)"/>
							<rect style="stroke: black; stroke-width:2; fill:none" x="-8" y="-20" width="117" height="29"/>
							<text class="scale">
								<tspan x="0" y="-1">Historic Road</tspan>
							</text>
						</g>
					</g>				
				</g>
			</g>
			
			<g transform="translate(512, 585)">
				<rect style="fill: #E87600;" x="-205" y="-18" width="410" height="25" filter="url(#dropshadow)"/>
				<rect style="stroke: black; stroke-width:2; fill:none" x="-202" y="-16" width="405" height="21"/>
				<a xlink:href="http://www.reddit.com/r/CivcraftRoads" target="_blank">
					<text class="link">
						w w w . r e d d i t . c o m / r / C i v c r a f t R o a
						d s
					</text>
				</a>
			</g>
			
			<g id="citylist" transform="translate(230, 70) scale(1)" style="visibility: hidden;">
				<g id="Town_coords_citylist" visibility="hidden">
					<rect class="Town_coords" x="-100" y="-17" width="200" height="55" filter="url(#dropshadow)" />
					<text class="Town_coords_name" y="5" id="Town_coords_name_citylist">Unknown</text>
					<text class="Town_coords" y="28" id="Town_coords_overworld_citylist">
					O: 	0,0
					</text>
				</g>
				<script type="text/ecmascript">
					<![CDATA[
						Town_coords_citylist = document.getElementById('Town_coords_citylist');
						Town_coords_overworld_citylist = document.getElementById('Town_coords_overworld_citylist');
						Town_coords_name_citylist = document.getElementById('Town_coords_name_citylist');
					]]>
				</script>
			</g>
			
			
				
			
			<g transform="translate(512, 40)">
				<rect style="fill: #E87600;" x="-150" y="-26" width="300" height="34" filter="url(#dropshadow)"/>
				<rect style="stroke: black; stroke-width:2; fill:none" x="-148" y="-24" width="296" height="30"/>
				<text class="title">
					<tspan x="0" y="0">CIVCRAFT ROAD MAP</tspan>
				</text>
			</g>
				
  		
			<rect style="stroke: black; stroke-width:2; fill:none" x="1" y="1" width="1022" height="598"/>
		</svg>
	</xsl:template>
</xsl:stylesheet>


<!-- Compass and Scale -->
<!--<g transform="translate(320, 100)"> <text class="compass" y="-72">North</text> 
	<g transform="translate(0, 20)"> <polygon class="compass_north" transform="translate(0, 
	-10) rotate(180,0,-40) scale(2.0)" points="0,0 -20,-20 -17,-23 -3,-9 -3,-40 3,-40 
	3,-9 17,-23 20,-20" /> <polygon class="compass" transform="translate(10, 25) rotate(270,0,-40)" 
	points="0,0 -20,-20 -17,-23 -3,-9 -3,-40 3,-40 3,-9 17,-23 20,-20" /> <polygon class="compass" 
	transform="translate(0, 35) rotate( 0,0,-40)" points="0,0 -20,-20 -17,-23 -3,-9 -3,-40 
	3,-40 3,-9 17,-23 20,-20" /> <polygon class="compass" transform="translate(-10,25) 
	rotate( 90,0,-40)" points="0,0 -20,-20 -17,-23 -3,-9 -3,-40 3,-40 3,-9 17,-23 20,-20" 
	/> </g> <g transform="translate(72,35)"> <rect class="scale_light" x="0" width="10" 
	height="10" /> <rect class="scale_dark" x="10" width="10" height="10" /> <rect class="scale_light" 
	x="20" width="10" height="10" /> <rect class="scale_dark" x="30" width="10" height="10" 
	/> <rect class="scale_light" x="40" width="10" height="10" /> <rect class="scale_dark" 
	x="50" width="10" height="10" /> <rect class="scale_light" x="60" width="10" height="10" 
	/> <rect class="scale_dark" x="70" width="10" height="10" /> <rect class="scale_light" 
	x="80" width="10" height="10" /> <rect class="scale_dark" x="90" width="10" height="10" 
	/> <rect class="scale_dark" y="-10" width="10" height="10" /> <rect class="scale_light" 
	y="-20" width="10" height="10" /> <rect class="scale_dark" y="-30" width="10" height="10" 
	/> <rect class="scale_light" y="-40" width="10" height="10" /> <rect class="scale_dark" 
	y="-50" width="10" height="10" /> <rect class="scale_light" y="-60" width="10" height="10" 
	/> <rect class="scale_dark" y="-70" width="10" height="10" /> <rect class="scale_light" 
	y="-80" width="10" height="10" /> <rect class="scale_dark" y="-90" width="10" height="10" 
	/> <text class="scale" x="0" y="24">0 Meters</text> <text class="scale_right" x="100" 
	y="24">100</text> </g> </g> -->
