### Library 
library(raster)
library(SpaDES)

###
lu<-raster("C:/Users/miche/Downloads/mapbiomas/masked/output_masked_2019.tif")

plot(lu)
splitRaster(lu,9,9,buffer=0.05,fExt=".tif",path="tiling_2019")


#### 
lu<-raster("C:/Users/miche/Downloads/mapbiomas/masked/output_masked_2018.tif")

plot(lu)
splitRaster(lu,9,9,buffer=0.05,fExt=".tif",path="tiling_2018")

lu<-raster("C:/Users/miche/Downloads/mapbiomas/masked/output_masked_2017.tif")

plot(lu)
splitRaster(lu,9,9,buffer=0.05,fExt=".tif",path="tiling_2017")

lu<-raster("C:/Users/miche/Downloads/mapbiomas/masked/output_masked_2016.tif")

plot(lu)
splitRaster(lu,9,9,buffer=0.05,fExt=".tif",path="tiling_2016")

lu<-raster("C:/Users/miche/Downloads/mapbiomas/masked/output_masked_2015.tif")

plot(lu)
splitRaster(lu,9,9,buffer=0.05,fExt=".tif",path="tiling_2015")

lu<-raster("C:/Users/miche/Downloads/mapbiomas/masked/output_masked_2014.tif")

plot(lu)
splitRaster(lu,9,9,buffer=0.05,fExt=".tif",path="tiling_2014")

lu<-raster("C:/Users/miche/Downloads/mapbiomas/masked/output_masked_2013.tif")

plot(lu)
splitRaster(lu,9,9,buffer=0.05,fExt=".tif",path="tiling_2013")


lu<-raster("C:/Users/miche/Downloads/mapbiomas/masked/output_masked_2012.tif")

plot(lu)
splitRaster(lu,9,9,buffer=0.05,fExt=".tif",path="tiling_2012")


lu<-raster("C:/Users/miche/Downloads/mapbiomas/masked/output_masked_2011.tif")

plot(lu)
splitRaster(lu,9,9,buffer=0.05,fExt=".tif",path="tiling_2011")


lu<-raster("C:/Users/miche/Downloads/mapbiomas/masked/output_masked_2010.tif")

plot(lu)
splitRaster(lu,9,9,buffer=0.05,fExt=".tif",path="tiling_2010")


lu<-raster("C:/Users/miche/Downloads/mapbiomas/masked/output_masked_2009.tif")

plot(lu)
splitRaster(lu,9,9,buffer=0.05,fExt=".tif",path="tiling_2009")


lu<-raster("C:/Users/miche/Downloads/mapbiomas/masked/output_masked_2008.tif")

plot(lu)
splitRaster(lu,9,9,buffer=0.05,fExt=".tif",path="tiling_2008")


lu<-raster("C:/Users/miche/Downloads/mapbiomas/masked/output_masked_2007.tif")

plot(lu)
splitRaster(lu,9,9,buffer=0.05,fExt=".tif",path="tiling_2007")
