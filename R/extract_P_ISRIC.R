#' Extract Soil Phosphorus Retention Potential from georeference coordinates
#'
#' Extract soil phosphorus retention potential main class from georeference
#' coordinates
#' 
#' @param rc ratified raster with P retention class attributes 
#' @param georef dataframe with georeferenced data, 
#'        containning at least latitude and longitude columns
#' @param soilclass  dataframe with soil P retention class table
#' @param lon longitude column name
#' @param lat latitude column name
#' 
#' @return list containning:
#' \describe{
#'   \item{breaks}{vector of breaks for ggplot legend}
#'   \item{pal}{named vector of colors for ggplot legend/map as in ISRIC 2011}
#'   \item{georef}{dataframe of soil P retention potential main class added 
#'                 to georef input}
#' }
#'
#' @examples
#' ISRIC_P <- extract_P_ISRIC(rc, accn.info, P_soil_class,
#'                           lon = "Long", lat ="Lat")
#'
#' @export
#' 
extract_P_ISRIC <- function(rc, georef, soilclass, lon = "lon", lat ="lat") {

  # rat: raster attribute table
  rat <- raster::levels(rc)[[1]]

  georef$ascending <- raster::extract(x = rc, y = georef[, c(lon, lat)])

  P_georef <- georef %>%
      dplyr::inner_join(soilclass) %>%
      dplyr::arrange(ascending) %>%
      dplyr::mutate(main = factor(main, levels = rat$main))

  rat <- rat %>%
         dplyr::filter(main  %in% unique(P_georef$main)) %>%
         dplyr::arrange(ID)

  # Adding palette for ggplot scale
  pal <- rat$color_hex
  names(pal) <- rat$main
  list(breaks   = rev(rat$main),
       pal    = rev(pal),
       georef = P_georef)
}
