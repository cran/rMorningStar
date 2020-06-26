#' @title ms.5yExcessCategoryReturn
#' @description Provides the Excess Category Return of the Security
#' @param ticker Enter the TICKER
#' @return The output gives the Excess category return of the funs
#' @details Gives the Excess category return for the input TICKER (Fund)
#' @examples
#' ms.5yExcessCategoryReturn('FXAIX')
#' @rdname ms.5yExcessCategoryReturn
#' @import rvest
#' @import stringr
#' @import xml2
#' @importFrom tidyr separate
#' @export
ms.5yExcessCategoryReturn =  function(ticker){
  e1 = ms.5yReturn(ticker) - ms.5yCategoryReturn(ticker)
  e1
}
