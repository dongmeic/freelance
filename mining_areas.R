library(raster)
library(rgdal)
#library(geosphere)
library(rgeos)


infolder <- "/Users/dongmeichen/Documents/All/jobs/contract-based/ELAW"
outfolder <- paste0(infolder, "/output/")

years <- 2015:2019

mining.shp <- readOGR(dsn = paste0(infolder, "/mining_areas"), layer = paste0("Mining_Area_", years[1]))
plot(mining.shp)
sum(area(mining.shp))
#areaPolygon(mining.shp)
gArea(mining.shp)
