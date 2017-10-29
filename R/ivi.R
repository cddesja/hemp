#' @title Item-Validity Index
#' @description
#' Calculates the item-validity index
#'
#' @param item An item (as a vector)
#' @param crit A criterion (as a vector)
#' @param use How should missing data be handled? See the \code{cor} function. Default is "complete.obs"
#' @param na.rm logical. Should missing values be removed? Defualt is TRUE.
#' @return The item-validity index
#' @examples
#' ivi(SAPA$reason.4, reason.16)
#' @export
ivi <- function(item, crit, use = "complete.obs", na.rm = T){
  s_i <- sd(item, na.rm = na.rm)
  r <- cor(item, crit, use = use)
  index <- s_i * r
  return(index)
}
