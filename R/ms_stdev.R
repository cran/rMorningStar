#' @title ms.stdev
#' @description MorningStar 3-yr Standard Deviation
#' @param ticker Enter the TICKER for the security
#' @return Returns the Standard Deviation of the Security as Calculated by MorningStar.
#' @details Morningstar's reported standard deviation of fund returns uses both the monthly standard deviation and monthly mean return to compute an annualized value, assuming compounding of the monthly returns and zero serial correlation.
#' @examples
#' ms.stdev('AAPL')
#' @rdname ms.stdev
#' @import PerformanceAnalytics
#' @importFrom quantmod getSymbols
#' @importFrom xts xts apply.monthly
#' @importFrom stats na.omit
#' @export
ms.stdev = function(ticker){
  year = paste0(Sys.Date() - 1115,'/')
  ticker = ticker
  fund = getSymbols(ticker, auto.assign = FALSE)
  fund = na.omit(fund)
  fund = apply.monthly(fund, FUN = mean)
  fund = fund[year,]
  fund_ret = CalculateReturns(fund[,6])
  fund_ret = fund_ret[-1,]
  amr = mean(fund_ret)
  sdmr = StdDev(fund_ret)
  ms.sd = sqrt((sdmr^2 + (1+amr)^2)^12 - ((1+amr)^2)^12)
  ms.sd[,1]
}
