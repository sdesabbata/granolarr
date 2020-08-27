---
title: "Lecture 212"
author: "Dr Stefano De Sabbata<br/>School of Geography, Geology, and the Env.<br/><a href=\"mailto:s.desabbata@le.ac.uk\">s.desabbata&commat;le.ac.uk</a> &vert; <a href=\"https://twitter.com/maps4thought\">&commat;maps4thought</a><br/><a href=\"https://github.com/sdesabbata/GY7702\">github.com/sdesabbata/GY7702</a> licensed under <a href=\"https://www.gnu.org/licenses/gpl-3.0.html\">GNU GPL v3.0</a>"
date: "2020-08-27"
output:
  ioslides_presentation:
    template: ../Utils/IOSlides/UoL_Template.html
    logo: ../Utils/IOSlides/uol_logo.png
    highlight: tango
---





# Read and write data



## Summary

Table pivot

- Wide and long data
- tidyr::pivot_longer
- tidyr::pivot_wider

**Next**: Read and write data

- file formats
- read
- write



## Comma Separated Values

The file `2011_OAC_Raw_uVariables_Leicester.csv`
- contains data used for the 2011 Output Area Classificagtion
- 167 variables, as well as the resulting groups
- for the city of Leicester

Extract showing only some columns

```{}
OA11CD,LSOA11CD, ... supgrpcode,supgrpname,Total_Population, ...
E00069517,E01013785, ... 6,Suburbanites,313, ...
E00169516,E01013713, ... 4,Multicultural Metropolitans,341, ...
E00169048,E01032862, ... 4,Multicultural Metropolitans,345, ...
```

The full variable names can be found in the file
- `2011_OAC_Raw_uVariables_Lookup.csv`.


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


## Read

The `read_csv` function of the [`readr`](https://readr.tidyverse.org/index.html) library reads a *csv* file from the path provided as the first argument



```r
leicester_2011OAC <- read_csv("2011_OAC_Raw_uVariables_Leicester.csv")

leicester_2011OAC %>% 
  select(OA11CD,LSOA11CD, supgrpcode,supgrpname,Total_Population) %>%
  top_n(3) %>%
  kable()
```


|OA11CD    |LSOA11CD  | supgrpcode|supgrpname                  | Total_Population|
|:---------|:---------|----------:|:---------------------------|----------------:|
|E00169553 |E01013648 |          2|Cosmopolitans               |              714|
|E00069303 |E01013739 |          4|Multicultural Metropolitans |              623|
|E00168096 |E01013689 |          2|Cosmopolitans               |              708|


## Write

The function `write_csv` can be used to save a dataset to `csv`

Example:

1. **read** the 2011 OAC dataset
2. **select** a few columns
3. **filter** only those OA in the supergroup *Suburbanites* (code `6`)
4. **write** the results to a file named *Leicester_Suburbanites.csv* in your home folder


```r
read_csv("2011_OAC_Raw_uVariables_Leicester.csv") %>%
  select(OA11CD, supgrpcode, supgrpname) %>%
  filter(supgrpcode == 6) %>%
  write_csv("~/Leicester_Suburbanites.csv")
```


## Summary

Read and write data

- file formats
- read
- write

**Next**: Practical session

- Join operations
- Table pivot
- Read and write data
