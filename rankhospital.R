## Programming with R programming assignment 3
## Function that returns the name of the hospital that has the ranking specified by the num argument
## of the 30-day mortality rate for the specified outcome in that state.
## Takes three arguments, 2-character abbreviated name of hte state, an outcome name, and the ranking

rankhospital <- function(state, outcome, num ="best") {
## Read outcome data
  outcomeofcare <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  statesofcare <- outcomeofcare[,7]
  outcomeTest <- c("heart attack","heart failure","pneumonia")

## Check tha state and outcome are valid
  if ( !(state %in% statesofcare) ) {
    stop("invalid state")
  }
  if ( !(outcome %in% outcomeTest) ) {
    stop("invalid outcome")
  }
  
## Return hospital name in that state with the given rank
## 30-day death rate
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
  if (num == "worst") {
    num <- nrow(r)
  }
  if (num == "best") {
    num <- 1
  }
  r[num,2]
}