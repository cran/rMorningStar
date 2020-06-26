#' @title ms.Top10HoldingTotal
#' @description Gives the MorningStar Top 10 Holding Total of the fund
#' @param ticker Enter the TICKER of the Fund
#' @return Gives the Morningstar Top 10 Holding Total of the Fund
#' @details Gives the fund's top 10 Holdings Total as cmputed by MorningStar.
#' @examples
#' ms.Top10HoldingTotal('FXAIX')
#' @rdname ms.Top10Holding
#' @import rvest
#' @import stringr
#' @importFrom xml2 read_html
#' @export
ms.Top10HoldingTotal = function(ticker){
  tot = ms.Top10Holding(ticker)
  sum(tot[,3])
}
