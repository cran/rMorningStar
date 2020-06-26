#' @title ms.Top10HoldingPlot
#' @description Gives the MorningStar Top 10 Holding Plot of the fund
#' @param ticker Enter the TICKER of the Fund
#' @return Gives the Morningstar Top 10 Holding Plot of the Fund
#' @details Gives the fund's top 10 Holdings Plot as cmputed by MorningStar.
#' @examples
#' ms.Top10HoldingPlot('FXAIX')
#' @rdname ms.Top10HoldingPlot
#' @import dplyr
#' @import stringr
#' @import ggplot2
#' @export
ms.Top10HoldingPlot = function(ticker){
  Asset_Percentage = NULL
  Symbol = NULL
  m2 = ms.Top10Holding(ticker)
  m2[,3] = m2[,3]/sum(m2[,3])
  m2 %>%
  ggplot() +
  geom_bar(aes(x = '',y = Asset_Percentage, fill = Symbol), stat = 'identity') +
  coord_polar('y') + labs(x = NULL, y = NULL, title = 'Top 10 Holdings') +
  theme_classic() +
  theme(axis.line = element_blank(), axis.text = element_blank(), axis.ticks = element_blank(), plot.title = element_text(hjust = 0.5, color = "#666666"))
}
