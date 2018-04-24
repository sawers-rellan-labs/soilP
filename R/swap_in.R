#' Reclassifies raster with dataframe column
#'
#' @param x raster object
#' @param rat  dataframe with Raster Atribute Table,
#'        e.g. P retention potential main classes
#' @param is column name of input raster value.
#' @param becomes column name of output raster value
#'
#' @return ratified raster object with P retention classes as 8 bit values 
#'
#' @examples
#' tif_in <- "inst/extdata/tif/P_retention_potential_main_grey.tif"
#' tif_out <- "inst/extdata/tif/P_retention_potential_main_grey_ascending.tif"
#' rc <-  read_P_ISRIC(file      = tif_in,
#'                     rat       = soilclass,
#'                     is        = "arcgis",
#'                     becomes   = "ascending")
#'
#' @export
#' 
swap_in <- function(x,
                    rat = raster::levels(x)[[1]], 
                    from = "ID",
                    to = NULL) {
  if (!is.null(from) && !is.null(to)) {
    x <- raster::reclassify(x, rat[, c(from, to)])
    return(x)
  }else{
    stop("Arguments 'from' and 'to' are required")
  }
  
}