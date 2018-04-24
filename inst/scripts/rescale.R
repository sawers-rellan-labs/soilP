devtools::load_all("./")
library(ncdf4)
# FAO74 and FAO90  ids are complentary in this set.
# Southamerica, East Africa, Europe, Russia, East Asia reclassified to FAO90
# FAO85 and FAO90 do have partial correspondence (Russia)

data_dir <- system.file("data", package = "soilP", mustWork = TRUE)
extdata_dir <- system.file("extdata", package = "soilP", mustWork = TRUE)
HWSD <- raster::raster(file.path(extdata_dir,"HWSD","MU_GLOBAL.nc4"))

mdb_file <- file.path(extdata_dir,
                      "Global_distribution_of_soil_phosphorus_retention_potential",
                      "ISRIC_Phosphorus_Retention_Potential.mdb")
RATs <- read_ISRIC_RAT(mdb_file)

FAO74    <- RATs$FAO74
mapunit  <- RATs$mapunit
soilunit <- RATs$soilunit

mdb_file <- file.path(extdata_dir,"HWSD","HWSD.mdb")
HWSD_tab <- Hmisc::mdb.get(mdb_file)

rcl <- as.matrix(HWSD_tab$HWSD_SMU[, c("MU.GLOBAL","SU.CODE","")])

HWSD_tab$HWSD_DATA
names(HWSD_tab$HWSD_DATA)
p <- HWSD_tab$HWSD_DATA[, c("MU.GLOBAL","SU.CODE90","SHARE")] %>%
  dplyr::group_by(MU.GLOBAL)%>%
  dplyr::arrange(SHARE) %>%
  dplyr::filter(row_number()==1)
p[is.na(p$SU.CODE90),"SU.CODE90"] <- 0
p

rcl <- as.matrix(p[,c("MU.GLOBAL","SU.CODE90")])
TOPCLASS <- raster::reclassify(HWSD, rcl)
quartz()
raster::plot(TOPCLASS)
