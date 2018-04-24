#' Reclassifies raster from RAT columns 
#'
#'
#' @param ratified  ratified raster object
#' @param cols vector of columns.
#'
#' @return list of reclassified raster objects 
#'
#' @examples
#'
#' @export
#'
layers_from <- function(ratified, cols = NULL){
  ratified <- ISRIC2011$FAO74
  if (!is.null(rat(ratified))) {
    layers <- list()
    for (varname in cols) {
      layers[[varname]] <- swap_in(ratified, to = varname)
    }
    layers
  }else{
    stop("object seems to not be ratified")
  }
}
