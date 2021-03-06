#R can also be used for downloading MODIS products in which we can bypass 
#the authentication setup that EROS put up within the past two yrs.
#View http://r-gis.net/?q=ModisDownload for more details. 

#NOTE: Read the link listed above. You must download and install the MRT tool (projection tool). Google how to install using command line. Its extremely useful to install as R can also reproject any and all MODIS maps (which you will need to do). 

#Date: 10 April 2017

#*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~

#This is the "raster time series" package. ModisDownload and related functions are nested within.
require(rts) 

#This is the authetication key that we can bypass using RTS and the related functions. 
setNASAauth("USERNAME GOES HERE","PASSWORD GOES HERE") #this is your login for Earthdata EROS. 

#authetication is requried for downloading images, however you don't need it for the reprojection tool (if you've downloaded images already). 

#Set your working directory. You -must- set the WD using the modisDownload function. 
#You cannot set a variable as a working directory. ie: w.dir <- "F:/blahblabh"
setwd("F:/Zambia/MOD_NDVI_16Day/2011_2012")

#Set a variable to indicate your product of interest...
modis.product <- modisProducts()[modisProducts() == "MOD13A1"]

#Identify where your already-installed MRT tool is located.
MRT.pname <- "C:/Modis/bin/"


#Using ModisDownload, you can download maps of interest and it will save in your working directory which you set above. 
ModisDownload(modis.product,h = "20", v = "10",
              MRTpath = "C:/Modis/bin/", bands_subset = "1 0 0 0 0 0 0 0 0 0 0 0",
              proj = TRUE,proj_type="UTM",datum="WGS84",utm_zone=35,pixel_size=500, 
              dates = c("2011.01.01", "2012.06.30"))


#read more on the function to understand the variables it requires...
