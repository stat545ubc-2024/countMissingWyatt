test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

library(testthat)
library(dplyr)

test_that("Output matches direct call to dplyr", {
  small_tbl <- tibble::tribble(
    ~group, ~var1, ~var2,
    "A", 1, NA,
    "A", 2, "x",
    "B", NA, "y",
    "C", 3, "z"
  )

  # Expected result without .groups argument
  expect_equal(
    small_tbl |> dplyr::group_by(group) |>
      dplyr::summarize(dplyr::across(everything(), ~sum(is.na(.x))), .groups = "drop"),
    count_all_missing_by_group(small_tbl, group)
  )

  # Expected result with NULL .groups argument
  expect_equal(
    small_tbl |> dplyr::group_by(group) |>
      dplyr::summarize(dplyr::across(everything(), ~sum(is.na(.x))), .groups = NULL),
    count_all_missing_by_group(small_tbl, group, NULL)
  )
})

test_that("Checking error handling for .groups input", {
  expect_error(
    count_all_missing_by_group(airquality, Month, "kep"),
    "needs to be one of NULL"
  )
  expect_no_error(
    count_all_missing_by_group(airquality, Month, NULL)
  )
})
