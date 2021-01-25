---
output: 
  html_document: 
    theme: yeti
editor_options: 
  chunk_output_type: console
---



# Day 1

## Hunting Error messages 

The internet is your friend 😄.

The language of the current `R` session can be changed to english using `Sys.setenv()`
(this only worked *once per session* for me --- so to toggle back to my initial language I had to restart the r-session) 


```r
Sys.setenv(LANGUAGE="de")
x
Sys.setenv(LANGUAGE="en")
x
```

## Basic Data Types 

```
   Logical  --->  Integer  --->  Numeric  --->  Character
[FALSE, TRUE]     [0, 1]       [0.0, 1.0]    [“0.0”, “1.0”]
```


```r
a <- TRUE 
c <- 1
class(c)
#> [1] "numeric"
b <- as.integer(1)
class(b)
#> [1] "integer"
a + c
#> [1] 2
d <- "1"
as.numeric("1")
#> [1] 1
as.numeric("TRUE")
#> Warning: NAs introduced by coercion
#> [1] NA
c == d
#> [1] TRUE
a == c
#> [1] TRUE
a == d
#> [1] FALSE
identical(c, d)
#> [1] FALSE
identical(a, c)
#> [1] FALSE
2 == 3
#> [1] FALSE
```
## Basic Data Structures

```
         1D            Row/Column         2D
    Atomic Vectors ------------------> Matrices
          |                                |
recursive |                                | Properties Of
          |                                |
        Lists <--------------------- Data Frames
                    Properties Of
```

### Atomic Vectors


```r
weight_g <- c(50, 60, 65, 80)
weight_g
#> [1] 50 60 65 80

animals <- c("kinkajous", "coatis", "capuchins")
animals
#> [1] "kinkajous" "coatis"    "capuchins"

empty <- vector(length = 5)
empty
#> [1] FALSE FALSE FALSE FALSE FALSE

length(weight_g)
#> [1] 4
length(animals)
#> [1] 3

str(weight_g)
#>  num [1:4] 50 60 65 80

num_char <- c(1, 2, 3, "a") 
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

num_char
#> [1] "1" "2" "3" "a"
```

Subsetting

```r
animals[2]
#> [1] "coatis"
animals[c(2,3)]
#> [1] "coatis"    "capuchins"
weight_g[2:4]
#> [1] 60 65 80

2:4
#> [1] 2 3 4

weight_g[c(2, 2, 2, 3)]
#> [1] 60 60 60 65
weight_g[-2]
#> [1] 50 65 80
```

### Conditional Subsetting


```r
weight_g > 50
#> [1] FALSE  TRUE  TRUE  TRUE
weight_g[weight_g > 50]
#> [1] 60 65 80

weight_g[weight_g > 50 & weight_g < 70]
#> [1] 60 65
weight_g[weight_g <= 50 | weight_g >= 70]
#> [1] 50 80

animals2 <- c("kinkajous", "kinkajous", "coatis", "meerkats")

animals2 %in% c(animals)
#> [1]  TRUE  TRUE  TRUE FALSE
animals2[animals2 %in% c(animals)]
#> [1] "kinkajous" "kinkajous" "coatis"
```

### Matrices


```r
sequence_vector <- 1:9
sequence_vector
#> [1] 1 2 3 4 5 6 7 8 9

example_matrix1 <- matrix(data = sequence_vector, nrow = 3, ncol = 3)
example_matrix1
#>      [,1] [,2] [,3]
#> [1,]    1    4    7
#> [2,]    2    5    8
#> [3,]    3    6    9

example_matrix2 <- matrix(sequence_vector, 3, byrow = TRUE)
example_matrix2
#>      [,1] [,2] [,3]
#> [1,]    1    2    3
#> [2,]    4    5    6
#> [3,]    7    8    9

str(example_matrix1)
#>  int [1:3, 1:3] 1 2 3 4 5 6 7 8 9
str(example_matrix2)
#>  int [1:3, 1:3] 1 4 7 2 5 8 3 6 9

length(example_matrix1)
#> [1] 9
dim(example_matrix1)
#> [1] 3 3
nrow(example_matrix1)
#> [1] 3
ncol(example_matrix1)
#> [1] 3

example_matrix1[4:7] # ! not a helpful way to subset matrices
#> [1] 4 5 6 7
example_matrix1[2, 3] # example_matrix1[<rows>, <columns>]
#> [1] 8

example_matrix1[2:3, c(1, 3)]
#>      [,1] [,2]
#> [1,]    2    8
#> [2,]    3    9
```

### Lists


```r
animals_all <- list(animals, animals2)
animals_all
#> [[1]]
#> [1] "kinkajous" "coatis"    "capuchins"
#> 
#> [[2]]
#> [1] "kinkajous" "kinkajous" "coatis"    "meerkats"

animals_all[1]
#> [[1]]
#> [1] "kinkajous" "coatis"    "capuchins"
str(animals_all)
#> List of 2
#>  $ : chr [1:3] "kinkajous" "coatis" "capuchins"
#>  $ : chr [1:4] "kinkajous" "kinkajous" "coatis" "meerkats"
str(animals_all[1])
#> List of 1
#>  $ : chr [1:3] "kinkajous" "coatis" "capuchins"

animals_all[[1]]
#> [1] "kinkajous" "coatis"    "capuchins"

animals_all_combined <- c(animals_all, weight_g) # for demonstration purpose
animals_all_combined
#> [[1]]
#> [1] "kinkajous" "coatis"    "capuchins"
#> 
#> [[2]]
#> [1] "kinkajous" "kinkajous" "coatis"    "meerkats" 
#> 
#> [[3]]
#> [1] 50
#> 
#> [[4]]
#> [1] 60
#> 
#> [[5]]
#> [1] 65
#> 
#> [[6]]
#> [1] 80

animals_all_combined <- c(animals_all, list(weight_g))
animals_all_combined
#> [[1]]
#> [1] "kinkajous" "coatis"    "capuchins"
#> 
#> [[2]]
#> [1] "kinkajous" "kinkajous" "coatis"    "meerkats" 
#> 
#> [[3]]
#> [1] 50 60 65 80

list_challange1 <- animals_all_combined[1][1]
list_challange2 <- animals_all_combined[[c(1,2)]]
list_challange1
#> [[1]]
#> [1] "kinkajous" "coatis"    "capuchins"
list_challange2
#> [1] "coatis"
```

---
