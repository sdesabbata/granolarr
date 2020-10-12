



# Data Frames



## Recap

**Prev**: R programming

- 111 Lecture: Data types
- 112 Lecture: Control structures
- 113 Lecture: Functions
- 114 Practical session

**Now**: Data Frames

- Data Frames
- Tibbles


## Lists and named lists

**List**

- can contain elements of different types
  - whereas elements of vectors are all of the same type
- in **named lists**, each element has a name
  - elements can be selected using the operator `$`


```r
employee <- list(employee_name = "Stef", start_year = 2015)
employee[[1]]
```

```
## [1] "Stef"
```

```r
employee$employee_name
```

```
## [1] "Stef"
```



## Data Frames

A **data frame** is equivalent to a *named list* where all elements are *vectors of the same length*.


```r
employees <- data.frame(
  EmployeeName = c("Maria", "Pete", "Sarah"),
  Age = c(47, 34, 32),
  Role = c("Professor", "Researcher", "Researcher"))
employees
```

```
##   EmployeeName Age       Role
## 1        Maria  47  Professor
## 2         Pete  34 Researcher
## 3        Sarah  32 Researcher
```

Data frames are the most common way to represent tabular data in R. Matrices and lists can be converted to data frames.

<!--
**Note:** As is common in R, the elements of an eventual too short column are recycled to match column lengths.
-->

## Selection

Selection is similar to vectors and lists.


```r
employees[1, 1] # value selection
```

```
## [1] "Maria"
```

```r
employees[1, ] # row selection
```

```
##   EmployeeName Age      Role
## 1        Maria  47 Professor
```

```r
employees[, 1] # column selection
```

```
## [1] "Maria" "Pete"  "Sarah"
```


## Selection

Selection is similar to vectors and lists.


```r
employees$EmployeeName # column selection, as for named lists
```

```
## [1] "Maria" "Pete"  "Sarah"
```

```r
employees$EmployeeName[1]
```

```
## [1] "Maria"
```



## Table manipulation

- Values can be assigned to cells
  - using any selection method 
  - and the assignment operator `<-`
- New columns can be defined 
  - assigning a vector to a new name


```r
employees$Age[3] <- 33 
employees$Place <- c("Leicester", "Leicester","Leicester") 
employees
```

```
##   EmployeeName Age       Role     Place
## 1        Maria  47  Professor Leicester
## 2         Pete  34 Researcher Leicester
## 3        Sarah  33 Researcher Leicester
```



## Column processing

Operations can be performed on columns as they where vectors


```r
10 - c(1, 2, 3)
```

```
## [1] 9 8 7
```


```r
# Use Sys.Date to retrieve the current year
current_year <- as.integer(format(Sys.Date(), "%Y"))

# Calculate employee year of birth
employees$Year_of_birth <- current_year - employees$Age
employees
```

```
##   EmployeeName Age       Role     Place Year_of_birth
## 1        Maria  47  Professor Leicester          1973
## 2         Pete  34 Researcher Leicester          1986
## 3        Sarah  33 Researcher Leicester          1987
```



## tibble

A [tibble](https://tibble.tidyverse.org/) is a modern reimagining of the data.frame within `tidyverse`

- they do less 
    - don’t change column names or types
    - don’t do partial matching
- complain more
    - e.g. when referring to a column that does not exist
    
That forces you to confront problems earlier, typically leading to cleaner, more expressive code.



## Summary

Data Frames

- Data Frames
- Tibbles

**Next**: Data selection and filtering

- dplyr
- dplyr::select
- dplyr::filter


