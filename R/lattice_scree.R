#' @title Scree plot via lattice
#'
#' @description
#' \code{lattice_scree} returns a scree plot using the lattice package
#'
#' @param x A correlation matrix
#'
#' @import lattice
#' @importFrom psych fa
#' @examples
#' lattice_scree(interest)
#' @export
#'
lattice_scree <- function(data){
  values <- psych::fa(data, fm = "ml")$values
  factors = seq_along(values)
  eigen.data <- data.frame(values, factors)
  xyplot(values ~ factors,
         panel = function(x, y, ...){
           panel.xyplot(x,y, type = c("p", "l"), col = "black")
           panel.abline(h = 0, lty = 2)
         }, xlab = "Factors",
         ylab = "Eigenvalues of reduced correlation matrix",
         data = eigen.data)
}
