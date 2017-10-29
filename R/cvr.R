#' @title CVR
#' @description
#' Calculates CVR
#'
#' @param N total number of experts
#' @param Ne number of experts that agree that the item is essential.
#' @return CVR.
#' @examples
#' cvr(20, 17)
#' @export

cvr <- function(N, Ne){
  value <- (n_e - (N / 2)) / (N / 2)
  return(value)
}
