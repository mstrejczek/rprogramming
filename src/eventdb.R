#Sys.setenv(PASS="pass")

#install.packages("RPostgreSQL")
#install.packages("plyr")

connectToEventDb <- function() {
  require("RPostgreSQL")
  
  # create a connection
  pw <- {
    Sys.getenv("PASS")
  }  
  
  # loads the PostgreSQL driver
  drv <- dbDriver("PostgreSQL")
  
  # creates a connection to the postgres database
  # note that "con" will be used later in each connection to the database
  #  con <- dbConnect(drv, dbname = "report", # mirror
  #                   host = "dev-cppl2-dbpgsql-001.flatns.net", port = 5432,
  #                   user = "report", password = pw)
  con <- dbConnect(drv, dbname = "events",
                   host = "rprod-cpp-r2-events-master.flatns.net", port = 5441,
                   user = "events_ro", password = pw)  
  rm(pw) # removes the password
  
  return(con)
}

disconnectFromEventDb <- function(con) {
  # close the connection
  dbDisconnect(con)
}

conn <- connectToEventDb()

fromDate <- '2017-11-15 00:00:00'
toDate <- '2017-11-15 01:00:00'
sql <- paste("",
             "select",
             "txn_uuid, event_type, user_id, client_date",
             "from event_rprod_cpp_r2.events",
             "where client_date >= '", fromDate, "'::timestamp", 
             "and client_date < '", toDate, "'::timestamp", 
             "order by user_id asc, client_date asc;",
             sep="\n")
  
events <- dbGetQuery(conn, sql, as.is=TRUE)
  
# Event Tracker stores times without timestamp, let's assume it is UTC
events$client_date <- as.character(events$client_date)
events$client_date <- as.POSIXct(events$client_date, "UTC")

disconnectFromEventDb(conn)

summary(events)

events
unique(events$event_type)

failed_commits <- events[events$event_type == 'COMMIT_CURRENT_TRANSACTION_FAILED',]
failed_commits
nrow(failed_commits)

library(plyr)
userEventCount <- count(events, "user_id")
mostActiveUsers <- userEventCount[userEventCount$freq > 200,]
mostActiveUsers

eventTypeCounts <- with(events, table(event_type))
numerousEventTypeCounts <- eventTypeCounts[eventTypeCounts>200]
barplot(numerousEventTypeCounts, beside=TRUE, legend=TRUE, col=rainbow(nrow(numerousEventTypeCounts)))
