FAO74_3channels <- raster::raster(FAO74_tif)
plot(FAO74)

print(object.size(brick(FAO74)), units = "MB")

writeRaster(FAO74,file = FAO74_16bit_tif, datatype = 'INT2U', overwrite = TRUE)

FAO74_16bit_tif <- file.path(extdata_dir,
                             "ISRIC2011", "raster",
                             "FAO74_16bit.tif")
FAO74_16bit <- raster::raster(FAO74_16bit_tif)
plot(FAO74_16bit)

print(object.size(brick(FAO74_16bit)), units = "MB")