#' @title Generate the variance components from a G-study
#' @import lme4
#' @description
#' Generates the variance components and the relative magnitude (percent of total variance) of each variance component.
#'
#' @param x An lmer fitted object
#'
#' @examples
#' mod <- lmer(score ~ (1 | participant) + (1 | item), data = efData)
#' gstudy(mod)
#' @export
gstudy <- function(x) {
  tmp <- as.data.frame(VarCorr(x))
  tmp <- tmp[c(1,4)]
  colnames(tmp) <- c("Source", "Est.Variance")
  tmp$Percent.Variance <- tmp$Est.Variance/sum(tmp$Est.Variance)
  tmp[,2] <- round(tmp[,2], 4)
  tmp[,3] <- paste0(round(tmp[,3] * 100,1), "%")
  return(tmp)
  }
