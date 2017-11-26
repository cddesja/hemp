#' Plots various D studies for one and two-facet design
#'
#' Plots multiple d studies for one or two-facet design.
#' @param x object of class \code{mer} returned from the \code{lme4} function
#' @param unit the name of the unit of measurement
#' @param facets A list of length 1 (one-facet) or 2 (two-facet). If two-facet plot, then the second facet is the grouping variable.
#' @param g_coef Plot the generalizability coefficent? If FALSE, plot the dependability coefficient.
#' @param bw logical. Make the plot black and white? Default is FALSE.
#' @import lattice
#' @examples
#' ## One facet
#' one_facet <- lmer(Score ~ (1 | Participants) + (1 | Items), data = efData)
#' dstudy_plot(one_facet, unit = "Participants", facets = list(Items = c(8, 20, 30, 40)))
#' dstudy_plot(one_facet, unit = "Participants", facets = list(Items = c(8, 20, 30, 40)), g_coef = F)
#'
#' ## Two facet
#' two_facet <- lmer(scores ~ (1 | students) + (1  | prompts) + (1 | raters) + (1 | students:prompts) +  (1 | students:raters) + (1 | prompts:raters), data = writing)
#' twofacet_gstudy <- gstudy(two_facet)
#' dstudy_plot(twofacet_gstudy, unit = "students", facets = list(raters = 1:4, prompts = 1:4))
#' dstudy_plot(twofacet_gstudy, unit = "students", facets = list(raters = 1:4, prompts = 1:4), g_coef = F)

#' @seealso \code{\link{dstudy}}
#' @export
dstudy_plot <- function(x, unit, facets, g_coef = T, bw = F){
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
    if(g_coef){
      if(bw){
        xyplot(data.df[,2] ~ data.df[,1], type = c("p", "l"),
               xlab = paste(names(data.df[1])), ylab = paste(names(data.df[2])),
               scales = list(x = list(at = unique(data.df[,1]))),
               col = "black")
      } else {
        xyplot(data.df[,2] ~ data.df[,1], type = c("p", "l"),
               xlab = paste(names(data.df[1])), ylab = paste(names(data.df[2])),
               scales = list(x = list(at = unique(data.df[,1]))))
      }
    } else {
      if(bw){
        xyplot(data.df[,3] ~ data.df[,1], type = c("p", "l"),
               xlab = paste(names(data.df[1])), ylab = paste(names(data.df[3])),
               scales = list(x = list(at = unique(data.df[,1]))),
               col = "black")
      } else {
        xyplot(data.df[,3] ~ data.df[,1], type = c("p", "l"),
               xlab = paste(names(data.df[1])), ylab = paste(names(data.df[3])),
               scales = list(x = list(at = unique(data.df[,1]))))
      }
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
    if(bw){
      par.settings <- simpleTheme(lty = seq(1, length(unique(data.df[,2]))), pch = seq(1, length(unique(data.df[,2]))), col = "black")
    } else {
      par.settings <- simpleTheme(lty = seq(1, length(unique(data.df[,2]))), pch = 1)
    }
    if(g_coef){
      xyplot(data.df[,3] ~ data.df[,1], group = data.df[,2], type = "b", xlab = paste(names(data.df[1])), ylab = paste(names(data.df[3])), par.settings = par.settings,
             auto.key = list(title = paste(names(data.df[2])),
                             space = "right", cex.title = 1, lines = T,
                             points = F,
                             type = "b"),
             scales = list(x = list(at = unique(data.df[,1]))))
    } else {
      xyplot(data.df[,4] ~ data.df[,1], group = data.df[,2], type = "b", xlab = paste(names(data.df[1])), ylab = paste(names(data.df[4])), par.settings = par.settings,
             auto.key = list(title = paste(names(data.df[2])),
                             space = "right", cex.title = 1, lines = T,
                             points = F,
                             type = "b"),
             scales = list(x = list(at = unique(data.df[,1]))))
    }
  }
}
