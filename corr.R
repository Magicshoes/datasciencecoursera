corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  files <- list.files(path=directory)
  cfoo <- numeric()
  for(i in 1:length(files) ){
      if (complete(directory,i)$nobs>threshold ) {
        csvfile <- sprintf("%03d.csv", i)
        filepath <- file.path(directory, csvfile)
        foo <- read.csv(filepath, header = TRUE)
        m1 <- subset(foo,!is.na(nitrate) & !is.na(sulfate))
        m2 <- cor(m1$nitrate,m1$sulfate)
        cfoo <- c(cfoo,m2)
      }  
  }
  cfoo
  
}