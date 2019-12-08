library(raster)
library(rgdal)

path <- "/Volumes/dongmeic/17.Fall_2019/FSEEE/raster/"

DEM <- raster(paste0(path, "DEM10m_Reclass.tif"))
plot(DEM, main="DEM")
slope <- raster(paste0(path, "Slope10m_Reclass.tif"))
plot(slope, main="Slope")
roads <- raster(paste0(path, "EucDist_Trans_Reclass.tif"))
plot(roads, main="Roads")
lakes <- raster(paste0(path, "Lakes10mRM.tif"))
plot(lakes, main="Lakes")
landslides <- raster(paste0(path, "Landslide10mRM.tif"))
plot(landslides, main="Landslides")
nature <- raster(paste0(path, "NaturalAreas10mRM.tif"))
plot(nature, main="Natural areas")
forests <- raster(paste0(path, "NaturalForests10mRM.tif"))
plot(forests, main="National forests")
streams <- raster(paste0(path, "Streams10mRM.tif"))
plot(streams, main="Streams")
ugb <- raster(paste0(path, "UGB10mRM.tif"))
plot(ugb, main="Urban growth boundary")

outraster <- DEM * 0.04 + slope * 0.12 + roads * 0.03 + landslides * 0.07 + forests * 0.17 + nature * 0.17 + lakes * 0.17 + streams * 0.09 + ugb * 0.14

