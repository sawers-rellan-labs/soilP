#' Background Map for phosphorus variable plotting
#'
#' @param lon longitude column name
#' @param lat latitude column name
#' @param data dataframe with georeferenced data, 
#'        containning at least latitude and longitude columns
#' @param bg sf object representing a shapefile for background plot.
#'           e.g. mountains, rivers, ecosystems
#' 
#' @return ggplot object with plotted map
#'
#' @examples
#' data(mountain)
#' 
#' bg_map("Long", "Lat", data = ISRIC_P$georef, bg = mountain) 
#'
#' @export
bg_map <- function(lon, lat, data, bg){
  latitude <- data[!is.na(data[, lat]), lat]  #assumes lat lon are always paired
  longitude <- data[!is.na(data[, lon]), lon] 
  # print(c(min(latitude), max(latitude), min(longitude), max(longitude)))
  world <- ggplot2::map_data("world")
  ggplot2::ggplot(world) + 
  ggplot2::geom_sf(data = bg, color = "grey", lwd = 0.2, fill = NA) +
  ggplot2::geom_map(map = world, 
                    ggplot2::aes(map_id = region),
                    fill = NA, lwd = 0.2, color = "black") +
  ggplot2::coord_sf(ylim = c(min(latitude), max(latitude)), 
           xlim = c(min(longitude), max(longitude))) +
  ggplot2::theme(panel.background = element_rect(fill = "white"),
                 panel.border = element_rect( fill = NA, colour = "black"),
                 panel.grid.major = element_line(colour = 'transparent'),
                 legend.key = element_rect(fill = NA),
                 legend.key.size = unit(0.75, 'lines'))
}

