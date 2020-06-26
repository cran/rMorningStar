#' @title ms.ReturnRating
#' @description Provides the Morningstar Return Rating of the Security
#' @param ticker Enter the TICKER
#' @return The output gives the Morningstar Return Rating of the funs
#' @details Gives the stated Morningstar Return Rating for the input TICKER (Fund)
#' @examples
#' ms.ReturnRating('FXAIX')
#' @rdname ms.ReturnRating
#' @import rvest
#' @import stringr
#' @import xml2
#' @importFrom stringi stri_escape_unicode
#' @export
ms.ReturnRating =  function(ticker){
  url = paste0('https://in.finance.yahoo.com/quote/', ticker,'/performance?p=',  ticker)
  d = read_html(url) %>% html_node('body') %>% xml_find_all("//div[contains(@class, 'Bdbw(1px) Bdbc($seperatorColor) Bdbs(s) H(25px) Pt(10px)')]") %>% html_text()
  d = stri_escape_unicode(str_remove_all(str_subset(d, 'Morningstar return rating'), 'Morningstar return rating'))
  d = nchar(d)/6
  d
}
