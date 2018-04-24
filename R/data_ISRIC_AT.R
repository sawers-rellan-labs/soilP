#' Raster attribute tables for ISRIC 2011
#'  
#' List of dataframe representing various Phosphorus Retention Potential
#' associated variables.
#' 
#' The main tables in thisdata set
#' \itemize{
#' \item{\code{mapunit}}
#' \item{\code{soilunit}}
#'  \item{\code{FAO74}}
#' }
#' Come from the access database in the published data of Batjes 2011.
#' Names of the tables and variables were changed with \code{read_ISRIC_RAT}
#' in order to have a clearer semantics of the code.
#' 
#' The main objection with these tables id the discrepancy in the number of rows
#' map unit table has 4932 rows, while DSMW has 4931, and the Batjes raster
#' has 4909 vlaues.
#' 
#' @docType data
#'
#' @usage data(ISRIC2_RAT)
#'
#' @format A list of dataframe objects
#'
#' @keywords datasets, FAO74, DSMW
#'
#' @references Batjes NH 2011. Global distribution of soil phosphorus retention. 
#'             Report 2011/06, Plant Research International (PRI), 
#'             Wageningen UR, and ISRIC – World Soil Information,
#'             Wageningen, 42 p. with dataset 
#'                  
#' (\href{ http://www.isric.org/sites/default/files/ISRIC_Report_2011_06.pdf}{ISRIC})
#'
#' @source \href{http://www.isric.org/sites/default/files/isric_report_2011_06.pdf}{ISRIC}
#'
#' @examples
#' data(ISRIC2011)
#' plot(ISRIC2011)
"ISRIC_AT"