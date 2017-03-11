#' @title Parallel analysis engine based on psych code
#'
#' @description A paired down version of the FA parallel function for the REPM package based on \code{psych::fa.parallel}
#'
#'
#' @param x An object of class parallel returned from the fa.parallel function
#'
#' @import parallel
#' @export
fa.parallel.repm <- function (x, n.obs = NULL, main = "Parallel Analysis Scree Plots",
          n.iter = 20, error.bars = FALSE, se.bars = TRUE, quant = 0.95, cor = "cor", use = "pairwise")
{
  cl <- match.call()
  ci <- 1.96
  arrow.len <- 0.05
  nsub <- dim(x)[1]
  nvariables <- dim(x)[2]
  resample <- TRUE
  rx <- cor(x, use = use)
  valuesx <- eigen(rx)$values
  fa.valuesx <- fa(rx, fm = "ml", warnings = FALSE)$values

  temp <- list(samp = vector("list", n.iter), samp.fa = vector("list",
                                                               n.iter), sim = vector("list", n.iter), sim.fa = vector("list", n.iter))
  templist <- mclapply(1:n.iter, function(XX) {
    bad <- TRUE
    while (bad) {
      sampledata <- matrix(apply(x, 2, function(y) sample(y,
                                                          nsub, replace = TRUE)), ncol = nvariables)
      C <- cor(sampledata, use = use)
      bad <- any(is.na(C))
    }
    values.samp <- eigen(C)$values
    temp[["samp"]] <- values.samp
    temp[["samp.fa"]] <- fa(C, fm = "ml", SMC = FALSE,
                            warnings = FALSE)$values

    simdata = matrix(rnorm(nsub * nvariables), nrow = nsub,
                     ncol = nvariables)
    sim.cor <- cor(simdata)
    temp[["sim"]] <- eigen(sim.cor)$values
    fa.values.sim <- fa(sim.cor, fm = "ml", SMC = FALSE,
                        warnings = FALSE)$values
    temp[["sim.fa"]] <- fa.values.sim

    replicates <- list(samp = temp[["samp"]], samp.fa = temp[["samp.fa"]],
                       sim = temp[["sim"]], sim.fa = temp[["sim.fa"]])
  })

  values <- t(matrix(unlist(templist), ncol = n.iter))
  values.sim.mean = colMeans(values, na.rm = TRUE)
  values.ci <- values.sim.mean
  values.sim.se <- apply(values, 2, sd, na.rm = TRUE)/sqrt(n.iter)
  ymax <- max(valuesx, values.sim.mean)
  sim.se.pc <- NA

  if (resample) {
    sim.far <- values.sim.mean[(nvariables + 1):(2 *
                                                   nvariables)]
    sim.far.ci <- values.ci[(nvariables + 1):(2 * nvariables)]
    sim.se.far <- values.sim.se[(nvariables + 1):(2 *
                                                    nvariables)]
  }

  if (resample) {
    sim.fa <- values.sim.mean[(3 * nvariables + 1):(4 *
                                                      nvariables)]
    sim.fa.ci <- values.ci[(3 * nvariables + 1):(4 *
                                                   nvariables)]
    sim.se.fa <- values.sim.se[(3 * nvariables +
                                  1):(4 * nvariables)]
  } else {
    sim.fa <- values.sim.mean[(nvariables + 1):(2 *
                                                  nvariables)]
    sim.fa.ci <- values.sim.mean[(nvariables + 1):(2 *
                                                     nvariables)]
    sim.se.fa <- values.sim.se[(nvariables + 1):(2 *
                                                   nvariables)]
    sim.far <- NA
    sim.far.ci <- NA
    sim.se.far <- NA
  }
  fa.test <- which(!(fa.valuesx > sim.fa.ci))[1] -
    1
  sim.pc <- NA
  sim.pcr <- NA
  sim.se.pc <- NA
  pc.test <- NA

  if (error.bars) {
    if (!any(is.na(sim.pc))) {
      for (i in 1:length(sim.pc)) {
        ycen <- sim.pc[i]
        yse <- sim.se.pc[i]
      }
    }
    if (!any(is.na(sim.pcr))) {
      for (i in 1:length(sim.pcr)) {
        ycen <- sim.pcr[i]
        yse <- sim.se.pcr[i]
      }
    }
    if (!any(is.na(sim.fa))) {
      for (i in 1:length(sim.fa)) {
        ycen <- sim.fa[i]
        yse <- sim.se.fa[i]
      }
    }
    if (!any(is.na(sim.far))) {
      for (i in 1:length(sim.far)) {
        ycen <- sim.far[i]
        yse <- sim.se.far[i]
      }
    }
  }
  colnames(values) <- paste0("Sim", 1:ncol(values))
  results <- list(fa.values = fa.valuesx, pc.values = valuesx,
                  pc.sim = sim.pc, pc.simr = sim.pcr, fa.sim = sim.fa,
                  fa.simr = sim.far, nfact = fa.test, ncomp = pc.test,
                  Call = cl)
  colnames(values)[1:(2 * nvariables)] <- c(paste0("C",
                                                     1:nvariables), paste0("F", 1:nvariables))
      if (resample)
        colnames(values)[(2 * nvariables + 1):ncol(values)] <- c(paste0("CSim", 1:nvariables), paste0("Fsim", 1:nvariables))
  results$nfact <- fa.test
  results$ncomp <- pc.test
  results$values <- values
  class(results) <- c("psych", "parallel")
  return(invisible(results))
}
