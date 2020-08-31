---
title: "Lecture 313"
author: "Dr Stefano De Sabbata<br/>School of Geography, Geology, and the Env.<br/><a href=\"mailto:s.desabbata@le.ac.uk\">s.desabbata&commat;le.ac.uk</a> &vert; <a href=\"https://twitter.com/maps4thought\">&commat;maps4thought</a><br/><a href=\"https://github.com/sdesabbata/GY7702\">github.com/sdesabbata/GY7702</a> licensed under <a href=\"https://www.gnu.org/licenses/gpl-3.0.html\">GNU GPL v3.0</a>"
date: "2020-08-31"
output:
  ioslides_presentation:
    template: ../Utils/IOSlides/UoL_Template.html
    logo: ../Utils/IOSlides/uol_logo.png
---





<style type="text/css">
.small_r_all pre{
  font-size: 16px;
  line-height: 18px;
}
.small_r_output pre:not(.prettyprint){
  font-size: 16px;
  line-height: 18px;
}
.verysmall_r_output pre:not(.prettyprint){
  font-size: 12px;
  line-height: 14px;
}
</style>



# Data transformations


## Recap

**Prev**: Correlation

- Pearson’s r
- Spearman’s rho
- Kendall’s tau
- Pairs plot

**Now**: Data transformations

- Z-scores
- Logarithmic transformations


## Libraries and data


```r
library(tidyverse)
library(magrittr)  
library(nycflights13)

flights_nov_20 <- nycflights13::flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay), month == 11, day ==20) 
```




## Z-scores

*Z-scores* transform the values as relative to the distribution mean and standard deviation

<div class="columns-2">


```r
flights_nov_20 %>%
  ggplot(aes(x = dep_delay)) +
  geom_histogram()
```


```r
flights_nov_20 %>%
  mutate(
    dep_delay_zscore = 
      scale(dep_delay)
  ) %>%
  ggplot(
    aes(x = dep_delay_zscore)
  ) +
  geom_histogram()
```

<br/>

<img src="313_L_DataTransformations_files/figure-html/unnamed-chunk-4-1.png" width="384" />

<img src="313_L_DataTransformations_files/figure-html/unnamed-chunk-5-1.png" width="384" />

</div>



## Log transformation

*Logarithmic* transformations (e.g., `log` and `log10`) are useful to *"un-skew"* variables, but only possible on values `> 0`

<div class="columns-2">


```r
flights_nov_20 %>%
  filter(dep_delay > 0) %>%
  ggplot(aes(x = dep_delay)) +
  geom_histogram()
```


```r
flights_nov_20 %>%
  filter(dep_delay > 0) %>%
  mutate(
    dep_delay_log = 
      log(dep_delay)
  ) %>%
  ggplot(
    aes(x = dep_delay_log)) + 
  geom_histogram()
```

<br/>

<img src="313_L_DataTransformations_files/figure-html/unnamed-chunk-8-1.png" width="384" />

<img src="313_L_DataTransformations_files/figure-html/unnamed-chunk-9-1.png" width="384" />

</div>



## Inverse hyperbolic sine


*Inverse hyperbolic sine* (`asinh`) transformations are useful to *"un-skew"* variables, similar to logarithmic transformations, work on all values

<div class="columns-2">


```r
flights_nov_20 %>%
  ggplot(aes(x = dep_delay)) +
  geom_histogram()
```


```r
flights_nov_20 %>%
  mutate(
    dep_delay_ihs = 
      asinh(dep_delay)
  ) %>%
  ggplot(
    aes(x = dep_delay_ihs)) + 
  geom_histogram()
```

<br/>

<img src="313_L_DataTransformations_files/figure-html/unnamed-chunk-12-1.png" width="384" />

<img src="313_L_DataTransformations_files/figure-html/unnamed-chunk-13-1.png" width="384" />

</div>



## Summary

Data transformations

- Z-scores
- Logarithmic transformations

**Next**: Practical session

- Comparing means
- Correlation
