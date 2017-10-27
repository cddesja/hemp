#' @title Split-half reliability
#' @description
#' Calculates split-half reliability either by selecting every other item or by randomly split the items.
#'
#' @param data A data frame
#' @param type Either alternate or random. Default is alternate.
#' @param sb Use the Spearman-Brown correction? Default is FALSE.
#' @return The split half reliability is calculated using every other item, if \code{type = "alternate"} is specified, or by splitting the instrument in half at random, if \code{type = "random"} is specifed. If \code{sb = TRUE}, then the Spearman-Brown correction is returned.
#' @examples
#' data(SAPA)
#' split_half(SAPA, type = "alternate")
#' split_half(SAPA, type = "random")
#' @export
split_half <- function(data, type = "alternate", sb = FALSE) {
  if(type != "alternate" & type != "random"){
    stop('Please specify type = "alternate" or type = "random".')
  }
  if(type == "alternate"){
    first_half <- data[, seq(1, ncol(data), by = 2)]
    second_half <- data[, seq(2, ncol(data), by = 2)]
    first_total <- rowSums(first_half, na.rm = T)
    second_total <- rowSums(second_half, na.rm = T)
    rel <- cor(first_total, second_total)
    rel_rd <- round(rel, 3)
  }
  if(type == "random"){
    num_items <- 1:ncol(data)
    first_items <- sample(num_items, ncol(data) / 2)
    first_half <- data[, first_items]
    second_half <- data[, -first_items]
    first_total <- rowSums(first_half, na.rm = T)
    second_total <- rowSums(second_half, na.rm = T)
    rel <- cor(first_total, second_total)
    rel_rd <- round(rel, 3)
  }
  if(sb == TRUE){
    rel_rd <- 2 * rel_rd / (1 + rel_rd)
  }
  return(rel_rd)
}

