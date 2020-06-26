#' @title ms.YTDExcessCategoryReturn
#' @description Provides the Excess Category Return of the Security
#' @param ticker Enter the TICKER
#' @return The output gives the Excess category return of the funs
#' @details Gives the Excess category return for the input TICKER (Fund)
#' @examples
#' ms.YTDExcessCategoryReturn('FXAIX')
#' @rdname ms.YTDExcessCategoryReturn
#' @import rvest
#' @import stringr
#' @import xml2
#' @importFrom tidyr separate
#' @export
ms.YTDExcessCategoryReturn =  function(ticker){
  e1 = ms.ytdreturn(ticker) - ms.YTDCategoryReturn(ticker)
  e1
}
