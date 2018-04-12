#' Extract ORNL 2013 Soil Phosphorus Variables from georeference coordinates
#'
#'
#' @param brick raster brick of of ORNL Soil Phosphorus variables 
#' @param georef dataframe with georeferenced data, 
#'        containning at least latitude and longitude columns
#' @param lon longitude column name
#' @param lat latitude column name
#' 
#' @return list containning:
#' \describe{
#'   \item{pal}{ramped pallete function as in ORNL 2013}
#'   \item{georef}{dataframe of ORNL 2013 Soil Phosphorus Variables data
#'                 added to georef input}
#' }
#'
#' @examples
#' nc_in <- "inst/extdata/GLOBAL_PHOSPHORUS_DIST_MAP_1223/data/pforms_den.nc"
#' 
#' phospho_brick <- read_P_ORNL(nc_in)
#'
#' @export
#' 
#'
extract_P_ORNL <- function(brick, georef, lon ="Long", lat = "Lat") {
  for (var_name in names(brick)) {
    georef[var_name] <- raster::extract(x = brick[[var_name]],
                                   y = georef[, c(lon, lat)])
  }
  list(pal = colorRampPalette(rev(RColorBrewer::brewer.pal(11, "Spectral"))),
       georef = georef)
}
