#' @title ms.Top10Holding
#' @description Gives the MorningStar Top 10 Holding of the fund
#' @param ticker Enter the TICKER of the Fund
#' @return Gives the Morningstar Top 10 Holding of the Fund
#' @details Gives the fund's top 10 Holdings as cmputed by MorningStar.
#' @examples
#' ms.Top10Holding('FXAIX')
#' @rdname ms.Top10Holding
#' @import rvest
#' @import stringr
#' @importFrom xml2 read_html
#' @importFrom dplyr arrange
#' @export
ms.Top10Holding = function(ticker){
url = paste0('https://finance.yahoo.com/quote/',ticker,'/holdings?p=',ticker)
t1 = read_html(url)  %>% html_table()
t1 = t1[[1]]
t1[,3] = parse_number(t1[,3])/100
colnames(t1) = c('Name', 'Symbol', 'Asset_Percentage')
t1
}
