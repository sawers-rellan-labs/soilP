#' Raster Attribute Table for ISRIC 2011 
#' Global Distribution of Soil Phosphorus Retention Potential
#'
#' Table of correspondence between 8 bit geotiff values
#' and various attributes including ascending order of soil classes and
#' color palette for the 16 main soil P retention Potential classes.
#' 
#' The geotiff from the original download contains values between 0 and 7000.
#' those values correspond to different soil units not to phophorus retention 
#' classes. 
#' 
#' In order to obtain the soil retention potential main class (16 values)
#' I had to use Arcgis to make a new layer from the attribute main.class 
#' from the attribute table of the layer Phosphorus_retention_class 
#' and export it as 8 bit tiff with tags and world file
#'
#' In this 8 bit geotiff file the different values of 
#' P retention soilclass are stored as a number between 0 and 15
#' and correspond to the legend in the arcgis layer Phosphorus_retention_class.
#' In order to build the table I had to manually check the correspondence:
#'
#' \tabular{rrl}{
#' arcgis \tab main \tab description\cr
#' 0 \tab WR1 \tab Oceans/Inland waters\cr
#' 1 \tab VH3 \tab 25-50\% Very High\cr
#' 2 \tab VH2 \tab 50-75\% Very High\cr
#' 3 \tab VH1 \tab >75\% Very High\cr
#' 4 \tab RK2 \tab 50-75\% Rock Outcrops\cr
#' 5 \tab RK1 \tab >75\% Rock Outcrops\cr
#' 6 \tab Mo3 \tab 25-50\% Moderate\cr
#' 7 \tab Mo2 \tab 50-75\% Moderate\cr
#' 8 \tab Mo1 \tab >75\% Moderate\cr
#' 9 \tab Lo3 \tab 25-50\% Low\cr
#' 10 \tab Lo2 \tab 50-75\% Low\cr
#' 11 \tab Lo1 \tab >75\% Low\cr
#' 12 \tab Hi3 \tab 25-50\% High\cr
#' 13 \tab Hi2 \tab 50-75\% High\cr
#' 14 \tab Hi1 \tab >75\% High\cr
#' 15 \tab GL1 \tab Glaciers
#' }
#'
#' The problem is that this order is not ascending with regard to 
#' P retention potential. So I reassigned integers into a postulated ascending
#' order of phosphorus retention potential and stored it as the \code{ascending}
#' column.
#' 
#' \tabular{rrl}{
#' ascending \tab main \tab description\cr
#' 0 \tab WR1 \tab Oceans/Inland waters\cr
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
#' @docType data
#'
#' @usage data(soilclass)
#'
#' @format An object of class \code{"raster"}; see \code{\link[raster]{raster}}.
#'
#' @keywords datasets
#'
#' @references Batjes NH 2011. Global distribution of soil phosphorus retention. 
#'             Report 2011/06, Plant Research International (PRI), 
#'             Wageningen UR, and ISRIC – World Soil Information,
#'             Wageningen, 42 p. with dataset. 
#'                  
#' (\href{ http://www.isric.org/sites/default/files/ISRIC_Report_2011_06.pdf}{ISRIC})
#'
#' @source \href{http://data.isric.org/geonetwork/srv/eng/catalog.search;jsessionid=3D928F77E740EEB81217DD1FD0562420#/metadata/36cb1f3a-c0fe-4f99-ba5f-a9f2b4494431}{ISRIC}
#'
#' @examples
#' data(soilclass)
"soilclass"