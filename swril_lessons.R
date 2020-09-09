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