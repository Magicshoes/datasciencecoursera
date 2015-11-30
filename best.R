## Programming with R programming assignment 3
## Function that returns the name of the hospital that has the best (lowest) 30-day mortality rate
## for the specified outcome in that state.
## Takes two arguments, 2-character abbreviated name of hte state, and an outcome name

best <- function(state, outcome) {
  ## Read outcome date
  outcomeofcare <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  statesofcare <- outcomeofcare[,7]
  outcomeTest <- c("heart attack","heart failure","pneumonia")
  
    ## Check that state and outcome are valid
  if ( !(state %in% statesofcare) ) {
    stop("invalid state")
  }
  if ( !(outcome %in% outcomeTest) ) {
    stop("invalid outcome")
  }
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  m <- outcomeofcare[outcomeofcare[,7]==state,]
  
  if ( outcome == "heart attack") {
    r <-m[which(m[,11] == min(as.numeric(m[,11]), na.rm = TRUE)), ]
  }
  if ( outcome == "heart failure") {
    r <-m[which(m[,17] == min(as.numeric(m[,17]), na.rm = TRUE)), ]
  }
  if ( outcome == "pneumonia") {
    r <-m[which(m[,23] == min(as.numeric(m[,23]), na.rm = TRUE)), ]
  }
 
 r[,2]
  
}