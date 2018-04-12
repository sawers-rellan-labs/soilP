#' Read Soil Phosphorus Retention Main Class Raster from ISRIC 2011 geotiff
#'
#'
#' @param tif ISRIC 2011 geotiff
#' @param soilclass  dataframe with soil P retention class table
#' @param is 8 bit value integer vector corresponding to soil P retention
#'        main classes
#' @param becomes 8 bit value corresponding to new order for soil P retention 
#'        main classes
#' @param filename output geotiff file name with P retention classes stored 
#'                 in new order
#'
#' @return ratified raster object with P retention classes as 8 bit values 
#'
#' @examples
#' tif_in <- "inst/extdata/tif/P_retention_potential_main_grey.tif"
#' tif_out <- "inst/extdata/tif/P_retention_potential_main_grey_ascending.tif"
#' rc <-  read_P_ISRIC(tif       = tif_in,
#'                     soilclass = soilclass,
#'                     is        = "arcgis",
#'                     becomes   = "ascending",
#'                     filename  = tif_out)
#'
#' @export
#' 
read_P_ISRIC <- function(tif,  soilclass = NULL, is=NULL,
                         becomes=NULL, filename = NULL) {
  r <- raster::raster(tif)
  if (!is.null(is) && !is.null(becomes)) {
    rcl <- as.matrix(soilclass[, c(is, becomes)])
    if (is.null(filename)) {
      r <- raster::reclassify(r, rcl)
    }else{
      r <- raster::reclassify(r, rcl, filename = filename, overwrite = TRUE)
    }
  }
  raster::ratify(r)
}

