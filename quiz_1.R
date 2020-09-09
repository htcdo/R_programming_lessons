# Quiz 1 - cousera
# Helena Oliveira | 09-08-20


x <- 4
x
class(x)

x <- c(4, "a", TRUE)
class(x)

x <- c(1,3, 5) 
y <- c(3, 2, 10)
cbind(x,y)

x <- list(2, "a", "b", TRUE)
x[[1]]

x <- 1:4
y <- 2:3
x+y

x <- 1:4
y <- 2
x+y
class(x+y)

x <- c(3, 5, 1, 10, 12, 6)
x[x >= 6] <- 0
x[x > 6] <- 0
x    

x <- c(17, 14, 4, 5, 13, 12, 10)
x[x >= 11] <- 4
x[x > 10] <- 4

dat <- download.file('https://d396qusza40orc.cloudfront.net/rprog/data/quiz1_data.zip', destfile ="quizdat.zip")
dat <- unzip("quizdat.zip")
dat <- read.csv("hw1_data.csv")
names(dat)

dat[1:2,]

nrow(dat)

dat[152:153,]

dat$Ozone[47]

sum(is.na(dat$Ozone))

mean(dat$Ozone, na.rm=TRUE)

mean(dat[which(dat$Ozone >31 & dat$Temp > 90),]$Solar.R)

mean(dat[which(dat$Month == 6),]$Temp)

max(dat[which(dat$Month == 5),]$Ozone, na.rm = TRUE)