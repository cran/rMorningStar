#' @title ms.FundName
#' @description Provides the Fund Name
#' @param ticker Enter the TICKER
#' @return The output gives the Fund Name
#' @details Gives the stated TICKER Fund Name
#' @examples
#' ms.FundName('FXAIX')
#' @rdname ms.FundName
#' @import rvest
#' @import stringr
#' @import xml2
#' @export
ms.FundName =  function(ticker){
  url = paste0('https://in.finance.yahoo.com/quote/', ticker,'/performance?p=',  ticker)
  d = read_html(url) %>% html_node('body') %>% xml_find_all("//div[contains(@class, 'D(ib) ')]") %>% html_text()
  d = d[3]
  d
}
