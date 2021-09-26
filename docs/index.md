---
layout: single
permalink: /
header:
  overlay_image: /assets/images/granolarr_banner_001_1920.png
  overlay_filter: 0.5
  caption: "Photo by Stefano De Sabbata"
  #actions:
  #  - label: ""
  #    url: ""
author: Stefano De Sabbata
author_profile: true
title: "granolarr"
excerpt: >
  A geographic data science<br/>reproducible teaching resource in R
toc: true
toc_label: "Table of Contents"
toc_icon: "fas fa-book-open"
toc_sticky: true
---

A new version of these materials is currently under development as [R for Geographic Data Science](https://sdesabbata.github.io/r-for-geographic-data-science/).

<img src="assets/images/granolarr_hex.png" alt="The granolarr hex sticker" align="right" width="200" style="padding: 0 15px; float: right;"/> The materials included in **granolarr** have been designed for a module focusing on the programming language R as an effective tool for data science. R is one of the most widely used programming languages, and it provides access to a vast repository of programming libraries, which cover all aspects of data science from data wrangling to statistical analysis, from machine learning to data visualisation. That includes a variety of libraries for processing spatial data, perform geographic information analysis, and create maps. As such, R is an extremely versatile, free and opensource tool in geographic information science, which combines the capabilities of traditional GIS software with the advantages of a scripting language, and an interface to a vast array of algorithms.


The materials aim to cover the necessary skills in basic programming, data wrangling and reproducible research to tackle sophisticated but non-spatial data analyses. The first part of the module will focus on core programming techniques, data wrangling and practices for reproducible research. The second part of the module will focus on non-spatial data analysis approaches, including statistical analysis and machine learning.

The [lecture slides](lectures_100) use `#EAE2DF` as background colour to avoid the use of a pure white background, which can make reading more difficult and slower for people with dyslexia. For the same reason, all foreground colours have also been checked for readability using [Colour Contrast Analyser](https://developer.paciellogroup.com/resources/contrastanalyser/). The [practical sessions materials](practicals/bookdown) can be accessed online in their [bookdwon version](practicals/bookdown), where `Seppia` and `Night` themes are available and they can be downloaded in pdf or epub format from the top menu. The practical sessions materials can also be [downloaded separately in pdf format](https://github.com/sdesabbata/granolarr/tree/master/docs/practicals/pdf) for printing.

[This work](https://github.com/sdesabbata/granolarr) is licensed under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html) except where specified. 

**Note**: This is a **revised version** of granolarr, **currently under development** to meet the University of Leicester ["Ignite"](https://le.ac.uk/ignite) approach to blended learning for the academic year 2020/2021. The first version of granolarr is still available at [granolarr_v1](https://sdesabbata.github.io/granolarr_v1/).


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

- *R for Data Science* by Garrett Grolemund and Hadley Wickham, O'Reilly Media, 2016. See [online book](https://r4ds.had.co.nz/).
- *Machine Learning with R: Expert techniques for predictive modeling* by Brett Lantz, Packt Publishing, 2019. See book [webpage](https://subscription.packtpub.com/book/big_data_and_business_intelligence/9781788295864).

Further reading

- *Programming Skills for Data Science: Start Writing Code to Wrangle, Analyze, and Visualize Data with R* by Michael Freeman and Joel Ross, Addison-Wesley, 2019. See book [webpage](https://www.pearson.com/us/higher-education/program/Freeman-Programming-Skills-for-Data-Science-Start-Writing-Code-to-Wrangle-Analyze-and-Visualize-Data-with-R/PGM2047488.html) and [repository](https://programming-for-data-science.github.io/).
- *The Art of R Programming: A Tour of Statistical Software Design* by Norman Matloff, No Starch Press, 2011. See book [webpage](https://nostarch.com/artofr.htm).
- *Discovering Statistics Using R* by Andy Field, Jeremy Miles and Zoë Field, SAGE Publications Ltd, 2012. See book [webpage](https://www.discoveringstatistics.com/books/discovering-statistics-using-r/).
- *An Introduction to Statistical Learning with Applications in R* by Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani, Springer, 2013. See book [webpage](http://faculty.marshall.usc.edu/gareth-james/ISL/).
- *Introduction to Machine Learning with R* by Scott V. Burger, O'Reilly Media, 2018. See book [webpage](https://www.oreilly.com/library/view/introduction-to-machine/9781491976432/).
- *Machine Learning with R, the tidyverse, and mlr* by Hefin I. Rhys, Manning Publications, 2020. See book [webpage](https://www.manning.com/books/machine-learning-with-r-the-tidyverse-and-mlr).
- *Deep Learning with R* by François Chollet with J. J. Allaire, Manning Publications, 2018. See book [webpage](https://www.manning.com/books/deep-learning-with-r?query=deep%20learning%20with%20r).
- *An Introduction to R for Spatial Analysis and Mapping* by Chris Brunsdon and Lex Comber, Sage, 2015. See book [webpage](https://uk.sagepub.com/en-gb/eur/an-introduction-to-r-for-spatial-analysis-and-mapping/book241031).
- *Geocomputation with R* by Robin Lovelace, Jakub Nowosad and Jannes MuenchowSee, CRC Press, 2019. See [online book](https://geocompr.robinlovelace.net/).



## Reproducibility

### Instructor

You can now reproduce granolarr using [Docker](https://www.docker.com/). First [install Docker](https://docs.docker.com/get-docker/) on your system, [install Git](https://git-scm.com/downloads) if not already installed, and [clone this repository from GitHub](https://github.com/sdesabbata/granolarr). You can then either build the sdesabbata/granolarr image running the `Docker_Build.sh` script in the root directory of the repository or simply [pull the latest sdesabbata/granolarr image from the Docker Hub](https://hub.docker.com/repository/docker/sdesabbata/granolarr).

You should now have all the code and the computational environment to reproduce these materials, which can be done by running the script `Docker_Make.sh` (`Docker_Make_WinPowerShell.sh` on Windows using PowerShell) from the repository folder. The script will instantiate a Docker container for the sdesabbata/granolarr image, bind mount the repository folder to the container and execute `Make.R` on the container, clearing and re-making all the materials. The data used in the materials can be re-created from the original open data using the scripts in `src/utils`, as described in `data/README.md`.

For instance, in a unix-based system like Linux or Mac OS, you can reproduce granolarr using the following four commands:

```{bash}
docker pull sdesabbata/granolarr:latest
git clone https://github.com/sdesabbata/granolarr.git
cd granolarr
./Docker_Make.sh
```

This approach should allow not simply to use the materials as they are, but to easily edit and create your own version in the same computational environment. To develop your own materials, simply modify the code in the repository and run the `Docker_Make.sh` from the repository folder again to obtain the updated materials. 

The [RMarkdown](https://rmarkdown.rstudio.com/) code used to create the materials for the lectures and practical sessions can be found in the `src/lectures` and `src/practicals` folders, respectively. Both folders contain one RMarkdown file per session which contains the headings necessary to create the respective html slides  (compiled to `docs/lectures/html`) and pdf documents (compiled to `docs/practicals/pdf`), whereas the main corpus of the materials can be found in the files included in the respective `contents` folders. The latter files are also used directly to generate the [Bookdown](https://bookdown.org/) version of the materials (which are compiled to `docs/lectures/bookdown` and `docs/practicals/bookdown`). The `docs` folder also contains the files used to generate the [GitHub Pages](https://pages.github.com/) website using the [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/) Jekyll theme. The `utils` folder also contains the IOSlides templates and some style classes used in the RMarkdown code.

```{bash}
.
├── DockerConfig
├── data
├── docs
│   ├── _data
│   ├── _pages
│   ├── _posts
│   ├── assets
│   │   └── images
│   ├── exercises
│   ├── lectures
│   │   ├── bookdown
│   │   └── html
│   └── practicals
│       ├── bookdown
│       └── pdf
└── src
    ├── lectures
    │   ├── contents
    │   └── images
    ├── practicals
    │   ├── contents
    │   ├── images
    │   └── materials
    └── utils
        ├── IOSlides
        └── RMarkdown
```

You can edit the materials in the `granolarr` repository folder using RStudio or another editor on your computer and then compile the new materials using Docker. Alternatively, you can follow the *learner* instructions below to start RStudio Server using Docker, and develop your materials in the same environment in which they will be compiled. The first option might be quicker for minor edits, whereas the latter option might be preferable for substantial modifications, and especially when you might need to test your code.


### Learner

As a learner, you can use [Docker](https://www.docker.com/) to follow the practical sessions instructions and complete the exercises. First [install Docker](https://docs.docker.com/get-docker/) on your system, [install Git](https://git-scm.com/downloads) if not already installed, and [clone this repository from GitHub](https://github.com/sdesabbata/granolarr). 

You can then either build the sdesabbata/granolarr image running the `Docker_Build.sh` script in the root directory of the repository or simply [pull the latest sdesabbata/granolarr image from the Docker Hub](https://hub.docker.com/repository/docker/sdesabbata/granolarr).You should now have all the code and the computational environment to reproduce these materials, which can be done by running the script `Docker_RStudio_Start.sh` (`Docker_RStudio_Start_WinPowerShell.sh` on Windows using PowerShell) from the repository folder. 


For instance, in a unix-based system like Linux or Mac OS, you can set up and start the granolarr container using the following four commands:

```{bash}
docker pull sdesabbata/granolarr:latest
git clone https://github.com/sdesabbata/granolarr.git
cd granolarr
./Docker_RStudio_Start.sh
```

The `Docker_RStudio_Start.sh` script will first create a `my_granolarr` folder in the parent directory of the root directory of the repository (if it doesn't exitst). The script will then instantiate a Docker container for the sdesabbata/granolarr image, bind mount the `my_granolarr` folder and the `granolarr` repository folder to the container and start an RStudio Server.

Using your browser, you can access the RStudio Server running from the Docker container by typing `127.0.0.1:28787` in your address bar, and using `rstudio` as username and `rstudio` as password. As the `my_granolarr` folder is binded, everything that you will save in the the `my_granolarr` folder in your home directory on RStudio Server will be saved on your computer. Everything else will be lost when the Docker container is stopped.

To stop the Docker container, running the script `Docker_RStudio_Stop.sh` (same on Windows using PowerShell) from the repository folder.





## License and acknowledgements

*[Stefano De Sabbata](https://stefanodesabbata.com)*

[This work](https://github.com/sdesabbata/granolarr) is licensed under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html) except where specified. Contains public sector information licensed under the [Open Government Licence v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence), see [`data / README.md`](https://github.com/sdesabbata/granolarr/blob/master/data/README.md). See [`src / ;ectures / images / README.md`](https://github.com/sdesabbata/granolarr/blob/master/src/lectures/images/README.md), [`src / practicals / images / README.md`](https://github.com/sdesabbata/granolarr/blob/master/src/practicals/images/README.md) and [`src / utils / IOSlides / README.md`](https://github.com/sdesabbata/granolarr/blob/master/src/utils/IOSlides/README.md) for information regarding the images used in the materials.

This repository includes teaching materials that were created by [Dr Stefano De Sabbata](https://stefanodesabbata.com) for the module [GY7702 R for Data Science](https://le.ac.uk/modules/2021/gy7702), while working at the [School of Geography, Geology, and the Environment](https://le.ac.uk/gge) of the [University of Leicester](https://le.ac.uk/). Stefano would also like to acknowledge the contributions made to parts of these materials by [Prof Chris Brunsdon](https://www.maynoothuniversity.ie/people/chris-brunsdon) and [Prof Lex Comber](https://environment.leeds.ac.uk/geography/staff/1020/professor-lex-comber) (see also [An Introduction to R for Spatial Analysis and Mapping](https://uk.sagepub.com/en-gb/eur/an-introduction-to-r-for-spatial-analysis-and-mapping/book241031), Sage, 2015), [Dr Marc Padilla](https://scholar.google.com/citations?hl=en&user=NSxM1aEAAAAJ), and [Dr Nick Tate](https://www2.le.ac.uk/departments/geography/people/njt9), who conveened previous versions of the module (GY7022) at the University of Leicester.

Files in the Data folder have been derived from data by sources such as the Office for National Statistics, Ministry of Housing, Communities & Local Government, Ofcom, and other institutions of the UK Government under the [Open Government License v3](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/) -- see linked webpage above on the [National Archives website](http://www.nationalarchives.gov.uk/) or the *LICENSE* file in this folder).

This content was created using [R](https://www.r-project.org/), [RStudio](https://www.rstudio.com/), [RMarkdown](https://rmarkdown.rstudio.com/), [Bookdown](https://bookdown.org/), and [GitHub](https://github.com/sdesabbata).