#' @title Bollen Influential Cases Plot
#'
#' @description
#' This codes implements the Bollen influential cases plot described in Bollen (1989). This function is unable to handle missing data and listwise deletion is used. On the y-axis is the measure of influence, A, see Bollen (1989) for derivation,  and the row names are on the x-axis. These row names correspond to the original data set's row names prior to listwise deletion.
#'
#' @param x A dataset or matrix
#' @param crit.value Should a critical value be used to identify influential row names?
#'
#' @examples
#' data(interest)
#' bollen_plot(interest)
#'
#' @references
#' Bollen, K. A. (1989). Structural equations with latent variables. John Wiley & Sons.
#' @export
#'
bollen_plot <- function(x, crit.value = NULL) {
  x <- na.omit(x)
  mean.matrix <- matrix(rep(apply(x, 2, mean),
                              nrow(x)), byrow = T,
                          ncol = ncol(x))
  Z <- x - mean.matrix
  Z <- as.matrix(Z)
  A <- Z %*% solve(t(Z) %*% Z) %*% t(Z)
  A <- diag(A)
  dat <- data.frame(A, id = 1:nrow(x))
  plot(A ~ id, dat, type = "h",
       xlab = "Row Number",
       ylim = c(0, max(dat$A) + .15*max(dat$A)))
  points(dat$A ~ dat$id, pch = 16)
  abline(h = dim(mean.matrix)[2]/dim(mean.matrix)[1],
         col = "gray70")
  if(!is.null(crit.value)){
    text(dat$id,dat$A,
         labels = ifelse(dat$A > crit.value, dat$id, ""),
         pos = 3)
  }
}
