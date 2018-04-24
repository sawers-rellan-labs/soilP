#' Scattreplot wirh marginal histograms for ISRIC P retention Potential Scales  
#'
#' Continuous scales derived from multivariate analysis of the 
#' P retention potential Space
#' @param df dataframe containning Phosphorus Retention Potential Scales
#'        as columns.
#' @param soilclass  dataframe with soil P retention class table
#' @param is 8 bit value integer vector corresponding to soil P retention
#'        main classes
#' @param becomes 8 bit value corresponding to new order for soil P retention 
#'        main classes
#' @param filename output geotiff file name with P retention classes stored 
#'                 in new order
#'
#' @return ratified raster object with P retention classes as 8 bit values 
#'
#' @examples
#'
#' @export
#' 
plot_P_scales <- function(df, palette=NULL, 
                          scale_x ="LD2",
                          scale_y = "combined"){
  centroids <-  get_peaks(df,scale_x, scale_y)
  scatter <- ggplot(df, 
    aes_string(x = scale_x, 
               y = scale_y, 
               group = "ret", color = "ret")) +
    geom_point(size = 5, alpha = 0.9) + 
    scale_x_continuous() +
    scale_y_continuous() +
    scale_fill_manual(values = palette) +
    scale_color_manual(values = palette) +
    ggpubr::theme_pubr(base_size = 25, legend = "none")

xplot <- ggplot() + 
  geom_density(data = df,
               aes_string(x = scale_x, fill = "ret", color = "ret"),
               alpha = .7) +
  scale_fill_manual(values = palette) +
  scale_color_manual(values = palette) +
  scale_x_continuous() +
  scale_y_continuous() +
  ggpubr::theme_pubr(base_size = 25, legend = "none") +
  geom_label(data  = centroids,
             fill = palette,
             label = centroids$ret,
             size = 5,
             aes(x = peakX_coord, y = peakX_density),
             inherit.aes = FALSE)

yplot <- ggplot() + 
  geom_density(data = df, 
               aes_string(x = scale_y, fill = "ret", color = "ret"),
               alpha = .7) +
  scale_fill_manual(values = palette) +
  scale_color_manual(values = palette) +
  scale_x_continuous() +
  scale_y_continuous() +
  ggpubr::theme_pubr(base_size = 25, legend = "none") +
  geom_label(data  = centroids,
             fill = palette,
             label = centroids$ret,
             size = 5,
             aes(x = peakY_coord, y = peakY_density),
             inherit.aes = FALSE) +
  coord_flip()

scatter %>% 
  cowplot::insert_xaxis_grob(xplot, position = "top") %>%
  cowplot::insert_yaxis_grob(yplot, position = "right") %>%
  cowplot::ggdraw()

}

#' function for this:
#' which.max(density(!!!sym(scale_x))$y
#' Nasty!
get_peaks <- function(df, scale_x = "LD2", scale_y="combined"){
  df %>% dplyr::group_by(ret) %>%
  dplyr::summarise(meanX = mean(!!!sym(scale_x)), 
        meanY = mean(!!!sym(scale_y)),
        peakX_coord = density(!!!sym(scale_x))$x[which.max(density(!!!sym(scale_x))$y)],
        peakX_density = density(!!!sym(scale_x))$y[which.max(density(!!!sym(scale_x))$y)],
        peakY_coord = density(!!!sym(scale_y))$x[which.max(density(!!!sym(scale_y))$y)],
        peakY_density = density(!!!sym(scale_y))$y[which.max(density(!!!sym(scale_y))$y)])
}


