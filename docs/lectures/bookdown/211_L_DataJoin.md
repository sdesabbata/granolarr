



# Join operations



## Recap

**Prev**: Selection and manipulation

- Data Frames
- Data selection and filtering
- Data manipulation

**Now**: Join operations

- Joining data
- dplyr join functions



## Joining data

Data frames can be joined (or 'merged')

- information from two data frames can be combined
- specifying a **column with common values**
    - usually one with a unique identifier of an entity
- rows having the same value are joined
- depending on parameters
    - a row from one data frame can be merged with multiple rows from the other data frame
    - rows with no matching values in the other data frame can be retained
- `merge` base function or join functions in `dplyr`



## Join types

<center>
 ![](images/joins.png){width=75%}
 
<br/>
<font size="4">
<a href="https://www.codeproject.com/articles/33052/visual-representation-of-sql-joins">by C.L. Moffatt</a>, licensed under <a href="https://www.codeproject.com/info/cpol10.aspx">The Code Project Open License (CPOL)</a>
</font>
<center>


## Example


```r
employees <- data.frame(
  Name = c("Maria", "Pete", "Sarah", "Jo"),
  Age = c(47, 34, 32, 25),
  Role = c("Professor", "Researcher", "Researcher", "Postgrad")
)

city_of_birth <-data.frame(
  Name = c("Maria", "Pete", "Sarah", "Mel"),
  City = c("Barcelona", "London", "Boston", "Los Angeles")
)
```

## Example


|Name  | Age|Role       |
|:-----|---:|:----------|
|Maria |  47|Professor  |
|Pete  |  34|Researcher |
|Sarah |  32|Researcher |
|Jo    |  25|Postgrad   |

<br/>


|Name  |City        |
|:-----|:-----------|
|Maria |Barcelona   |
|Pete  |London      |
|Sarah |Boston      |
|Mel   |Los Angeles |


## dplyr::full_join

`dplyr` provides [a series of join functions](https://dplyr.tidyverse.org/reference/join.html)



- `full_join` combines all the available data


```r
employees %>% full_join(
  city_of_birth,
  by = c("Name" = "Name") # join columns
  ) %>%
  kable()
```



|Name  | Age|Role       |City        |
|:-----|---:|:----------|:-----------|
|Maria |  47|Professor  |Barcelona   |
|Pete  |  34|Researcher |London      |
|Sarah |  32|Researcher |Boston      |
|Jo    |  25|Postgrad   |NA          |
|Mel   |  NA|NA         |Los Angeles |



## dplyr::left_join

- `left_join` keeps all the data from the **left** table
  - using `%>%`, that's the data *"coming down the pipe"*
- rows from the right table without a match are dropped


```r
employees %>% left_join(
  city_of_birth,
  by = c("Name" = "Name") # join columns
  ) %>%
  kable()
```



|Name  | Age|Role       |City      |
|:-----|---:|:----------|:---------|
|Maria |  47|Professor  |Barcelona |
|Pete  |  34|Researcher |London    |
|Sarah |  32|Researcher |Boston    |
|Jo    |  25|Postgrad   |NA        |



## dplyr::right_join

- `right_join` keeps all the data from the **right** table
    - using `%>%`, that's the data provided as an argument
- rows from the left table without a match are dropped


```r
employees %>% right_join(
  city_of_birth,
  by = c("Name" = "Name") # join columns
  ) %>%
  kable()
```



|Name  | Age|Role       |City        |
|:-----|---:|:----------|:-----------|
|Maria |  47|Professor  |Barcelona   |
|Pete  |  34|Researcher |London      |
|Sarah |  32|Researcher |Boston      |
|Mel   |  NA|NA         |Los Angeles |



## dplyr::inner_join

- `inner_join` keeps only rows that have a match in both tables
- rows without a match are dropped


```r
employees %>% inner_join(
  city_of_birth,
  by = c("Name" = "Name") # join columns
  ) %>%
  kable()
```



|Name  | Age|Role       |City      |
|:-----|---:|:----------|:---------|
|Maria |  47|Professor  |Barcelona |
|Pete  |  34|Researcher |London    |
|Sarah |  32|Researcher |Boston    |



## Summary

Join operations

- Joining data
- dplyr join functions

**Next**: Tidy-up your data

- Wide and long data
- Re-shape data
- Handle missing values


