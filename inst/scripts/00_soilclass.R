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


#+  message=FALSE, warning=FALSE, results="hide"
library(soilP)     # Phosphorus maps


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
data_dir    <- system.file("data",    package = "soilP", mustWork = TRUE)
extdata_dir <- system.file("extdata", package = "soilP", mustWork = TRUE)

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


