---
title: "Lecture 201<br/>Data wrangling Pt. 1"
author: "Dr Stefano De Sabbata<br/>School of Geography, Geology, and the Env.<br/><a href=\"mailto:s.desabbata@le.ac.uk\">s.desabbata&commat;le.ac.uk</a> &vert; <a href=\"https://twitter.com/maps4thought\">&commat;maps4thought</a><br/><a href=\"https://github.com/sdesabbata/GY7702\">github.com/sdesabbata/GY7702</a> licensed under <a href=\"https://www.gnu.org/licenses/gpl-3.0.html\">GNU GPL v3.0</a>"
date: "2020-01-13"
output:
  ioslides_presentation:
    template: ../Utils/IOSlides/UoL_Template.html
    logo: ../Utils/IOSlides/uol_logo.png
    highlight: tango
---





# Recap @ 201



## Previous lectures

Basis of R programming

- Basic types
- Variables
- The pipe operator
- Coding style
- Vectors
- Data Frames



## This lecture

Moving on towards data science

- Data selection
- Data filtering
- Data manipulation



# Selection and filtering


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



# Manipulate


## dplyr::arrange


```r
nov_dep_delays <- nov_dep_delays %>%
  arrange( 
    dest, # Ascending destination name
    -dep_delay # Descending delay
  )

nov_dep_delays[1:3, ]
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

dest_dep_delays_nov[1:3, ]
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

dest_dep_delays_nov[1:3, ]
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
  
dest_dep_delays_nov[1:3, ]
```

```
## # A tibble: 3 x 3
##   dest  tot_dep_delay tot_dep_delay_days
##   <chr>         <dbl>              <dbl>
## 1 ABQ             -66            -0.0458
## 2 ALB             636             0.442 
## 3 ATL            8184             5.68
```



# Summary



## Summary

Moving on towards data science

- Data selection
- Data filtering
- Data manipulation



## Practical session

In the practical session we will see

- Creating R projects
- Creating R scripts
- Data selection
- Data filtering
- Data manipulation



## Next lecture

Moving on towards data science

- Join operations
- Table re-shaping
- Read and write data
