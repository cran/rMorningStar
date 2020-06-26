#' @title ms.GrowthTrack
#' @description Plots the growth of input amount in a fund
#' @param ticker Fund TICKER
#' @param growth_amount Amount invested in the fund, Default: 10000
#' @param benchmark Benchmark to compare the fund with, Default: '^GSPC'
#' @param time_period Investment Horizon: c("1m", "3m", "6m", "YTD", "1y", "3y", "5y", "max")
#' @return Plots the growth of the investment (Mutua Fund/ETFs) and compares it with provided benchmark
#' @details Plots the cumulative groth of the fund in a mutual fund/ETFs and compares it with the input benchmark.
#' @examples
#' ms.GrowthTrack('FXAIX', time_period = 'YTD')
#' @rdname ms.GrowthTrack
#' @import quantmod
#' @importFrom xts merge.xts plot.xts
#' @export
ms.GrowthTrack = function(ticker, growth_amount = 10000, benchmark = '^GSPC', time_period = c('1m', '3m', '6m', 'YTD', '1y', '3y', '5y', 'max')){
fund = getSymbols(ticker, auto.assign = FALSE)
fund = fund[,6]
if(benchmark == ''){
  bench = getSymbols(ticker, auto.assign = FALSE)
  bench = bench[,6]
}else{
bench = getSymbols(benchmark, auto.assign = FALSE)
bench = bench[,6]
}
if(time_period == '1m'){
  fund = tail(fund, 21)
}else if(time_period == '3m'){
  fund = tail(fund, 63)
}else if(time_period == '6m'){
  fund = tail(fund, 126)
}else if(time_period == '1y'){
  fund = tail(fund, 252)
}else if(time_period == '3y'){
  fund = tail(fund, 756)
}else if(time_period == '5m'){
  fund = tail(fund, 1260)
}else if(time_period == 'YTD'){
  date = paste0(format(Sys.Date(), '%Y'),'/')
  fund = fund[date,]
}else{
fund = fund
}

if(time_period == '1m'){
  bench = tail(bench, 21)
}else if(time_period == '3m'){
  bench = tail(bench, 63)
}else if(time_period == '6m'){
  bench = tail(bench, 126)
}else if(time_period == '1y'){
  bench = tail(bench, 252)
}else if(time_period == '3y'){
  bench = tail(bench, 756)
}else if(time_period == '5m'){
  bench = tail(bench, 1260)
}else if(time_period == 'YTD'){
  date = paste0(format(Sys.Date(), '%Y'),'/')
  bench = bench[date,]
}else{
  bench = bench
}

fund = cumsum(periodReturn(fund, 'daily')*growth_amount)
fund = fund + growth_amount
bench = cumsum(periodReturn(bench, 'daily')*growth_amount)
bench = bench + growth_amount
dat = merge.xts(fund, bench)
colnames(dat) = c(paste0(ticker), paste0(benchmark))
return(plot.xts(dat, legend.loc = 'topright', main = 'Growth of 10,000; Fund Vs Fund/Benchmark', yaxis.left = TRUE, col = c('blue', 'green'), grid.ticks.on = 'auto'))
}
