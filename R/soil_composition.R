#' Get Extended Map Unit Soil Composition Matrix from ISRIC RAT
#'
#'
#' @param mapunit map unit raster attribute table
#' @param FAO74 legend key from read_ISRIC_RAT
#'
#' @return matrix with named columns as soil units and values as percentage,
#'         excluding miscealaneous soil units RK WR GL  and corresponding
#'         map units
#'
#' @examples
#' get_soil_composition(mapunit, FAO74)
#' 
#' @export
#' 
soil_composition <- function(mapunit, FAO74){
  soil_comp <- matrix(0,nrow = nrow(mapunit),ncol = nrow(FAO74))
  colnames(soil_comp) <- FAO74$key
  colnames(soil_comp)[1] <- "V1"
  
  n <- length(grep("PROP", colnames(mapunit)))
         
  for (idx in 1:n) {
    soil_fr <- soil_prop(mapunit,idx)
    mycols <- colnames(soil_fr[,-1])
    soil_comp[,mycols] <- soil_comp[,mycols] + as.matrix(soil_fr[,-1])
  }
  
  colnames(soil_comp) <- paste0("_",colnames(soil_comp))
  fixed <- apply(soil_comp, 2, var) == 0
  glacier <- colnames(soil_comp) == "_GL"
  soil_comp[,!fixed & !glacier]
}

soil_prop <- function(x,n) {
  suid <- sym(colnames(x)[1])
  soil <- sym(paste0("SOIL",n))
  prop <- sym(paste0("PROP",n))
  
  x %>% 
    dplyr::select(!!suid, !!soil, !!prop) %>%
    tidyr::spread(!!soil, !!prop, fill = 0) %>%
    as.matrix() 
}
