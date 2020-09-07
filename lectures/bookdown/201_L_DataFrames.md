



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



### Data Frames

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
## [1] "Maria" "Pete"  "Sarah"
```


## Selection

Selection is similar to vectors and lists.


```r
employees$Name # column selection, as for named lists
```

```
## [1] "Maria" "Pete"  "Sarah"
```

```r
employees$Name[1]
```

```
## [1] "Maria"
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
## 1 Maria  47  Professor          1973
## 2  Pete  34 Researcher          1986
## 3 Sarah  33 Researcher          1987
```



## tibble

A [tibble](https://tibble.tidyverse.org/) is a modern reimagining of the data.frame within `tidyverse`

- they do less 
    - don’t change variable names or types
    - don’t do partial matching
- complain more
    - e.g. when a variable does not exist
    
This forces you to confront problems earlier, typically leading to cleaner, more expressive code.



## Summary

Data Frames

- Data Frames
- Tibbles

**Next**: Data selection and filtering

- dplyr
- dplyr::select
- dplyr::filter


