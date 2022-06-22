cat('\014')
rm(list = ls())

source("fSSMapGenerate.R")

flist = list.files(path='results/', pattern="*.csv", all.files=FALSE, full.names=T)

for (fpath in flist){
SSMapGenerate(path = fpath, n=5, csv = TRUE, plots = TRUE, plots.interpolate = FALSE)
}

