


#### Library
library(sf)
library(raster)


### Load the data 
lu<-raster("lu_cropped.tif")
border<-st_read("amazon_biome/amazon.shp")
border<-st_transform(border,4326)

crs(lu)
crs(border)
border<-st_cast(border,"POLYGON")


lu<-mask(lu,border,progress='text')
plot(lu)


step2 <- rasterize(border,lu)

