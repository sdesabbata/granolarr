---
title: "Lecture 211"
author: "Dr Stefano De Sabbata<br/>School of Geography, Geology, and the Env.<br/><a href=\"mailto:s.desabbata@le.ac.uk\">s.desabbata&commat;le.ac.uk</a> &vert; <a href=\"https://twitter.com/maps4thought\">&commat;maps4thought</a><br/><a href=\"https://github.com/sdesabbata/GY7702\">github.com/sdesabbata/GY7702</a> licensed under <a href=\"https://www.gnu.org/licenses/gpl-3.0.html\">GNU GPL v3.0</a>"
date: "2020-08-31"
output:
  ioslides_presentation:
    template: ../Utils/IOSlides/UoL_Template.html
    logo: ../Utils/IOSlides/uol_logo.png
    highlight: tango
---





# Data pivot



## Recap

**Prev**: Selection and manipulation

- Data Frames
- Data selection and filtering
- Data manipulation

**Now**: Data pivot

- Wide and long data
- tidyr::pivot_longer
- tidyr::pivot_wider



## Wide data

This is the most common approach 

- each real-world entity is represented by *one single row*
- its attributes are represented through different columns

|City      |Population|Area|Density|
|----------|----------|----|-------|
|Leicester |   329,839|73.3|  4,500|
|Nottingham|   321,500|74.6|  4,412|



## Long data 

This is probably a less common approach, but still necessary in many cases

- each real-world entity is represented by *multiple rows*
    - each one reporting only one of its attributes
- one column indicates which attribute each row represent
- another column is used to report the value

|City      |Attribute |Value  |
|----------|----------|-------|
|Leicester |Population|329,839|
|Leicester |      Area|   73.3|
|Leicester |   Density|  4,500|
|Nottingham|Population|321,500|
|Nottingham|      Area|   74.6|
|Nottingham|   Density|  4,412|


## Libraries


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
library(knitr)
```


## tidyr

The `tidyr` (pronounced *tidy-er*) library is part of `tidyverse` and it  provides functions to re-shape your data


```r
city_info_wide <- data.frame(
  City = c("Leicester", "Nottingham"),
  Population = c(329839, 321500),
  Area = c(73.3, 74.6),
  Density = c(4500, 4412)
)

kable(city_info_wide)
```



|City       | Population| Area| Density|
|:----------|----------:|----:|-------:|
|Leicester  |     329839| 73.3|    4500|
|Nottingham |     321500| 74.6|    4412|



## tidyr::gather

Re-shape from *wide* to *long* format


```r
city_info_long <- city_info_wide %>%
  gather(
    -City, # exclude city names from gathering
    key = "Attribute", # name for the new key column
    value = "Value" # name for the new value column
  )
```

|City       |Attribute  |    Value|
|:----------|:----------|--------:|
|Leicester  |Population | 329839.0|
|Nottingham |Population | 321500.0|
|Leicester  |Area       |     73.3|
|Nottingham |Area       |     74.6|
|Leicester  |Density    |   4500.0|
|Nottingham |Density    |   4412.0|



## tidyr::spread

Rre-shape from *long* to *wide* format


```r
city_info_back_to_wide <- city_info_long %>%
  spread(
    key = "Attribute", # specify key column
    value = "Value" # specify value column
  )
```

|City       | Area| Density| Population|
|:----------|----:|-------:|----------:|
|Leicester  | 73.3|    4500|     329839|
|Nottingham | 74.6|    4412|     321500|



## Summary

Table pivot

- Wide and long data
- tidyr::pivot_longer
- tidyr::pivot_wider

**Next**: Read and write data
