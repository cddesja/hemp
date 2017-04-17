#' Plots various D studies for one and two-facet design
#'
#' Plots multiple d studies for one or two-facet design.
#' @param x object of class \code{mer} returned from the \code{lme4} function
#' @param unit the name of the unit of measurement
#' @param facets A list of length 1 (one-facet) or 2 (two-facet)
#' @param g.coef Plot the generalizability coefficent? If false, plot the dependability coefficientå
#' @import lattice
#' @seealso \code{\link{dstudy}}
#' @export
design.plot <- function(x, unit, facets, g.coef = T){
  if(length(facets)==1){
    conds <- facets[[1]]
    coefs <- matrix(NA, nrow = length(conds), ncol = 2)
    for(i in 1:length(conds)){
      n <- conds[i]
      names(n) <- names(facets)
      tmp <- dstudy(x, n = n, unit = unit)
      coefs[i,] <- c(tmp$gcoef, tmp$dcoef)
    }
    data.df <- data.frame(conds, coefs)
    names(data.df)[1] <- names(facets)
    names(data.df)[2:3] <- c("Generalizability", "Dependability")
    if(g.coef){
      xyplot(data.df[,2] ~ data.df[,1], type = c("p", "l"),
             xlab = paste(names(data.df[1])), ylab = paste(names(data.df[2])),
             scales = list(x = list(at = unique(data.df[,1]))))
    } else {
      xyplot(data.df[,3] ~ data.df[,1], type = c("p", "l"),
             xlab = paste(names(data.df[1])), ylab = paste(names(data.df[3])),
             scales = list(x = list(at = unique(data.df[,1]))))
    }
  } else {
    conds <- expand.grid(facets[[1]], facets[[2]])
    coefs <- matrix(NA, nrow = nrow(conds), ncol = 2)
    names(conds) <- names(facets)
    for(i in 1:nrow(conds)){
      n <- c(conds[i,1], conds[i,2])
      names(n) <- names(conds)
      tmp <- dstudy(x, n = n, unit = unit)
      coefs[i,] <- c(tmp$gcoef, tmp$dcoef)
    }
    data.df <- data.frame(conds, coefs)
    names(data.df)[1:2] <- names(conds)
    names(data.df)[3:4] <- c("Generalizability", "Dependability")
    par.settings <- simpleTheme(lty = seq(1, length(unique(data.df[,2]))), pch = 1)
    if(g.coef){
      xyplot(data.df[,3] ~ data.df[,1], group = data.df[,2], type = "b", xlab = paste(names(data.df[1])), ylab = paste(names(data.df[3])), par.settings = par.settings,
             auto.key = list(title = paste(names(data.df[2])),
                             space = "right", cex.title = 1, lines = T,
                             points = F,
                             type = "b"),
             scales = list(x = list(at = unique(data.df[,2]))))

    } else {
      xyplot(data.df[,4] ~ data.df[,1], group = data.df[,2], type = "b", xlab = paste(names(data.df[1])), ylab = paste(names(data.df[4])), par.settings = par.settings,
             auto.key = list(title = paste(names(data.df[2])),
                             space = "right", cex.title = 1, lines = T,
                             points = F,
                             type = "b"),
             scales = list(x = list(at = unique(data.df[,2]))))
    }
  }
}
