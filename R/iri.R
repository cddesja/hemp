#' @title Item-Reliability Index
#' @description
#' Calculates the item-reliability index
#'
#' @param data data frame
#' @param use How should missing data be handled? See the \code{cor} function. Default is "complete.obs"
#' @param na.rm logical. Should missing values be removed? Defualt is TRUE.
#' @return The item-reliability index
#' @examples
#' iri(SAPA)
#' @export
iri <- function(data, use = "complete.obs", na.rm = T){
  ttscore <- rowSums(data, na.rm = na.rm)
  s_i <- apply(data, 2, sd, na.rm = na.rm)
  r <- cor(data, ttscore, use = use)
  index <- s_i * r
  return(index)
}
