#' @title CVR
#' @description
#' Calculates CVR
#'
#' @param N total number of experts
#' @param n_e number of experts that agree that the item is essential.
#' @return CVR.
#' @examples
#' cvr(20, 17)
#' @export

cvr <- function(N, n_e){
  value <- (n_e - (N / 2)) / (N / 2)
  return(value)
}
