#' @title ms.5yRank
#' @description Provides the 5y Rank of the Security
#' @param ticker Enter the TICKER
#' @return The output gives the stated rank in caegory of the funs
#' @details Gives the stated rank for the input TICKER (Fund)
#' @examples
#' ms.3yRank('FXAIX')
#' @rdname ms.3yRank
#' @import rvest
#' @import stringr
#' @import xml2
#' @export
ms.5yRank =  function(ticker){
  url = paste0('https://in.finance.yahoo.com/quote/', ticker,'/performance?p=',  ticker)
  d = read_html(url) %>% html_node('body') %>% xml_find_all("//div[contains(@class, 'Bdbw(1px) Bdbc($seperatorColor) Bdbs(s) H(25px) Pt(10px)')]") %>% html_text()
  d = parse_number(str_remove_all(str_subset(d, '5-year'), '5-year'))[[3]]
  d
}
