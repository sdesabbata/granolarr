---
title: "Lecture 210"
author: "Dr Stefano De Sabbata<br/>School of Geography, Geology, and the Env.<br/><a href=\"mailto:s.desabbata@le.ac.uk\">s.desabbata&commat;le.ac.uk</a> &vert; <a href=\"https://twitter.com/maps4thought\">&commat;maps4thought</a><br/><a href=\"https://github.com/sdesabbata/GY7702\">github.com/sdesabbata/GY7702</a> licensed under <a href=\"https://www.gnu.org/licenses/gpl-3.0.html\">GNU GPL v3.0</a>"
date: "2020-08-28"
output:
  ioslides_presentation:
    template: ../Utils/IOSlides/UoL_Template.html
    logo: ../Utils/IOSlides/uol_logo.png
    highlight: tango
---





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
 ![](Images/joins.png){width=75%}
 
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

**Next**: Table pivot
