---
layout: splash
permalink: /
header:
  overlay_image: /assets/images/eugenio-mazzone-6ywyo2qtaZ8-unsplash--top.png
  overlay_filter: 0.5
  caption: "Photo by [Eugenio Mazzone](https://unsplash.com/@eugi1492?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText) on [Unsplash](https://unsplash.com/?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText)"
  #actions:
  #  - label: ""
  #    url: ""
title: "granolarr"
excerpt: >
  A geoggraphic data science, reproducible<br/>teaching resource in R
---

**ANNOUNCMENT**: This is a **revised version** of granolarr, **currently under development** to meet the University of Leicester ["Ingite"](https://le.ac.uk/ignite) approach to blended learning for the academic year 2020/2021. The first version of granolarr is still available at [granolarr_v1](https://sdesabbata.github.io/granolarr_v1/).

The materials included in **granolarr** have been designed for a module focusing on the programming language R as an effective tool for data science. R is one of the most widely used programming languages, and it provides access to a vast repository of programming libraries, which cover all aspects of data science from data wrangling to statistical analysis, from machine learning to data visualisation. That includes a variety of libraries for processing spatial data, perform geographic information analysis, and create maps. As such, R is an extremely versatile, free and opensource tool in geographic information science, which combines the capabilities of traditional GIS software with the advantages of a scripting language, and an interface to a vast array of algorithms.

The materials aim to cover the necessary skills in basic programming, data wrangling and reproducible research to tackle sophisticated but non-spatial data analyses. The first part of the module will focus on core programming techniques, data wrangling and practices for reproducible research. The second part of the module will focus on non-spatial data analysis approaches, including statistical analysis and machine learning.

## Table of contents

- [Materials by topic](#materials)
- [Reference books](#reference-books)
- [Reproducibility](#reproducibility)
- [Credits and acknowledgements](#credits-and-acknowledgements)

## Materials

All the materials are available on the **[lectures pages](lectures_100)** (or the [bookdown](lectures/bookdown) version) and the **[practical sessions bookdown](practicals/bookdown)**. Links to the lecture slides and bookdown chapters for each week are listed below.

1. **R coding**
    - [100 Introduction](lectures_100)
    - [110 R programming](lectures_110)
2. **Data wrangling**
    - [200 Selection and manipulation](lectures_200)
    - [210 Table operations](lectures_210)
    - [220 Reproducibility](lectures_220)
3. **Data analysis**
    - [300 Exploratory data analysis](lectures_300)
    - [310 Comparing data](lectures_310)
    - [320 Regression models](lectures_320)
4. **Machine learning**
    - [400 Unsupervised](lectures_400)
    - [410 Supervised](lectures_410)



## Reference books

Suggested reading

- *Programming Skills for Data Science: Start Writing Code to Wrangle, Analyze, and Visualize Data with R* by Michael Freeman and Joel Ross, Addison-Wesley, 2019. See book [webpage](https://www.pearson.com/us/higher-education/program/Freeman-Programming-Skills-for-Data-Science-Start-Writing-Code-to-Wrangle-Analyze-and-Visualize-Data-with-R/PGM2047488.html) and [repository](https://programming-for-data-science.github.io/).
- *R for Data Science* by Garrett Grolemund and Hadley Wickham, O'Reilly Media, 2016. See [online book](https://r4ds.had.co.nz/).
- *Discovering Statistics Using R* by Andy Field, Jeremy Miles and Zoë Field, SAGE Publications Ltd, 2012. See book [webpage](https://www.discoveringstatistics.com/books/discovering-statistics-using-r/).
- *Machine Learning with R: Expert techniques for predictive modeling* by Brett Lantz, Packt Publishing, 2019. See book [webpage](https://subscription.packtpub.com/book/big_data_and_business_intelligence/9781788295864).

Further reading

- *The Art of R Programming: A Tour of Statistical Software Design* by Norman Matloff, No Starch Press, 2011. See book [webpage](https://nostarch.com/artofr.htm)
- *An Introduction to R for Spatial Analysis and Mapping* by Chris Brunsdon and Lex Comber, Sage, 2015. See book [webpage](https://uk.sagepub.com/en-gb/eur/an-introduction-to-r-for-spatial-analysis-and-mapping/book241031)
- *Geocomputation with R* by Robin Lovelace, Jakub Nowosad, Jannes Muenchow, CRC Press, 2019. See [online book](https://bookdown.org/robinlovelace/geocompr/).



## Reproducibility

You can now reproduce granolarr using [Docker](https://www.docker.com/). Once Docker is installed on your system, you can build the sdesabbata/granolarr image running the `Docker_Build.sh` or [download the latest sdesabbata/granolarr image from the Docker Hub](https://hub.docker.com/repository/docker/sdesabbata/granolarr). You can then [clone this repository from GitHub](https://github.com/sdesabbata/granolarr) to your system and run the script `Docker_Make.sh` from the repository folder. The script will instantiate a Docker container for the sdesabbata/granolarr image, bind mount the repository folder to the container and execute `Make.R` on the container, clearing and re-making all the materials.

For instance, in a unix-based system like Linux or Mac OS, you can reproduce granolarr using the following four commands:

```{bash}
docker pull sdesabbata/granolarr:latest
git clone https://github.com/sdesabbata/granolarr.git
cd granolarr
./Docker_Make.sh
```

This approach should allow you to not simply use the materials as they are, but to easily edit and create your own version in the same computational environment.


## Credits and acknowledgements

*[Stefano De Sabbata](https://stefanodesabbata.com)*

[This work](https://github.com/sdesabbata/granolarr) is licensed under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html) except where specified. Contains public sector information licensed under the [Open Government Licence v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence), see [`data / README.md`](https://github.com/sdesabbata/granolarr/blob/master/data/README.md). See [`src / ;ectures / images / README.md`](https://github.com/sdesabbata/granolarr/blob/master/src/lectures/images/README.md), [`src / practicals / images / README.md`](https://github.com/sdesabbata/granolarr/blob/master/src/practicals/images/README.md) and [`src / utils / IOSlides / README.md`](https://github.com/sdesabbata/granolarr/blob/master/src/utils/IOSlides/README.md) for information regarding the images used in the materials.

This repository includes teaching materials that were created by [Dr Stefano De Sabbata](https://stefanodesabbata.com) for the module [GY7702 R for Data Science](https://le.ac.uk/modules/2021/gy7702), while working at the [School of Geography, Geology, and the Environment](https://le.ac.uk/gge) of the [University of Leicester](https://le.ac.uk/). Stefano would also like to acknowledge the contributions made to parts of these materials by [Prof Chris Brunsdon](https://www.maynoothuniversity.ie/people/chris-brunsdon) and [Prof Lex Comber](https://environment.leeds.ac.uk/geography/staff/1020/professor-lex-comber) (see also [An Introduction to R for Spatial Analysis and Mapping](https://uk.sagepub.com/en-gb/eur/an-introduction-to-r-for-spatial-analysis-and-mapping/book241031), Sage, 2015), [Dr Marc Padilla](https://scholar.google.com/citations?hl=en&user=NSxM1aEAAAAJ), and [Dr Nick Tate](https://www2.le.ac.uk/departments/geography/people/njt9), who conveened previous versions of the module (GY7022) at the University of Leicester.

Files in the Data folder have been derived from data by sources such as the Office for National Statistics, Ministry of Housing, Communities & Local Government, Ofcom, and other institutions of the UK Government under the [Open Government License v3](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/) -- see linked webpage above on the [National Archives website](http://www.nationalarchives.gov.uk/) or the *LICENSE* file in this folder).

This content was created using [R](https://www.r-project.org/), [RStudio](https://www.rstudio.com/), [RMarkdown](https://rmarkdown.rstudio.com/), [Bookdown](https://bookdown.org/), and [GitHub](https://github.com/sdesabbata).