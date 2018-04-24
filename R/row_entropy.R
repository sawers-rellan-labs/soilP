#' estimated entropy
#'
#' @param m frequency matrix
#' 
#' @param minp Minimum quasi probability for entropy estimation
#'
#' @examples
#'
#' @export
#' 
#' 
#' 
row_entropy <- function(m, minp = 1e-6){
  apply((m + minp/nrow(m)), 1,
      function(x) {-sum(x * log2(x))})
}


