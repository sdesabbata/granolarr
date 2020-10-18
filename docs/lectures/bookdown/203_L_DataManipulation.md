



# Data manipulation



## Recap

**Prev**: Data selection and filtering

- dplyr
- dplyr::select
- dplyr::filter

**Now**: Data manipulation

- dplyr::arrange
- dplyr::summarise
- dplyr::group_by
- dplyr::mutate


## Example


```r
library(tidyverse)
library(nycflights13)

nov_dep_delays <- 
  nycflights13::flights %>%
  dplyr::select(origin, dest, dep_delay, year:day) %>%
  dplyr::filter(month == 11)

nov_dep_delays
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



## dplyr::arrange

Arranges rows in a particular order

- descending orders specified by using `-` (minus symbol)


```r
nov_dep_delays %>%
  dplyr::arrange(
    # Ascending destination name
    dest,
    # Descending delay
    -dep_delay
  )
```

```
## # A tibble: 27,268 x 6
##   origin dest  dep_delay  year month   day
##   <chr>  <chr>     <dbl> <int> <int> <int>
## 1 JFK    ABQ          25  2013    11    29
## 2 JFK    ABQ          21  2013    11    22
## # … with 27,266 more rows
```



## dplyr::summarise

Calculates aggregated values

- e.g., using functions such as mean, max, etc.


```r
nov_dep_delays %>%
  # Need to filter out rows where delay is NA
  dplyr::filter(!is.na(dep_delay)) %>%
  # Create two aggregated columns
  dplyr::summarise(
    avg_dep_delay = mean(dep_delay), 
    tot_dep_delay = sum(dep_delay)
  )
```

```
## # A tibble: 1 x 2
##   avg_dep_delay tot_dep_delay
##           <dbl>         <dbl>
## 1          5.44        146945
```



## dplyr::group_by

Groups rows based on common values for specified column(s)

- combined with `summarise`, aggregated values per group


```r
nov_dep_delays %>%
  # First group by same destination
  dplyr::group_by(dest) %>%
  # Then calculate aggregated value
  dplyr::filter(!is.na(dep_delay)) %>%
  dplyr::summarise(tot_dep_delay = sum(dep_delay))
```

```
## # A tibble: 90 x 2
##   dest  tot_dep_delay
##   <chr>         <dbl>
## 1 ABQ             -66
## 2 ALB             636
## # … with 88 more rows
```



## dplyr::tally and dplyr::count

- `dplyr::tally` short-hand for `summarise` with `n`
  - number of rows
- `dplyr::count`short-hand for `group_by` and `tally`
  - number of rows per group



```r
nov_dep_delays %>%
  # Count flights by same destination
  dplyr::count(dest)
```

```
## # A tibble: 90 x 2
##   dest      n
##   <chr> <int>
## 1 ABQ      30
## 2 ALB      46
## 3 ATL    1384
## # … with 87 more rows
```


## dplyr::mutate

Calculate values for new columns based on current columns


```r
nov_dep_delays %>%
  dplyr::mutate(
    # Combine origin and destination into one column
    orig_dest = str_c(origin, dest, sep = "->"),
    # Departure delay in days (rather than minutes)
    delay_days = ((dep_delay / 60) /24)
  )
```

```
## # A tibble: 27,268 x 8
##   origin dest  dep_delay  year month   day orig_dest delay_days
##   <chr>  <chr>     <dbl> <int> <int> <int> <chr>          <dbl>
## 1 JFK    PSE           6  2013    11     1 JFK->PSE     0.00417
## 2 JFK    SYR         105  2013    11     1 JFK->SYR     0.0729 
## 3 EWR    CLT          -5  2013    11     1 EWR->CLT    -0.00347
## # … with 27,265 more rows
```


## Full pipe example


```r
nycflights13::flights %>%
  dplyr::select(
    origin, dest, dep_delay, arr_delay, 
    year:day
  ) %>%
  dplyr::select(-arr_delay) %>%
  dplyr::filter(month == 11) %>%
  dplyr::filter(!is.na(dep_delay)) %>%
  dplyr::arrange(dest, -dep_delay) %>%
  dplyr::group_by(dest) %>%
  dplyr::summarise(
    tot_dep_delay = sum(dep_delay)
  ) %>%
  dplyr::mutate(
    tot_dep_delay_days = ((tot_dep_delay / 60) /24)
  )
```



## Full pipe example


```
## # A tibble: 90 x 3
##    dest  tot_dep_delay tot_dep_delay_days
##    <chr>         <dbl>              <dbl>
##  1 ABQ             -66            -0.0458
##  2 ALB             636             0.442 
##  3 ATL            8184             5.68  
##  4 AUS             574             0.399 
##  5 AVL             239             0.166 
##  6 BDL              80             0.0556
##  7 BGR             437             0.303 
##  8 BHM             412             0.286 
##  9 BNA            3943             2.74  
## 10 BOS            2968             2.06  
## # … with 80 more rows
```



## Summary

Data manipulation

- dplyr::arrange
- dplyr::summarise
- dplyr::group_by
- dplyr::mutate

**Next**: Practical session

- Creating R projects
- Creating R scripts
- Data wrangling script


