library(raster)
library(rgdal)
#library(geosphere)
library(rgeos)


infolder <- "/Users/dongmeichen/Documents/All/jobs/contract-based/ELAW"
outfolder <- paste0(infolder, "/output/")

years <- 2015:2019
areas <- vector()

for (i in 1:length(years)){
  mining.shp <- readOGR(dsn = paste0(infolder, "/mining_areas"), layer = paste0("Mining_Area_", years[i]))
  #plot(mining.shp)
  areas[i] <- sum(area(mining.shp))
  print(years[i])
  #areaPolygon(mining.shp)
  #gArea(mining.shp)
}
  
plot(years, areas/10000, xlab='Year', ylab='Mining area by hectare')
#df <- data.frame(Year=years, Area=areas)
png(paste0(outfolder, 'yearly_mining_area.png'), width=6, height=5, units="in", res=300)
par(mfrow=c(1, 1),mar=c(4,5,1,1))
bp <- barplot(t(as.matrix(areas/10000)), beside = TRUE, names.arg = years,
      col='lightgrey', legend.text = TRUE, xlab='Year', ylab='Mining area by hectare')
text(bp, 0, round(areas/10000, 0), cex=1, pos=3, col='darkred')
dev.off()

png(paste0(outfolder, 'mining_area_change.png'), width=6, height=6, units="in", res=300)
par(mfrow=c(2, 2))
for(i in 2:length(years)){
  mining.r <- brick(paste0(infolder, "/mining_example/", years[i], '.tif'))
  plotRGB(mining.r, r = 1, g = 2, b = 3, stretch = "lin")
  box(col="grey")
}
dev.off()

mining.r <- brick(paste0(infolder, "/mining_example/", years[1], '.tif'))
mining.shp <- readOGR(dsn = paste0(infolder, "/mining_areas"), layer = paste0("Mining_Area_2019"))

png(paste0(outfolder, 'mining_area_example.png'), width=6, height=6, units="in", res=300)
plotRGB(mining.r, r = 1, g = 2, b = 3, stretch = "lin")
box(col="grey")
plot(mining.shp, border = 'red', add=T, lwd=2)
dev.off()

rate <- vector()
for(i in 1:4){
  rate[i] <- (areas[i+1] - areas[i])/areas[i]
}

plot(years[-1], rate, xlab='Year', ylab='Mining area change rate')

