



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




## Comma Separated Values

The file `2011_OAC_Raw_uVariables_Leicester.csv`
- contains data used for the 2011 Output Area Classification
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


## readr

Library part of the Tidyverse providing functions to read and write text files

- `readr::read_csv`: comma-separated files `.csv`
- `readr::read_csv2`: semi-colon-separated files `.csv`
- `readr::read_tsv`: tab-separated files `.tsv`
- `readr::read_fwf`: fix-width files `.fwf`
- `readr::read_delim`: files using a custom delimiter

and their *write* counterpart, such as

- `readr::write_csv`: comma-separated files `.csv`


## Read

The `readr::read_csv` function of the [`readr`](https://readr.tidyverse.org/index.html) library reads a *csv* file from the path provided as the first argument



```r
leicester_2011OAC <- readr::read_csv("2011_OAC_Raw_uVariables_Leicester.csv")

leicester_2011OAC %>% 
  dplyr::select(OA11CD,LSOA11CD, supgrpcode,supgrpname,Total_Population)
```


|OA11CD    |LSOA11CD  | supgrpcode|supgrpname                  | Total_Population|
|:---------|:---------|----------:|:---------------------------|----------------:|
|E00069517 |E01013785 |          6|Suburbanites                |              313|
|E00069514 |E01013784 |          2|Cosmopolitans               |              323|
|E00169516 |E01013713 |          4|Multicultural Metropolitans |              341|



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



## Read options


```r
readr::read_csv("2011_OAC_Raw_uVariables_Leicester.csv")
```

```
## # A tibble: 969 x 190
##   OA11CD LSOA11CD LSO11ANM MSOA11CD MSOA11NM LAD11CD LAD11NM supgrpcode
##   <chr>  <chr>    <chr>    <chr>    <chr>    <chr>   <chr>        <dbl>
## 1 E0006… E010137… Leicest… E020028… Leicest… E06000… Leices…          6
## 2 E0006… E010137… Leicest… E020028… Leicest… E06000… Leices…          2
## 3 E0016… E010137… Leicest… E020028… Leicest… E06000… Leices…          4
## # … with 966 more rows, and 182 more variables: supgrpname <chr>,
## #   grpcode <chr>, grpname <chr>, subgrpcode <chr>, subgrpname <chr>,
## #   Total_Population <dbl>, Total_Households <dbl>, Total_Dwellings <dbl>,
## #   Total_Household_Spaces <dbl>, Total_Population_16_and_over <dbl>,
## #   Total_Population_16_to_74 <dbl>, Total_Pop_No_NI_Students_16_to_74 <dbl>,
## #   Total_Employment_16_to_74 <dbl>,
## #   Total_Pop_in_Housesholds_16_and_over <dbl>,
## #   Total_Population_3_and_over <dbl>, u001 <dbl>, u002 <dbl>, u003 <dbl>,
## #   u004 <dbl>, u005 <dbl>, u006 <dbl>, u007 <dbl>, u008 <dbl>, u009 <dbl>,
## #   u010 <dbl>, u011 <dbl>, u012 <dbl>, u013 <dbl>, u014 <dbl>, u015 <dbl>,
## #   u016 <dbl>, u017 <dbl>, u018 <dbl>, u019 <dbl>, u020 <dbl>, u021 <dbl>,
## #   u022 <dbl>, u023 <dbl>, u024 <dbl>, u025 <dbl>, u026 <dbl>, u027 <dbl>,
## #   u028 <dbl>, u029 <dbl>, u030 <dbl>, u031 <dbl>, u032 <dbl>, u033 <dbl>,
## #   u034 <dbl>, u035 <dbl>, u036 <dbl>, u037 <dbl>, u038 <dbl>, u039 <dbl>,
## #   u040 <dbl>, u041 <dbl>, u042 <dbl>, u043 <dbl>, u044 <dbl>, u045 <dbl>,
## #   u046 <dbl>, u047 <dbl>, u048 <dbl>, u049 <dbl>, u050 <dbl>, u051 <dbl>,
## #   u052 <dbl>, u053 <dbl>, u054 <dbl>, u055 <dbl>, u056 <dbl>, u057 <dbl>,
## #   u058 <dbl>, u059 <dbl>, u060 <dbl>, u061 <dbl>, u062 <dbl>, u063 <dbl>,
## #   u064 <dbl>, u065 <dbl>, u066 <dbl>, u067 <dbl>, u068 <dbl>, u069 <dbl>,
## #   u070 <dbl>, u071 <dbl>, u072 <dbl>, u073 <dbl>, u074 <dbl>, u075 <dbl>,
## #   u076 <dbl>, u077 <dbl>, u078 <dbl>, u079 <dbl>, u080 <dbl>, u081 <dbl>,
## #   u082 <dbl>, u083 <dbl>, u084 <dbl>, u085 <dbl>, …
```



```r
readr::read_csv(
  "2011_OAC_Raw_uVariables_Leicester.csv"
  )
```

```
## # A tibble: 969 x 190
##   OA11CD LSOA11CD LSO11ANM MSOA11CD MSOA11NM LAD11CD LAD11NM supgrpcode
##   <chr>  <chr>    <chr>    <chr>    <chr>    <chr>   <chr>        <dbl>
## 1 E0006… E010137… Leicest… E020028… Leicest… E06000… Leices…          6
## 2 E0006… E010137… Leicest… E020028… Leicest… E06000… Leices…          2
## 3 E0016… E010137… Leicest… E020028… Leicest… E06000… Leices…          4
## # … with 966 more rows, and 182 more variables: supgrpname <chr>,
## #   grpcode <chr>, grpname <chr>, subgrpcode <chr>, subgrpname <chr>,
## #   Total_Population <dbl>, Total_Households <dbl>, Total_Dwellings <dbl>,
## #   Total_Household_Spaces <dbl>, Total_Population_16_and_over <dbl>,
## #   Total_Population_16_to_74 <dbl>, Total_Pop_No_NI_Students_16_to_74 <dbl>,
## #   Total_Employment_16_to_74 <dbl>,
## #   Total_Pop_in_Housesholds_16_and_over <dbl>,
## #   Total_Population_3_and_over <dbl>, u001 <dbl>, u002 <dbl>, u003 <dbl>,
## #   u004 <dbl>, u005 <dbl>, u006 <dbl>, u007 <dbl>, u008 <dbl>, u009 <dbl>,
## #   u010 <dbl>, u011 <dbl>, u012 <dbl>, u013 <dbl>, u014 <dbl>, u015 <dbl>,
## #   u016 <dbl>, u017 <dbl>, u018 <dbl>, u019 <dbl>, u020 <dbl>, u021 <dbl>,
## #   u022 <dbl>, u023 <dbl>, u024 <dbl>, u025 <dbl>, u026 <dbl>, u027 <dbl>,
## #   u028 <dbl>, u029 <dbl>, u030 <dbl>, u031 <dbl>, u032 <dbl>, u033 <dbl>,
## #   u034 <dbl>, u035 <dbl>, u036 <dbl>, u037 <dbl>, u038 <dbl>, u039 <dbl>,
## #   u040 <dbl>, u041 <dbl>, u042 <dbl>, u043 <dbl>, u044 <dbl>, u045 <dbl>,
## #   u046 <dbl>, u047 <dbl>, u048 <dbl>, u049 <dbl>, u050 <dbl>, u051 <dbl>,
## #   u052 <dbl>, u053 <dbl>, u054 <dbl>, u055 <dbl>, u056 <dbl>, u057 <dbl>,
## #   u058 <dbl>, u059 <dbl>, u060 <dbl>, u061 <dbl>, u062 <dbl>, u063 <dbl>,
## #   u064 <dbl>, u065 <dbl>, u066 <dbl>, u067 <dbl>, u068 <dbl>, u069 <dbl>,
## #   u070 <dbl>, u071 <dbl>, u072 <dbl>, u073 <dbl>, u074 <dbl>, u075 <dbl>,
## #   u076 <dbl>, u077 <dbl>, u078 <dbl>, u079 <dbl>, u080 <dbl>, u081 <dbl>,
## #   u082 <dbl>, u083 <dbl>, u084 <dbl>, u085 <dbl>, …
```

## Write

The function `write_csv` can be used to save a dataset to `csv`

Example:

1. **read** the 2011 OAC dataset
2. **select** a few columns
3. **filter** only those OA in the supergroup *Suburbanites* (code `6`)
4. **write** the results to a file named *Leicester_Suburbanites.csv* in your home folder


```r
readr::read_csv("2011_OAC_Raw_uVariables_Leicester.csv") %>%
  dplyr::select(OA11CD, supgrpcode, supgrpname) %>%
  dplyr::filter(supgrpcode == 6) %>%
  readr::write_csv("~/Leicester_Suburbanites.csv")
```


## Other data imports

[Tidyverse](https://www.tidyverse.org/) also imports [other packages for reading data](https://www.tidyverse.org/packages/#import)

- Tabular formats
  - [`readxl`](https://readxl.tidyverse.org/) for Excel (`.xls` and `.xlsx`)
  - [`haven`](https://haven.tidyverse.org/) for SPSS, Stata, and SAS data.
- Databases
  - [`DBI`](https://cran.r-project.org/web/packages/DBI/) for relational databases
  - Specific backends require different packages, e.g. [`RPostgreSQL`](https://cran.r-project.org/web/packages/RPostgreSQL/)
- NoSQL
  - [`jsonlite`](https://cran.r-project.org/web/packages/jsonlite/) for JSON
  - [`xml2`](https://cran.r-project.org/web/packages/xml2/) for XML
- Web
  - [`httr`](https://cran.r-project.org/web/packages/httr/) for web APIs.
  - [`rvest`](https://cran.r-project.org/web/packages/rvest/) for web scraping.








## Summary

Read and write data

- file formats
- read
- write

**Next**: Practical session

- Read and write data
- Tidy data
- Join operations


