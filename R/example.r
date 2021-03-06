cat ('\014')
rm(list = ls())

library(dplyr)
library(tools)
source("SeebSkan_maps.R")
#Confuguration
# Path to file that has to be tidy-up
F_NAME = "testing/2.12.21 ASPS01_2x2co015_stat5_pom2.csv"
F_subNAME = basename(F_NAME)
F_dirNAME = dirname(F_NAME)
RPT_NAME = paste(F_dirNAME, file_path_sans_ext(F_subNAME),'',sep = '/')
PLOT = T

# How many masures the SeebSkan did at one point
N = 5

#Code -------------- no need to modify at basic cases
header = read.csv(file = F_NAME, header = T, nrows = 1)
names(header)[12] = 'Alpha'

ext_header = paste ('std_dev_',names(header),sep = '')
names(ext_header) = ext_header
output_header = c(header, ext_header)

mm = read.csv(file=F_NAME, skip = 2, dec = ',')
names(mm) <- names(header)
mm = mm[0:(nrow(mm)-1),]
output = summarize_table(mm)

for (i in 1:(nrow(mm)/N)){
  tmp = summarize_table(mm[(5*(i-1)+1):(5*(i-1)+N),])
  output = rbind(output,tmp)
}
outputP = output[2:nrow(output),]
write.csv(x = output[2:nrow(output),], file = paste(RPT_NAME,file_path_sans_ext(F_subNAME),'.csv',sep = ''))
if (PLOT)
{
  #plotting
  library(ggplot2)
  library(raster)
  library(rasterVis)
  library(rgdal)
  library(grid)
  library(scales)
  library(viridis)  # better colors for everyone
  library(ggthemes) # theme_map()
  prev_G01 = ggplot(outputP , aes(x = X, y = Y)) +
    geom_raster(aes(fill = Alpha), interpolate=F) +
    scale_fill_gradient2(low="black", mid="pink", high="red", 
                         midpoint=mean(outputP$Alpha), limits=range(outputP$Alpha)) +
    coord_equal()
  
  dir.create(path = RPT_NAME)
  ggsave(filename = paste(RPT_NAME,'SS_Preview.jpg',sep = ''),device = 'jpg', width = 7, height = 7, units = 'cm')
}