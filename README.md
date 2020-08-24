# granolarr

**GRANOLARR** is a geog**GR**aphic d**A**ta scie**N**ce, repr**O**ducib**L**e te**A**ching resou**R**ce in **R**

by *[Stefano De Sabbata](https://stefanodesabbata.com)*

[This work](https://github.com/sdesabbata/granolarr) is licensed under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html) except where specified. Contains public sector information licensed under the [Open Government Licence v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence), see [`Data / README.md`](https://github.com/sdesabbata/granolarr/blob/master/Data/README.md). See [`Lectures / Images / README.md`](https://github.com/sdesabbata/granolarr/blob/master/Lectures/Images/README.md), [`Practicals / Images / README.md`](https://github.com/sdesabbata/granolarr/blob/master/Practicals/Images/README.md) and [`Utils / IOSlides / README.md`](https://github.com/sdesabbata/granolarr/blob/master/Utils/IOSlides/README.md) for information regarding the images used in the materials.

This repository contains reproducible materials to teach geographic information and data science in R. Part of the materials are derived from the lectures and practical sessions for the module [GY7702 Practical Programming in R](https://sdesabbata.github.io/GY7702/) of the [MSc in Geographic Information Science](https://le.ac.uk/courses/geographical-information-science-msc/2019) at the [School of Geography, Geology, and the Environment](https://le.ac.uk/gge) of the [University of Leicester](https://le.ac.uk/), by [Dr Stefano De Sabbata](https://stefanodesabbata.com/).

This content was created using [R](https://www.r-project.org/), [RStudio](https://www.rstudio.com/), [RMarkdown](https://rmarkdown.rstudio.com/), [Bookdown](https://bookdown.org/), and [GitHub](https://github.com/sdesabbata).

## Table of contents

- [Materials by topic](#materials)
- [Reference books](#reference-books)
- [Reproducibility](#reproducibility)
- [Credits and acknowledgements](#credits-and-acknowledgements)

## Materials

All the materials are available through the **[lectures bookdown](Lectures/bookdown)** and **[practical sessions bookdown](Practicals/bookdown)** pages. Links to the lecture slides and bookdown chapters for each week are listed below.

**Currently under review to meet the University of Leicester ["Ingite"](https://le.ac.uk/ignite) approach to blended learning for the academic year 2020/2021.**

1. **R coding**
    - **100 Introduction**
        - 101 Lecture ([slides](Lectures/101_L_Introduction.html), [bookdown](Lectures/bookdown/about-this-module.html))
            - Introduction to R (basic types and operators)
        - 102 Lecture
            - Core concepts (variables, functions, libraries)
        - 103 Lecture
            - Tidyverse (incl. pipe operator)
        - 104 Practical session ([bookdown](Practicals/bookdown/introduction-to-r.html))
            - The R programming language
            - Interpreting values
            - Variables
            - Basic types
            - Tidyverse
            - Coding style
    - **110 R programming**
        - 111 Lecture ([slides](Lectures/102_L_DataTypes.html), [bookdown](Lectures/bookdown/recap-102.html))
            - Data types (vectors, factors, matrices, arrays, lists)
        - 112 Lecture
            - Control structures (conditional statements, loops)
        - 113 Lecutre
            - Functions
        - 114 Practical session ([bookdown](Practicals/bookdown/data-types.html))
            - Vectorss
            - Lists
            - Conditional statements
            - Loops
            - Functions
            - Scope of a variable
2. **Data wrangling**
    - **200 Selection and manipulation**
        - 201 Lecture ([slides](Lectures/201_L_DataWrangling1.html), [bookdown](Lectures/bookdown/recap-201.html))
            - Data Frames
        - 202 Lecture
            - Data selection and filtering
        - 203 Lecture
            - Data manipulation
        - 204 Practical session ([bookdown](Practicals/bookdown/data-wrangling-pt-1.html))
            - Creating R projects
            - Creating R scripts
            - Data wrangling script
    - **210 Table operations**
        - 211 Lecture ([slides](Lectures/202_L_DataWrangling2.html), [bookdown](Lectures/bookdown/recap-202.html))
            - Join operations
        - 212 Lecture
            - Table pivot
        - 213 Lecture
            - Read and write data
        - 214 Practical session ([bookdown](Practicals/bookdown/data-wrangling-pt-2.html))
            - Join operations
            - Data pivot
            - Read and write data
    - **220 Reproducibility**
        - 221 Lecture ([slides](Lectures/301_L_Reproducibility.html), [bookdown](Lectures/bookdown/recap-301.html))
            - Reproducibility
        - 222 Lecture
            - R and Markdown
        - 223 Lecture
            - Git
        - 224 Practical session ([bookdown](Practicals/bookdown/reproducibility.html))
            - Reproducibile data analysis
            - RMarkdown
            - Git
3. **Data analysis**
    - **300 Exploratory data analysis**
        - 301 Lecture ([slides](Lectures/501_L_Exploratory.html), [bookdown](Lectures/bookdown/recap-501.html))
            - Data visualisation
        - 302 Lecture
            - Descriptive statistics
        - 303 Lecture
            - Exploring assumptions
        - 304 Practical session ([bookdown](Practicals/bookdown/exploratory-analysis.html))
            - Data visualisation
            - Descriptive statistics
            - Exploring assumptions
    - **310 Comparing data** 
        - 311 Lecture ([slides](Lectures/502_L_Regression.html), [bookdown](Lectures/bookdown/recap-502.html))
            - Comparing groups
        - 312 Lecture
            - Correlation
        - 313 Lecture
            - Data transformations
        - 314 Practical session ([bookdown](Practicals/bookdown/exploratory-analysis.html))
            - Comparing means
            - Correlation
            - Chi-square
    - **320 Regression models**
        - 321 Lecture
            - Simple regression
        - 322 Lecture
            - Assessing regression assumptions
        - *323 Lecture (to do)*
            - Multiple regression
        - 324 Practical session
            - Simple regression
            - Testing assumptions
            - Multiple regression
4. **Machine learning**
    - **400 Unsupervised**
        - 401 Lecture ([slides](Lectures/601_L_Unsupervised.html), [bookdown](Lectures/bookdown/recap-601.html))
            - Introduction to Machine Learning
        - 402 Lecture
            - Clustering
        - 403 Lecture
            - Geodemographics
        - *404 Practical session ([bookdown](Practicals/bookdown/exploratory-analysis.html)) (to do)*
            - Geodemographic classification
    - **410 Supervised**
        - *411 Lecture (to do)*
            - K-nearest neighbors
        - *412 Lecture (to do)*
            - Support vector machines
        - *413 Lecture (to do)*
            - Deep learning
        - *414 Practical session (to do)*
            - Support vector machines



## Reference books

Suggested reading

- *Programming Skills for Data Science: Start Writing Code to Wrangle, Analyze, and Visualize Data with R* by Michael Freeman and Joel Ross, Addison-Wesley, 2019. See book [webpage](https://www.pearson.com/us/higher-education/program/Freeman-Programming-Skills-for-Data-Science-Start-Writing-Code-to-Wrangle-Analyze-and-Visualize-Data-with-R/PGM2047488.html) and [repository](https://programming-for-data-science.github.io/).
- *Machine Learning with R: Expert techniques for predictive modeling* by Brett Lantz, Packt Publishing, 2019. See book [webpage](https://subscription.packtpub.com/book/big_data_and_business_intelligence/9781788295864).

Further reading

- *The Art of R Programming: A Tour of Statistical Software Design* by Norman Matloff, No Starch Press, 2011. See book [webpage](https://nostarch.com/artofr.htm)
- *Discovering Statistics Using R* by Andy Field, Jeremy Miles and Zoë Field, SAGE Publications Ltd, 2012. See book [webpage](https://www.discoveringstatistics.com/books/discovering-statistics-using-r/).
- *R for Data Science* by Garrett Grolemund and Hadley Wickham, O'Reilly Media, 2016. See [online book](https://r4ds.had.co.nz/).
- *An Introduction to R for Spatial Analysis and Mapping* by Chris Brunsdon and Lex Comber, Sage, 2015. See book [webpage](https://uk.sagepub.com/en-gb/eur/an-introduction-to-r-for-spatial-analysis-and-mapping/book241031)



## Reproducibility

To reproduce these materials:

- install [R](https://www.r-project.org/), [RStudio](https://rstudio.com/products/rstudio/download/) and [Git](https://git-scm.com/downloads)
- install the following R libraries
    - `tidyverse`, `magrittr`
    - `knitr`, `stargazer`
    - `nycflights13`
    - `pastecs`, `car`, `psych`, `lmtest`, `lm.beta`
    - `e1071`, `dbscan`
    - `sp`, `rgdal`, `tmap`
- install [tinytex](https://yihui.org/tinytex/r/)
- clone this repository as an RStudio project
    - open RStudio
    - make sure Git is correctly set up in `Tools > Global Options... > Git/SVN`
    - make sure that the selected option for `Typeset LaTeX into PDF using` is `XeLaTeX` in `Tools > Global Options... > Sweave` (practicals are also compiled locally as PDF files)
    - select `File > New Project...`, then`Version Control` and finally `Git`
    - copy `https://github.com/sdesabbata/granolarr.git` in the `Repository URL` field, select a folder for the field `Create project as subdirectory of` and click on `Create Project`
- execute `Make.R`


## Credits and acknowledgements

*[Stefano De Sabbata](https://stefanodesabbata.com)*

[This work](https://github.com/sdesabbata/GY7702) is licensed under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html).

This repository includes teaching materials that were created by [Dr Stefano De Sabbata](https://stefanodesabbata.com) for the module [GY7702 Practical Programming in R](https://le.ac.uk/modules/2019/gy7702), while working at the [School of Geography, Geology, and the Environment](https://le.ac.uk/gge) of the [University of Leicester](https://le.ac.uk/). Stefano would also like to acknowledge the contributions made to parts of these materials by [Prof Chris Brunsdon](https://www.maynoothuniversity.ie/people/chris-brunsdon) and [Prof Lex Comber](https://environment.leeds.ac.uk/geography/staff/1020/professor-lex-comber) (see also [An Introduction to R for Spatial Analysis and Mapping](https://uk.sagepub.com/en-gb/eur/an-introduction-to-r-for-spatial-analysis-and-mapping/book241031), Sage, 2015), [Dr Marc Padilla](https://scholar.google.com/citations?hl=en&user=NSxM1aEAAAAJ), and [Dr Nick Tate](https://www2.le.ac.uk/departments/geography/people/njt9), who conveened previous versions of the module (GY7022) at the University of Leicester.

Files in the Data folder have been derived from data by sources such as the Office for National Statistics, Ministry of Housing, Communities & Local Government, Ofcom, and other institutions of the UK Government under the [Open Government License v3](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/) -- see linked webpage above on the [National Archives website](http://www.nationalarchives.gov.uk/) or the *LICENSE* file in this folder).