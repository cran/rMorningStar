#' @title ms.5yReturn
#' @description Provides the Total Return of the Security
#' @param ticker Enter the TICKER
#' @return The output gives the stated return of the funs
#' @details Gives the stated return for the input TICKER (Fund)
#' @examples
#' ms.5yReturn('FXAIX')
#' @rdname ms.5yReturn
#' @import rvest
#' @import stringr
#' @import xml2
#' @export
ms.5yReturn =  function(ticker){
  url = paste0('https://in.finance.yahoo.com/quote/', ticker,'/performance?p=',  ticker)
  d = read_html(url) %>% html_node('body') %>% xml_find_all("//div[contains(@class, 'Bdbw(1px) Bdbc($seperatorColor) Bdbs(s) H(25px) Pt(10px)')]") %>% html_text()
  d = str_remove_all(str_subset(d, '5-year'), '5-year')
  d = parse_number(d)[[2]]
  d = d/100
  d
}
