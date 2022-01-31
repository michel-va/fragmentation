#
library(raster)
library(sf)
library(raster)
library(dplyr)
library(lubridate)
library(ggplot2)
library(tidyr)
library(landscapemetrics)
#library(landscapetools)
#library(SpaDES)
library(rgeos)

#jobID<-Sys.getenv("PBS_ARRAY_INDEX")
#jobID<-2"
jobID<-'5'

name_input<-paste0("tiling3/lu_cropped_tile",jobID)
name_input<-paste(name_input,"tif",sep=".")

name_output_ed<-paste0("output/ed/output",jobID)
name_output_ed<-paste(name_output_ed,"tif",sep=".")

name_output_ai<-paste0("output/ai/output",jobID)
name_output_ai<-paste(name_output_ai,"tif",sep=".")

name_output_area_mn<-paste0("output/area_mn/output",jobID)
name_output_area_mn<-paste(name_output_area_mn,"tif",sep=".")

### load the data 
lu<-raster(name_input)
proj<-"+proj=aea +lat_1=-5 +lat_2=-42 +lat_0=-32 +lon_0=-60 +x_0=0 +y_0=0 +ellps=aust_SA +units=m +no_defs"
lu2<-projectRaster(lu,crs=proj,method="ngb",progress="text")



### Check if we got some forest there 
if(4 %in% unique(lu2)){
  print ("we can go!")
}else{
  setValues(lu2,0)
  a<-2500/res(lu2)[[1]]
  lu2<-raster::aggregate(lu2,fact=a)
  writeRaster(lu2,name_output_ai)
  writeRaster(lu2,name_output_ed)
  writeRaster(lu2,name_output_area_mn)
  stop()
}


### Create a substitution matrix !!!!! Make a whole classification panels 
reclass_df <- c(0, 0,
                3,1,
                4,2,
                5,2,
                9,2,
                11,2,
                12,2,
                12,2,
                14,2,
                15,2,
                19,2,
                20,2,
                21,2,
                22,2,
                23,2,
                24,2,
                25,2,
                26,2,
                27,2,
                29,2,
                30,2,
                31,2,
                32,2,
                33,2,
                36,2,
                39,2,
                40,2,
                41,2,
                47,2,
                48,2,
                49,2)

reclass_m <- matrix(reclass_df,
                    ncol = 2,
                    byrow = TRUE)

lu_classified<- reclassify(lu2, reclass_m)
###############################################################################
##############  landscapes metrics   ##########################################

### Load the packages 
plot(lu_classified)

save.image(file="frag.RData")


###############################################################################
###############################################################################
############################## Create raster with the difference matrix 
a<-25000/res(lu2)[[1]]
forest3<-raster::aggregate(lu_classified,fact=a)
forest3<-raster::crop(forest3,lu_classified)

plot(forest3)
plot(lu_classified,add=T)
plot(gridpoint)

gridpoint <- as(forest3,'SpatialPixelsDataFrame')
gridpoint_ai<-gridpoint
gridpoint_ed<-gridpoint
gridpoint_area_mn<-gridpoint


#Extract the landscape metric of interest and insert in a new table  
v_ai<-sample_lsm(lu_classified,gridpoint,shape="square",what="lsm_c_ai",size=12500,progress = TRUE)
v_ai<-subset(v_ai,class==1)


v_area_mn<-sample_lsm(lu_classified,gridpoint,shape="square",what="lsm_c_area_mn",size=12500,progress = TRUE)
v_area_mn<-subset(v_area_mn,class==1)

v_ed<-sample_lsm(lu_classified,gridpoint,shape="square",what="lsm_c_ai",size=12500,progress = TRUE)
v_ed<-subset(v_ed,class==1)

save.image(file="frag.RData")


#### Create some loops to affects the value to the gridpoints 
for (i in 1:length(gridpoint_ai)){
  
  if (any(v_ai$plot_id==gridpoint_ai@grid.index[[i]])){
    gridpoint_ai$layer[[i]]<-as.numeric(v_ai[v_ai$plot_id==i,6])
  }
  
  else{
    gridpoint_ai$layer[[i]]<-NA
  }
}


for (i in 1:length(gridpoint_area_mn)){
  
  if (any(v_area_mn$plot_id==gridpoint_area_mn@grid.index[[i]])){
    gridpoint_area_mn$layer[[i]]<-as.numeric(v_area_mn[v_area_mn$plot_id==i,6])
  }
  
  else{
    gridpoint_area_mn$layer[[i]]<-NA
  }
}



for (i in 1:length(gridpoint_ed)){
  
  if (any(v_ed$plot_id==gridpoint_ed@grid.index[[i]])){
    gridpoint_ed$layer[[i]]<-as.numeric(v_ed[v_ed$plot_id==i,6])
  }
  
  else{
    gridpoint_ed$layer[[i]]<-NA
  }
}



save.image(file="frag.RData")


#### Transform sp in sf object for selecting the value of interest 
gridpoint_ai<-st_as_sf(gridpoint_ai)
gridpoint_area_mn<-st_as_sf(gridpoint_area_mn)
gridpoint_ed<-st_as_sf(gridpoint_ed)


gridpoint_ai<-gridpoint_ai[,"layer"]
gridpoint_area_mn<-gridpoint_area_mn[,"layer"]
gridpoint_ed<-gridpoint_ed[,"layer"]


gridpoint_ai$layer<-as.numeric(gridpoint_ai$layer)
gridpoint_area_mn$layer<-as.numeric(gridpoint_area_mn$layer)
gridpoint_ed$layer<-as.numeric(gridpoint_ed$layer)

raster_ai<-rasterize(gridpoint_ai,forest3,field="layer",fun=mean)
raster_area_mn<-rasterize(gridpoint_area_mn,forest3,field="layer",fun=mean)
raster_ed<-rasterize(gridpoint_ed,forest3,field="layer",fun=mean)

plot(raster_ai)
#plot(raster_area_mn)
#plot(raster_ed)


####
writeRaster(raster_ai,name_output_ai,overwrite=TRUE)
writeRaster(raster_area_mn,name_output_area_mn,overwrite=TRUE)
writeRaster(raster_ed,name_output_ed,overwrite=TRUE)