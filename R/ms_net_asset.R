#' @title ms.NetAsset
#' @description Gives the ouptput of input Performance Metric as provided by the MorningStar Performance Results
#' @param ticker Ticker of the Fund
#' @return The output provides the Input Performance Metric as given by MorningStar.
#' @details Morningstar provides a great deal of useful information in its print publications and in its Principia Plus CD-ROM data service. Use this function for performance metric calculations.
#' @examples
#' ms.NetAsset('FXAIX')
#' @rdname ms.NetAsset
#' @export
ms.NetAsset = function(ticker){
  net_asset = ms.summary(ticker)[9,]
  as.numeric(net_asset[,-1]) * 10^9
}
