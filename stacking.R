################################################################################


library(raster)
library(sf)
library(stringr)



current.list <- list.files(path="output",pattern =".tif")
current.list<-paste('output',current.list,sep="/")
current.list<-str_subset(current.list,pattern = 'tif.aux.xml',negate=TRUE)
current.list<-str_sort(current.list, numeric = TRUE)


for (i in 1:length(current.list)){
  raster_temp<-raster(current.list[[i]])
  if (i==1){
    output<-raster_temp
  }else{
    output<-addLayer(output,raster_temp)
  }
  
}

plot(output)

writeRaster(output,"ai.tif")



current.list <- list.files(path="output_ed",pattern =".tif")
current.list<-paste('output_ed',current.list,sep="/")
current.list<-str_subset(current.list,pattern = 'tif.aux.xml',negate=TRUE)
current.list<-str_sort(current.list, numeric = TRUE)


for (i in 1:length(current.list)){
  raster_temp<-raster(current.list[[i]])
  if (i==1){
    output<-raster_temp
  }else{
    output<-addLayer(output,raster_temp)
  }
  
}

plot(output)

writeRaster(output,"ed.tif")


current.list <- list.files(path="output_area",pattern =".tif")
current.list<-paste('output_area',current.list,sep="/")
current.list<-str_subset(current.list,pattern = 'tif.aux.xml',negate=TRUE)
current.list<-str_sort(current.list, numeric = TRUE)


for (i in 1:length(current.list)){
  raster_temp<-raster(current.list[[i]])
  if (i==1){
    output<-raster_temp
  }else{
    output<-addLayer(output,raster_temp)
  }
  
}

plot(output)

writeRaster(output,"area_mn.tif")





































current.list <- list.files(path="ip",pattern =".tif")
current.list<-paste('ip',current.list,sep="/")
current.list<-str_subset(current.list,pattern = 'tif.aux.xml',negate=TRUE)
current.list<-str_sort(current.list, numeric = TRUE)


for (i in 1:length(current.list)){
  raster_temp<-raster(current.list[[i]])
  if (i==1){
    output<-raster_temp
  }else{
    output<-addLayer(output,raster_temp)
  }
  
}

plot(output)

writeRaster(output,"integral_protection.tif")




current.list <- list.files(path="su",pattern =".tif")
current.list<-paste('su',current.list,sep="/")
current.list<-str_subset(current.list,pattern = 'tif.aux.xml',negate=TRUE)
current.list<-str_sort(current.list, numeric = TRUE)


for (i in 1:length(current.list)){
  raster_temp<-raster(current.list[[i]])
  if (i==1){
    output<-raster_temp
  }else{
    output<-addLayer(output,raster_temp)
  }
  
}

plot(output)

writeRaster(output,"sustainable_use.tif")




