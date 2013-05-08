#!/bin/bash
#GenerateAndPublish.sh
#
#use to publish map to gh-pages (http://strongman332.github.io/Civcraft-Road-Map/)
#use GenerateTestMap.sh for testing
#
#depends- xalan, git
#

TODAY=$(date +%D)
HOUR=$(date +%T)


echo Cleaning
rm -r -f gh-pages
echo Clone gh-pages from github
git clone -b gh-pages https://github.com/Strongman332/Civcraft-Road-Map.git gh-pages
echo Generating map.svg
xalan -in map.xml -xsl map.xslt -out gh-pages/map.svg
cd gh-pages
git add map.svg
git commit -a -m "Auto Build $TODAY;$HOUR" && clear
echo Please login to github
((git push origin gh-pages||git push origin gh-pages||git push origin gh-pages) && (clear && echo SUCCESS!)) || (clear; echo FAILED!)
echo Cleaning
cd ..
rm -r -f gh-pages
read -p "Press enter to continue" nothing
