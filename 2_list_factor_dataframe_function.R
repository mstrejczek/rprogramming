#Lists, factors
x <- list(1, "a", T, 5+4i)
x <- list(first=1, second="a", third=T, fourth=5+4i)
x[1]
x$third

x <- factor(c(T, T, F, F, T))
x <- factors(c(T, T, F, F, T), levels=(T, F))

x <- c(1, 2, NA, 4, NaN)
is.na(x)
is.nan(x)

#Data frames
x <- data.frame(first=1:3, second=c("a", "b", "c"))
dimnames(x) <- list(c("#1", "#2", "#3"), c("uno", "dos"))

airquality
str(airquality)
summary(airquality)
airquality[1:6,]
airquality[complete.cases(airquality),][1:6,]

#Functions
x <- 3
if (x==3) {
  y = 5
} else {
  y = 10
}

y <- if (x == 3) {
  5
} else {
  10
}

for (i in 1:10) {
  print(i)
}

while (x > 0) {
  print(x)
  x <- x-1
}

f <- function(a, b) {
  print(a)
  print(b)
}

f <- function(a, b=0) {
  print(a)
  print(b)
}
