pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  cfoo <- data.frame( Date=character(),sulfate=factor(),nitrate=factor(),ID=character())
  for(i in id){
    csvfile <- sprintf("%03d.csv", i)
    filepath <- file.path(directory, csvfile)
    foo <- read.csv(filepath, header = TRUE)
    cfoo <- rbind(cfoo,foo)
  }
  mean(cfoo[,pollutant], na.rm = TRUE)
}

