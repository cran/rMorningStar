#' @title ms.summary
#' @description Summary of the Fund Risk and Returns
#' @param ticker Enter the TICKER for the security
#' @return Returns the Summary of the Security's Risk and Return as Calculated by MorningStar.
#' @details Morningstar provides a great deal of useful information in its print publications and in its Principia Plus CD-ROM data service. This function can be used to get a DataFrame of the summary of the risk and return of the input fund.
#' @examples
#' ms.summary('FXAIX')
#' @rdname ms.summary
#' @import rvest
#' @import rvest
#' @import stringr
#' @importFrom xml2 read_html
#' @importFrom readr parse_number
#' @importFrom dplyr arrange
#' @export
ms.summary = function(ticker){
  url = paste0('https://finance.yahoo.com/quote/',ticker,'/quote?p=', ticker)
  summary_table = read_html(url) %>% html_table()
  summary_table_1 = as.data.frame(summary_table[[1]])
  summary_table_2 = as.data.frame(summary_table[[2]])
  summary_table = rbind(summary_table_1, summary_table_2)
  colnames(summary_table) = c('parameter', 'value')
  summary_table[9,2] = parse_number(summary_table[9,2])
  summary_table[11,2] = parse_number(summary_table[11,2])/100
  summary_table[13,2] = parse_number(summary_table[13,2])/100
  summary_table[2,2] = parse_number(summary_table[2,2])/100
  summary_table[3,2] = parse_number(summary_table[3,2])/100
  summary_table[2,2] = ms.ytdreturn(ticker)
  return(summary_table)
}
