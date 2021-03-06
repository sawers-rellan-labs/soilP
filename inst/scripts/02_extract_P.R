#' ---
#' title: "Extract P Data from ISRIC and Oak Ridge Maps"
#' output:
#'   html_notebook:
#'     highlight: tango
#'     number_sections: true
#'     theme: spacelab
#'     toc: true
#'     toc_float: true
#' ---
#' # Loading Libraries
#+  message=FALSE, warning=FALSE, results="hide"
library(soilP)    # Phosphorus maps
library(raster)
library(sf)       # Loading shapefiles for background
library(ggplot2)


#' # Loading stored data from previous workflow steps
#+ 
data("ISRIC2011") # raster list
data("soilclass") # raster attribute table
data_dir <- system.file("data", package = "soilP", mustWork = TRUE)
extdata_dir <- system.file("extdata", package = "soilP", mustWork = TRUE)


#' # Loading Background Shapefile and Saving it to .Rdata format
#+ 
GMBA_file <- file.path(extdata_dir, "GMBA mountain inventory_V1.1",
                 "GMBA mountain inventory_V1.1-World.shp")
mountain <- st_read(GMBA_file)
save(mountain, file =  file.path(data_dir,"mountain.RData"))


#' # Importing  maize accession collection coordinates

#+ 
accn_file <- system.file("extdata",
                         "F1PARENTS120.csv",
                         package = "soilP",
                         mustWork = TRUE)
accn_info <- read.csv(accn_file)
accn_info$Elevation_class <- classify_elevation(accn_info$Elevation)

#' # Using ISRIC data
#+ 
ISRIC_P <- extract_P_ISRIC(ISRIC2011$main, accn_info, soilclass,
                           lon = "Long", lat = "Lat")


#' 
#' ## Plotting phosphorus retention map

#+  message=FALSE
bg_map("Long", "Lat", data = ISRIC_P$georef, bg = mountain) +
  ggtitle(paste0("Accession selection for F1s")) +
  geom_point(aes(x = Long, y = Lat,
                 shape = Elevation_class,
                 colour = main), 
                 data = ISRIC_P$georef) +
  scale_color_manual(values = ISRIC_P$pal,
                     name = "Phosphorus\nRetention\nPotential",
                     breaks = ISRIC_P$breaks ) +
  scale_shape_manual(values = c(16, 17)) +
  theme(legend.key.size = unit(0.5, 'lines'))


#' # Using Oak Ridge National Laboratory Phosphorus Model 

#+ 
nc_in <- file.path(extdata_dir,
              "GLOBAL_PHOSPHORUS_DIST_MAP_1223",
              "data", "pforms_den.nc")

ORNL2013 <- brickP(nc_in)

save(ORNL2013,file = file.path(data_dir,"ORNL2013.RData"))


#+ 
ORNL_P <- extract_P_ORNL(ORNL2013, ISRIC_P$georef,
                         lon = "Long", lat = "Lat" )


#' ## Plotting phosphorus availability map

#+ 
bg_map("Long", "Lat", data = ORNL_P$georef, bg = mountain) +
  ggtitle(paste0("Accession selection for F1s")) +
  geom_point(aes(x = Long, y = Lat,
                 shape = Elevation_class,
                 colour = lab), 
             data = ORNL_P$georef) +
  scale_colour_gradientn(name = "Labile Inorganic\nPhosphorus",
                         colours = ORNL_P$pal(180),
                         limits = c(1, 180)) +
  scale_shape_manual(values = c(16, 17))

#' # Compare ISRIC vs ORNL

#+ 
boxplot(lab ~ main, las = 2, data = ORNL_P$georef,
        main = paste0("Corresponcence between Phosphorus Maps\n",
                      "ORNL 2013 Vs ISRIC 2011"),
        xlab = "Phosphorus Retention Potential Main Class",
        ylab = "Labile Inorganic Phosphorus")


pairs(ORNL_P$georef[,c("ascending", names(ORNL2013))])


