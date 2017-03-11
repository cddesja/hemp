#' @title Parallel analysis plot via lattice
#'
#' @description
#' \code{latticePA} returns a parallel analysis based on a reduced correlation matrix using lattice
#'
#' @param data A data.frame with no missing data
#'
#' @import lattice
#' @import parallel
#' @importFrom psych fa
#' @examples
#' library(REPM)
#' cognition <- subset(interest, select = vocab:analyrea)
#' latticePA(cognition)
#' @export
#'
#'
latticePA <- function(data, ...){
  x <- REPM::fa.parallel.repm(data)
  dat.tmp <- data.frame(fa.values = x[[1]],
                            fa.sim = x[[5]],
                            nfactors = seq_along(x[[1]]))
  xyplot(fa.values ~ nfactors, data = dat.tmp,
         panel = function(x,y, ...){
           panel.xyplot(x, y, type = c("p", "l"))
           panel.lines(x, y = dat.tmp$fa.sim, lty = 3, col = "black")
         },
         xlab = "Number of Factors",
         ylab = "Eigenvalues of reduced correlation matrix",
        )
}
