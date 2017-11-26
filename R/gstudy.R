#' @title Generate the variance components from a G-study
#' @import lme4
#' @description
#' Generates the variance components and the relative magnitude (percent of total variance) of each variance component.
#'
#' @param x An lmer fitted object
#'
#' @examples
#' one_facet <- lmer(Score ~ (1 | Participants) + (1 | Items), data = efData)
#' two_facet <- lmer(scores ~ (1 | students) + (1  | prompts) + (1 | raters) + (1 | students:prompts) +  (1 | students:raters) + (1 | prompts:raters), data = writing)
#' gstudy(one_facet)
#' gstudy(two_facet)
#' # Two facet with prompts fixed
#' gstudy(two_facet, fixed = "prompts")
#' @export
gstudy <- function(x, fixed = NULL) {
  tmp <- as.data.frame(VarCorr(x))
  tmp <- tmp[c(1,4)]
  no.match <- function(x) {x[-match(fixed, x)]}
  if(!is.null(fixed)){
    n_adj <- length(unique(x@frame[,grep(fixed, names(x@frame))]))
    fixed_vars <- tmp[grep(fixed, tmp$grp),]
    fixed_vars <- fixed_vars[-match(fixed, fixed_vars$grp),]
    fixed_vars$adj_vcov <- fixed_vars$vcov/n_adj;fixed_vars$vcov <- NULL
    add_back <- strsplit(fixed_vars$grp, ":")
    fixed_vars$grp <- sapply(add_back, no.match)
    two.way <- data.frame(grp = paste(fixed_vars$grp, collapse = ":"), adj_vcov = tmp[nrow(tmp),2]/n_adj)
    fixed_vars <- rbind(fixed_vars, two.way)
    tmp <- merge(tmp, fixed_vars)
    tmp[,2] <- tmp[,2] + tmp[,3]; tmp[,3] <- NULL
    tmp$grp[length(tmp$grp)] <- "Residual"
    }
  colnames(tmp) <- c("Source", "Est.Variance")
  tmp$Percent.Variance <- tmp$Est.Variance/sum(tmp$Est.Variance)
  tmp[,2] <- round(tmp[,2], 4)
  tmp[,3] <- paste0(round(tmp[,3] * 100,1), "%")
  N <- length(x@resp$y)
  output <- list(gstudy.out = tmp, nobs = N)
  class(output) <- "gStudy"
  return(output)
}

#' Prints the results from the G-study
#'
#' Prints  output from fitting the \code{gstudy} function.
#' @param x object of class \code{gStudy} returned from the \code{gstudy} function
#' @param ... additional objects of the same type.
#' @method print gStudy
#' @seealso \code{\link{gstudy}}
#' @export
print.gStudy <- function(x, ...){
  print(x$gstudy.out)
}
