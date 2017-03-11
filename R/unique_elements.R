#' @title Calculate number of unique elements in a covariance matrix
#'
#' @description
#' This function simply returns the number of unique elements in a covariance matrix. Recall that a correlation matrix is just a standardized covariance matrix.
#'
#' @param x A fitted lavaan object
#' @examples
#' iq.cfa <- '
#' verb =~ info + comp + arith + simil + digit + vocab
#' perf =~ pictcomp + parang + block + object + coding
#' '
#' fit <- cfa(iq.cfa, data = wiscsem)
#' unique_elements(fit)
#'
#' @export
unique_elements <- function(x){
  tmp <- length(diag(inspect(x)$theta))
  tmp * (tmp + 1) / 2
}
