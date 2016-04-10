setwd("D:\\Projects\\R\\GFTPresentation")

log <- read.table("apache.access.log.PROJECT", colClasses = c("character", "character", "character", "character", "character", "character", "numeric", "character"))
colnames(log) <- c('host', 'ident', 'authuser', 'datetime', 'timezone', 'request', 'status', 'bytes')

# reponse size statistics
log[,8] <- as.numeric(log[,8])
mean(log[,8], na.rm=T)
range(log[,8], na.rm=T)

# response status distribution
t <- table(log[,"status"])

pie(t, col=rainbow(length(t)))
barplot(t, col=rainbow(length(t)), xlab="Status code", ylab="Count")

# any 20 hosts that sent more than 10 requests
hosts <- table(log[,"host"])
head(hosts[hosts > 10], n=20)

# unique hosts
length(hosts) 

# top endpoints
requests <- table(log[,"request"])
requestOrder <- order(requests, decreasing = T)
head(requests[requestOrder], n=10)

# top ten error endpoints
failed <- log[log[,"status"] != 200,]
failedReqs <- table(failed[,"request"])
failedReqsOrder <- order(failedReqs, decreasing = T)
head(failedReqs[failedReqsOrder], n=10)
