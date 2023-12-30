Data is in [Releases](https://github.com/ramSeraph/ms_buildings_india/releases/tag/MSBI)

How the data has been transformed into the current form is in `steps.sh` 

Data is from [Microsoft Global ML BUilding Footprints](https://github.com/microsoft/GlobalMLBuildingFootprints)

Data License is ODbl

I think running the following commands might let you convert data into a more analyzable format. Untested though.
```
pmtiles convert ms_buildings_india-z14-part0.pmtiles ms_buildings_india-z14-part0.mbtiles
ogr2ogr -oo ZOOM_LEVEL=14 -f GeoJSONSeq ms_buildings_india.geojsonl ms_buildings_india-z14-part0.mbtiles
```
I suspect there might be duplicates in the data produced.

If someone is interested I can upload the dataset in a more analysis friendly format. 
Alternatively you can follow the steps listed in `steps.sh` except the tiling part to get data into the required format.

