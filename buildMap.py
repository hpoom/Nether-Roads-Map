import sys
import fileinput
from xml.etree import ElementTree
import xml.dom.minidom

# Fetch our data from Rei's points file
def fetchData():
	fdir = '/Users/simonwood/Library/Application Support/minecraft/mods/rei_minimap/'
	fname = 'untamedears.com.DIM-1.points'
	mapData = []
	
	for line in fileinput.input( [fdir + fname] ):
		lineData = line.strip().split( ':' )
		if lineData[4] == 'true':
			mapData.append( [lineData[0], lineData[1], lineData[3]] )

	return mapData
	#print 'Hello World! ' + sys.argv[1]

# Build our XML string
def buildXml( data ):
	parent = ElementTree.Element( 'map' )
	portalsEl = ElementTree.SubElement( parent, 'portals' )
	
	for value in data:
		if isinstance( value, list ):
			element = ElementTree.SubElement( portalsEl, 'portal' )
			element.set( 'x', value[1] )
			element.set( 'z', value[2] )
			element.set( 'name', value[0] )
			#element.text = value[0]
	
	return ElementTree.tostring( parent )
  
# Our procedural code
mapData = fetchData()
outputString = buildXml( mapData )
xml = xml.dom.minidom.parseString( outputString )


fo = open( 'tmp.xml', 'wb' )
fo.write( xml.toprettyxml() )
fo.close()
