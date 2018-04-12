#' Convert Elevation values to classes
#'
#'
#' @param elevation vector of numeric elevation values 
#' @param breaks numeric vector of class limits
#' @param labels character vector of elevation class labels
#' 
#' @return factor of elevation classes converting \code{NA}s to \code{"Missing"}
#'
#' @examples
#' accn.info$Elevation_class <- classify_elevation(accn.info$Elevation)
#'
#' @export
#' 
#' 
classify_elevation <- function(elevation,
                               breaks = c(0, 1000, 2000, 9000),
                               labels= c("Low", "Mid", "High")){
  elevation_class <- cut(elevation, breaks = breaks, labels = labels)
  elevation_class <- as.character(elevation_class)
  elevation_class[is.na(elevation_class)] <- "Missing"
  factor(elevation_class, levels = c(labels, "Missing"))
}

