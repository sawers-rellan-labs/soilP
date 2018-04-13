# soilP  
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
├── data      # Package data  
├── inst     
│   ├── extdata # Extrenal data  
│   │   ├── F1PARENTS120.csv # Parental accessions for F1s  
│   │   ├── GLOBAL_PHOSPHORUS_DIST_MAP_1223 # Oak ridge Phosphorus map  
│   │   ├── GMBA\ mountain\ inventory_V1.1  # Plot Background
│   │   ├── GRIN.csv # GRIN data for georeference   
│   │   ├── Global_distribution_of_soil_phosphorus_retention_potential  
│   │   │   # ISRIC Phosphorus retention potential raw data  
│   │   ├── P_retention_class.csv # Raster Attribute table for  
│   │   │                         # P_retention_potential_main_grey.tif  
│   │   ├── P_retention_class.xlsx  
│   │   ├── allzeaGBS.snpAll.stockinfo.txt  
│   │   ├── burton2013.csv        # Root Phenotype data  
│   │   ├── burton2013.xlsx  
│   │   ├── c12-07-0440-supplement.pdf # Burton 2013 raw data  
│   │   └── tif  
│   │       ├── P_retention_potential_main.clr  
│   │       ├── P_retention_potential_main.tfw  
│   │       ├── P_retention_potential_main.tif  
│   │       │   # ISRIC Phosphorus retention potential map color  
│   │       ├── P_retention_potential_main_grey.tfw  
│   │       ├── P_retention_potential_main_grey.tif  
│   │       │   # ISRIC Phosphorus retention potential map 8 bit  
│   │       └── P_retention_potential_main_grey_ascending.tif  
│   ├── notebooks ************** Read these vignettes ***********************  
│   │   ├── 00_soilclass.nb.html  
│   │   ├── 01_extract_P.nb.html  
│   │   └── 02_extract_P_burton.nb.html  
│   └── scripts  
│       └── install.R # for development only  
├── man  
└── soilP.pdf # Package documentation  
  
18 directories, 104 files  
```
## Read the notebooks

Full documentation on the analysis workflow, best rendered from the local repository / installation copies of the html files, not the online github Rmd.

### Rpubs versions  

[00_soilclass.nb.html](http://rpubs.com/faustovrz/379389)  

[01_extract_P.nb.html](http://rpubs.com/faustovrz/379390)  

[02_extract_P_burton.nb.html](http://rpubs.com/faustovrz/379391)

  