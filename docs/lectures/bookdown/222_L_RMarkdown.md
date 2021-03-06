



# RMarkdown



## Recap

**Prev**: Reproduciblity

- Reproduciblity and software engineering
- Reproduciblity in GIScience
- Guidelines

**Now**: RMarkdown

- Markdown
- RMarkdown



## Markdown

**Markdown** is a simple markup language

- allows to mark-up plain text 
- to specify more complex features (such as *italics text*)
- using a very simple [syntax](https://daringfireball.net/projects/markdown/syntax)

Markdown can be used in conjunction with numerous tools

- to produce HTML pages
- or even more complex formats (such as PDF)

These slides are written in Markdown



## Markdown example code

```
### This is a third level heading

Text can be specified as *italic* or **bold**

- and list can be created
    - very simply

1. also numbered lists
    1. [add a link like this](http://le.ac.uk)

|Tables |Can         |Be       |
|-------|------------|---------|
|a bit  |complicated |at first |
|but    |it gets     |easier   |
```



## Markdown example output

### This is a third level heading

Text can be specified as *italic* or **bold**

- and list can be created
    - very simply

1. also numbered lists
    1. [add a link like this](http://le.ac.uk)

|Tables |Can         |Be       |
|-------|------------|---------|
|a bit  |complicated |at first |
|but    |it gets     |easier   |



## RMarkdown

The [rmarkdown](https://rmarkdown.rstudio.com/docs/) library and its [RStudio plug-in](https://rmarkdown.rstudio.com/)

- provide functionalities to *compile* scripts containing
  - **Markdown** text
    - rendered to documents (e.g., *.pdf* and *.doc*)
  - chunks of **R** code (other supported, e.g., Python, SQL)
    - included in output document
    - interpreted
    - results included in output document

````
```{r, echo=TRUE}
# Example of R chunck
sqrt(2)
```
````


## RMarkdown example

Content of an RMarkdown file: `First_example.Rmd`

````
This is an **RMarkdown** document. The *code chunk* below:

- loads the necessary libraries
- loads the flights from New York City in 2013
- presents a few columns from the first row

```{r, echo=TRUE, message=FALSE, warning=FALSE}
library(tidyverse)
library(nycflights13)

nycflights13::flights %>% 
  dplyr::select(year:day, origin, dest, flight) %>%
  dplyr::slice_head(1) %>% 
  knitr::kable()
```
````


## RMarkdown example

This is an **RMarkdown** document. The *code chunk* below:

- loads the necessary libraries
- loads the flights from New York City in 2013
- presents a few columns from the first row


```r
library(tidyverse)
library(nycflights13)

nycflights13::flights %>% 
  dplyr::select(year:day, origin, dest, flight) %>%
  dplyr::slice_head(1) %>% 
  knitr::kable()
```



| year| month| day|origin |dest | flight|
|----:|-----:|---:|:------|:----|------:|
| 2013|     1|   1|EWR    |IAH  |   1545|


## The Definitive Guide

:::::: {.cols data-latex=""}
::: {.col style="width: 60%;" data-latex="{0.5\textwidth}"}

Markdown is a rather simple for a markup language, but still fairly complex, especially when used in combination with R.

For an complete guide to RMarkdown, please see:

[R Markdown:<br/>The Definitive Guide](https://bookdown.org/yihui/rmarkdown/) 

by<br/>
Yihui Xie,<br/>
J. J. Allaire,<br/>
Garrett Grolemund.

:::
::: {.col style="width: 50%; text-align: right;" data-latex="{0.5\textwidth}"}

![](https://bookdown.org/yihui/rmarkdown/images/cover.png)

:::
::::::

## Summary

RMarkdown

- Markdown
- RMarkdown

**Next**: Git and Docker

- Git operations
- Git and RStudio
- Docker


