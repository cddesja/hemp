#' @title distract
#' @description
#' Calculates the proportion endorsing a distractor.
#'
#' @param data data frame
#' @return The proportion endorsing a distractor.
#' @examples
#' distract(multiplechoice)
#' @export
distract <- function(data){
  nchoice <- length(unique(data[,1]))
  dis_table <- matrix(0,
                      nrow = ncol(data),
                      ncol = nchoice)
  prop_endorse <- function(x) prop.table(table(x))
  for(i in 1:ncol(data)){
    dis_table[i,] <- prop_endorse(data[,i])
  }
  rownames(dis_table) <- colnames(data)
  colnames(dis_table) <- sort(unique(data[,1]))
  return(round(dis_table, 3))
}


