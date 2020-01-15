---
title: "102 Data types"
author: "Stefano De Sabbata"
date: "2020-01-15"
output: pdf_document
urlcolor: blue
---



# Data types

*[Stefano De Sabbata](https://stefanodesabbata.com)*

[This work](https://github.com/sdesabbata/granolarr) is licensed under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html). 

## Vectors

Vectors can be defined in R by using the function `c`, which takes as parameters the items to be stored in the vector -- stored in the order in which they are provided. 


```r
east_midlands_cities <- c("Derby", "Leicester", "Lincoln", "Nottingham")
length(east_midlands_cities)
```

```
## [1] 4
```

Once the vector has been created and assigned to an identifier, elements within the vector can be retrieved by specifying the identifier, followed by square brackets, and the *index* (or indices as we will see further below) of the elements to be retrieved -- remember that indices start from 1.


```r
# Retrieve third city
east_midlands_cities[3]
```

```
## [1] "Lincoln"
```

To retrieve any subset of a vector (i.e., not just one element), specify an integer vector containing the indices of interest (rather than a single integer value) between square brackets. 


```r
# Retrieve first and third city
east_midlands_cities[c(1, 3)]
```

```
## [1] "Derby"   "Lincoln"
```

The operator `:` can be used to create integer vectors, starting from the number specified before the operator to the number specified after the operator. 


```r
# Create a vector containing integers between 2 and 4
two_to_four <- 2:4
two_to_four
```

```
## [1] 2 3 4
```

```r
# Retrieve cities between the second and the fourth
east_midlands_cities[two_to_four]
```

```
## [1] "Leicester"  "Lincoln"    "Nottingham"
```

```r
# As the second element of two_to_four is 3...
two_to_four[2]
```

```
## [1] 3
```

```r
# the following command will retrieve the third city
east_midlands_cities[two_to_four[2]]
```

```
## [1] "Lincoln"
```

```r
# Create a vector with cities from the previous vector
selected_cities <- c(east_midlands_cities[1], east_midlands_cities[3:4])
```


The functions `seq` and `rep` can also be used to create vectors, as illustrated below.


```r
seq(1, 10, by = 0.5)
```

```
##  [1]  1.0  1.5  2.0  2.5  3.0  3.5  4.0  4.5  5.0  5.5  6.0  6.5  7.0  7.5
## [15]  8.0  8.5  9.0  9.5 10.0
```

```r
seq(1, 10, length.out = 6)
```

```
## [1]  1.0  2.8  4.6  6.4  8.2 10.0
```

```r
rep("Ciao", 4)
```

```
## [1] "Ciao" "Ciao" "Ciao" "Ciao"
```


The logical operators `any` and `all` can be used to test conditional statements on the vector. The former returns `TRUE` if at least one element satisfies the statement, the second returns `TRUE` if all elements satisfy the condition


```r
any(east_midlands_cities == "Leicester")
```

```
## [1] TRUE
```

```r
my_sequence <- seq(1, 10, length.out = 7)
my_sequence
```

```
## [1]  1.0  2.5  4.0  5.5  7.0  8.5 10.0
```

```r
any(my_sequence > 5)
```

```
## [1] TRUE
```

```r
all(my_sequence > 5)
```

```
## [1] FALSE
```



## Filtering

All built-in numerical functions in R can be used on a vector variable directly. That is, if a vector is specified as input, the selected function is applied to each element of the vector.


```r
one_to_ten <- 1:10
one_to_ten
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

```r
one_to_ten + 1
```

```
##  [1]  2  3  4  5  6  7  8  9 10 11
```

```r
sqrt(one_to_ten)
```

```
##  [1] 1.000000 1.414214 1.732051 2.000000 2.236068 2.449490 2.645751
##  [8] 2.828427 3.000000 3.162278
```

As seen in the first practical session, a conditional statement entered in the console is evaluated for the provided input, and a logical value (`TRUE` or `FALSE`) is provided as output. Similarly, if the provided input is a vector, the conditional statement is evaluated for each element of the vector, and a vector of logical values is returned -- which contains the respective results of the conditional statements for each element.


```r
minus_three <- -3
minus_three > 0
```

```
## [1] FALSE
```

```r
minus_three_to_three <- -3:3
minus_three_to_three
```

```
## [1] -3 -2 -1  0  1  2  3
```

```r
minus_three_to_three > 0
```

```
## [1] FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE
```

A subset of the elements of a vector can also be selected by providing a vector of logical values between brackets after the identifier. A new vector returned, containing only the values for which a `TRUE` value has been specified correspondingly.


```r
minus_two_to_two <- -2:2
minus_two_to_two
```

```
## [1] -2 -1  0  1  2
```

```r
minus_two_to_two[c(TRUE, TRUE, FALSE, FALSE, TRUE)]
```

```
## [1] -2 -1  2
```

As the result of evaluating the conditional statement on a vector is a vector of logical values, this can be used to filter vectors based on conditional statements. If a conditional statement is provided between square brackets (after the vector identifier, instead of an index), a new vector is returned, which contains only the elements for which the conditional statement is true. 


```r
minus_two_to_two > 0
```

```
## [1] FALSE FALSE FALSE  TRUE  TRUE
```

```r
minus_two_to_two[minus_two_to_two > 0]
```

```
## [1] 1 2
```



## Factors

Factors are used to represent categorical data, where a small number of categories are used to represent some characteristic in a variable.  For example, the colour of a particular model of car sold by a showroom in a week can be represented in this way:


```r
colours <- factor(c("red", "blue", "red", "white", "yellow", "red", "white", "yellow",
                  "red", "red", "white", "yellow", "yellow"),
                  levels = c("red", "blue", "white", "yellow", "black"))
```

Since the only colours this car comes in are red, blue, white, yellow and black, these are the only levels in the factor.

Assuming that the factor above represents the list of cars sold in the showroom, the `table` function can be used to see how many of each colour were sold.  First, re-assign the `colours` variable (as you may have altered this variable in answering the self-test question):


```r
table(colours)
```

```
## colours
##    red   blue  white yellow  black 
##      5      1      3      4      0
```

Note that the result of the `table` function is an object of the type `table`. 


```r
colours_table <- table(colours)
is.table(colours_table)
```

```
## [1] TRUE
```

Columns of `table` data type variables can be retrieved by specifying the related index or heading.


```r
colours_table[1]
```

```
## red 
##   5
```

```r
colours_table[c(1,2)]
```

```
## colours
##  red blue 
##    5    1
```

```r
colours_table["red"]
```

```
## red 
##   5
```

```r
colours_table[c("red", "blue")]
```

```
## colours
##  red blue 
##    5    1
```

The `table` function can also work with two arguments. For instance, another factor variable `car_type` can be used to specify the type of each car. The function applied to both factors wil return an object of the type table, which is the crosstabulation of the two variables provided as input. The assumption is that the values in the two-factor variables refer to the same entities. In this example, the two variables tell us that the first car sold was red and a saloon. Thus, the functions return counts of how many red saloons, blue saloons, red convertible, etc., have been sold.


```r
car_type <- factor(c("saloon", "saloon", "hatchback", "saloon", "convertible",
                                   "hatchback", "convertible", "saloon",
                                    "hatchback", "saloon", "saloon",
                                    "saloon", "hatchback"),
                  levels = c("saloon", "hatchback", "convertible"))

crosstab <- table(car_type, colours)
crosstab
```

```
##              colours
## car_type      red blue white yellow black
##   saloon        2    1     2      2     0
##   hatchback     3    0     0      1     0
##   convertible   0    0     1      1     0
```

A third variable can be defined to capture the engine size of the cars, and that the three sizes are 1.1 litres, 1.3 litres and 1.6 litres. Again,  this is stored in a variable,  but this time the sizes are ordered.  Enter:


```r
engines <- ordered(c("1.1litre", "1.3litre", "1.1litre", "1.3litre", "1.6litre",
                   "1.3litre", "1.6litre", "1.1litre",
                   "1.3litre", "1.1litre", "1.1litre", "1.3litre", "1.3litre"),
                  levels=c("1.1litre", "1.3litre", "1.6litre"))
```

When working with `ordered` factors, it is possible to evaluate conditional statements, using the operators `>`, `<`, `>=` and `<=`.  For example:


```r
engines > "1.1litre"
```

```
##  [1] FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE FALSE
## [12]  TRUE  TRUE
```



## Exercise 2.1

**Question 2.1.1:** Suppose you were to enter :


```r
colours[4] <- "orange"
colours
```

What would you expect to happen?  Why?

**Question 2.1.2:**  What two differences do you notice between the results of the two table expressions?

**Question 2.1.3:** What is the difference between `table(car_type, colours)` and `table(colours, car_type)`? 

**Question 2.1.4:**  Using the `engines`,  `car_type` and `colours` variables, write expressions to produce the following output

- The colours of all cars with engines with a capacity higher than 1.1 litres. 
- The counts of types (i.e. hatchback etc)  of all cars with a capacity below 1.6 litres. 
- The counts of colours of all hatchbacks with a capacity higher than or equal to 1.3 litres. 



## Matrices and arrays

In R, matrices are collections of numerics arranged in a two-dimensional rectangular layout, while arrays are higher-dimensional matrices. Both are common mathematical representation for raster data in GIScience. For instance, assume that the matrix defined below illustrates an estimation of the temperatures in an area, with the highest temperatures in the top-left corner and the lowest temperatures in the bottom-right.


```r
temperature_matrix <- matrix(
  c(20, 18, 16, 10, 18, 18, 12, 8,
    16, 14, 10, 8, 12, 10, 8, 6), 
  c(4, 4))
temperature_matrix
```

```
##      [,1] [,2] [,3] [,4]
## [1,]   20   18   16   12
## [2,]   18   18   14   10
## [3,]   16   12   10    8
## [4,]   10    8    8    6
```

You can retrieve the temperature in the top-left corner and the four central cells using the indexes as follow.


```r
temperature_matrix[1, 1]
```

```
## [1] 20
```

```r
temperature_matrix[c(2, 3), c(2, 3)]
```

```
##      [,1] [,2]
## [1,]   18   14
## [2,]   12   10
```

A three-dimensional array can be used to represent the data of three different days of temperature records, as three layers of bi-dimensional matrices.


```r
temperature_array <- array(
  c(20, 18, 16, 10, 18, 18, 12, 8,
    16, 14, 10, 8, 12, 10, 8, 6,
    21, 19, 17, 10, 18, 18, 12, 8,
    17, 15, 10, 10, 12, 10, 10, 8,
    18, 18, 14, 8, 16, 16, 12, 8,
    16, 14, 10, 8, 12, 8, 8, 6
    ), 
  c(4, 4, 3))
temperature_array
```

```
## , , 1
## 
##      [,1] [,2] [,3] [,4]
## [1,]   20   18   16   12
## [2,]   18   18   14   10
## [3,]   16   12   10    8
## [4,]   10    8    8    6
## 
## , , 2
## 
##      [,1] [,2] [,3] [,4]
## [1,]   21   18   17   12
## [2,]   19   18   15   10
## [3,]   17   12   10   10
## [4,]   10    8   10    8
## 
## , , 3
## 
##      [,1] [,2] [,3] [,4]
## [1,]   18   16   16   12
## [2,]   18   16   14    8
## [3,]   14   12   10    8
## [4,]    8    8    8    6
```

The function `apply` applies another function to each level of a selected dimension of an array. That is, for each level of the selected dimension, the function is applied to the values spread through the remaining dimensions. For instance, if each level of the third dimension of `temperature_array` represents a different day, the function `max` can be applied to find the maximum temperature of each day by selecting the third dimension.


```r
apply(temperature_array, 3, max)
```

```
## [1] 20 21 18
```

Alternatively, applying the function `max` and selecting both the first and second dimensions retrieves the max temperature during the three days for each cell.


```r
apply(temperature_array, c(1, 2), max)
```

```
##      [,1] [,2] [,3] [,4]
## [1,]   21   18   17   12
## [2,]   19   18   15   10
## [3,]   17   12   10   10
## [4,]   10    8   10    8
```



## Exercise 2.2

**Question 2.2.1:**  How can you use `apply` to compute the average temperature per day in `temperature_array` (i.e., the result should be a vector of three numbers, one value per day, averaging the values of the 16 cells)?

**Question 2.2.2:**  How can you use `apply` to compute the difference between the maximum and minimum temperature measured during the three days per each cell in `temperature_array` (i.e., the result should be a 4x4 matrix, one value per cell, each reporting difference between the maximum and minimum temperature)?



## Lists

One of the main difference between **vectors** and **lists** is that the formers must contain elements of the same type, whereas the latter don't. Lists can be *named* and *unnamed*. Here we only consider the named kind. Named lists can be created using the function **list**, and passing as arguments any number of pairs *name = value*, using any data type, as in the example below. Elements of named lists can be referred to using their name after the symbol `$`.


```r
lecturer <- list(surname = "De Sabbata", 
                teaching_MSc = TRUE,
                subjects = c("Programming", "GIS"), 
                moved_to_Leicester = 2015
                )
lecturer
```

```
## $surname
## [1] "De Sabbata"
## 
## $teaching_MSc
## [1] TRUE
## 
## $subjects
## [1] "Programming" "GIS"        
## 
## $moved_to_Leicester
## [1] 2015
```

```r
lecturer$surname
```

```
## [1] "De Sabbata"
```




## Data frames

A **data frame** is equivalent to a **named list** where all elements are *vectors of the same length*. Data frame is the data type that encodes what is commonly understood as a *table*, and it is probably the most common way to represent tabular data in R.


```r
lecturer <- list(
  surname = "De Sabbata", 
  teaching_MSc = TRUE,
  subjects = c("Programming", "GIS"), 
  moved_to_Leicester = 2015
)
lecturer
```

```
## $surname
## [1] "De Sabbata"
## 
## $teaching_MSc
## [1] TRUE
## 
## $subjects
## [1] "Programming" "GIS"        
## 
## $moved_to_Leicester
## [1] 2015
```

Selection and filtering procedures are similar to those seen for vectors and lists, and the columns of a data frame can be referred to using their name after the symbol `$`.


```r
students <- data.frame(
                Name = c("Pete","Maria","Joan"),
                Course = c("Geography","Engineering","Geography"),
                Year = c(1, 3, 4))
students
```

```
##    Name      Course Year
## 1  Pete   Geography    1
## 2 Maria Engineering    3
## 3  Joan   Geography    4
```

```r
students$Name
```

```
## [1] Pete  Maria Joan 
## Levels: Joan Maria Pete
```

```r
students$Name[2]
```

```
## [1] Maria
## Levels: Joan Maria Pete
```

```r
students[2, ]
```

```
##    Name      Course Year
## 2 Maria Engineering    3
```

```r
students[, 1]
```

```
## [1] Pete  Maria Joan 
## Levels: Joan Maria Pete
```

```r
students[2, 1]
```

```
## [1] Maria
## Levels: Joan Maria Pete
```

```r
students[students$Name == "Maria", ]
```

```
##    Name      Course Year
## 2 Maria Engineering    3
```

```r
students[students$Name == "Maria", 3]
```

```
## [1] 3
```

```r
students[students$Name == "Maria", "Course"]
```

```
## [1] Engineering
## Levels: Engineering Geography
```

```r
students[students$Name == "Maria", c("Name", "Course")]
```

```
##    Name      Course
## 2 Maria Engineering
```


## Exercise 2.3

**Question 2.3.1:** Select the name and year of enrollment of all geography students. Then select the names of all students who have past the first year (that is from the second year on).



## Solutions



### Exercise 2.1

**Question 2.1.1:** 

```r
colours[4] <- "orange"
```

```
## Warning in `[<-.factor`(`*tmp*`, 4, value = "orange"): invalid factor
## level, NA generated
```

```r
colours
```

```
##  [1] red    blue   red    <NA>   yellow red    white  yellow red    red   
## [11] white  yellow yellow
## Levels: red blue white yellow black
```

"orange" isn't one of the factor's levels,  so the result is NA.

**Question 2.1.2:**

There is no count for "black" in the character version - `table` doesn't know that this value exists,  since there is no 'levels' information.  Also, the order of colours is alphabetical in the character version.  In the factor version, it is based on that specified in the `factor` function.

**Question 2.1.3:**

The first variable is tabulated along the rows,  the second along the columns.

**Question 2.1.4:**

```r
# Undo the colour[4] <- 'orange' line used above
colours <- factor(c("red", "blue", "red", "white", "yellow", "red", "white", "yellow",
                  "red", "red", "white", "yellow"),
                  levels = c("red", "blue", "white", "yellow", "black"))
```
Colours of all cars with engines with capacity greater than 1.1 litres:

```r
colours[engines > "1.1litre"]  
```

```
## [1] blue   white  yellow red    white  red    yellow <NA>  
## Levels: red blue white yellow black
```
 Counts of types of all cars with capacity below 1.6 litres:

```r
table(car_type[engines < "1.6litre"])  
```

```
## 
##      saloon   hatchback convertible 
##           7           4           0
```
Counts of colours of all hatchbacks with capacity greater than or equal to 1.3 litres:

```r
table(colours[(engines >= "1.3litre") & (car_type == "hatchback")])  
```

```
## 
##    red   blue  white yellow  black 
##      2      0      0      0      0
```



### Exercise 2.2

**Question 2.2.1:** 

```r
apply(temperature_array, 3, mean)
```

```
## [1] 12.7500 13.4375 12.0000
```

**Question 2.2.2:** 

```r
apply(temperature_array, c(1, 2), max) - apply(temperature_array, c(1, 2), min)
```

```
##      [,1] [,2] [,3] [,4]
## [1,]    3    2    1    0
## [2,]    1    2    1    2
## [3,]    3    0    0    2
## [4,]    2    0    2    2
```


### Exercise 2.3

**Question 2.3.1:**

```r
students[students$Course == "Geography", c("Name", "Year")]
```

```
##   Name Year
## 1 Pete    1
## 3 Joan    4
```

```r
students[students$Year > 1, ]$Name
```

```
## [1] Maria Joan 
## Levels: Joan Maria Pete
```
