#' @title ms.FundCat
#' @description Gives the ouptput of input Performance Metric as provided by the MorningStar Performance Results
#' @param ticker Ticker of the Fund
#' @return The output provides the Input Performance Metric as given by MorningStar.
#' @details Morningstar provides a great deal of useful information in its print publications and in its Principia Plus CD-ROM data service. Use this function for performance metric calculations.
#' @examples
#' ms.FundCat('FXAIX')
#' @rdname ms.FundCat
#' @export
ms.FundCat = function(ticker){
  fund_cat = ms.summary(ticker)[4,]
  fund_cat[,-1]
}
