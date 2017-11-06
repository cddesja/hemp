#' @title Quartile cutter
#' @description
#' Converts a continuous variable into an ordinal variable using quartiles.
#'
#' @param x A continuous variable
#' @return A 4 level ordinal variable
#' @examples
#' quart_cut(wiscsem$info)
#' @export
#'
quart_cut <- function(x){
  tmp <- ifelse(x < quantile(x)[2], 1,
                ifelse(x > quantile(x)[2] & x < quantile(x)[3], 2,
                       ifelse(x > quantile(x)[4], 4, 3)))
  return(tmp)
}
