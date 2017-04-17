#' @title Conduct a dependability study
#' @import lme4
#' @description
#' Generates the variance components and the relative magnitude (percent of total variance) of each variance component.
#'
#' @param x An lmer fitted object
#' @param n A vector with facets named
#' @param unit The label for the unit of measurement
#'
#' @examples
#' ## One facet design
#' one.facet <- lmer(Score ~ (1 | Participants) + (1 | Items), data = efData)
#' dstudy(one.facet, n = c("Items" = 4), unit = "Participants")
#'
#' ## Two facet design
#' lmer.tab3.2 <- lmer(score ~ (1 | child) + (1 | raters) + (1 | occasions) + (1 | child:raters) + (1 | child:occasions) + (1 | raters:occasions), data = swtab1.3)
#' dstudy(lmer.tab3.2, unit = "child", n = c("occasions" = 4, "raters" = 2))
#' @export
dstudy <- function(x, n, unit) {
  tmp <- as.data.frame(VarCorr(x))
  tmp <- tmp[c(1,4)]
  us.var <- tmp[tmp$grp %in% unit,2]

  n.matrix <- matrix(nrow = nrow(tmp), ncol = length(n))
  for(i in 1:length(n)) n.matrix[grep(names(n)[i], tmp$grp),i] <- n[i]
  n.matrix[nrow(n.matrix),] <- n
  tmp$n <- apply(n.matrix, 1, prod, na.rm = T)
  tmp[match(unit, tmp$grp), "n"] <- length(x@resp$y)
  tmp$vcov.n <- tmp$vcov/tmp$n
  tmp[match(unit, tmp$grp), "vcov.n"] <- tmp[match(unit, tmp$grp), "vcov"]

  # relative variance ----
  rel.var <- tmp$vcov.n[nrow(tmp)]
  if(length(n)>1){
    for(i in 1:length(n)) {
      tmp.names <- c(paste0(unit, ":", names(n)[i]), paste0(names(n)[i], ":", unit))
      tmp.var <- tmp[tmp$grp %in% tmp.names,"vcov.n"]
      rel.var <- sum(rel.var, tmp.var)
    }
  }

  # absolute variance ----
  tmp.abs <- tmp[-nrow(tmp),]
  abs.var <- sum(tmp.abs[-grep(unit, tmp.abs$grp),"vcov.n"], rel.var)

  # generalizability coefficient
  g.coef <- us.var/(us.var + rel.var)

  # dependability coefficient
  d.coef <- us.var/(us.var + abs.var)

  output <- list(ds.df = tmp, relvar = rel.var, absvar = abs.var, gcoef = g.coef, dcoef = d.coef)
  class(output) <- "dStudy"
  return(output)
}

#' Prints the results from the D-study
#'
#' Prints  output from fitting the \code{dstudy} function.
#' @param x object of class \code{dStudy} returned from the \code{dstudy} function
#' @param ... additional objects of the same type.
#' @method print dStudy
#' @seealso \code{\link{dstudy}}
#' @export

print.dStudy <- function(x, ...){
  colnames(x$ds.df) <- c("Source", "Est.Variance", "N", "Ratio of Var:N")
  print(x$ds.df)
  cat("\nThe generalizability coefficient is:", x$gcoef)
  cat(".\nThe dependability coefficient is: ", x$dcoef,".", sep = "")
}


