#' @title ms.HoldingsTurnover
#' @description Gives the ouptput of input Performance Metric as provided by the MorningStar Performance Results
#' @param ticker Ticker of the Fund
#' @return The output provides the Input Performance Metric as given by MorningStar.
#' @details Morningstar provides a great deal of useful information in its print publications and in its Principia Plus CD-ROM data service. Use this function for performance metric calculations.
#' @examples
#' ms.HoldingsTurnover('FXAIX')
#' @rdname ms.HoldingsTurnover
#' @export
ms.HoldingsTurnover = function(ticker){
  hold_turnover = ms.summary(ticker)[13,]
  as.numeric(hold_turnover[,-1])
}

