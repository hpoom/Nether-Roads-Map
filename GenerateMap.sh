echo Cleaning
rm -r -f gh-pages
echo Clone gh-pages from github
git clone -b gh-pages https://github.com/Strongman332/Civcraft-Road-Map.git gh-pages
echo Generating map.svg
xalan -in map.xml -xsl map.xslt -out gh-pages/map.svg && clear
cd gh-pages
echo Please log in
((git push origin gh-pages||git push origin gh-pages||git push origin gh-pages) && (clear && echo SUCCESS!)) || (clear; echo FAILED!)
echo Cleaning
cd ..
rm -r -f gh-pages
read -p "Press enter to continue" nothing
