best <- function(state, outcome) {
    # Read outcome data
    outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses="character")
    
    ## Check that state and outcome are valid
    if (!is.element(state, outcomeData[, 7])) {
        stop("invalid state")
    }
    
    allowedOutcomes <- as.character(list("heart attack", "heart failure", "pneumonia"))
    if (!is.element(outcome, allowedOutcomes)) {
        stop("invalid outcome")
    }
    
    ## Return hospital name in that state with lowest 30-day death rate
    outcomeDataForState <- subset(outcomeData, State == state)
    
    colIndex <- 11
    if (outcome == "heart failure") {
        colIndex <- 17
    } else if (outcome == "pneumonia") {
        colIndex <- 23
    }
    outcomeDataForState[,colIndex] <- as.numeric(outcomeDataForState[,colIndex])
    
    result <- outcomeDataForState[which.min(outcomeDataForState[,colIndex]),]$Hospital.Name
}

best("NY", "pneumonia")