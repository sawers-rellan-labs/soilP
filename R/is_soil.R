#' Soil class check
#'
#' @param x factor or character vector with soil phosphorus retention classes
#' 
#' @param minp Minimum quasi probability for entropy estimation
#'
#' @examples
#'
#' @export
#' 
#' 
#' 
is_soil <- function(x, reserve = 5 ){
  !(x %in% c("GL1","RK1","RK2","WR1"))
}
