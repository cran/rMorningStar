#' @title ms.ytdreturn
#' @description MorningStar YTD Return
#' @param ticker Enter the TICKER for the security
#' @return Returns the MorningStar YTD Return of the Security as Calculated by MorningStar.
#' @details A traditional measure of performance in the mutual fund industry is the cumulative value of $1 compounded over a specified number of periods. Morningstar uses such measures on both before-load and after-load fee bases. The value relative at the end of T periods not taking any load charges into account is:
#' @examples
#' ms.ytdreturn('AAPL')
#' @rdname ms.ytdreturn
#' @importFrom quantmod periodReturn getSymbols
#' @importFrom xts xts apply.monthly to.monthly
#' @import utils
#' @export
ms.ytdreturn = function(ticker){
  year = paste0(Sys.Date() - 1115,'/')
  ticker = ticker
  fund = getSymbols(ticker, auto.assign = FALSE)
  fund = to.monthly(fund)
  fund = fund[year,]
  ytd_return = tail(periodReturn(fund[,6], period = 'yearly'),n = 1)
  ytd_return[,1]
}
