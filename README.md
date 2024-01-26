# VisOmopResults

<!-- badges: start -->

[![R-CMD-check](https://github.com/catalamarti/gtSummarisedResult/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/catalamarti/gtSummarisedResult/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Package overview

VisOmopResults contains functions for formatting objects of the class *summarised_result* and *compared_result* (see R package [omopgenerics](https://cran.r-project.org/web/packages/omopgenerics/index.html)). This package simplifies the handling of these objects to obtain nice output tables in the format of *gt* or *flextable*' to report results via Shiny apps, RMarkdown, Quarto, and more.


## Installation

You can install the development version of VisOmopResults from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("oxford-pharmacoepi/VisOmopResults")
```

## Example

In this example we show how to use the package to format a mock *summarised_result* object into a nice gt object.

First we load the package and create the mock *summarised_result* object.

``` r
library(VisOmopResults)
library(dplyr)
result <- mockSummarisedResult()
```

### 1. formatEstimateValue
We utilize the `formatEstimateValue` function to modify the *estimate_value* column. In this case, we will apply the default settings of the function, which include using 0 decimals for integer values, 2 decimals for numeric values, 1 decimal for percentages, and 3 decimals for proportions. Additionally, the function sets the decimal mark to '.', and the thousand/millions separator to ',' by default."

``` r
result <- result |> formatEstimateValue()
```

### 2. formatEstimateName
The `formatEstimateName` function enables the transformation of the *estimate_name* and *estimate_value* columns. For example, it allows to consolidate into one row counts and percentages related to the same variable within the same group and strata. It's worth noting that the estimate_name is enclosed within <...> in the *estimateNameFormat* argument."
``` r
result <- result |> formatEstimateName(
  estimateNameFormat = c("N (%)" = "<count> (<percentage>%)",
                         "N" = "<count>",
                         "Mean (SD)" = "<mean> (<sd>)"),
  keepNotFormatted = FALSE)
```

### 3. formatTable
[to do]
``` r
result <- result |>
  spanHeader(header = c("Study cohorts", "group_level", "Study strata",
                         "strata_name", "strata_level"),
             delim = "\n", 
             includeHeaderName = FALSE,
             includeHeaderKey = FALSE)
```

### 4. gtTable
[to do]
``` r
result <- result |>
  gtTable(
    delim = "\n",
    style = "default",
    na = "-",
    title = "My first gt table with VisOmopResults!",
    groupNameCol = "group_level",
    groupNameAsColumn = FALSE,
    groupOrder = c("cohort1", "cohort2")
    )
```
