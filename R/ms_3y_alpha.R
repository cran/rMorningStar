#' @title ms.3yAlpha
#' @description Provides the Total Return of the Security
#' @param ticker Enter the TICKER
#' @return The output gives the 3-Year Alpha of the funs
#' @details Gives the 3-Year Alpha for the input TICKER (Fund)
#' @examples
#' ms.3yAlpha('FXAIX')
#' @rdname ms.3yAlpha
#' @import rvest
#' @import stringr
#' @import xml2
#' @export
ms.3yAlpha =  function(ticker){
  url = paste0('https://in.finance.yahoo.com/quote/', ticker,'/risk?p=',  ticker)
  d = read_html(url) %>% html_node('body') %>% xml_find_all("//div[contains(@class, 'Bdbw(1px) Bdbc($seperatorColor) Bdbs(s) H(25px) Pt(10px)')]") %>% html_text()
  d = str_remove_all(str_subset(d, 'Alpha'), 'Alpha')
  d = parse_number(d)[[1]]
  d
}
