#' @title PortfolioManager
#' @description Gives the detailed  Risk-Reward Metrics as Computed by MorningStar
#' @param ticker Enter the Fund TICKER
#' @param view Choose a View of the Portfolio, Default: c("overview", "detailed")
#' @return The output is a tibble that gives the overview of the risk and reward metrics of different holdings in a portfoluio.
#' @details This function can be used to examine and assess your holdings in different funds
#' @import dplyr
#' @importFrom purrr map_dbl map_chr possibly
#' @rdname PortfolioManager
#' @export
PortfolioManager = function(ticker, view = c('overview', 'detailed')){
  fund_name = map_chr(ticker, possibly(ms.FundName, otherwise = NA_real_))
  last_close = map_dbl(ticker, possibly(ms.LastClose, otherwise = NA_real_))
  percent_change = map_dbl(ticker,possibly(  ms.PercentChange, otherwise = NA_real_))
  category = map_chr(ticker, possibly(ms.FundCat, otherwise = NA_real_))
  net_asset = map_dbl(ticker, possibly(ms.NetAsset, otherwise = NA_real_))
  return_rating = map_dbl(ticker, possibly(ms.ReturnRating, otherwise = NA_real_))
  risk_rating = map_dbl(ticker, possibly(ms.RiskRating, otherwise = NA_real_))
  ms_rating = map_dbl(ticker, possibly(ms.Rating, otherwise = NA_real_))
  ytd_return = map_dbl(ticker, possibly(ms.ytdreturn, otherwise = NA_real_))
  ytd_rank = map_dbl(ticker, possibly(ms.YtdRank, otherwise = NA_real_))
  ytd_excess_cat_return = map_dbl(ticker, possibly(ms.YTDExcessCategoryReturn, otherwise = NA_real_))
  three_y_return = map_dbl(ticker,  possibly( ms.3yReturn, otherwise = NA_real_))
  three_y_rank = map_dbl(ticker, possibly(ms.3yRank, otherwise = NA_real_))
  three_y_excess_cat_return = map_dbl(ticker, possibly(ms.3yExcessCategoryReturn, otherwise = NA_real_))
  five_y_return = map_dbl(ticker, possibly( ms.5yReturn, otherwise = NA_real_))
  five_y_rank = map_dbl(ticker, possibly(ms.5yRank, otherwise = NA_real_))
  five_y_excess_cat_return = map_dbl(ticker, possibly(ms.5yExcessCategoryReturn, otherwise = NA_real_))
  ten_y_return = map_dbl(ticker, possibly(ms.10yReturn, otherwise = NA_real_))
  ten_y_excess_cat_return = map_dbl(ticker, possibly(ms.10yExcessCategoryReturn, otherwise = NA_real_))
  expense_ratio = map_dbl(ticker, possibly(ms.ExpenseRatio, otherwise = NA_real_))
  beta = map_dbl(ticker, possibly(ms.5yBeta, otherwise = NA_real_))
  alpha = map_dbl(ticker, possibly(ms.3yAlpha, otherwise = NA_real_))
  std_dev = map_dbl(ticker, possibly(ms.stdev, otherwise = NA_real_))
  top10_holding = map_dbl(ticker, possibly(ms.Top10HoldingTotal, otherwise = NA_real_))
  if(view == 'overview'){
    portfolio = data.frame(fund_name, ticker, last_close, percent_change, ms_rating, ytd_return, expense_ratio, std_dev)
  }else if(view == 'detailed'){
  portfolio = data.frame(fund_name, ticker, last_close, percent_change, category, net_asset, return_rating, risk_rating, ms_rating, ytd_return, ytd_rank, ytd_excess_cat_return, three_y_return, three_y_rank, three_y_excess_cat_return, five_y_return, five_y_rank, five_y_excess_cat_return, ten_y_return, ten_y_excess_cat_return, expense_ratio, beta, alpha, std_dev, top10_holding)
  }else{'Please Select a view (overview/detailed)'}
  as_tibble(portfolio)
}
