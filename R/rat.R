#' get raster attribute table
#'
#'
#' @param x ratified raster
#'
#' @return matrix with named columns as soil units and values as percentage,
#'         excluding miscealaneous soil units RK WR GL  and corresponding
#'         map units
#'
#' @examples
#' get_soil_composition(mapunit, FAO74)
#' 
#' @export
#' 
rat <- function(x){raster::levels(x)[[1]]}

