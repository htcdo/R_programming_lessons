#lesson_1
install.packages("swirl")
library(swirl)
ls()
rm(list = ls())
swirl()

install_from_swirl("R Programming")

# 1: Basic Building Blocks

5+7

x <- 5 + 7

y <- x - 3
y

z <- c(1.1, 9, 3.14)

?c

z

c(z,555, z)

z * 2 + 100

my_sqrt <- sqrt(z-1)
my_sqrt

my_div <- z/my_sqrt
my_div

c(1, 2, 3, 4) + c(0, 10)
c(1, 2, 3, 4) + c(0, 10,100)

#lesson_2 Workspace and Files

getwd()
ls()

x <- 9

ls()

dir()
?list.files

args(list.files)

old.dir <- getwd()
dir.create( "testdir" )

setwd("testdir")

file.create("mytest.R")

file.exists("mytest.R")
list.files()

file.info("mytest.R")

file.rename(from = "mytest.R", to = "mytest2.R")

file.copy(from = "mytest2.R", to = "mytest3.R")

file.path("mytest3.R")

file.path("folder1", "folder2")
?dir.create

dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE)

setwd(old.dir)

# lesson_3 Sequence of numbers 

1:20

pi:10

15:1

? ":"

seq(1,20)

seq(0, 10, by = 0.5)

my_seq <- seq(5, 10, length = 30)

length(my_seq)

1:length(my_seq)

seq(along.with = my_seq)

seq_along(my_seq)

rep(0, times = 40)

rep(c(0, 1, 2), times = 10)

rep(c(0, 1, 2), each = 10)

# lesson_4 vectors

num_vect <- c(0.5, 55, -10, 6)

tf <- num_vect < 1

tf

num_vect >= 6

my_char <- c("My", "name", "is")

my_char

paste(my_char, collapse = " ")

my_name <- c(my_char, "Helena")

my_name

paste(my_name, collapse = " ")

paste(1:3, c("X", "Y", "Z"), sep = "" )

paste(LETTERS,1:4, sep = "-")
paste("Hello", "world!", sep = " ")

#lesson_5 missing values

x <- c(44, NA, 5, NA)

x*3

y <- rnorm(1000)

z <- rep(NA, 1000)

my_data <- sample(c(y, z), 100)

my_na <- is.na(my_data)
my_na

my_data == NA

sum(my_na)

my_data

0/0

Inf - Inf

# lesson_6 subsetting vectors

x

x [1:10]

x[is.na(x)]

y <- x[!is.na(x)]

y[ y > 0 ]

x [ x > 0 ]

x[!is.na(x) & x > 0]

x [ c(3, 5, 7)]

x[0]

x[3000]

x[-c(2, 10)]

vect <- c(foo = 11, bar = 2, norf = NA)

vect

names(vect)

vect2 <- c(11, 2, NA)

names(vect2) <- c("foo", "bar", "norf")

identical(vect, vect2)

vect["bar"]

vect[c("foo", "bar")]