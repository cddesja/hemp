#' @title Item-Reliability and Item-Validity Index
#' @description
#' Calculates the item-reliability index or the item-validity index
#'
#' @param data
#' @param use How should missing data be handled? See the \code{cor} function. Default is "complete.obs"
#' @param na.rm logical. Should missing values be removed? Defualt is TRUE.
#' @return CVR.
#' @examples
#' cvr(20, 17)
#' @export
irvi <- function(data, use = "complete.obs", na.rm = T){
  ttscore <- rowSums(data, na.rm = na.rm)
  s_i <- apply(data, 2, sd, na.rm = na.rm)
  r <- cor(data, ttscore, use = use)
  r <- r[-length(r)]
  index <- s_i * r
  return(index)
}
