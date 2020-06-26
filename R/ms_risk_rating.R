#' @title ms.RiskRating
#' @description Provides the Morningstar Risk Rating of the Security
#' @param ticker Enter the TICKER
#' @return The output gives the Morningstar Risk Rating of the funs
#' @details Gives the stated Morningstar Risk Rating for the input TICKER (Fund)
#' @examples
#' ms.RiskRating('FXAIX')
#' @rdname ms.RiskRating
#' @import rvest
#' @import stringr
#' @import xml2
#' @importFrom stringi stri_escape_unicode
#' @export
ms.RiskRating =  function(ticker){
  url = paste0('https://in.finance.yahoo.com/quote/', ticker,'/risk?p=',  ticker)
  d = read_html(url) %>% html_node('body') %>% xml_find_all("//div[contains(@class, 'Bdbw(1px) Bdbc($seperatorColor) Bdbs(s) H(25px) Pt(10px)')]") %>% html_text()
  d = stri_escape_unicode(str_remove_all(str_subset(d, 'Morningstar risk rating'), 'Morningstar risk rating'))
  d = nchar(d)/6
  d
}
