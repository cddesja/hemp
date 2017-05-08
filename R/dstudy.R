#' @title Conduct a dependability study
#' @import lme4
#' @description
#' Generates the variance components and the relative magnitude (percent of total variance) of each variance component.
#'
#' @param x A gstudy object
#' @param n A vector with facets named
#' @param unit The label for the unit of measurement
#'
#' @examples
#' ## One facet design
#' one.facet <- lmer(Score ~ (1 | Participants) + (1 | Items), data = efData)
#' one.facet.gstudy <- gstudy(one.facet)
#' dstudy(one.facet.gstudy, n = c("Items" = 4), unit = "Participants")
#'
#' ## Two facet design
#' two.facet <- lmer(scores ~ (1 | students) + (1  | prompts) + (1 | raters) + (1 | students:prompts) +  (1 | students:raters) + (1 | prompts:raters), data = writing)
#' two.facet.gstudy <- gstudy(two.facet)
#' dstudy(two.facet.gstudy, n = c("raters" = 2, "prompts" = 5), unit = "students")
#'
#' ## Two facet fixed design wtih prompt
#' gstudy.fixed.prompt <- gstudy(two.facet, fixed = "prompts")
#' dstudy(gstudy.fixed.prompt, n = c("raters" = 2), unit = "students")
#' @export
dstudy <- function(x, n, unit) {
  tmp <- x$gstudy.out
  tmp <- tmp[c(1,2)]
  us.var <- tmp[tmp$Source %in% unit,2]
  n.matrix <- matrix(nrow = nrow(tmp), ncol = length(n))
  for(i in 1:length(n)) n.matrix[grep(names(n)[i], tmp$Source),i] <- n[i]
  n.matrix[nrow(n.matrix),] <- n
  tmp$n <- apply(n.matrix, 1, prod, na.rm = T)
  tmp[match(unit, tmp$Source), "n"] <- x$nobs
  tmp$vcov.n <- tmp$Est.Variance/tmp$n
  tmp[match(unit, tmp$Source), "vcov.n"] <- tmp[match(unit, tmp$Source), "Est.Variance"]

  # relative variance ----
  rel.var <- tmp$vcov.n[nrow(tmp)]
  if(length(n)>1){
    for(i in 1:length(n)) {
      tmp.names <- c(paste0(unit, ":", names(n)[i]), paste0(names(n)[i], ":", unit))
      tmp.var <- tmp[tmp$Source %in% tmp.names,"vcov.n"]
      rel.var <- sum(rel.var, tmp.var)
    }
  }

  # absolute variance ----
  tmp.abs <- tmp[-nrow(tmp),]
  abs.var <- sum(tmp.abs[-grep(unit, tmp.abs$Source),"vcov.n"], rel.var)

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


