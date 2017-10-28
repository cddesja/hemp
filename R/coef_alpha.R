#' @title Coefficient alpha
#' @description
#' Calculates coefficient alpha, i.e., Cronbach's alpha
#'
#' @param data A data frame
#' @return Coefficient alpha.
#' @examples
#' data(SAPA)
#' coef_alpha(SAPA)
#' @export

coef_alpha <- function(data){
  k <- ncol(data)
  item.var <- apply(data, 2, var, na.rm = T)
  test.var <- var(rowSums(data, na.rm = T))
  alpha <- k / (k - 1) * (1 - sum(item.var) / test.var)
  alpha <- round(alpha, 3)
  return(alpha)
}
