#' @title ms.Yield
#' @description Gives the ouptput of input Performance Metric as provided by the MorningStar Performance Results
#' @param ticker Ticker of the Fund
#' @return The output provides the Input Performance Metric as given by MorningStar.
#' @details Morningstar provides a great deal of useful information in its print publications and in its Principia Plus CD-ROM data service. Use this function for performance metric calculations.
#' @examples
#' ms.Yield('FXAIX')
#' @rdname ms.Yield
#' @export
ms.Yield = function(ticker){
    yield = ms.summary(ticker)[11,]
    as.numeric(yield[,-1])
}
