---
title: "Lecture 102<br/>Data types"
author: "Dr Stefano De Sabbata<br/>School of Geography, Geology, and the Env.<br/><a href=\"mailto:s.desabbata@le.ac.uk\">s.desabbata&commat;le.ac.uk</a> &vert; <a href=\"https://twitter.com/maps4thought\">&commat;maps4thought</a><br/><a href=\"https://github.com/sdesabbata/GY7702\">github.com/sdesabbata/GY7702</a> licensed under <a href=\"https://www.gnu.org/licenses/gpl-3.0.html\">GNU GPL v3.0</a>"
date: "2019-11-19"
output:
  ioslides_presentation:
    template: ../Utils/IOSlides/UoL_Template.html
    logo: ../Utils/IOSlides/uol_logo.png
---





# Recap @ 102



## Previous lecture

An introduction to R

- Basic types
- Basic operators
- Variables
- Libraries
- The pipe operator
- Coding style



## Today

More complex data types

- Vectors
- Factors
- Matrices
- Arrays
- Lists
- Data Frames



# Vectors

## Vectors
**Vectors** are ordered list of values.

- Vectors can be of any data type
    - numeric
    - character
    - logic
- All items in a vector have to be of the same type
- Vectors can be of any length


## Defining vectors

A vector variable can be defined using 

- an **identifier** (e.g., `a_vector`) 
- on the left of an **assignment operator** `<-`
- followed by the object to be linked to the identifier
- in this case, the result returned by the function `c`
- which creates a vector containing the element provided as input


```r
a_vector <- c("Birmingham", "Derby", "Leicester",
  "Lincoln", "Nottingham", "Wolverhampton")
a_vector
```

```
## [1] "Birmingham"    "Derby"         "Leicester"     "Lincoln"      
## [5] "Nottingham"    "Wolverhampton"
```

<!--
Note that the second line of the answer provided by R in the console when asking to evaluate the variable starts with `[5]`, as the second line stats with the fifth element of the answer (i.e., the vector)
-->

## Creating vectors

- the operator `:`
- the function `seq`
- the function `rep`


```r
4:7
```

```
## [1] 4 5 6 7
```

```r
seq(1, 7, by = 0.5)
```

```
##  [1] 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0 6.5 7.0
```

```r
seq(1, 10, length.out = 7)
```

```
## [1]  1.0  2.5  4.0  5.5  7.0  8.5 10.0
```

```r
rep("Ciao", 4)
```

```
## [1] "Ciao" "Ciao" "Ciao" "Ciao"
```


## Selection

Each element of a vector can be retrieved specifying the related **index** between square brackets, after the identifier of the vector. The first element of the vector has index 1.


```r
a_vector[3]
```

```
## [1] "Leicester"
```


A vector of indexes can be used to retrieve more than one element.


```r
a_vector[c(5, 3)]
```

```
## [1] "Nottingham" "Leicester"
```


<!--
## Examples


```r
east_midlands_cities <- c("Derby", "Leicester", "Lincoln", "Nottingham")
my_indexes <- 2:4
east_midlands_cities[my_indexes]
```

```
## [1] "Leicester"  "Lincoln"    "Nottingham"
```

```r
selected_cities <- c(east_midlands_cities[1], east_midlands_cities[3:4])
```
-->


## Functions on vectors

Functions can be used on a vector variable directly


```r
a_numeric_vector <- 1:5
a_numeric_vector + 10
```

```
## [1] 11 12 13 14 15
```

```r
sqrt(a_numeric_vector)
```

```
## [1] 1.000000 1.414214 1.732051 2.000000 2.236068
```

```r
a_numeric_vector >= 3
```

```
## [1] FALSE FALSE  TRUE  TRUE  TRUE
```



## Any and all

Overall expressions can be tested using the functions:

- **any**, TRUE if any of the elements satisfies the condition
- **all**, TRUE if all of the elements satisfy the condition


```r
any(a_numeric_vector >= 3)
```

```
## [1] TRUE
```

```r
all(a_numeric_vector >= 3)
```

```
## [1] FALSE
```


# Factors

## Factors

A **factor** is a data type similar to a vector. However, the values contained in a factor can only be selected from a set of **levels**.


```r
houses_vector <- c("Bungalow", "Flat", "Flat",
  "Detached", "Flat", "Terrace", "Terrace")
houses_vector
```

```
## [1] "Bungalow" "Flat"     "Flat"     "Detached" "Flat"     "Terrace" 
## [7] "Terrace"
```

```r
houses_factor <- factor(c("Bungalow", "Flat", "Flat",
  "Detached", "Flat", "Terrace", "Terrace"))
houses_factor
```

```
## [1] Bungalow Flat     Flat     Detached Flat     Terrace  Terrace 
## Levels: Bungalow Detached Flat Terrace
```

## table

The function **table** can be used to obtain a tabulated count for each level.


```r
houses_factor <- factor(c("Bungalow", "Flat", "Flat",
  "Detached", "Flat", "Terrace", "Terrace"))
houses_factor
```

```
## [1] Bungalow Flat     Flat     Detached Flat     Terrace  Terrace 
## Levels: Bungalow Detached Flat Terrace
```

```r
table(houses_factor)
```

```
## houses_factor
## Bungalow Detached     Flat  Terrace 
##        1        1        3        2
```

## Specified levels

A specific set of levels can be specified when creating a factor by providing a **levels** argument.


```r
houses_factor_spec <- factor(
  c("People Carrier", "Flat", "Flat", "Hatchback",
      "Flat", "Terrace", "Terrace"),
  levels = c("Bungalow", "Flat", "Detached",
       "Semi", "Terrace"))

table(houses_factor_spec)
```

```
## houses_factor_spec
## Bungalow     Flat Detached     Semi  Terrace 
##        0        3        0        0        2
```


## (Unordered) Factors

In statistics terminology, (unordered) factors are **categorical** (i.e., binary or nominal) variables. Levels are not ordered.


```r
income_nominal <- factor(
  c("High", "High", "Low", "Low", "Low",
      "Medium", "Low", "Medium"),
  levels = c("Low", "Medium", "High"))
income_nominal > "Low"
```

```
## Warning in Ops.factor(income_nominal, "Low"): '>' not meaningful for
## factors
```

```
## [1] NA NA NA NA NA NA NA NA
```

## Ordered Factors

In statistics terminology, ordered factors are **ordinal** variables.
Levels are ordered.


```r
income_ordered <- ordered(
  c("High", "High", "Low", "Low", "Low",
      "Medium", "Low", "Medium"),
  levels = c("Low", "Medium", "High"))
income_ordered > "Low"
```

```
## [1]  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE
```

```r
sort(income_ordered)
```

```
## [1] Low    Low    Low    Low    Medium Medium High   High  
## Levels: Low < Medium < High
```



# Matrices and arrays


## Matrices

**Matrices** are collections of numerics arranged in a two-dimensional rectangular layout

- the first argument is a vector of values
- the second specifies number of rows and columns
- R offers operators and functions for matrix algebra


```r
a_matrix <- matrix(c(3, 5, 7, 4, 3, 1), c(3, 2))
a_matrix
```

```
##      [,1] [,2]
## [1,]    3    4
## [2,]    5    3
## [3,]    7    1
```

<!--
## Matrices

Variables of the type **matrix** are collections of data elements arranged in a two-dimensional rectangular layout. The first argument is vector a containing the values, the second is a vector specifying the number of rows and columns.


```r
x <- matrix(c(3, 5, 7, 4, 3, 1), c(3, 2))
x
y <- matrix(c(3, 5, 7, 4, 3, 1), c(2, 3))
y
z <- matrix(c(3, 5, 7, 4, 3, 1), c(2, 3), byrow = TRUE)
z
```


## Matrix algebra

Operations as in mathematical matrix algebra.


```r
x
y
z
```


```r
y + z
y %*% x
t(x)
```



## Matrix algebra

Operations as in mathematical matrix algebra.


```r
A <- matrix(
      c(3, 1, 2, 1),
      nrow = 2, ncol = 2)
A
b <- matrix(
      c(8, 2),
      nrow = 2, ncol = 1)
b
```


```r
# inverse
solve(A)
# returns x, where b = Ax
solve(A, b)
# That is
# 8 = 3*4 + 2*-2
# 2 = 1*4 + 1*-2
```
-->

## Arrays

Variables of the type **array** are higher-dimensional matrices.

- the first argument is a vector containing the values
- the second argument is a vector specifying the depth of each dimension


```r
a3dim_array <- array(1:24, dim=c(4, 3, 2))
```

## Arrays


```r
a3dim_array
```

```
## , , 1
## 
##      [,1] [,2] [,3]
## [1,]    1    5    9
## [2,]    2    6   10
## [3,]    3    7   11
## [4,]    4    8   12
## 
## , , 2
## 
##      [,1] [,2] [,3]
## [1,]   13   17   21
## [2,]   14   18   22
## [3,]   15   19   23
## [4,]   16   20   24
```

<!--
## Matrices and arrays: selection

The subset can be specified as a matrix of indexes.


```r
x2 
choose_x2 <- matrix(
              c(3, 3, 3, 1, 2, 1, 2, 3),
              c(4, 2), byrow = TRUE)
choose_x2
x2[choose_x2]
```
-->


## Selection

Subsets of matrices (and arrays) can be selected as seen for vectors.


```r
a_matrix[2, c(1, 2)]
```

```
## [1] 5 3
```

```r
a3dim_array[c(1, 2), 2, 2]
```

```
## [1] 17 18
```


## apply

`apply` applies another function to each level of a set dimension of an array


```r
apply(a3dim_array, 3, min) # apply on third dimension
```

```
## [1]  1 13
```

```r
apply(a3dim_array, 1, min) # apply on first dimension
```

```
## [1] 1 2 3 4
```

```r
apply(a3dim_array, 2, min) # apply on second dimension
```

```
## [1] 1 5 9
```


# Lists

## Lists

Variables of the type **list** can contain elements of different types (including vectors and matrices), whereas elements of vectors are all of the same type. 


```r
employee <- list("Stefano", 2015)
employee
```

```
## [[1]]
## [1] "Stefano"
## 
## [[2]]
## [1] 2015
```

```r
employee[[1]] # Note the double square brackets for selection
```

```
## [1] "Stefano"
```


## Named Lists

In **named lists** each element has a name, and elements can be selected to using their name after the symbol `$`. 


```r
employee <- list(name = "Stefano", start_year = 2015)
employee
```

```
## $name
## [1] "Stefano"
## 
## $start_year
## [1] 2015
```

```r
employee$name
```

```
## [1] "Stefano"
```


## lapply

With `lapply` take care that the function makes sense for *any* element in the list


```r
various <- list(
  "Some text",
  matrix(c(6, 3, 1, 2), c(2, 2))
)
lapply(various, is.numeric)
```

```
## [[1]]
## [1] FALSE
## 
## [[2]]
## [1] TRUE
```



<!--
## Lists: append

The function **append** can be used to append a new element at the end of a list.


```r
various <- list("Stefano", c(2015, 2016), "Lecturer",
                matrix(c(6, 3, 1, 2), c(2, 2)))
various <- append(various, list(c(7, 6, 9, 1))) 
various
```
-->


# Data frames



## Data Frames

A **data frame** is equivalent to a *named list* where all elements are *vectors of the same length*.


```r
employees <- data.frame(
  Name = c("Maria", "Pete", "Sarah"),
  Age = c(47, 34, 32),
  Role = c("Professor", "Researcher", "Researcher"))
employees
```

```
##    Name Age       Role
## 1 Maria  47  Professor
## 2  Pete  34 Researcher
## 3 Sarah  32 Researcher
```

Data frames are the most common way to represent tabular data in R. Matrices and lists can be converted to data frames.

<!--
**Note:** As is common in R, the elements of an eventual too short column are recycled to match column lengths.
-->

## Selection

Selection is similar to vectors and lists.


```r
employees[1, ] # row selection
```

```
##    Name Age      Role
## 1 Maria  47 Professor
```

```r
employees[, 1] # column selection, as for matrices
```

```
## [1] Maria Pete  Sarah
## Levels: Maria Pete Sarah
```


## Selection

Selection is similar to vectors and lists.


```r
employees$Name # column selection, as for named lists
```

```
## [1] Maria Pete  Sarah
## Levels: Maria Pete Sarah
```

```r
employees$Name[1]
```

```
## [1] Maria
## Levels: Maria Pete Sarah
```



## Value assignment

Values can be assigned to cells through filtering and `<-`


```r
employees$Age[3] <- 33 
employees
```

```
##    Name Age       Role
## 1 Maria  47  Professor
## 2  Pete  34 Researcher
## 3 Sarah  33 Researcher
```


## Column processing

Operations can be performed on columns, and new columns created.


```r
current_year <- as.integer(format(Sys.Date(), "%Y"))
employees$Year_of_birth <- current_year - employees$Age
employees
```

```
##    Name Age       Role Year_of_birth
## 1 Maria  47  Professor          1972
## 2  Pete  34 Researcher          1985
## 3 Sarah  33 Researcher          1986
```



## tibble

A [tibble](https://tibble.tidyverse.org/) is a modern reimagining of the data.frame within `tidyverse`

- they do less 
    - don’t change variable names or types
    - don’t do partial matching
- complain more
    - e.g. when a variable does not exist
    
This forces you to confront problems earlier, typically leading to cleaner, more expressive code.



# Summary



## Summary

More complex data types

- Vectors
- Factors
- Matrices
- Arrays
- Lists
- Data Frames



## Practical session

In the practical session, we will see (surprise, surprise)

- Vectors
- Factors
- Matrices
- Arrays
- Lists
- Data Frames



## Next week

Moving on towards data science

- Data selection
- Data filtering
- Data manipulation
- Join operations
- Table re-shaping
