#' @title Summary of the IRT-LR DIF test from the mirt package
#'
#' @description This function creates a brief summary table for the \code{mirt::DIF} function in the mirt package. The printed output includes the flagged items, chi-square statistics, degrees of freedom, and corresponding p-values.
#'
#' @param x An object returned from the \code{mirt::DIF} function in the mirt package
#' @param alpha The alpha level of significance (default=0.05)
#'
#' @export
summary.irtlr <- function(x, alpha=0.05) {
  output <- lapply(x[unlist(lapply(x, function(y) y$p[2] < alpha))], function(z) z[2,c("X2", "df", "p")])
  nitems <- length(output)
  output2 <- data.frame(Item=NA, chi_square=NA, df=NA, p_value=NA)
  if(nitems > 0) {
    for(i in 1:nitems) {
      output2[i,1] <- names(output)[i]
      output2[i,2:4] <- output[[i]]
    }
  }
  output2$p_value <- round(output2$p_value, 3)
  return(output2)
}

