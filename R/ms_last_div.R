#' @title ms.LastDividend
#' @description Gives the ouptput of input Performance Metric as provided by the MorningStar Performance Results
#' @param ticker Ticker of the Fund
#' @return The output provides the Input Performance Metric as given by MorningStar.
#' @details Morningstar provides a great deal of useful information in its print publications and in its Principia Plus CD-ROM data service. Use this function for performance metric calculations.
#' @examples
#' ms.LastDividend('FXAIX')
#' @rdname ms.LastDividend
#' @export
ms.LastDividend = function(ticker){
    last_div = ms.summary(ticker)[14,]
    as.numeric(last_div[,-1])
  }
