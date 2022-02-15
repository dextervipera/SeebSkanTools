summarize_table <- function (x){
  means = x[,] %>% summarise_at(c(1:16), mean)
  means$TIME_ABSOLUTE = tail (mm$TIME_ABSOLUTE,1)
  std_devs = x[,] %>% summarise_at(1:ncol(x), sd)
  
  names(means) = names(x)
  names(std_devs) = paste ('std_dev_',names(means),sep = '')
  
  return(cbind(means,std_devs))
}