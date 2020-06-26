#' @title ms.10yExcessCategoryReturn
#' @description Provides the Excess Category Return of the Security
#' @param ticker Enter the TICKER
#' @return The output gives the Excess category return of the funs
#' @details Gives the Excess category return for the input TICKER (Fund)
#' @examples
#' ms.10yExcessCategoryReturn('FXAIX')
#' @rdname ms.10yExcessCategoryReturn
#' @import rvest
#' @import stringr
#' @import xml2
#' @importFrom tidyr separate
#' @export
ms.10yExcessCategoryReturn =  function(ticker){
  e1 = ms.10yReturn(ticker) - ms.10yCategoryReturn(ticker)
  e1
}
