#' @title ms.5yBeta
#' @description Gives the ouptput of input Performance Metric as provided by the MorningStar Performance Results
#' @param ticker Ticker of the Fund
#' @return The output provides the Input Performance Metric as given by MorningStar.
#' @details Morningstar provides a great deal of useful information in its print publications and in its Principia Plus CD-ROM data service. Use this function for performance metric calculations.
#' @examples
#' ms.5yBeta('FXAIX')
#' @rdname ms.5yBeta
#' @export
ms.5yBeta = function(ticker){
  beta = ms.summary(ticker)[10,]
  as.numeric(beta[,-1])
}
