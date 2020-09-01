---
title: "Lecture materials | granolarr"
author: "Stefano De Sabbata"
date: "2020-09-01"
description: "Geographic data science reproducible teaching resource in R, Lecture materials"
url: 'https://sdesabbata.github.io/granolarr/'
github-repo: "sdesabbata/granolarr"
site: bookdown::bookdown_site
documentclass: book
biblio-style: apalike
output:
  bookdown::gitbook:
    config:
      toc:
        before: |
          <li><a href="...">Lectures | granolarr</a></li>
        after: |
          <li><a href="https://sdesabbata.github.io/granolarr/">granolarr</a></li>
      search: yes
      download: ["pdf", "epub"]
  bookdown::pdf_book:
    latex_engine: xelatex
    includes:
      in_header: ../../Utils/RMarkdown/rmarkdown_classes.tex
---

# Preface {-}

*[Stefano De Sabbata](https://stefanodesabbata.com)*

[This work](https://github.com/sdesabbata/GY7702) is licensed under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html). Contains public sector information licensed under the [Open Government Licence v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence).

This book contains the *lectures* component of [granolarr](https://github.com/sdesabbata/granolarr), a repository of reproducible materials to teach geographic information and data science in R. Part of the materials are derived from the lectures for the module [GY7702 Practical Programming in R](https://sdesabbata.github.io/GY7702/) of the [MSc in Geographic Information Science](https://le.ac.uk/courses/geographical-information-science-msc/2019) at the [School of Geography, Geology, and the Environment](https://le.ac.uk/gge) of the [University of Leicester](https://le.ac.uk/), by [Dr Stefano De Sabbata](https://stefanodesabbata.com/).

This book was created using [R](https://www.r-project.org/), [RStudio](https://www.rstudio.com/), [RMarkdown](https://rmarkdown.rstudio.com/), [Bookdown](https://bookdown.org/), and [GitHub](https://github.com/sdesabbata).



## Session info {-}

```r
sessionInfo()
```

```
## R version 4.0.1 (2020-06-06)
## Platform: x86_64-apple-darwin17.0 (64-bit)
## Running under: macOS Mojave 10.14.6
## 
## Matrix products: default
## BLAS:   /Library/Frameworks/R.framework/Versions/4.0/Resources/lib/libRblas.dylib
## LAPACK: /Library/Frameworks/R.framework/Versions/4.0/Resources/lib/libRlapack.dylib
## 
## locale:
## [1] en_GB.UTF-8/en_GB.UTF-8/en_GB.UTF-8/C/en_GB.UTF-8/en_GB.UTF-8
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## loaded via a namespace (and not attached):
##  [1] compiler_4.0.1  magrittr_1.5    bookdown_0.20   htmltools_0.5.0
##  [5] tools_4.0.1     yaml_2.2.1      stringi_1.4.6   rmarkdown_2.3  
##  [9] knitr_1.29      stringr_1.4.0   digest_0.6.25   xfun_0.15      
## [13] rlang_0.4.7     evaluate_0.14
```
