#' @title Calculate the number of estimated parameters
#'
#' @description
#' Given a fitted objects from lavaan, this functions returns the number of free parameter. Note, this function will give incorrect results when intercepts are estimated and should be not used.
#'
#' @param x A lavaan fitted object
#'
#' @examples
#' iq.cfa <- '
#' verb =~ info + comp + arith + simil + digit + vocab
#' perf =~ pictcomp + parang + block + object + coding
#' '
#' fit <- cfa(iq.cfa, data = wiscsem)
#' free_params(fit)
#' @export
free_params <- function(x) {
  max(unlist(inspect(x)))
}
