## Programming with R programming assignment 3
## Function that returns a 2 column dataframe containg the hospitial in each state that has the ranking specified 
## in num. Hospitals that do not have data on an outcome should be excluded
## Takes two arguments, an outcome name, and the ranking

rankall <- function( outcome, num ="best" ) {
## Read outcome data
  outcomeofcare <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  outcomeTest <- c("heart attack","heart failure","pneumonia")
  output <- data.frame(hospital=character(),state=character(),stringsAsFactors=FALSE)

## Check that state and outcome are valid
  if ( !(outcome %in% outcomeTest) ) {
    stop("invalid outcome")
  }
  if (num == "best") {
    num <- 1
  }
## For each state, find the hospital of the given rank
  statelist <- sort(unique(outcomeofcare[,7]))
  for (state in statelist) {
    m <- outcomeofcare[outcomeofcare[,7]==state,]
    
    if ( outcome == "heart attack") {
      r <-m[order( as.numeric(m[,11]), m[,2], na.last = NA ), ]
    }
    if ( outcome == "heart failure") {
      r <-m[order( as.numeric(m[,17]), m[,2] , na.last = NA), ]
    } 
    if ( outcome == "pneumonia") {
      r <-m[order( as.numeric(m[,23]), m[,2] , na.last = NA), ]
    }
    outnum <- num
    if (num == "worst") {
      outnum <- nrow(r)
    }
##    output[nrow(output)+1,] <- c(r[outnum,2],state)
    output <- rbind(output, data.frame(row.names=state,hospital=r[outnum,2],state=state)) 
  }

## Return a data frame with the hospital names and the
## (abbreviated) state name
  output
  
}