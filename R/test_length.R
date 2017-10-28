#' @title New test length
#' @description
#' Calcuate the length of a test given a desired reliability.
#'
#' @param data A data frame
#' @param r The desired reliability
#' @param r_type Either "alpha" for coefficient alpha,"split" for split-half reliability, or a numeric value given the current reliability calculated elsewhere. The "split" type assumes an even/odd split with the Spearman-Brown correction.
#' @return The length of a test given the desired reliability
#' @examples
#' data(SAPA)
#' test_length(SAPA, r = .95, r_type = "split")
#' test_length(SAPA, r = .95, r_type = "alpha")
#' test_length(SAPA, r = .95, r_type = .90)
#' test_length(SAPA, r = .85, r_type = .90)
#' @export
test_length <- function(data, r, r_type) {
  if(is.numeric(r_type)){
    r_cur = r_type
  }
  if(r_type == "alpha"){
    r_cur <- coef_alpha(data)
  }
  if(r_type == "split"){
    r_cur <- split_half(data, sb = TRUE)
  }
  n <- ncol(data)
  num <- r * (1 - r_cur)
  den <- r_cur * (1 - r)
  t_len <- ceiling(num / den * n)
  return(t_len)
}

