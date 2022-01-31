################################################################################


library(raster)
library(sf)
library(stringr)
library(tmap)

ai<-stack("ai.tif")
ed<-stack("ed.tif")
area_mn<-stack("area_mn.tif")

plot(ai)

nlayers(ai)

### Let's plot 

ai1<-ai[[1]]
ai2<-ai[[15]]

ai1[ai1==0]<-NA
ai2[ai2==0]<-NA

ai3<-ai2-ai1

tm_shape(ai3)+
  tm_raster(breaks=c(-20,-15,-10,-5,-4,-3,-2,-1,-0.5,0,1,2,5))+
  tm_layout(title="Difference Aggregation Index",legend.outside = T)


library(meteo)
library(sp)
library(sf)

border<-st_read("C:/Users/miche/Downloads/rasterisation/processed_data/biome/biome_amazon.Shp")
border<-st_transform(border,crs(raster))

border2<-as_Spatial(border)
ed<-rfillspgaps(ed,maskPol = border2)

ed1<-ed[[1]]
ed2<-ed[[15]]

ed1[ed1==0]<-NA
ed2[ed2==0]<-NA

ed3<-ed1-ed2
ed3<-rfillspgaps(ed3,maskPol = border2)


plot(ed3)
tm_shape(ed3)+
  tm_raster(breaks=c(-60,-40,-30,-20,-15,-10,-5,0,1,5,10,15,20,30,40,60))+
  tm_layout(title="Difference Edge density",legend.outside = T)


area_mn1<-area_mn[[1]]
area_mn2<-area_mn[[15]]

area_mn1[area_mn1==0]<-NA
area_mn2[area_mn2==0]<-NA

area_mn3<-(area_mn2-area_mn1)/area_mn1

plot(area_mn3)

tm_shape(area_mn3)+
  tm_raster(style="fisher",n=50)+
  tm_layout(title="Change mean core area",legend.outside = T)


tm_shape(area_mn3)+
  tm_raster(breaks=c(-1,-0.9,-0.8,-0.7,-0.6,-0.5,-0.4,-0.3,-0.2,-0.1,0,0.1,0.2,0.5,1))+
  tm_layout(title="Change mean core area",legend.outside = T)





