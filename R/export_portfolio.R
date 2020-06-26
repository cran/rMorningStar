#' @title export.portfolio
#' @description Exports the portfolio into a csv file
#' @param portfolio portfolio as created by Portfolio.Manager
#' @param path Location on the disk where the portfolio should be saved
#' @return Export portfolio into a csv file
#' @details Export your portfolio
#' @rdname export.portfolio
#' @export
export.portfolio = function(portfolio, path){
  write.csv(portfolio, file = path)
}
