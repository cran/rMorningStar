#' @title ms.ExpenseRatio
#' @description Gives the ouptput of input Performance Metric as provided by the MorningStar Performance Results
#' @param ticker Ticker of the Fund
#' @return The output provides the Input Performance Metric as given by MorningStar.
#' @details Morningstar provides a great deal of useful information in its print publications and in its Principia Plus CD-ROM data service. Use this function for performance metric calculations.
#' @examples
#' ms.ExpenseRatio('FXAIX')
#' @rdname ms.ExpenseRatio
#' @export
ms.ExpenseRatio = function(ticker){
  expenseratio = ms.summary(ticker)[3,]
  as.numeric(expenseratio[,-1])
}
