% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_P_scales.R
\name{plot_P_scales}
\alias{plot_P_scales}
\title{Scattreplot wirh marginal histograms for ISRIC P retention Potential Scales}
\usage{
plot_P_scales(df, palette = NULL, scale_x = "LD2", scale_y = "combined")
}
\arguments{
\item{df}{dataframe containning Phosphorus Retention Potential Scales
as columns.}

\item{soilclass}{dataframe with soil P retention class table}

\item{is}{8 bit value integer vector corresponding to soil P retention
main classes}

\item{becomes}{8 bit value corresponding to new order for soil P retention 
main classes}

\item{filename}{output geotiff file name with P retention classes stored 
in new order}
}
\value{
ratified raster object with P retention classes as 8 bit values
}
\description{
Continuous scales derived from multivariate analysis of the 
P retention potential Space
}
\examples{

}
