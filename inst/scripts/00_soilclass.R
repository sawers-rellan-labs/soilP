#' ---
#' title: "Building the soilclass dataframe"
#' output:
#'   html_notebook:
#'     highlight: tango
#'     number_sections: true
#'     theme: spacelab
#'     toc: true
#'     toc_float: true
#' ---
#' # Introduction
#'  
#' ![Generalized map of soil phosphorus retention potential](ISRIC2011.png)
#' 
#' In this 2011 ISRIC map we can distinguish 16 different main classes of map unit
#' according to its soil phosphorus retention potential.
#' 
#' 
#' # Starting with the wrong file
#' 
#' So I naively assumed that the the geotif available at the ISRIC website contains
#' the same information as the map above.

#+  message=FALSE, warning=FALSE, results="hide"
library(soilP)      # Phosphorus maps
library(raster)
library(rasterVis)  # Plot categorical raster

data_dir <- system.file("data", package = "soilP", mustWork = TRUE)
extdata_dir <- system.file("extdata", package = "soilP", mustWork = TRUE)

test_tif <- file.path(extdata_dir,
            "Global_distribution_of_soil_phosphorus_retention_potential",
            "Global_distribution_of_soil_phosphorus_retention_potential.tif")
test_raster <- raster(test_tif) 


#' However, when we plot the raster file we get a suspiciously unexpected
#' distribuition of soil phosphorus retention potential:

#+  fig.height=4, fig.width=10, warning=FALSE
op <- par()
par(mar = c(0, 0, 0, 0), oma = c(0, 0, 0, 0))
plot(test_raster, axes = FALSE, box = FALSE,
     frame.plot = FALSE,
     legend.width = 2,
     legend.shrink = 0.95,
     axis.args = list(cex.axis = 2),
     legend.args = list(text = "", cex = 1))
par(op)

#' With the lowest values in Africa and then ascending through Asia, the Americas,
#' Oceania and the highest values in Europe.
#' 
#' After inspection of the Arcgis files and the Batjes 2011 report, I can
#' infer that the values in this geotif seem to be indices of different FAO soil
#' unit domains. They do not represent directly the phosphorus retention potential 
#' contrary to what the file name seems to imply. Using that index and a series of
#' SQL queries the author assigns phosphorus retention potential classes to each
#' pixel/map unit in the map. 
#' 
#' # Where did `soilclass` data came from?
#' 
#' See the manual for details.
#+ 
?soilclass


#' ## Extracting palette from Arcgis P_retention_class_main layer.
#' This operation was carried out in ArcGis on the mxd file.
#' I just copied to the corresponding `soilclass` column `r`,`g`,`b`,
#' the RGB values from the legend of the unique values symbology in the layer 
#' P_retention_class_main properties.

#+ 

soilclass <- read.csv(file.path(extdata_dir,"P_retention_class.csv")) 

soilclass


#' ## Adding hexadecimal strings and R standard names to colors. 
#+ 
color_hex <- apply(soilclass %>% dplyr::select(r,g,b), 
                   1, 
                   function(x){rgb(x[1], x[2], x[3],
                                   maxColorValue = 255)
                   })
color_name <- sapply(sapply(color_hex, plotrix::color.id), 
                       `[[`, 
                       1) # extracts first of multiple possible names
  
soilclass$color_hex <- color_hex
soilclass$color_name <- color_name
soilclass


#' ## Reordering according to ascending Phosphorus Retention Potential.
#' This is step is critical for rendering color legend in the right way
#' (reproducing arcgis appearance of the generalized map).
#' 
#' The `ascending` column integers were manually assigned. For the Low map unit
#' main class, higher percentage of Low soil unit P retention corresponded to lower
#' integers. For the Moderate, High, and very High map unit main classes, higher
#' integers were assigned to higher percentage of corresponding soil unit P
#' retention. This means the higher the Low soil unit P retention percentage the
#' lower the integer, and complentarily the higher the Moderate, High, and Very 
#' High soil unit P retention percentage the higher the integer.
#' This assignation is naive and consequently both, intuitive and *ad hoc*.
#' 
#' ------
#' 
#' TODO: We should establish a data based order of map unit soil phosphorus 
#'       retention classes instead of postulating an ad hoc order. This can be done
#'       through selecting the first discriminant dimension from a Discriminant
#'       Analysis of the percentage of soil unit phosphorus retention classes per
#'       mapping unit. Furthermore, we can use that discriminant dimention as a
#'       continuous variable instead of the discrete classes for downstream
#'       analyses.
#'       
#' ------

#+ 
soilclass <- soilclass[order(soilclass$ascending),]

save(soilclass, file = file.path(data_dir,"soilclass.RData"))

soilclass


#' # Reading ISRIC map from the geotiff file

#+ 
tif_in <- file.path(extdata_dir, "tif",
                    "P_retention_potential_main_grey.tif")

tif_out <- file.path( extdata_dir, "tif",
                       "P_retention_potential_main_grey_ascending.tif")

ISRIC2011 <- read_P_ISRIC(tif       = tif_in,
                          soilclass = soilclass,
                          is        = "arcgis",
                          becomes   = "ascending",
                          filename  = tif_out)


#' #  Adding Raster Attribute Table to  `ISRIC2011`
#' `levels<-` S3 method is internal to `raster` package and could not be exported 
#' to the `soilP` package, which prevented me from making a working package function
#' out of the following snippet:

#+ 
# Raster Attribute Table
rat <- levels(ISRIC2011)[[1]] %>% 
       dplyr::inner_join(soilclass, by = c("ID" = "ascending"))

levels(ISRIC2011) <- rat # This assignment method is not exported from raster

save(ISRIC2011, file = file.path(data_dir, "ISRIC2011.RData"))


#' ## Raster Plot

#+  fig.height=4, fig.width=10, warning=FALSE
op <- par()
par(mar = c(0, 0, 0, 0), oma = c(0, 0, 0, 0))
plot(ISRIC2011, axes = FALSE, box = FALSE,
     frame.plot = FALSE,
     legend.width = 2,
     legend.shrink = 0.95,
     axis.args = list(breaks=1:14, at = 0:15, cex.axis = 2),
     legend.args = list(text = "", cex = 1))
par(op)


#' ## Pixel density histogram

#+ 
ISRIC2011_hist <- hist(ISRIC2011,maxpixels = ncell(ISRIC2011),
                       breaks = c(0, 0.99 + 0:15), xlab = "value",
                       main = "Phosphorus Retention Potential")


#' # Rebuilding the arcgis render appeareance 
#' From the data, the color and the value correspondence between the arcgis 8bit
#' and ascending order. 

#+  fig.height=4, fig.width=10, warning=FALSE
op <- par()
par(mar = c(0, 0, 0, 0), oma = c(0, 0, 0, 0))

plot(ISRIC2011, 
     col = soilclass$color_hex[1:16],
     breaks = c(0,0.99 + 0:15),
     axes = FALSE, box = FALSE,
     frame.plot = FALSE,
     legend.width = 2,
     legend.shrink = 0.95,
     axis.args = list(at       = c(0,0.99 + 0:15),
                      labels   = c("",0:15), 
                      cex.axis = 2),
     legend.args = list(text = "", cex = 1))
par(op)


#' However, the `raster` plot legend above assumes a continuous scale from 0 to 15,
#' while the data is explicitly a categorical variable (although derived from
#' continuous percentages, see Batjes 2011). 
#' 
#' # Using rasterVis to appropiately label categories and show legend 
#' Remember that we assigned to the to the phosphorus retention potential main
#' classes an *ad hoc* order so we can interpret a direction of ascending retention 
#' potential (see above) in the plot legend.
#' 
#' In order to show the right labels in this ascending scale we use the `levelplot`
#' function from `RasterVis` that uses the raster attribute table to transform the 
#' numerical value of the raster to discrete categories.


#+ 
levelplot(ISRIC2011, att = "main", col.regions = soilclass$color_hex[1:16],
          maxpixels = ncell(ISRIC2011),  scales = list(draw = FALSE),
          xlab = NULL, ylab = NULL,
          main = "Generalized Phosphorus Retention Potential Map")



