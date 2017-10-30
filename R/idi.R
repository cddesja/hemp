#' @title Item Discrimation Index
#' @description
#' Calculates the item discrimation index
#'
#' @param data data frame
#' @param item An item (as a vector)
#' @param use How should missing data be handled? See the \code{cor} function. Default is "complete.obs"
#' @param na.rm logical. Should missing values be removed? Defualt is TRUE.
#' @return The item discrimination index
#' @examples
#' idi(SAPA, SAPA$reason.4)
#' @export
idi <- function(data, item, use = "complete.obs", na.rm = T){
  ttscore <- rowSums(data, na.rm = na.rm)
  score_cuts <- quantile(ttscore, probs = c(.27, .73), na.rm = T)
  group <- ifelse(ttscore <= score_cuts[1], "low",
              ifelse(ttscore <= score_cuts[2], "high", "middle"))
  # print the results
  diff_tab <- table(group, item)[-3,]
  tab <- prop.table(diff_tab, 2)[,2]
  names(tab) <- c("Upper 27%", "Lower 27%")
  return(tab)
}
