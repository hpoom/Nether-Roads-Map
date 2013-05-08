rm -r -f gh-pages
git clone -b gh-pages https://github.com/Strongman332/Civcraft-Road-Map.git gh-pages
xalan -in map.xml -xsl map.xslt -out gh-pages/map.svg
cd gh-pages
git push origin gh-pages
cd ..
rm -r -f gh-pages
