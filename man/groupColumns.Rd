% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/columns.R
\name{groupColumns}
\alias{groupColumns}
\title{Identify group columns in an omop result object}
\usage{
groupColumns(result, overall = lifecycle::deprecated())
}
\arguments{
\item{result}{A summarised_result.}

\item{overall}{deprecated.}
}
\value{
Unique values of the group name column.
}
\description{
Identifies and returns the unique values in group_name column.
}
\examples{
mockSummarisedResult() |>
  groupColumns()

}
