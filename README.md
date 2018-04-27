# soilP  
[![DOI](https://zenodo.org/badge/129322524.svg)](https://zenodo.org/badge/latestdoi/129322524)

---
Local adaptation to Phosphorus Availability


This package helps in the extraction from geographical coordinates of  phosphorus data from two sources, ISRIC for soil retention, and  Oakridge National Laboratory for soil availabilty.

## Install
```
library(devtools)
install_github("sawers-rellan-labs/soilP")
```

## File description
``` 
.  
├── R         # Function definitions  
├── README.md # This file  
├── data
│   ├── ISRIC2011.RData # Raster list
│   ├── ISRIC_AT.RData  # Raster attribute table
│   ├── ORNL2013.RData  # Oakridge National Lab Phosphorus Model
│   ├── mountain.RData  # Mountains of the World
│   └── soilclass.RData # ISRIC maincalss palette
├── inst     
│   ├── extdata # External data  
│   │   ├── F1PARENTS120.csv # Parental accessions for F1s  
│   │   ├── GLOBAL_PHOSPHORUS_DIST_MAP_1223 # Oak ridge Phosphorus map  
│   │   ├── GMBA\ mountain\ inventory_V1.1  # Plot Background
│   │   ├── GRIN.csv # GRIN data for georeference   
│   │   ├── ISRIC2011 # Rasters of Phosphorus retention potential Variables
│   │   │   ├── FAO74.tif
│   │   │   ├── Global_distribution_of_soil_phosphorus_retention_potential.tif
│   │   │   ├── Hi.tif
│   │   │   ├── ISRIC2011_main_color.tif
│   │   │   ├── ISRIC_Phosphorus_Retention_Potential.mdb
│   │   │   ├── LD1.tif
│   │   │   ├── LD2.tif
│   │   │   ├── LD3.tif
│   │   │   ├── LD_composite.tfw
│   │   │   ├── LD_composite.tif
│   │   │   ├── Lo.tif
│   │   │   ├── MISC.tif
│   │   │   ├── Mo.tif
│   │   │   ├── VH.tif
│   │   │   ├── main.tif
│   │   │   ├── main_color.tfw
│   │   │   ├── main_color.tif
│   │   │   └── weighted.tif
│   │   ├── P_retention_class.csv # Raster Attribute table for  main.tif  
│   │   ├── P_retention_class.xlsx  
│   │   ├── allzeaGBS.snpAll.stockinfo.txt  
│   │   ├── burton2013.csv        # Root Phenotype data  
│   │   ├── burton2013.xlsx  
│   │   ├── c12-07-0440-supplement.pdf # Burton 2013 raw data  
│   ├── notebooks ************** Read these vignettes ***********************  
│   │   ├── 00_soilclass.nb.html  
│   │   ├── 01_linearize_P.nb.html
│   │   ├── 02_extract_P.nb.html
│   │   ├── 03_extract_P_burton.nb.html
│   └── scripts  
│       └── install.R # for development only  
├── man  
└── soilP.pdf # Package documentation  
  
```
## Read the notebooks

Full documentation on the analysis workflow, best rendered from the local repository / installation copies of the html files, not the online github Rmd.

### Rpubs versions  

[00_soilclass.nb.html](http://rpubs.com/faustovrz/379389)  

[01_linearize_P.nb.html](http://rpubs.com/faustovrz/382989)  

[02_extract_P.nb.html](http://rpubs.com/faustovrz/382998)

[03_extract_P_burton.nb.html](http://rpubs.com/faustovrz/382997)

  
