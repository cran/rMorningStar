#' @title ms.Rating
#' @description Provides the Morningstar Rating of the Security
#' @param ticker Enter the TICKER
#' @return The output gives the Morningstar Rating of the funs
#' @details Gives the stated Morningstar Rating for the input TICKER (Fund)
#' @examples
#' ms.Rating('FXAIX')
#' @rdname ms.Rating
#' @import rvest
#' @import stringr
#' @import xml2
#' @importFrom stringi stri_escape_unicode
#' @export
ms.Rating =  function(ticker){
  url = paste0('https://in.finance.yahoo.com/quote/', ticker,'/profile?p=',  ticker)
  d = read_html(url) %>% html_node('body') %>% xml_find_all("//div[contains(@class, 'Bdbw(1px) Bdbc($seperatorColor) Bdbs(s) H(25px) Pt(10px)')]") %>% html_text()
  d = tolower(d)
  d = stri_escape_unicode( str_remove_all(str_subset(d, 'morningstar rating'), 'morningstar rating'))
  d = as.numeric(nchar(d))/6
  d
}
