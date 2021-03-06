% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extract_P_ORNL.R
\name{extract_P_ORNL}
\alias{extract_P_ORNL}
\title{Extract ORNL 2013 Soil Phosphorus Variables from georeference coordinates}
\usage{
extract_P_ORNL(brick, georef, lon = "Long", lat = "Lat")
}
\arguments{
\item{brick}{raster brick of of ORNL Soil Phosphorus variables}

\item{georef}{dataframe with georeferenced data, 
containning at least latitude and longitude columns}

\item{lon}{longitude column name}

\item{lat}{latitude column name}
}
\value{
list containning:
\describe{
  \item{pal}{ramped pallete function as in ORNL 2013}
  \item{georef}{dataframe of ORNL 2013 Soil Phosphorus Variables data
                added to georef input}
}
}
\description{
Extract ORNL 2013 Soil Phosphorus Variables from georeference coordinates
}
\examples{
nc_in <- "inst/extdata/GLOBAL_PHOSPHORUS_DIST_MAP_1223/data/pforms_den.nc"

phospho_brick <- read_P_ORNL(nc_in)

}
