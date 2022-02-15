cat ('\014')
rm(list = ls())
library(dplyr)
source("SeebSkan_maps.R")
#Confuguration
F_NAME = "testing/2.12.21 ASPS01_2x2co015_stat5_pom2.csv"
#Code

header = read.csv(file = F_NAME, header = T, nrows = 1)
ext_header = paste ('std_dev_',names(header),sep = '')
mm = read.csv(file=F_NAME, skip = 2, dec = ',')
names(mm) <- names(header)
mm = mm[0:(nrow(mm)-1),]
output = summarize_table(mm)

N = 5
for (i in 1:(nrow(mm)/N)){
  tmp = summarize_table(mm[(5*(i-1)+1):(5*(i-1)+N),])
  output = rbind(output,tmp)
}
write.csv(x = output[2:nrow(output),], file = paste("summarized.csv"))