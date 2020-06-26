#' @title ms.YtdRank
#' @description Provides the YTD Rank of the Security
#' @param ticker Enter the TICKER
#' @return The output gives the stated rank in caegory of the funs
#' @details Gives the stated rank for the input TICKER (Fund)
#' @examples
#' ms.YtdRank('FXAIX')
#' @rdname ms.YtdRank
#' @import rvest
#' @import stringr
#' @import xml2
#' @export
ms.YtdRank =  function(ticker){
  url = paste0('https://in.finance.yahoo.com/quote/', ticker,'/performance?p=',  ticker)
  d = read_html(url) %>% html_node('body') %>% xml_find_all("//div[contains(@class, 'Bdbw(1px) Bdbc($seperatorColor) Bdbs(s) H(25px) Pt(10px)')]") %>% html_text()
  d = parse_number(str_remove_all(str_subset(d, 'YTD'), 'YTD'))[[2]]
  d
}
