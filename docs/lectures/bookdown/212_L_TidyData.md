




# Tidy data



## Recap

**Prev**: Join operations

- Joining data
- dplyr join functions

**Now**: Tidy-up your data

- Wide and long data
- Re-shape data
- Handle missing values


<!-- Data for xample, also echo-ed below-->




## Long data 

Each real-world entity is represented by *multiple rows*

- each one reporting only one of its attributes
- one column indicates which attribute each row represent
- another column is used to report the value

Common approach for temporal series


|city       |week_ending | cases|
|:----------|:-----------|-----:|
|Derby      |2020-10-03  |    NA|
|Leicester  |2020-10-03  |   473|
|Nottingham |2020-10-03  |  1701|
|Derby      |2020-10-10  |   320|
|Leicester  |2020-10-10  |   616|
|Nottingham |2020-10-10  |    NA|


## Wide data

Each real-world entity is represented by *one single row*

  - its attributes are represented through different columns


|city       | cases_2020_10_03| cases_2020_10_10|
|:----------|----------------:|----------------:|
|Derby      |               NA|              320|
|Leicester  |              473|              616|
|Nottingham |             1701|               NA|

<br/>

- **Long data** can be more flexible
  - new attributes add new rows where necessary
- **Wide data** require more structure
  - new attributes need new column for all entities



## Example


```r
city_info_long <- data.frame(
    city = c("Derby", "Leicester" , "Nottingham", 
             "Derby", "Leicester", "Nottingham"),
    week_ending = c("2020-10-03", "2020-10-03", "2020-10-03", 
                    "2020-10-10", "2020-10-10", "2020-10-10"),
    cases = c(NA, 473, 1701, 320, 616, NA)
  ) %>% 
  tibble::as_tibble()
```

|city       |week_ending | cases|
|:----------|:-----------|-----:|
|Derby      |2020-10-03  |    NA|
|Leicester  |2020-10-03  |   473|
|Nottingham |2020-10-03  |  1701|
|Derby      |2020-10-10  |   320|
|Leicester  |2020-10-10  |   616|
|Nottingham |2020-10-10  |    NA|




## tidyr

The [`tidyr`](https://tidyr.tidyverse.org/) (pronounced *tidy-er*) library is part of [`tidyverse`](https://www.tidyverse.org/)

Provides a series of functions to *"tidy-up"* your data, including

- re-shape your data
  - [`tidyr::pivot_wider`](https://tidyr.tidyverse.org/reference/pivot_wider.html): pivot from long to wide
  - [`tidyr::pivot_longer`](https://tidyr.tidyverse.org/reference/pivot_longer.html): pivot from wide to long
- handle missing values
  - [`tidyr::drop_na`](https://tidyr.tidyverse.org/reference/drop_na.html): remove rows with missing data
  - [`tidyr::replace_na`](https://tidyr.tidyverse.org/reference/replace_na.html): replace missing data
  - [`tidyr::fill`](https://tidyr.tidyverse.org/reference/replace_na.html): fill missing data
  - [`tidyr::complete`](https://tidyr.tidyverse.org/reference/complete.html): add missing value combinations



## tidyr::pivot_wider

Re-shape from **long** to **wide** format


```r
city_info_wide <- 
  city_info_long %>%
  tidyr::pivot_wider(
    # Column from which to extract new column names
    names_from = week_ending,
    # Column from which to extract values
    values_from = cases
  )
```

|city       | 2020-10-03| 2020-10-10|
|:----------|----------:|----------:|
|Derby      |         NA|        320|
|Leicester  |        473|        616|
|Nottingham |       1701|         NA|



## tidyr::pivot_wider

It might be useful (or indeed necessary) to **format** the values that will become the names of the new columns


```r
city_info_wide <- city_info_long %>% dplyr::mutate(
    # Change "-" to "_" in the string representing the dates
    week_ending = stringr::str_replace_all(week_ending, "-", "_")
  ) %>%
  tidyr::pivot_wider(
    names_from = week_ending, values_from = cases, # As before
    names_prefix = "cases_" # Add a prefix
  ) # Apologies for bad coding style, need to fit code in slide :)
```

|city       | cases_2020_10_03| cases_2020_10_10|
|:----------|----------------:|----------------:|
|Derby      |               NA|              320|
|Leicester  |              473|              616|
|Nottingham |             1701|               NA|



## tidyr::pivot_longer

Re-shape from **wide** to **long** format


```r
city_info_back_to_long <- city_info_wide %>%
  tidyr::pivot_longer(
    cols = -city, # Pivot all columns, excluding city
    names_to = "week_ending", # Name column for column names
    values_to = "cases" # Name column for values
  ) # Again, not best formatting, sorry -_-'
```

|city       |week_ending      | cases|
|:----------|:----------------|-----:|
|Derby      |cases_2020_10_03 |    NA|
|Derby      |cases_2020_10_10 |   320|
|Leicester  |cases_2020_10_03 |   473|
|Leicester  |cases_2020_10_10 |   616|
|Nottingham |cases_2020_10_03 |  1701|
|Nottingham |cases_2020_10_10 |    NA|


## tidyr::pivot_longer

It might be useful (or indeed necessary) to **format** the values extracted from the column names


```r
city_info_back_to_long <- city_info_wide %>%
  tidyr::pivot_longer(
    # As before
    cols = -city, names_to = "week_ending",  values_to = "cases",
    # Remove name prefix
    names_prefix = "cases_",
    # Transform the values that will become column names
    # list of new column names <-> functions to apply
    names_transform = list(
      # Provide a function name or define one
      week_ending = function (x) { 
        stringr::str_replace_all(x, "_", "-") 
        }
    )
  ) # I usually format my code decently, I promise
```



## tidyr::pivot_longer

... which brings us back exactly where we started.


|city       |week_ending | cases|
|:----------|:-----------|-----:|
|Derby      |2020-10-03  |    NA|
|Derby      |2020-10-10  |   320|
|Leicester  |2020-10-03  |   473|
|Leicester  |2020-10-10  |   616|
|Nottingham |2020-10-03  |  1701|
|Nottingham |2020-10-10  |    NA|



## tidyr

The [`tidyr`](https://tidyr.tidyverse.org/) (pronounced *tidy-er*) library is part of [`tidyverse`](https://www.tidyverse.org/)

Provides a series of functions to *"tidy-up"* your data, including

- re-shape your data
  - [`tidyr::pivot_wider`](https://tidyr.tidyverse.org/reference/pivot_wider.html): pivot from long to wide
  - [`tidyr::pivot_longer`](https://tidyr.tidyverse.org/reference/pivot_longer.html): pivot from wide to long
- handle missing values
  - [`tidyr::drop_na`](https://tidyr.tidyverse.org/reference/drop_na.html): remove rows with missing data
  - [`tidyr::replace_na`](https://tidyr.tidyverse.org/reference/replace_na.html): replace missing data
  - [`tidyr::fill`](https://tidyr.tidyverse.org/reference/replace_na.html): fill missing data
  - [`tidyr::complete`](https://tidyr.tidyverse.org/reference/complete.html): add missing value combinations



## tidyr::replace_na

If the data allow for a baseline value, missing values can be **replaced**


```r
city_info_long %>%
  tidyr::replace_na(
    # List of columns <-> values to replace NA
    list(cases = 0)
  )
```

|city       |week_ending | cases|
|:----------|:-----------|-----:|
|Derby      |2020-10-03  |     0|
|Leicester  |2020-10-03  |   473|
|Nottingham |2020-10-03  |  1701|
|Derby      |2020-10-10  |   320|
|Leicester  |2020-10-10  |   616|
|Nottingham |2020-10-10  |     0|



## tidyr::fill

Sometimes it can make sense to **fill** missing values using *"nearby"* values, but **caution**, order and grouping matter!


```r
city_info_long %>%
  dplyr::group_by(city) %>%
  dplyr::arrange(week_ending) %>%
  # Columns to fill
  tidyr::fill(cases)
```

|city       |week_ending | cases|
|:----------|:-----------|-----:|
|Derby      |2020-10-03  |    NA|
|Leicester  |2020-10-03  |   473|
|Nottingham |2020-10-03  |  1701|
|Derby      |2020-10-10  |   320|
|Leicester  |2020-10-10  |   616|
|Nottingham |2020-10-10  |  1701|


## tidyr::drop_na 

In other cases, it might be simpler or safer to just **remove** all the rows with missing data


```r
city_info_long_noNAs <- 
  city_info_long %>%
  # Columns to drop where NA
  tidyr::drop_na(cases)
```

|city       |week_ending | cases|
|:----------|:-----------|-----:|
|Leicester  |2020-10-03  |   473|
|Nottingham |2020-10-03  |  1701|
|Derby      |2020-10-10  |   320|
|Leicester  |2020-10-10  |   616|



## tidyr::complete

Finally, some analysis or visualisation procedures might require a *complete* table

- where missing values are represented as NAs
- for instance, when creating a map
  - you might want to use a specific colour for missing values
  - rather than a missing polygon



## tidyr::complete

Complete table by turning implicit missing values into explicit missing values


```r
city_info_long_noNAs %>%
  # Complete table with all week_ending and city combinations
  # making missing values for remaining columns explicit
  tidyr::complete(week_ending, city)
```

|city       |week_ending | cases|
|:----------|:-----------|-----:|
|Derby      |2020-10-03  |    NA|
|Derby      |2020-10-10  |   320|
|Leicester  |2020-10-03  |   473|
|Leicester  |2020-10-10  |   616|
|Nottingham |2020-10-03  |  1701|
|Nottingham |2020-10-10  |    NA|


## Summary

Tidy-up your data

- Wide and long data
- Re-shape data
- Handle missing values

**Next**: Read and write data

- file formats
- read
- write


