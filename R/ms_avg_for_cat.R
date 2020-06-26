#' @title ms.AvgForCategory
#' @description Gives the ouptput of input Performance Metric as provided by the MorningStar Performance Results
#' @param ticker Ticker of the Fund
#' @return The output provides the Input Performance Metric as given by MorningStar.
#' @details Morningstar provides a great deal of useful information in its print publications and in its Principia Plus CD-ROM data service. Use this function for performance metric calculations.
#' @examples
#' ms.AvgForCategory('FXAIX')
#' @rdname ms.AvgForCategory
#' @export
ms.AvgForCategory = function(ticker){
    avg_cat = ms.summary(ticker)[15,]
    as.numeric(avg_cat[,-1])
  }
