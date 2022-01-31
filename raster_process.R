


#### Library
library(sf)
library(raster)


### Load the data 
lu<-raster("brasil_coverage_2020.tif")
border<-st_read("amazon_biome/amazon.shp")
border<-st_transform(border,4326)

crs(lu)
crs(border)


lu<-crop(lu,border)
lu<-mask(lu,border)
plot(lu)

#### Customize options to increase the speed 
rasterOptions()
rasterOptions(maxmemory = 5e+08)





plot(lu)



writeRaster(lu,'lu_cropped.tif',progress="text")



plot(lu)



#### Using the terra pakchae 

library(terra)
library(raster)
library(sf)


lu<-rast("brasil_coverage_2020.tif")
border<-vect("amazon_biome/amazon.shp")
border2<-st_read("amazon_biome/amazon.shp")



lu2<-terra::crop(lu,border2)


res(lu)
r <- raster(border2, res = 0.0002694946,vals=1,"+proj=longlat +datum=WGS84")

summary(r)
setValues(r,1)

plot(r)

r<-1

lu2<-terra::mask(lu,border,touc)

lu2<-mask(lu,border)

plot(lu)
plot(lu)
plot(border,add=T)
crs(border)<-crs(lu)


#### Try another technics 
library(pakillo)
lu<-raster("brasil_coverage_2020.tif")
border<-st_read("amazon_biome/amazon.shp")
border<-st_transform(border,4326)

crs(lu)
crs(border)


lu2<-fast_mask(lu,border)
