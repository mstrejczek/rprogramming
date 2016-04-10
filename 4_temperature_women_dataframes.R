#Examples
## Mean ozone in each month
tapply(airquality[,1], airquality[,5], mean, na.rm=T)
table(cc_air$Month)

## Min and max temperature in each month

fahr_to_celsius <- function(fahr) {
    (fahr-32) *5 / 9
}

tapply(fahr_to_celsius(airquality[,4]), airquality[,5], range)
boxplot(f=fahr_to_celsius(airquality[,4]) ~ airquality[,5])
boxplot(f=fahr_to_celsius(airquality[,4]) ~ airquality[,5], names=c("May", "June", "July", "August", "September"), las=2, col=c("red","sienna","palevioletred1","royalblue2", "yellow"), xlab="Month", ylab="Temperature (Fahr)")

# Plot temperatures vs date
airquality[,7] = as.Date(paste(sep="", "1973-0", airquality[,5],"-",airquality[,6]))

plot(airquality$Temp ~ airquality$Date, xlab="Date", ylab="Max temperature", col="red")
lines(airquality$Temp ~ airquality$Date, xlab="Date", ylab="Max temperature", col="blue")


# Height vs weight of American women
with(women, plot(height, weight))
title(main="Height vs weight of American women")
with(women, cor.test(height, weight))

plot(weight ~ height, data=women, main="Height vs weight of American women")
abline(lm(weight ~ height, data=women), col="red")
