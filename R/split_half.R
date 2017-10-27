#' @title Split half reliability
#' @description
#' Calculates split-half reliability either by selecting every other item or by randomly split the items.
#'
#' @param data A data frame
#' @param type Either alternate or random. Default is alternate.
#' @return The split half reliability is caculated using every other item, if \code{type = "alternate"} is specified, or by splitting the instrument in half at random, if \code{type = "random"} is specifed.
#' @examples
#' data(SAPA)
#' split_half(SAPA, type = "alternate")
#' split_half(SAPA, type = "random")
#' @export
split_half <- function(data, type = "alternate") {
  if(type != "alternate" & type != "random"){
    stop('Please specify type = "alternate" or type = "random".')
  }
  if(type == "alternate"){
    first_half <- data[, seq(1, ncol(data), by = 2)]
    second_half <- data[, seq(2, ncol(data), by = 2)]
    first_total <- rowSums(first_half, na.rm = T)
    second_total <- rowSums(second_half, na.rm = T)
    reliability <- cor(first_total, second_total)
    return(round(reliability, 3))
  }
  if(type == "random"){
    num_items <- 1:ncol(data)
    first_items <- sample(num_items, ncol(data) / 2)
    first_half <- data[, first_items]
    second_half <- data[, -first_items]
    first_total <- rowSums(first_half, na.rm = T)
    second_total <- rowSums(second_half, na.rm = T)
    reliability <- cor(first_total, second_total)
    return(round(reliability, 3))
  }
}

