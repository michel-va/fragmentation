####################
library(raster)
library(tmap)
library(sf)
library(meteo)

raster<-raster("output_15_12.tif")
plot(raster)



border<-st_read("C:/Users/miche/Downloads/rasterisation/processed_data/biome/biome_amazon.Shp")

border<-st_transform(border,crs(raster))
raster<-mask(raster,border)


raster[raster==0]<-NA

border2<-as_Spatial(border)
raster2<-rfillspgaps(raster,maskPol = border2)

plot(raster2)

tm_shape(raster)+
  tm_raster(palette="magma",style="cont")

tm_shape(raster2)+
  tm_raster(palette="magma",style="cont")




