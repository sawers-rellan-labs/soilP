
sp <- sf::st_read(file.path(here(),"inst","extdata", "DSMW", "DSMW.shp"))
world <- ggplot2::map_data("world")

quartz()
ggplot2::ggplot(world) + 
  ggplot2::geom_sf(data = sp, color = "grey", lwd = 0.2, fill = NA) +
  ggplot2::geom_map(map = world, 
                    ggplot2::aes(map_id = region),
                    fill = NA, lwd = 0.2, color = "black") 
length(unique(sp$SNUM))
extent(sp)
r <- raster::raster(ncol=4320, nrow=1686)
extent(r) <- extent(sp)
rp <- rasterize(sp, r, 'SNUM')


