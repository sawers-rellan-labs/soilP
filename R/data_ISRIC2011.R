#' Global Distribution of Soil Phosphorus Retention Potential. 
#' International Soil Reference and Information Centre, 2011.
#' 
#' List of raster objects representing various Phosphorus Retention Potential
#' associated variables.
#' 
#' @section \code{ISRIC$main}
#' 
#' Generalised GIS map of 16 main phosphorus retention potential classes
#' at 5 arc-minute resolution. 
#'
#' Acidity (pH), soil mineralogy, and clay content were used to rate
#' the inferred capacity for P retention using four classes (Low, Moderate,
#' High, and Very High) for each FAO soil unit combining them into 16 different
#' possible classes per map unit.
#' 
#' Each map unit consists of multiple 5 by 5 arc-minutes, and is composed of up 
#' to eight different soil units. The overall soil phosphorus retention 
#' potential was assessed for each mapping unit, taking into account the 
#' P ratings and relative proportion of  each component FAO soil unit. 
#' A hierarchical clustering of the combined soil 
#' unit ratings resulted in 16 main P retention classes (MainCLASS) subidivided 
#' into 166 2nd level classes (FullClass), and 280 3rd level classes. Only the
#' most  extensive and most limiting  P retention class (MainCLASS)  has been
#' shown in the generalised GIS map.  Classes like 'VH3'', Hi3', 'Mo3' and Lo3'
#' are typically comprised of a combination of several 2nd level P retention
#' classes, albeit in widely varying proportions.
#' 
#' Although uncertainties remain high, the analysis provides an
#' approximation of world soil phosphorus retention potential.
#' 
#' Values assigned assuming that the following is an ascending order
#' of soil phosphorus retention classes:
#' 
#' \tabular{rrl}{
#' ascending \tab main \tab description\cr
#' 0 \tab WR1 \tab Oceans/Inland Waters\cr
#' 1 \tab GL1 \tab Glaciers\cr
#' 2 \tab RK1 \tab >75\% Rock Outcrops\cr
#' 3 \tab RK2 \tab 50-75\% Rock Outcrops\cr
#' 4 \tab Lo1 \tab >75\% Low\cr
#' 5 \tab Lo2 \tab 50-75\% Low\cr
#' 6 \tab Lo3 \tab 25-50\% Low\cr
#' 7 \tab Mo3 \tab 25-50\% Moderate\cr
#' 8 \tab Mo2 \tab 50-75\% Moderate\cr
#' 9 \tab Mo1 \tab >75\% Moderate\cr
#' 10 \tab Hi3 \tab 25-50\% High\cr
#' 11 \tab Hi2 \tab 50-75\% High\cr
#' 12 \tab Hi1 \tab >75\% High\cr
#' 13 \tab VH3 \tab 25-50\% Very High\cr
#' 14 \tab VH2 \tab 50-75\% Very High\cr
#' 15 \tab VH1 \tab >75\% Very High
#' }
#' 
#' @section \code{ISRIC$Lo}, \code{ISRIC$Mo}, \code{ISRIC$Hi}, \code{ISRIC$VH}, \code{ISRIC$MISC}
#' Soil Phsophorus retention potential as area percentage of a map unit.
#' scaled between 5 and 254, non soil pixels coded as 255.
#' 
#' @section \code{ISRIC$LD1}, \code{ISRIC$LD2}, \code{ISRIC$LD2}, \code{ISRIC$weighted}
#' Linear discriminant of main categories, and ad hoc weighted meassure
#'  weighted = (Lo + 2Mo + 3Hi + 4VH)/400
#' scaled between 5 and 254, non soil pixels coded as 255.
#' 
#' @section \code{ISRIC$FAO74},
#' 
#' Digitized Soilmap of the World Raster, FAO74, as published in Batjes 2011.
#' Although DSMW has 4931 map units, this version in Batjes 2011 has 4932 in the
#' raster atribute tables and 4909 in the actual raster.
#' 
#' @docType data
#'
#' @usage data(ISRIC2011)
#'
#' @format A list of \code{"RasterLayer"} objects;
#'         see \code{\link[raster]{raster}}.
#'
#' @keywords datasets, FAO74, DSMW
#'
#' @references Batjes NH 2011. Global distribution of soil phosphorus retention. 
#'             Report 2011/06, Plant Research International (PRI), 
#'             Wageningen UR, and ISRIC – World Soil Information,
#'             Wageningen, 42 p. with dataset 
#'                  
#' (\href{ http://www.isric.org/sites/default/files/ISRIC_Report_2011_06.pdf}{ISRIC})
#'
#' @source \href{http://www.isric.org/sites/default/files/isric_report_2011_06.pdf}{ISRIC}
#'
#' @examples
#' data(ISRIC2011)
#' plot(ISRIC2011)
"ISRIC2011"