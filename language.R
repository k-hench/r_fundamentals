library(tidyverse)
# Sys.setenv(LANGUAGE="de")
# x
# Sys.setenv(LANGUAGE="en")
# x
# Basic Data Types -------
a <- TRUE 
c <- 1
class(c)
b <- as.integer(1)
class(b)
a + c
d <- "1"
as.numeric("1")
as.numeric("TRUE")
c == d
a == c
a == d
identical(c, d)
identical(a, c)
2 == 3

# Basic Data Structures -------------
# -----------------------------------
# Atomic Vectors ---------- Matrices
#      |                       |
#    Lists -------------- Data Frames

## Vectors
weight_g <- c(50, 60, 65, 80)
weight_g

animals <- c("kinkajous", "coatis", "capuchins")
animals

empty <- vector(length = 5)
empty

length(weight_g)

read_csv("survey_data.csv")
