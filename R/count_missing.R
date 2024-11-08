#' Count Missing Values by Group
#' 
#' @description Computes the number of missing values in each column for each level of a specified grouping column.
#'
#' @details This function groups data by the specified `group_col`, then counts the missing values in each column within each group.
#' It uses `dplyr` functions `group_by()` and `summarize()` for efficient grouping and summarization.
#'
#' @param data A data frame or tibble containing the data.
#' @param group_col The column within `data` to group by. Specify unquoted column name.
#' @param .groups (Optional) Controls whether the output is grouped by `group_col`. Defaults to `"drop"`.
#' 
#' @return A tibble with each unique level of `group_col` and a count of `NA`s for each column in `data`, excluding the grouping column.
#' 
#' @examples
#' # Example with the airquality dataset
#' count_all_missing_by_group(airquality, Month)
#'
#' # Piping example
#' airquality |> count_all_missing_by_group(Month)
#'
#' # Keeping grouped output
#' count_all_missing_by_group(airquality, Month, .groups = "keep")
#'
#' @export
count_all_missing_by_group <- function(data, group_col, .groups = "drop") {
  if (!is.null(.groups)) {
    if (!(.groups %in% c("drop_last", "drop", "keep", "rowwise"))) {
      stop(".groups needs to be one of NULL, \"drop_last\", \"drop\", \"keep\", and \"rowwise\".")
    }
  }
  data |> group_by({{ group_col }}) |>
    summarize(across(everything(), ~sum(is.na(.x))), .groups = .groups)
}
