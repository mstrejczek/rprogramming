a <- 3

ls()
rm(list=ls())

#Vectors
a <- c(1, 2, 3)
a
object.size(a)
a+1
a[2] + 5
a[0]
a[4]

a <- c("hello", "world")
typeof(a)
a <- c(T, F)

x <- 1:4
y <- 1:2
x/y

x <- 1:5
y <- 1:2
x/y
r <- x[x>2]

x <- c(1, 2, NA, 4, 5, NA, 7)
r <- x[!is.na(x)]

#Matrices
m <- matrix(nrow=3, ncol=2)
matrix(1:6, nrow=3, ncol=2)
r <- m[1,]

x <- 1:6
matrix(x)
matrix(x, ncol=2)
matrix(x, nrow=2)

x <- 1:3
y <- 10:12
cbind(x, y)
rbind(x, y)

x <- c(1, -1/4)
y <- c(-1/4, 1)
m <- rbind(x, y)
inv_m <- solve(m)
m*inv_m
m %*% inv_m
