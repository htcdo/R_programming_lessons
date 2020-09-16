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

# lesson_7 matrices and data frames 

my_vector <- 1:20

my_vector

dim(my_vector)

length(my_vector)

dim(my_vector) <- c(4, 5)

dim(my_vector)

attributes(my_vector)

my_vector

class(my_vector)

my_matrix <- my_vector

?matrix

my_matrix2 <- matrix(data = 1:20, nrow = 4, ncol = 5, byrow = FALSE, dimnames = NULL)

identical(my_matrix, my_matrix2)

patients <- c("Bill", "Gina", "Kelly", "Sean")

cbind(patients, my_matrix)

my_data <- data.frame(patients, my_matrix)

my_data

class(my_data)

cnames <- c("patient", "age", "weight", "bp", "rating", "test")

colnames(my_data) <- cnames

my_data

#Lesson_8 Logic 

TRUE == TRUE

(FALSE == TRUE) == FALSE

6 == 7

6 < 7

10 <= 10

5 != 7

!(5 == 7)

FALSE & FALSE

TRUE & c(TRUE, FALSE, FALSE)

TRUE && c(TRUE, FALSE, FALSE)

TRUE | c(TRUE, FALSE, FALSE)

TRUE || c(TRUE, FALSE, FALSE)

5 > 8 || 6 != 8 && 4 > 3.9

isTRUE(6 > 4)

identical('twins', 'twins')

xor(5 == 6, !FALSE)

ints <- sample(10)

ints

ints > 5

which(ints > 7)

boring_function

any(ints < 0)

all(ints > 0)

# Lesson_9 Functions

Sys.Date()

mean(c(2, 4, 5))

boring_function('My first function!')

my_mean(c(4, 5, 10))

remainder(5)

remainder(11, 5)

remainder(divisor = 11, num = 5)

remainder(4, div = 2)

args(remainder)

evaluate (sd,c(1.4, 3.6, 7.9, 8.8))

evaluate(function(x){x+1}, 6)

evaluate(function(x){x[1]}, c(8, 4, 0))

evaluate(function(x){x[length(x)]}, c(8, 4, 0))

?paste

paste("Programming", "is", "fun!")

telegram("I love my dog")

mad_libs()

'I' %p% 'love' %p% 'R!'

# The syntax for creating new binary operators in R is unlike anything else in
# R, but it allows you to define a new syntax for your function. I would only
# recommend making your own binary operator if you plan on using it often!
#
# User-defined binary operators have the following syntax:
#      %[whatever]% 
# where [whatever] represents any valid variable name.
# 
# Let's say I wanted to define a binary operator that multiplied two numbers and
# then added one to the product. An implementation of that operator is below:
#
# "%mult_add_one%" <- function(left, right){ # Notice the quotation marks!
#   left * right + 1
# }
#
# I could then use this binary operator like `4 %mult_add_one% 5` which would
# evaluate to 21.
#
# Write your own binary operator below from absolute scratch! Your binary
# operator must be called %p% so that the expression:
#
#       "Good" %p% "job!"
#
# will evaluate to: "Good job!"

"%p%" <- function(left, right){
  paste(left, right)
}


# Let's explore how to "unpack" arguments from an ellipses when you use the
# ellipses as an argument in a function. Below I have an example function that
# is supposed to add two explicitly named arguments called alpha and beta.
# 
# add_alpha_and_beta <- function(...){
#   # First we must capture the ellipsis inside of a list
#   # and then assign the list to a variable. Let's name this
#   # variable `args`.
#
#   args <- list(...)
#
#   # We're now going to assume that there are two named arguments within args
#   # with the names `alpha` and `beta.` We can extract named arguments from
#   # the args list by using the name of the argument and double brackets. The
#   # `args` variable is just a regular list after all!
#   
#   alpha <- args[["alpha"]]
#   beta  <- args[["beta"]]
#
#   # Then we return the sum of alpha and beta.
#
#   alpha + beta 
# }
#
# Have you ever played Mad Libs before? The function below will construct a
# sentence from parts of speech that you provide as arguments. We'll write most
# of the function, but you'll need to unpack the appropriate arguments from the
# ellipses.

mad_libs <- function(...){
  args <- list(...)
  place <- args[["place"]]
  adjective <- args[["adjective"]]
  noun <- args[["noun"]]
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}


# arguments after an ellipses must have default values. Take a look at the
# simon_says function below:
#
#simon_says <- function(...){
#  paste("Simon says:", ...)
# }
#
# The simon_says function works just like the paste function, except the
# begining of every string is prepended by the string "Simon says:"
#
# Telegrams used to be peppered with the words START and STOP in order to
# demarcate the beginning and end of sentences. Write a function below called 
# telegram that formats sentences for telegrams.
# For example the expression `telegram("Good", "morning")` should evaluate to:
# "START Good morning STOP"

telegram <- function(...) {
  paste("START", ..., "STOP")
}


# You can pass functions as arguments to other functions just like you can pass
# data to functions. Let's say you define the following functions:
#
add_two_numbers <- function(num1, num2){
  num1 + num2
}
#
multiply_two_numbers <- function(num1, num2){
  num1 * num2
}
#
some_function <- function(func){
  func(2, 4)
}

# As you can see we use the argument name "func" like a function inside of 
# "some_function()." By passing functions as arguments 
# some_function(add_two_numbers) will evaluate to 6, while
# some_function(multiply_two_numbers) will evaluate to 8.
# 
# Finish the function definition below so that if a function is passed into the
# "func" argument and some data (like a vector) is passed into the dat argument
# the evaluate() function will return the result of dat being passed as an
# argument to func.
#
# Hints: This exercise is a little tricky so I'll provide a few example of how
# evaluate() should act:
#    1. evaluate(sum, c(2, 4, 6)) should evaluate to 12
#    2. evaluate(median, c(7, 40, 9)) should evaluate to 9
#    3. evaluate(floor, 11.1) should evaluate to 11

evaluate <- function(func, dat){
  func(dat)
}


# Let me show you an example of a function I'm going to make up called
# increment(). Most of the time I want to use this function to increase the
# value of a number by one. This function will take two arguments: "number" and
# "by" where "number" is the digit I want to increment and "by" is the amount I
# want to increment "number" by. I've written the function below. 
#
increment <- function(number, by = 1){
  number + by
}
#
# If you take a look in between the parentheses you can see that I've set
# "by" equal to 1. This means that the "by" argument will have the default
# value of 1.
#
# I can now use the increment function without providing a value for "by": 
# increment(5) will evaluate to 6. 
#
# However if I want to provide a value for the "by" argument I still can! The
# expression: increment(5, 2) will evaluate to 7. 
# 
# You're going to write a function called "remainder." remainder() will take
# two arguments: "num" and "divisor" where "num" is divided by "divisor" and
# the remainder is returned. Imagine that you usually want to know the remainder
# when you divide by 2, so set the default value of "divisor" to 2. Please be
# sure that "num" is the first argument and "divisor" is the second argument.
#
# Hint #1: You can use the modulus operator %% to find the remainder.
#   Ex: 7 %% 4 evaluates to 3. 
#
# Remember to set appropriate default values! Be sure to save this 
# script and type submit() in the console after you write the function.

remainder <- function(num, divisor = 2) {
  num%%divisor 
}


# You're free to implement the function my_mean however you want, as long as it
# returns the average of all of the numbers in `my_vector`.
#
# Hint #1: sum() returns the sum of a vector.
# 	Ex: sum(c(1, 2, 3)) evaluates to 6
#
# Hint #2: length() returns the size of a vector.
# 	Ex: length(c(1, 2, 3)) evaluates to 3
#
# Hint #3: The mean of all the numbers in a vector is equal to the sum of all of
#		   the numbers in the vector divided by the size of the vector.
#
# Note for those of you feeling super clever: Please do not use the mean()
# function while writing this function. We're trying to teach you something 
# here!
#
# Be sure to save this script and type submit() in the console after you make 
# your changes.

my_mean <- function(my_vector) {
  sum(my_vector)/length(my_vector)
}


# You're about to write your first function! Just like you would assign a value 
# to a variable with the assignment operator, you assign functions in the following
# way:
#
function_name <- function(arg1, arg2){
  #	# Manipulate arguments in some way
  #	# Return a value
}
#
# The "variable name" you assign will become the name of your function. arg1 and
# arg2 represent the arguments of your function. You can manipulate the arguments
# you specify within the function. After sourcing the function, you can use the 
# function by typing:
# 
function_name(value1, value2)
#
# Below we will create a function called boring_function. This function takes
# the argument `x` as input, and returns the value of x without modifying it.
# Delete the pound sign in front of the x to make the function work! Be sure to 
# save this script and type submit() in the console after you make your changes.

boring_function <- function(x) {
  x
}


#lesson_14 date and time 

d1 <- Sys.Date()

class(d1)

unclass(d1)

d1

d2 <- as.Date("1969-01-01")

unclass(d2)

t1 <- Sys.time()

t1

class(t1)

unclass(t1)

t2 <- as.POSIXlt(Sys.time())

class(t2)

t2

unclass (t2)

str(unclass(t2))

t2$min

weekdays(d1)

months(t1)

quarters(t2)

t3 <- "October 17, 1986 08:24"

t4 <- strptime(t3, "%B %d, %Y %H:%M")

t4

class(t4)

Sys.time() > t1

Sys.time() - t1

difftime(Sys.time(), t1, units = 'days')
