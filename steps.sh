#!/bin/sh

mkdir data
cd data
wget https://minedbuildings.blob.core.windows.net/global-buildings/dataset-links.csv
wget https://minedbuildings.blob.core.windows.net/global-buildings/buildings-coverage.geojson
wget https://raw.githubusercontent.com/datameet/maps/master/Country/india-composite.geojson
cd -

python pick_quads.py

cd data
cat links.txt | xargs  wget -x -c -nH --cut-dirs=3
cd -

python unzip_and_clip.py

cd data
tippecanoe -x height -j '{ "*": [ "attribute-filter", "confidence", [ ">=", "$zoom", 13 ] ] }' -P -o ms_buildings_india.mbtiles --no-clipping --no-duplication --simplify-only-low-zooms --drop-densest-as-needed --extend-zooms-if-still-dropping -l ms_buildings_india -n ms_buildings_india -A '<a href="https://github.com/microsoft/GlobalMLBuildingFootprints" target="_blank" rel="noopener noreferrer">Microsoft ML Buildings</a>' ms_buildings_india.geojsonl
cd -

python partition.py
