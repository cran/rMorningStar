#' @title ms.3yExcessCategoryReturn
#' @description Provides the Excess Category Return of the Security
#' @param ticker Enter the TICKER
#' @return The output gives the Excess category return of the funs
#' @details Gives the Excess category return for the input TICKER (Fund)
#' @examples
#' ms.3yExcessCategoryReturn('FXAIX')
#' @rdname ms.3yExcessCategoryReturn
#' @import rvest
#' @import stringr
#' @import xml2
#' @importFrom tidyr separate
#' @export
ms.3yExcessCategoryReturn =  function(ticker){
  e1 = ms.3yReturn(ticker) - ms.3yCategoryReturn(ticker)
  e1
}
