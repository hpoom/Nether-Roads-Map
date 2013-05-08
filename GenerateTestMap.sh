#GenerateTestMap.sh
#
#generates testing map svg
#use GenerateAndPublish.sh to deploy new maps

xalan -in map.xml -xsl map.xslt -out TestMap.svg
