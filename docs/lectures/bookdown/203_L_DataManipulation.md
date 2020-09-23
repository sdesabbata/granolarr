



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



## dplyr

The `dplyr` (pronounced *dee-ply-er*) library is part of `tidyverse` and it offers a grammar for data manipulation

- `select`: select specific columns
- `filter`: select specific rows
- `arrange`: arrange rows in a particular order
- `summarise`: calculate aggregated values (e.g., mean, max, etc)
- `group_by`: group data based on common column values
- `mutate`: add columns
- `join`: merge data frames


## Libraries


```r
library(tidyverse)
library(nycflights13)

nov_dep_delays <- 
  nycflights13::flights %>%
  select(origin, dest, dep_delay, arr_delay, year:day) %>%
  select(-arr_delay) %>%
  filter(month == 11)
```



## dplyr::arrange


```r
nov_dep_delays <- nov_dep_delays %>%
  arrange( 
    dest, # Ascending destination name
    -dep_delay # Descending delay
  )

nov_dep_delays %>% head(3)
```

```
## # A tibble: 3 x 6
##   origin dest  dep_delay  year month   day
##   <chr>  <chr>     <dbl> <int> <int> <int>
## 1 JFK    ABQ          25  2013    11    29
## 2 JFK    ABQ          21  2013    11    22
## 3 JFK    ABQ          17  2013    11    21
```



## dplyr::summarise

`summarise`: calculate aggregated values (e.g., mean, max, etc)


```r
aggr_dep_delays_nov <- nov_dep_delays %>%
  # Need to filter out rows where delay is NA
  filter(!is.na(dep_delay)) %>%
  # Create two aggregated columns
  summarize(
    avg_dep_delay = mean(dep_delay), 
    tot_dep_delay = sum(dep_delay)
  )

aggr_dep_delays_nov
```

```
## # A tibble: 1 x 2
##   avg_dep_delay tot_dep_delay
##           <dbl>         <dbl>
## 1          5.44        146945
```



## dplyr::group_by


```r
dest_dep_delays_nov <- nov_dep_delays %>%
  # Need to filter out rows where delay is NA
  filter(!is.na(dep_delay)) %>%
  # Frist group by same destination
  group_by(dest) %>%
  # Then caluculate aggregated value
  summarize(
    tot_dep_delay = sum(dep_delay)
  )
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```r
dest_dep_delays_nov %>% head(3)
```

```
## # A tibble: 3 x 2
##   dest  tot_dep_delay
##   <chr>         <dbl>
## 1 ABQ             -66
## 2 ALB             636
## 3 ATL            8184
```



## dplyr::mutate


```r
dest_dep_delays_nov <- dest_dep_delays_nov %>%
  mutate(
    tot_dep_delay_days = ((tot_dep_delay / 60) /24)
  )

dest_dep_delays_nov %>% head(3)
```

```
## # A tibble: 3 x 3
##   dest  tot_dep_delay tot_dep_delay_days
##   <chr>         <dbl>              <dbl>
## 1 ABQ             -66            -0.0458
## 2 ALB             636             0.442 
## 3 ATL            8184             5.68
```


## Full pipe example


```r
dest_dep_delays_nov <- nycflights13::flights %>%
  select(origin, dest, dep_delay, arr_delay, year:day) %>%
  select(-arr_delay) %>%
  filter(month == 11) %>%
  filter(!is.na(dep_delay)) %>%
  arrange(dest, -dep_delay) %>%
  group_by(dest) %>%
  summarize(tot_dep_delay = sum(dep_delay)) %>%
  mutate(tot_dep_delay_days = ((tot_dep_delay / 60) /24))
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```r
dest_dep_delays_nov %>% head(3)
```

```
## # A tibble: 3 x 3
##   dest  tot_dep_delay tot_dep_delay_days
##   <chr>         <dbl>              <dbl>
## 1 ABQ             -66            -0.0458
## 2 ALB             636             0.442 
## 3 ATL            8184             5.68
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


