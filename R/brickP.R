#'  Read Soil Phosphorus Variables raster from ORNL 2013 
#'
#'
#' @param nc_file ORNL 2013 netCDF file of Soil Phosphorus Variables
#'
#' @return raster brick of of ORNL Soil Phosphorus variables
#'
#' @examples
#' nc_in <- "inst/extdata/GLOBAL_PHOSPHORUS_DIST_MAP_1223/data/pforms_den.nc"
#' 
#' phospho_brick <- read_P_ORNL(nc_in)
#'
#' @export
#' 
brickP <- function(nc_file){
  phospho_nc <- ncdf4::nc_open(nc_file)
  vars <- names(phospho_nc$var)
  lst_by_var <- lapply(
    1:length(vars),
    function(i) {
      raster::brick(nc_file, varname = vars[i])
    }
  )
  nc_brick <- raster::brick(lst_by_var)
  names(nc_brick) <- vars
  nc_brick
}

