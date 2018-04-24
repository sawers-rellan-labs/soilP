#' # Script for installing soilP
library(here)
library(knitr)
library(devtools)

#' ### Unloading and removing package

detach("package:soilP", unload = TRUE)
detach("package:rasterVis", unload = TRUE)
detach("package:raster", unload = TRUE)
remove.packages("soilP")

#' ### Using backstitch for building scripts based upon .Rmd notebooks

devtools::source_gist('284671997992aefe295bed34bb53fde6', filename = 'backstitch.R')
scripts <- list.files(path    = here("inst", "notebooks"), 
                      pattern = "\\.Rmd")
for (s in scripts) {
  base <- tools::file_path_sans_ext(s) 
  backstitch(infile       = here("inst", "notebooks", paste0(base, ".Rmd")),
             outfile      = here("inst", "scripts", paste0(base, ".R")),
             output_type  = 'script',
             chunk_header = "#+")
}

#' ### Building and Installing package
setwd(here())
setwd("../")
document("soilP")
build("soilP")

install.packages(pkgs = "soilP_0.2.0.tar.gz",
                 repos = NULL, # Tells R not to try to get the package from CRAN
                 type = "source" )
setwd("./soilP")

#' Compiling pdf documentation
path <- find.package("soilP")
system(paste(shQuote(file.path(R.home("bin"), "R")),
             "CMD", "Rd2pdf", "--force", shQuote(path)))
# load_all(pkg = here())