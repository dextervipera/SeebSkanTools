# SeebSkanTools
Requirements:
1. CRAN R (tested: R version 4.1.2 (2021-11-01))
2. RStudio

# Automated filtering
1. place SeebSkan-structire csv files in the ``` R/results/ ``` directory
2. Run the ``` AutoResults.R ``` script
3. Smile please

## Seebeck tools for analysis - More detailed appr
A simple script for SeebSkan is provided in a function form.

```
#' SSMapGenerate(path, n, csv, plots, plots.interpolate)
#'
#' @param path Path to *.csv file with pure SeebSkan exported data
#' @param n Defines how many times the probe measured one point
#' @param csv Boolean: if true the csv will be rendered
#' @param plots Boolean: Auto-generate map?
#' @param plots.interpolate Boolean: Interpolate inside map?
#'
#' @return Collapsed, mean data frame
#' @export CSV file, if csv=TRUE, XY map if plots=TRUE
```

## Use example
Load the function:
```
source("fSSMapGenerate.R")
```

Use the function on the files:
```
void = SSMapGenerate(path = **PATH_TO_FILE**,
                     n=5, csv = TRUE, plots = TRUE, plots.interpolate = FALSE)
```
