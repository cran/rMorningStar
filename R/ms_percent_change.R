#' @title ms.PercentChange
#' @description Gives the percent change of the fund
#' @param ticker Enter the TICKER of the fund
#' @return Provides the percent change of the fund
#' @details Percent Change of the funds from previous Close.
#' @examples
#' ms.PercentChange('FXAIX')
#' @rdname ms.PercentChange
#' @importFrom quantmod getSymbols
#' @importFrom stats na.omit
#' @export
ms.PercentChange = function(ticker){
  dat = getSymbols(ticker, auto.assign = FALSE)
  dat = na.omit(dat)
  dat = tail(dat, n = 2)
  percent_change = diff(dat)[2,6]
  abs_change = as.numeric(percent_change)
  percent_chg = abs_change / tail(dat[,6],n = 1)
  as.numeric(percent_chg)
}
