#' Read Soil Phosphorus Retention Raster Attribute Table from ISRIC 2011 mdb
#'
#'
#' @param mbd_file ISRIC 2011 geotiff
#' 
#' @return list of dataframes:
#' #' \describe{
#'   \item{\code{FAO74}}{\code{KeyFAO74}, Soil Map of the world legend}
#'   \item{\code{mapunit}}{\code{P_RetMap_FINAL}, Map unit attributes including map unit
#'                  phophorus retention full class, main class,
#'                  soil unit composition, and dominant soil unit
#'                  phophorus retention class}
#'   \item{\code{soilunit}}{\code{P_newsuid_avg_PRET} soil unit phosphorus retention class,
#'                   physicochemical properties, Qs single value}
#'   }
#'
#' @examples
#' extdata_dir <- system.file("extdata", package = "soilP", mustWork = TRUE)
#' mdb_file <- file.path(extdata_dir,
#' "Global_distribution_of_soil_phosphorus_retention_potential",
#' "ISRIC_Phosphorus_Retention_Potential.mdb")
#' RATs <- read_ISRIC_RAT(mdb_file)
#' 
#' FAO74    <- RATs$FAO74
#' mapunit  <- RATs$mapunit
#' soilunit <- RATs$soilunit
#' @export
#' 
read_ISRIC_AT <- function(mdb_file){
  mdb <- Hmisc::mdb.get(mdb_file)
  # Rename tables and columns for better readability
  FAO74    <- mdb$KeyFAO74
  mapunit  <- mdb$P_RetMap_FINAL 
  soilunit <- mdb$P_newsuid_avg_PRET %>%
    dplyr::filter(FAO74.name != "Dunes/Shifting sands")

  colnames(FAO74) <- c("key","name","note")
  
  colnames(mapunit)[c(1,2,3,11)] <- 
    c("ID", "mainclass", "fullclass","extentcode")
  
  colnames(soilunit) <- c("key","name","pH","SAND","SILT","CLAY",
                          "CECLAY","P_RET")
  list(FAO74    = clear.labels(FAO74),
       mapunit  = clear.labels(rm_empty_cols(mapunit)),
       soilunit = clear.labels(soilunit)
       )
}

rm_empty_cols <- function(x){
  empty <- apply(x,2,function(x) all(is.na(x)))
  x[,!empty]
}

# Snatched from stack overflow
clear.labels <- function(x) {
  if(is.list(x)) {
    for(i in 1 : length(x)) class(x[[i]]) <- setdiff(class(x[[i]]), 'labelled') 
    for(i in 1 : length(x)) attr(x[[i]],"label") <- NULL
  }
  else {
    class(x) <- setdiff(class(x), "labelled")
    attr(x, "label") <- NULL
  }
  return(x)
}
