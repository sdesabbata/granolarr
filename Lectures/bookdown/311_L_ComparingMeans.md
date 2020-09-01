


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



# Comparing groups


## Recap

**Prev**: Exploratory data analysis

- 301 Lecture Data visualisation
- 302 Lecture Descriptive statistics
- 303 Lecture Exploring assumptions
- 304 Practical session

**Now**: Comparing groups

- T-test
- ANOVA
- Chi-square


## Libraries

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

Today's libraries

- mostly working with the usual `nycflights13`
- exposition pipe `%$%` from the library `magrittr`


```r
library(tidyverse)
library(magrittr)  
library(nycflights13)
```

:::

::: {.col data-latex="{0.5\textwidth}"}

But let's start from a simple example from `datasets`

- 50 flowers from each of 3 species of iris

![](311_L_ComparingMeans_files/figure-epub3/unnamed-chunk-2-1.png)<!-- -->

:::
::::::



## Example

<div class="small_r_all">


```r
iris %>% filter(Species == "setosa") %>% pull(Petal.Length) %>% shapiro.test()
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.95498, p-value = 0.05481
```

```r
iris %>% filter(Species == "versicolor") %>% pull(Petal.Length) %>% shapiro.test()
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.966, p-value = 0.1585
```

```r
iris %>% filter(Species == "virginica") %>% pull(Petal.Length) %>% shapiro.test()
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.96219, p-value = 0.1098
```

</div>



## T-test

Independent T-test tests whether two group means are different

$$outcome_i = (group\ mean) + error_i $$

- groups defined by a predictor, categorical variable
- outcome is a continuous variable
- assuming
    - normally distributed values in groups
    - homogeneity of variance of values in groups
        - if groups have different sizes
    - independence of groups



## Example

Values are normally distributed, groups have same size, and they are independent (different flowers, check using `leveneTest`)

<div class="small_r_output">


```r
iris %>%
  filter(Species %in% c("versicolor", "virginica")) %$% # Note %$%
  t.test(Petal.Length ~ Species)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  Petal.Length by Species
## t = -12.604, df = 95.57, p-value < 2.2e-16
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -1.49549 -1.08851
## sample estimates:
## mean in group versicolor  mean in group virginica 
##                    4.260                    5.552
```

</div>



The difference is significant t(95.57) = -12.6, *p* < .01



## ANOVA

ANOVA (analysis of variance) tests whether more than two group means are different

$$outcome_i = (group\ mean) + error_i $$

- groups defined by a predictor, categorical variable
- outcome is a continuous variable
- assuming
    - normally distributed values in groups
        - especially if groups have different sizes
    - homogeneity of variance of values in groups
        - if groups have different sizes
    - independence of groups



## Example

Values are normally distributed, groups have same size, they are independent (different flowers, check using `leveneTest`)

<div class="small_r_output">

<!--

```r
library(car)

iris %$%
leveneTest(Petal.Length, Species)
```

```
## Levene's Test for Homogeneity of Variance (center = median)
##        Df F value    Pr(>F)    
## group   2   19.48 3.129e-08 ***
##       147                      
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```
-->


```r
iris %$%
  aov(Petal.Length ~ Species) %>%
  summary()
```

```
##              Df Sum Sq Mean Sq F value Pr(>F)    
## Species       2  437.1  218.55    1180 <2e-16 ***
## Residuals   147   27.2    0.19                   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

</div>



The difference is significant t(2, 147) = 1180.16, *p* < .01


## Summary

Comparing groups

- T-test
- ANOVA
- Chi-square

**Next**: Correlation

- Pearson’s r
- Spearman’s rho
- Kendall’s tau
- Pairs plot

- 
