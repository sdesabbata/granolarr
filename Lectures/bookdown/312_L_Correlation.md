



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



# Correlation


## Recap

**Prev**: Comparing groups

- T-test
- ANOVA
- Chi-square

**Now**: Correlation

- Pearson’s r
- Spearman’s rho
- Kendall’s tau
- Pairs plot


## Correlation

Two variables can be related in three different ways

- related
    - positively: entities with high values in one tend to have high values in the other
    - negatively: entities with high values in one tend to have low values in the other
- not related at all

**Correlation** is a standardised measure of covariance



## Libraries and data


```r
library(tidyverse)
library(magrittr)  
library(nycflights13)

flights_nov_20 <- nycflights13::flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay), month == 11, day ==20) 
```



## Example

<center>
![](312_L_Correlation_files/figure-epub3/unnamed-chunk-2-1.png)<!-- -->
</center>


## Example

<div class="small_r_output">


```r
flights_nov_20 %>%
  pull(dep_delay) %>% shapiro.test()
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.39881, p-value < 2.2e-16
```

```r
flights_nov_20 %>%
  pull(arr_delay) %>% shapiro.test()
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.67201, p-value < 2.2e-16
```

</div>



## Pearson’s r

<div class="small_r_output">

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

If  two variables are **normally distributed**, use **Pearson's r**



The square of the correlation value indicates the percentage of shared variance

*If they were normally distributed, but they are not* 

- 0.882 ^ 2 = 0.778
- departure and arrival delay *would* share 77.8% of variance

:::

::: {.col data-latex="{0.5\textwidth}"}


```r
# note the use of %$%
#instead of %>%
flights_nov_20 %$%
  cor.test(dep_delay, arr_delay)
```

```
## 
## 	Pearson's product-moment correlation
## 
## data:  dep_delay and arr_delay
## t = 58.282, df = 972, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.8669702 0.8950078
## sample estimates:
##       cor 
## 0.8817655
```

:::
::::::

</div>



## Spearman’s rho

<div class="small_r_output">

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}



If  two variables are **not normally distributed**, use **Spearman’s rho**

- non-parametric
- based on rank difference

The square of the correlation value indicates the percentage of shared variance

*If few ties, but there are*

- 0.536 ^ 2 = 0.287
- departure and arrival delay *would* share 28.7% of variance

:::

::: {.col data-latex="{0.5\textwidth}"}


```r
flights_nov_20 %$%
  cor.test(
    dep_delay, arr_delay, 
    method = "spearman")
```

```
## Warning in cor.test.default(dep_delay, arr_delay, method = "spearman"): Cannot
## compute exact p-value with ties
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  dep_delay and arr_delay
## S = 71437522, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##       rho 
## 0.5361247
```

:::
::::::

</div>



## Kendall’s tau

<div class="small_r_output">

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}



If **not normally distributed** and there is a **large number of ties**, use **Kendall’s tau**

- non-parametric
- based on rank difference

The square of the correlation value indicates the percentage of shared variance

**Departure and arrival delay seem actually to share**

- 0.396 ^ 2 = 0.157
- **15.7% of variance**

:::

::: {.col data-latex="{0.5\textwidth}"}


```r
flights_nov_20 %$%
  cor.test(
    dep_delay, arr_delay, 
    method = "kendall")
```

```
## 
## 	Kendall's rank correlation tau
## 
## data:  dep_delay and arr_delay
## z = 17.859, p-value < 2.2e-16
## alternative hypothesis: true tau is not equal to 0
## sample estimates:
##       tau 
## 0.3956265
```

:::
::::::

</div>



## Pairs plot

Combines in one visualisation: histograms, scatter plots, and correlation values for a set of variables

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}


```r
library(psych)

flights_nov_20 %>%
  select(
    dep_delay, 
    arr_delay, 
    air_time
  ) %>%
  pairs.panels(
    method = "kendall"
  )
```

:::

::: {.col data-latex="{0.5\textwidth}"}

<center>
![](312_L_Correlation_files/figure-epub3/unnamed-chunk-11-1.png)<!-- -->
</center>

:::
::::::

</div>



## Summary

Correlation

- Pearson’s r
- Spearman’s rho
- Kendall’s tau
- Pairs plot

**Next**: Data transformations

- Z-scores
- Logarithmic transformations
