#' Rescale to 8 bit integer, with reserved lower integers
#'
#' @param x factor or character vector with soil phosphorus retention classes
#' 
#' @param reserve first integers not corresponding to original scale 
#'
#' @examples
#'
#' @export
#' 
#' 
#' 
scale256 <- function(x , reserve = 5) {
  x_min <- min(x,na.rm = TRUE)
  x_max <- max(x,na.rm = TRUE)
  scaled <- round((254 - reserve) * (x - x_min) / (x_max - x_min )) + reserve
  as.integer(scaled)}
