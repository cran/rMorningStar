#' @title ms.RiskCategory
#' @description Gives the ouptput of input Performance Metric as provided by the MorningStar Performance Results
#' @param ticker Ticker of the Fund
#' @return The output provides the Input Performance Metric as given by MorningStar.
#' @details Morningstar provides a great deal of useful information in its print publications and in its Principia Plus CD-ROM data service. Use this function for performance metric calculations.
#' @examples
#' ms.RiskCategory('FXAIX')
#' @rdname ms.RiskCategory
#' @export
ms.RiskCategory = function(ticker){
  risk_rating = ms.summary(ticker)[7,]
  risk_rating[,-1]
}
