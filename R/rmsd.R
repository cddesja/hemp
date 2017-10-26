#' @title Calculate RMSD
#' @description
#' Calculates the root mean squared deviation.
#'
#' @param theta1 Vector containing the estimated latent traits from the first estimation method.
#' @param theta2 Vector containing the estimated latent traits from the second estimation method.
#'
#'
#' @examples
#' data(SAPA)
#' twopl_mod <- "F = 1 - 16"
#' twopl_fit <- mirt(data = SAPA, model = twopl_mod,
#'                   itemtype = "2PL", SE = TRUE)
#' latent_mle <- fscores(twopl_fit, method = 'ML', full.scores = TRUE, full.scores.SE = TRUE)
#' latent_map <- fscores(twopl_fit, method = 'MAP', full.scores = TRUE, full.scores.SE = TRUE)
#' rmsd(latent_mle, latent_map)
#' @export
rmsd <- function(theta1, theta2) {
  if(length(theta1) != length(theta2)){
    stop("To calculate RMSD, the vectors containing trait estimates must be the same length.")
  }
  N <- length(theta1)
  rmsd.tmp <- sqrt(sum(theta1-theta2)^2/N)
  return(rmsd.tmp)
}

