



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
- `join`: merge data frames


```r
library(tidyverse)
```



## Example dataset

The library `nycflights13` contains a dataset storing data about all the flights departed from New York City in 2013


```r
install.packages("nycflights13")
```

```r
library(nycflights13)
```

```
## Warning: package 'nycflights13' was built under R version 4.0.2
```

```r
flights_from_nyc <- nycflights13::flights

colnames(flights_from_nyc)
```

```
##  [1] "year"           "month"          "day"            "dep_time"      
##  [5] "sched_dep_time" "dep_delay"      "arr_time"       "sched_arr_time"
##  [9] "arr_delay"      "carrier"        "flight"         "tailnum"       
## [13] "origin"         "dest"           "air_time"       "distance"      
## [17] "hour"           "minute"         "time_hour"
```



## dplyr::select

`select` can be used to specify which columns to retain


```r
delays <- select(flights_from_nyc, 
  origin, dest, dep_delay, arr_delay,
  year:day
  )

# Drop column arr_delay using - in front of the column name
dep_delays <- select(delays, -arr_delay)

delays[1:3, ]
```

```
## # A tibble: 3 x 7
##   origin dest  dep_delay arr_delay  year month   day
##   <chr>  <chr>     <dbl>     <dbl> <int> <int> <int>
## 1 EWR    IAH           2        11  2013     1     1
## 2 LGA    IAH           4        20  2013     1     1
## 3 JFK    MIA           2        33  2013     1     1
```


## dplyr::select

... using the pipe operator


```r
dep_delays <- flights_from_nyc %>%
  select(origin, dest, dep_delay, arr_delay, year:day) %>%
  select(-arr_delay)

delays[1:3, ]
```

```
## # A tibble: 3 x 7
##   origin dest  dep_delay arr_delay  year month   day
##   <chr>  <chr>     <dbl>     <dbl> <int> <int> <int>
## 1 EWR    IAH           2        11  2013     1     1
## 2 LGA    IAH           4        20  2013     1     1
## 3 JFK    MIA           2        33  2013     1     1
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
nov_dep_delays <- dep_delays[dep_delays$month == 11, ]

nov_dep_delays[1:3, ]
```

```
## # A tibble: 3 x 6
##   origin dest  dep_delay  year month   day
##   <chr>  <chr>     <dbl> <int> <int> <int>
## 1 JFK    PSE           6  2013    11     1
## 2 JFK    SYR         105  2013    11     1
## 3 EWR    CLT          -5  2013    11     1
```



## dplyr::filter


```r
nov_dep_delays <- dep_delays %>%
  filter(month == 11) # Flights in November

nov_dep_delays[1:3, ]
```

```
## # A tibble: 3 x 6
##   origin dest  dep_delay  year month   day
##   <chr>  <chr>     <dbl> <int> <int> <int>
## 1 JFK    PSE           6  2013    11     1
## 2 JFK    SYR         105  2013    11     1
## 3 EWR    CLT          -5  2013    11     1
```



## Summary

Data selection and filtering

- dplyr
- dplyr::select
- dplyr::filter

**Next**:
