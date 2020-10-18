



# Selection and filtering



## Recap

**Prev**: Data Frames

- Data Frames
- Tibbles

**Now**: Data selection and filtering

- dplyr
- dplyr::select
- dplyr::filter



## dplyr

The `dplyr` (pronounced *dee-ply-er*) library is part of `tidyverse` and it offers a grammar for data manipulation

- `select`: select specific columns
- `filter`: select specific rows
- `arrange`: arrange rows in a particular order
- `summarise`: calculate aggregated values (e.g., mean, max, etc)
- `group_by`: group data based on common column values
- `mutate`: add columns
- `join`: merge tables (`tibbles` or `data.frames`)


```r
library(tidyverse)
```



## Example dataset

The library `nycflights13` contains a dataset storing data about all the flights departed from New York City in 2013
<!--

```r
install.packages("nycflights13")
```
-->

```r
library(nycflights13)

nycflights13::flights
```

```
## # A tibble: 336,776 x 19
##    year month   day dep_time sched_dep_time dep_delay arr_time
##   <int> <int> <int>    <int>          <int>     <dbl>    <int>
## 1  2013     1     1      517            515         2      830
## 2  2013     1     1      533            529         4      850
## 3  2013     1     1      542            540         2      923
## # … with 336,773 more rows, and 12 more variables:
## #   sched_arr_time <int>, arr_delay <dbl>, carrier <chr>,
## #   flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>,
## #   time_hour <dttm>
```



## Selecting table columns

Columns of **data frames** and **tibbles** can be selected

- specifying the column index


```r
nycflights13::flights[, c(13, 14)]
```

- specifying the column name


```r
nycflights13::flights[, c("origin", "dest")]
```

```
## # A tibble: 336,776 x 2
##   origin dest 
##   <chr>  <chr>
## 1 EWR    IAH  
## 2 LGA    IAH  
## 3 JFK    MIA  
## # … with 336,773 more rows
```



## dplyr::select

`select` can be used to specify which columns to retain


```r
nycflights13::flights %>%
  dplyr::select( 
    origin, dest, dep_delay, arr_delay, year:day
  )
```

```
## # A tibble: 336,776 x 7
##   origin dest  dep_delay arr_delay  year month   day
##   <chr>  <chr>     <dbl>     <dbl> <int> <int> <int>
## 1 EWR    IAH           2        11  2013     1     1
## 2 LGA    IAH           4        20  2013     1     1
## 3 JFK    MIA           2        33  2013     1     1
## 4 JFK    BQN          -1       -18  2013     1     1
## 5 LGA    ATL          -6       -25  2013     1     1
## # … with 336,771 more rows
```


## dplyr::select

... or whichones to drop, using - in front of the column name


```r
nycflights13::flights %>%
  dplyr::select(origin, dest, dep_delay, arr_delay, year:day) %>% 
  dplyr::select(-arr_delay)
```

```
## # A tibble: 336,776 x 6
##   origin dest  dep_delay  year month   day
##   <chr>  <chr>     <dbl> <int> <int> <int>
## 1 EWR    IAH           2  2013     1     1
## 2 LGA    IAH           4  2013     1     1
## 3 JFK    MIA           2  2013     1     1
## # … with 336,773 more rows
```


## Logical filtering

Conditional statements can be used to filter a vector

- i.e. to retain only certain values
- where the specified value is `TRUE`


```r
a_numeric_vector <- -3:3
a_numeric_vector
```

```
## [1] -3 -2 -1  0  1  2  3
```

```r
a_numeric_vector[c(FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)]
```

```
## [1] 0 1 2 3
```



## Conditional filtering

As a conditional expression results in a logic vector...


```r
a_numeric_vector > 0
```

```
## [1] FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE
```

<br/>
... conditional expressions can be used for filtering


```r
a_numeric_vector[a_numeric_vector > 0]
```

```
## [1] 1 2 3
```



## Filtering data frames

The same approach can be applied to **data frames** and **tibbles**


```r
nycflights13::flights$month
```

```
##     [1]  1  1  1  1  1  1  1  1  1  1  1  1  1  1...
```


```r
nycflights13::flights$month == 11
```

```
##     [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE...
```


```r
nycflights13::flights[nycflights13::flights$month == 11, ]
```

```
## # A tibble: 27,268 x 19
##    year month   day dep_time sched_dep_time
##   <int> <int> <int>    <int>          <int>
## 1  2013    11     1        5           2359
## # … with 27,267 more rows, and 14 more variables:
## #   dep_delay <dbl>, arr_time <int>,
## #   sched_arr_time <int>, arr_delay <dbl>,
## #   carrier <chr>, flight <int>, tailnum <chr>,
## #   origin <chr>, dest <chr>, air_time <dbl>,
## #   distance <dbl>, hour <dbl>, minute <dbl>,
## #   time_hour <dttm>
```



## dplyr::filter


```r
nycflights13::flights %>%
  # Flights in November
  dplyr::filter(month == 11)
```

```
## # A tibble: 27,268 x 19
##    year month   day dep_time sched_dep_time
##   <int> <int> <int>    <int>          <int>
## 1  2013    11     1        5           2359
## 2  2013    11     1       35           2250
## 3  2013    11     1      455            500
## # … with 27,265 more rows, and 14 more variables:
## #   dep_delay <dbl>, arr_time <int>,
## #   sched_arr_time <int>, arr_delay <dbl>,
## #   carrier <chr>, flight <int>, tailnum <chr>,
## #   origin <chr>, dest <chr>, air_time <dbl>,
## #   distance <dbl>, hour <dbl>, minute <dbl>,
## #   time_hour <dttm>
```




## Select and filter


```r
nycflights13::flights %>%
  # Select the columns you need
  dplyr::select(origin, dest, dep_delay, arr_delay, year:day) %>% 
  # Drop arr_delay... because you don't need it after all
  dplyr::select(-arr_delay) %>%
  # Filter in only November flights
  dplyr::filter(month == 11)
```

```
## # A tibble: 27,268 x 6
##   origin dest  dep_delay  year month   day
##   <chr>  <chr>     <dbl> <int> <int> <int>
## 1 JFK    PSE           6  2013    11     1
## 2 JFK    SYR         105  2013    11     1
## 3 EWR    CLT          -5  2013    11     1
## # … with 27,265 more rows
```



## Summary

Data selection and filtering

- dplyr
- dplyr::select
- dplyr::filter

**Next**: Data manipulation

- dplyr::arrange
- dplyr::summarise
- dplyr::group_by
- dplyr::mutate




