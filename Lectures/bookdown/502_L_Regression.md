---
title: "Lecture 502<br/>Univariate analysis"
author: "Dr Stefano De Sabbata<br/>School of Geography, Geology, and the Env.<br/><a href=\"mailto:s.desabbata@le.ac.uk\">s.desabbata&commat;le.ac.uk</a> &vert; <a href=\"https://twitter.com/maps4thought\">&commat;maps4thought</a><br/><a href=\"https://github.com/sdesabbata/GY7702\">github.com/sdesabbata/GY7702</a> licensed under <a href=\"https://www.gnu.org/licenses/gpl-3.0.html\">GNU GPL v3.0</a>"
date: "2019-11-18"
output:
  ioslides_presentation:
    template: ../Utils/IOSlides/UoL_Template.html
    logo: ../Utils/IOSlides/uol_logo.png
---





# Recap @ 502



## Previous lectures

TODO



## Today

TODO



# Correlation



## Correlation



## Pearson’s r



## Spearman’s coefficient



## Kendall’s tau



## Pairs plot



# Data transformations


# Z-scores



## Log transformation



## Inverse hyperbolic sine



#  Regression



## Least squares



## Example


```r
library(tidyverse)
```

```
## ── Attaching packages ─────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──
```

```
## ✔ ggplot2 3.2.1     ✔ purrr   0.3.2
## ✔ tibble  2.1.3     ✔ dplyr   0.8.3
## ✔ tidyr   1.0.0     ✔ stringr 1.4.0
## ✔ readr   1.3.1     ✔ forcats 0.4.0
```

```
## ── Conflicts ────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```

```r
library(nycflights13)

nycflights13::flights %>%
  filter(month == 11, carrier == "US") %>%
  lm(dep_delay ~ arr_delay, data = .) %>%
  summary()
```

```
## 
## Call:
## lm(formula = dep_delay ~ arr_delay, data = .)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -39.980  -5.771  -0.242   5.031  77.074 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  2.24171    0.25232   8.885   <2e-16 ***
## arr_delay    0.62268    0.01182  52.674   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 10.22 on 1665 degrees of freedom
##   (32 observations deleted due to missingness)
## Multiple R-squared:  0.625,	Adjusted R-squared:  0.6247 
## F-statistic:  2775 on 1 and 1665 DF,  p-value: < 2.2e-16
```

```r
#filter(!is.na(dep_delay)) %>%
```



## Overall fit



## Parameters

Beta



## Outliers and residuals



## Influential cases



## Checking assumptions

<!--
Note from Discovering Statistics Using R by Andy Field, Jeremy Miles and Zoë Field, SAGE Publications Ltd, 2012
List all in 7.7.2.1 excluding those for multivariate
-->

## Normally distributed errors



## Homoscedasticity



## Independent errors



# Comparing means



## Independent t-test



## Reporting results



## Dependent t-test



## Reporting results



# Summary



## Summary

TODO



## Practical session

In the practical session we will see:

TODO
