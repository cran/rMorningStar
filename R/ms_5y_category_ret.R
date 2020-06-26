#' @title ms.5yCategoryReturn
#' @description Provides the Category Return of the Security
#' @param ticker Enter the TICKER
#' @return The output gives the category return of the funs
#' @details Gives the category return for the input TICKER (Fund)
#' @examples
#' ms.5yCategoryReturn('FXAIX')
#' @rdname ms.5yCategoryReturn
#' @import rvest
#' @import stringr
#' @import xml2
#' @importFrom tidyr separate
#' @export
ms.5yCategoryReturn =  function(ticker){
  url = paste0('https://in.finance.yahoo.com/quote/', ticker,'/performance?p=',  ticker)
  d = read_html(url) %>% html_node('body') %>% xml_find_all("//div[contains(@class, 'Bdbw(1px) Bdbc($seperatorColor) Bdbs(s) H(25px) Pt(10px)')]") %>% html_text()
  d = str_remove_all(str_subset(d, '5-year'), '5-year')[2]
  DF = data.frame(d)
  d = separate(DF, d, into = c('pre', 'post'), sep = '%') %>% pull('post')
  d = parse_number(d)
  d = d/100
  d
}
