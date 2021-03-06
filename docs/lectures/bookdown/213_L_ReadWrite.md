



# Read and write data



## Summary

Tidy-up your data

- Wide and long data
- Re-shape data
- Handle missing values

**Next**: Read and write data

- file formats
- read
- write





## Text file formats

A series of formats based on plain-text files

For instance

- comma-separated values files `.csv`
- semi-colon-separated values files `.csv`
- tab-separated values files `.tsv`
- other formats using custom delimiters
- fix-width files `.fwf`



## Comma Separated Values

The file `2011_OAC_supgrp_Leicester.csv` contains

- one row for each [Output Area (OA)](https://www.ons.gov.uk/methodology/geography/ukgeographies/censusgeography) in Leicester
- [Lower-Super Output Area (LSOA)](https://www.ons.gov.uk/methodology/geography/ukgeographies/censusgeography) containing the OA
- code and name of the supergroup assigned to the OA by the [2011 Output Area Classification](http://geogale.github.io/2011OAC/)
- total population of the OA

Extract showing only the first few rows

```{}
OA11CD,LSOA11CD,supgrpcode,supgrpname,Total_Population
E00069517,E01013785,6,Suburbanites,313
E00069514,E01013784,2,Cosmopolitans,323
E00169516,E01013713,4,Multicultural Metropolitans,341
E00169048,E01032862,4,Multicultural Metropolitans,345
```



## readr

The [`readr`](https://readr.tidyverse.org/) (pronounced *read-er*) library is part of [`tidyverse`](https://www.tidyverse.org/)

Provides functions to read and write text files

- `readr::read_csv`: comma-separated files `.csv`
- `readr::read_csv2`: semi-colon-separated files `.csv`
- `readr::read_tsv`: tab-separated files `.tsv`
- `readr::read_fwf`: fix-width files `.fwf`
- `readr::read_delim`: files using a custom delimiter

and their *write* counterpart, such as

- `readr::write_csv`: comma-separated files `.csv`


## readr::read_csv

The `readr::read_csv` function of the [`readr`](https://readr.tidyverse.org/index.html) library reads a *csv* file from the path provided as the first argument


```r
leicester_2011OAC <- 
  readr::read_csv("2011_OAC_supgrp_Leicester.csv")

leicester_2011OAC
```


```
## # A tibble: 969 x 5
##   OA11CD  LSOA11CD supgrpcode supgrpname    Total_Population
##   <chr>   <chr>         <dbl> <chr>                    <dbl>
## 1 E00069… E010137…          6 Suburbanites               313
## 2 E00069… E010137…          2 Cosmopolitans              323
## 3 E00169… E010137…          4 Multicultura…              341
## # … with 966 more rows
```



## Read options

Read functions provide options about how to interpret a file contents

- For instance, `readr::read_csv`
  - `col_names`: 
    - `TRUE` or `FALSE` whether top row is column names
    - or a vector of column names
  - `col_types`:
    - a `cols()` specification or a string
  - `skip`: lines to skip before reading data
  - `n_max`: max number of record to read



## Column specifications

- `col_logical()` or `l` as logic values
- `col_integer()` or `i` as integer
- `col_double()` or `d` as numeric (double)
- `col_character()` or `c` as character
- `col_factor(levels, ordered)` or `f` as factor
- `col_date(format = "")` or `D` as data type
- `col_time(format = "")` or `t` as time type
- `col_datetime(format = "")` or `T` as datetime
- `col_number()` or `n` as numeric (dropping marks)
- `col_skip()` or `_` or `-` don’t import
- `col_guess()` or `?` use best type based on the input



## readr::read_csv

Using `readr::read_csv` as in the previous example with no further options will generate the following warning


```r
leicester_2011OAC <- 
  readr::read_csv("2011_OAC_supgrp_Leicester.csv")

leicester_2011OAC
```

```{}
Parsed with column specification:
cols(
  OA11CD = col_character(),
  LSOA11CD = col_character(),
  supgrpcode = col_double(),
  supgrpname = col_character(),
  Total_Population = col_double()
)
```



## readr::read_csv


```r
leicester_2011OAC <- readr::read_csv(
    "2011_OAC_supgrp_Leicester.csv",
    col_types = cols(
      OA11CD  = col_character(),
      LSOA11CD  = col_character(),
      supgrpcode  = col_character(),
      supgrpname  = col_character(),
      Total_Population  = col_integer()
    )
  )
```


```
## # A tibble: 969 x 5
##   OA11CD  LSOA11CD supgrpcode supgrpname    Total_Population
##   <chr>   <chr>    <chr>      <chr>                    <int>
## 1 E00069… E010137… 6          Suburbanites               313
## 2 E00069… E010137… 2          Cosmopolitans              323
## 3 E00169… E010137… 4          Multicultura…              341
## # … with 966 more rows
```


## readr::read_csv


```r
leicester_2011OAC <- readr::read_csv(
    "2011_OAC_supgrp_Leicester.csv",
    col_types = "cccci"
  )
```


```
## # A tibble: 969 x 5
##   OA11CD  LSOA11CD supgrpcode supgrpname    Total_Population
##   <chr>   <chr>    <chr>      <chr>                    <int>
## 1 E00069… E010137… 6          Suburbanites               313
## 2 E00069… E010137… 2          Cosmopolitans              323
## 3 E00169… E010137… 4          Multicultura…              341
## 4 E00169… E010328… 4          Multicultura…              345
## 5 E00169… E010328… 4          Multicultura…              322
## 6 E00069… E010136… 4          Multicultura…              334
## 7 E00169… E010328… 4          Multicultura…              336
## # … with 962 more rows
```


## readr::write_csv

The function `write_csv` can be used to save a dataset to `csv`

Example:

1. **read** the 2011 OAC dataset
2. **select** a few columns
3. **filter** only those OA in the supergroup *Suburbanites* (code `6`)
4. **write** the results to a file named *2011_OAC_supgrp_Leicester_supgrp6.csv*


```r
readr::read_csv("2011_OAC_supgrp_Leicester.csv") %>%
  dplyr::select(OA11CD, supgrpcode, Total_Population) %>%
  dplyr::filter(supgrpcode == "6") %>%
  readr::write_csv("2011_OAC_supgrp_Leicester_supgrp6.csv")
```




## readr::write_tsv


```r
readr::read_csv("2011_OAC_supgrp_Leicester.csv") %>%
  dplyr::select(OA11CD, supgrpcode, Total_Population) %>%
  dplyr::filter(supgrpcode == "6") %>%
  readr::write_tsv("2011_OAC_supgrp_Leicester_supgrp6.tsv")
```


```{}
OA11CD	    supgrpcode	Total_Population
E00069517	6	        313
E00069468	6	        251
E00069528	6	        270
E00069538	6	        307
E00069174	6	        321
E00069170	6	        353
E00069171	6	        351
E00068713	6	        265
E00069005	6	        391
E00069014	6	        316
E00068989	6	        354
```




## Other data imports

[Tidyverse](https://www.tidyverse.org/) also imports [other packages for reading data](https://www.tidyverse.org/packages/#import)

- Tabular formats
  - [`readxl`](https://readxl.tidyverse.org/) for Excel (`.xls` and `.xlsx`)
  - [`haven`](https://haven.tidyverse.org/) for SPSS, Stata, and SAS data.
- Databases
  - [`DBI`](https://cran.r-project.org/web/packages/DBI/) for relational databases
- NoSQL
  - [`jsonlite`](https://cran.r-project.org/web/packages/jsonlite/) for JSON
  - [`xml2`](https://cran.r-project.org/web/packages/xml2/) for XML
- Web
  - [`httr`](https://cran.r-project.org/web/packages/httr/) for web APIs

<!--
  - Specific backends require different packages, e.g. [`RPostgreSQL`](https://cran.r-project.org/web/packages/RPostgreSQL/)
  - [`rvest`](https://cran.r-project.org/web/packages/rvest/) for web scraping.
-->



## Summary

Read and write data

- file formats
- read
- write

**Next**: Practical session

- Read and write data
- Tidy data
- Join operations


