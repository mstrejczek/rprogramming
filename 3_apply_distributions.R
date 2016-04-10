f <- function(x) {
    x * 2
}

a <- 1:3
lapply(a, f)

a <- list(first=1:5, second=rnorm(100), third=rnorm(100,5))
lapply(a, mean)
sapply(a, mean)

m <- matrix(1:6, nrow=3, ncol=2)
apply(m, 1, mean)
apply(m, 2, mean)

x <- 1:20
y <- factor(rep(letters[1:5], each=4))
tapply(x, y, sum)

a <- c(rnorm(10), rnorm(10, 5), rnorm(10, 10))
f <- gl(3, 10)
tapply(a, f, range)

l <- split(a, f)
r <- sapply(i, range)

#Distributions
set.seed(5)

coin1000 <- rbinom(1000, 1, 0.5)
summary(coin1000)

dice100 = sample(1:6, 100, replace=T)
summary(dice100)
