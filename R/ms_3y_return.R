#' @title ms.3yReturn
#' @description Provides the 3y Return of the Security
#' @param ticker Enter the TICKER
#' @return The output gives the stated return of the funs
#' @details Gives the stated return for the input TICKER (Fund)
#' @examples
#' ms.3yReturn('FXAIX')
#' @rdname ms.3yReturn
#' @import rvest
#' @import stringr
#' @import xml2
#' @export
ms.3yReturn =  function(ticker){
url = paste0('https://in.finance.yahoo.com/quote/', ticker,'/performance?p=',  ticker)
d = read_html(url) %>% html_node('body') %>% xml_find_all("//div[contains(@class, 'Bdbw(1px) Bdbc($seperatorColor) Bdbs(s) H(25px) Pt(10px)')]") %>% html_text()
d = parse_number(str_remove_all(str_subset(d, '3-year'), '3-year'))[[1]]
d = d/100
d
}
