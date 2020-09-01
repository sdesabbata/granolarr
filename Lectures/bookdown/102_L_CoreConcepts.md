



# Core concepts



## Recap

**Prev**: An introduction to R

- Basic types
- Basic operators

**Now**: Core concepts

- Variables
- Functions
- Libraries



## Variables

Variables **store data** and can be defined 

- using an *identifier* (e.g., `a_variable`) 
- on the left of an *assignment operator* `<-`
- followed by the object to be linked to the identifier
- such as a *value* (e.g., `1`) 


```r
a_variable <- 1
```

The value of the variable can be invoked by simply specifying the **identifier**.


```r
a_variable
```

```
## [1] 1
```



## Algorithms and functions

*An* **algorithm** *or effective procedure is a mechanical rule, or automatic method, or programme for performing some mathematical operation* (Cutland, 1980).

A **program** is a specific set of instructions that implement an abstract algorithm.

The definition of an algorithm (and thus a program) can consist of one or more **function**s

- set of instructions that preform a task 
- possibly using an input, possibly returning an output value

Programming languages usually provide pre-defined functions that implement common algorithms (e.g., to find the square root of a number or to calculate a linear regression)



## Functions

Functions execute complex operations and can be invoked 

- specifying the *function name*
- the *arguments* (input values) between simple brackets
    - each *argument* corresponds to a *parameter*
    - sometimes the *parameter* name must be specified


```r
sqrt(2)
```

```
## [1] 1.414214
```

```r
round(1.414214, digits = 2)
```

```
## [1] 1.41
```



## Functions and variables

- functions can be used on the right side of `<-` 
- variables and functions can be used as *arguments*


```r
sqrt_of_two <- sqrt(2)
sqrt_of_two
```

```
## [1] 1.414214
```

```r
round(sqrt_of_two, digits = 2)
```

```
## [1] 1.41
```

```r
round(sqrt(2), digits = 2)
```

```
## [1] 1.41
```



## Naming

When creating an identifier for a variable or function

- R is a **case sensitive** language
    - UPPER and lower case are not the same
    - `a_variable` is different from `a_VARIABLE`
- names can include
    -  alphanumeric symbols
    - `.` and `_`
- names must start with
    - a letter



## Coding style

A *coding style* is a way of writing the code, including

- how variable and functions are named
    - lower case and `_`
- how spaces are used in the code
- which libraries are used


```r
# Bad
X<-round(sqrt(2),2)

#Good
sqrt_of_two <- sqrt(2) %>%
 round(digits = 2)
```

Study the [Tidyverse Style Guid](http://style.tidyverse.org/) and use it consistently!



## stringr

R provides some basic functions to manipulate strings, but the `stringr` library provides a more consistent and well-defined set


```r
library(tidyverse)
```

```
## ── Attaching packages ───────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.3.0 ──
```

```
## ✓ ggplot2 3.3.2     ✓ purrr   0.3.4
## ✓ tibble  3.0.3     ✓ dplyr   1.0.0
## ✓ tidyr   1.1.0     ✓ stringr 1.4.0
## ✓ readr   1.3.1     ✓ forcats 0.5.0
```

```
## ── Conflicts ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
str_length("Leicester")
```

```
## [1] 9
```

```r
str_detect("Leicester", "e")
```

```
## [1] TRUE
```

```r
str_replace_all("Leicester", "e", "x")
```

```
## [1] "Lxicxstxr"
```




## Summary

Core concepts

- Variables
- Functions
- Libraries

**Next**: Tidyverse

- Tidyverse libraries
- *pipe* operator
