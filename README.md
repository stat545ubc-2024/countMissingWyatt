
<!-- README.md is generated from README.Rmd. Please edit that file -->

# countMissingWyatt

This package provides tools for analyzing and summarizing missing data
across groups in a dataset. It includes functions to group data by a
specified column and count the number of missing values in each column
within each group, simplifying data quality assessments.

## Student Info

name: Xiang Zhang

## Installation

You can install the development version of this package from GitHub:

``` r
devtools::install_github("stat545ubc-2024/countMissingWyatt", ref = "1.0.0")
#> Downloading GitHub repo stat545ubc-2024/countMissingWyatt@1.0.0
#> lifecycle (1.0.3 -> 1.0.4) [CRAN]
#> glue      (1.6.2 -> 1.8.0) [CRAN]
#> withr     (2.5.0 -> 3.0.2) [CRAN]
#> utf8      (1.2.2 -> 1.2.4) [CRAN]
#> fansi     (1.0.2 -> 1.0.6) [CRAN]
#> Installing 5 packages: lifecycle, glue, withr, utf8, fansi
#> Installing packages into '/private/var/folders/7w/wpjhzm9d3mq12mgfgpfvbv400000gn/T/Rtmp36BA6I/temp_libpathbc8371a1fd31'
#> (as 'lib' is unspecified)
#> Warning in readRDS(dest): lzma decoder corrupt data
#> 
#>   There are binary versions available but the source versions are later:
#>           binary source needs_compilation
#> lifecycle  1.0.3  1.0.4             FALSE
#> glue       1.6.2  1.8.0              TRUE
#> withr      2.5.0  3.0.2             FALSE
#> utf8       1.2.3  1.2.4              TRUE
#> fansi      1.0.4  1.0.6              TRUE
#> installing the source packages 'lifecycle', 'glue', 'withr', 'utf8', 'fansi'
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#> * checking for file ‘/private/var/folders/7w/wpjhzm9d3mq12mgfgpfvbv400000gn/T/RtmpdGJhyU/remotes11d385bff294a/stat545ubc-2024-countMissingWyatt-6f7530a/DESCRIPTION’ ... OK
#> * preparing ‘countMissingWyatt’:
#> * checking DESCRIPTION meta-information ... OK
#> * checking for LF line-endings in source and make files and shell scripts
#> * checking for empty or unneeded directories
#> * building ‘countMissingWyatt_1.0.0.tar.gz’
#> Installing package into '/private/var/folders/7w/wpjhzm9d3mq12mgfgpfvbv400000gn/T/Rtmp36BA6I/temp_libpathbc8371a1fd31'
#> (as 'lib' is unspecified)
```

## Usage

Load the package and use `count_all_missing_by_group()` to analyze
missing values in grouped data. Here’s an example with the `airquality`
dataset:

``` r
library(countMissingWyatt)
data(airquality)
# Count missing values grouped by Month
count_all_missing_by_group(airquality, Month)
#> # A tibble: 5 × 6
#>   Month Ozone Solar.R  Wind  Temp   Day
#>   <int> <int>   <int> <int> <int> <int>
#> 1     5     5       4     0     0     0
#> 2     6    21       0     0     0     0
#> 3     7     5       0     0     0     0
#> 4     8     5       3     0     0     0
#> 5     9     1       0     0     0     0


#To keep the output grouped by the grouping column, use the .groups argument:

count_all_missing_by_group(airquality, Month, .groups = "keep")
#> # A tibble: 5 × 6
#> # Groups:   Month [5]
#>   Month Ozone Solar.R  Wind  Temp   Day
#>   <int> <int>   <int> <int> <int> <int>
#> 1     5     5       4     0     0     0
#> 2     6    21       0     0     0     0
#> 3     7     5       0     0     0     0
#> 4     8     5       3     0     0     0
#> 5     9     1       0     0     0     0
```
