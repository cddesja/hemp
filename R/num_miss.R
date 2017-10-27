#' @title Missing observations by items
#' @description
#' Calcuate number of missing observations per items
#'
#' @param data A data frame
#' @return The number of missing observations, \code{num_miss}, and the percent missing, \code{perc_miss}.
#' @examples
#' data(SAPA)
#' num_miss(SAPA)
#' @export
num_miss <- function(data) {
  nm <- apply(data, 2, function(x) sum(is.na(x)))
  prop_miss <- nm/nrow(data) * 100
  miss_df <- data.frame(num_miss = nm, perc_miss = round(prop_miss, 2))
  return(miss_df)
}

