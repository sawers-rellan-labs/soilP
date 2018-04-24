#' Raster plot adjusted to rendering in R notebooks 
#'
#' @param r raster object to be plotted.
#'
#' @return plot
#'
#' @examples
#' data(ISRIC2011)
#' nb_plot(ISRIC2011$main)
#' @export
nb_plot <- function(r, axis.args = list(cex.axis = 2), ...) {
    op <- par()
    par(mar = c(0, 0, 2, 0), oma = c(0, 0, 0, 0))
    raster::plot(r,
                 cex.main = 2,
                 axes = FALSE,
                 box = FALSE,
                 frame.plot = FALSE,
                 legend.width = 2,
                 legend.shrink = 0.95,
                 axis.args = axis.args,
                 legend.args = list(text = "", cex = 1), ...)
    par(op)
}
