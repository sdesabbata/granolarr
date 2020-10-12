



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
dep_delays <- 
  nycflights13::flights %>%
  dplyr::select(origin, dest, dep_delay, arr_delay, year:day) %>% 
  dplyr::select(-arr_delay)

dep_delays
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

Conditional statements can be used to filter a vector, i.e. to retain only certain values


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

As a condition expression results in a logic vector, that condition can be used for filtering


```r
a_numeric_vector > 0
```

```
## [1] FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE
```

```r
a_numeric_vector[a_numeric_vector > 0]
```

```
## [1] 1 2 3
```



## Filtering data frames

The same can be applied to data frames


```r
dep_delays[dep_delays$month == 11, ]
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



## dplyr::filter


```r
dep_delays %>%
  dplyr::filter(month == 11) # Flights in November
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




