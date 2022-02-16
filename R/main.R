cat('\014')
rm(list = ls())

source("fSSMapGenerate.R")

void = SSMapGenerate(path = "testing/2.12.21 ASPS01_2x2co015_stat5_pom2.csv",
                     n=5, csv = TRUE, plots = TRUE, plots.interpolate = FALSE)