a <- 3
a/3

b <- c(1, 2, 3, 4)
b/4

m <- cbind(b, b*2)
m

l <- list(1, 5+4i, 'hello', TRUE)
l
typeof(l[[4]])

d <- data.frame(m)
d
colnames(d)[2]='b*2'


airquality
airquality[1:10,]
str(airquality)
summary(airquality)
airquality['TempCelsius'] = (airquality['Temp']-32)*5/9
airquality[1:10,]

fahr_to_celsius <- function(x) {
  (x-32)*5/9
}

airquality['TempCelsius'] = fahr_to_celsius(airquality['Temp'])
airquality[1:10,]

mean(airquality$TempCelsius)

mayAirQuality <- airquality[which(airquality$Month==5),]
mean(mayAirQuality$TempCelsius)

avgMonthTemp <- tapply(airquality$TempCelsius, airquality$Month, mean)

names(avgMonthTemp) <- month.abb[as.numeric(names(avgMonthTemp))]
plot(avgMonthTemp, xaxt="n", type="n", xlab="Month", ylab="Temperature [Celsius]")
axis(1,at=1:5,labels=names(avgMonthTemp))
lines(avgMonthTemp, type="o", col=rainbow(nrow(avgMonthTemp)))
