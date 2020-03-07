#' Subset Data Frame to Include One Row Per Unique Combination of Varlist
#' 
#' @description When finding unique people in a data frame, if we attempt to 
#'   determine if every individual row in the entire data set is a match with 
#'   every other individual row, it is a costly process. It becomes much more 
#'   tractable if we temporarily reduce the data to one row for each 
#'   combination of values that we want to investigate. In this case, we want 
#'   to investigate all unique combinations of name, DOB, and address.
#'
#' @param df The data frame to subset
#' @param ... A list of variables to find unique combinations of
#'
#' @return A tibble
#' @export
#'
#' @examples
#' \dontrun{reduce_search_space(df_unique_combo, sex)}
reduce_search_space <- function(df, ...) {
  
  # ------------------------------------------------------------------
  # Prevents R CMD check: "no visible binding for global variable ‘.’"
  # ------------------------------------------------------------------
  df = NULL
  
  # ===========================================================================
  # Enquo arguments
  # enquo/quo_name/UQ the ci_type and output argument so that I don't have to
  # use quotation marks around the argument being passed.
  # ===========================================================================
  varlist <- rlang::enquos(...)
  
  # ===========================================================================
  # Setup 
  # ===========================================================================
  out <- dplyr::mutate(df, group = paste(!!!varlist, sep = "_"))
  out
  
}

