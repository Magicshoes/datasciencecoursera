complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  cfoo <- data.frame(id=factor(),nobs=factor())
  for(i in id){
    csvfile <- sprintf("%03d.csv", i)
    filepath <- file.path(directory, csvfile)
    foo <- read.csv(filepath, header = TRUE)
    m1 <- data.frame(id = i, nobs=nrow(subset(foo,!is.na(nitrate) & !is.na(sulfate))))
    cfoo <- rbind(cfoo,m1)
  }
  cfoo
  
}