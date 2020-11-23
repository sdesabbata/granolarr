


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





## Iris

:::::: {.cols data-latex=""}

::: {.col style="width: 80%;" data-latex="{0.5\textwidth}"}

A classic R dataset

- 3 species of iris
- 50 flowers per species
- 4 measurements
  - sepal length and width
  - petal length and width

<br/>
Fisher, R.A., 1936. The use of multiple measurements in taxonomic problems. Annals of eugenics, 7(2), pp.179-188.

:::

::: {.col style="width: 70%; text-align: right;" data-latex="{0.5\textwidth}"}

![](311_L_ComparingMeans_files/figure-epub3/unnamed-chunk-2-1.png)<!-- -->

:::
::::::



## Independent T-test

Are two group means  different?

- null hypothesis
  - there is **no difference** between the groups
- if *p-value* (significance) below threshold (e.g., `0.05` or `0.01`)
  - **group means are different**
- assumptions
    - normally distributed values in groups
    - homogeneity of variance of values in groups
      - if groups have different sizes
    - independence of groups
      - e.g. different conditions of an experiment



## Independent T-test

Independent T-test as a general linear model

**General linear model**

- observation $i$ can be predicted by a $model$ (predictors)
- accounting for some amount of error

$$outcome_i = (model) + error_i $$

**Independent T-test**

- groups is the predictor (categorical variable)
- single observation value as group mean plus error

$$outcome_i = (group\ mean) + error_i $$


## Example: Petal lengths

:::::: {.cols data-latex=""}

::: {.col style="width: 80%;" data-latex="{0.5\textwidth}"}

Are the petal lengths of *versicolor* and *virginica* different?

1. Check assumptions
    1. Indipendent groups: ok
    2. normal distribution: check using Shapiro-Wilk test
    3. homogeneity of variance: not necessary
2. Run T-test
    1. `stats::t.test`

:::

::: {.col style="width: 70%; text-align: right;" data-latex="{0.5\textwidth}"}

![](311_L_ComparingMeans_files/figure-epub3/unnamed-chunk-3-1.png)<!-- -->

:::
::::::



## Assumptions: normality

Values are normally distributed for both groups

<div class="small_r_all">


```r
iris %>% dplyr::filter(Species == "versicolor") %>% 
  dplyr::pull(Petal.Length) %>% stats::shapiro.test()
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.966, p-value = 0.1585
```

```r
iris %>% dplyr::filter(Species == "virginica") %>% 
  dplyr::pull(Petal.Length) %>% stats::shapiro.test()
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.96219, p-value = 0.1098
```

</div>



## stats::t.test

The test is significant, the group means are different

<div class="small_r_output">


```r
iris %>%
  dplyr::filter(Species %in% c("versicolor", "virginica")) %$%
  stats::t.test(Petal.Length ~ Species)
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



How to report: 

- *t*(95.57) = -12.6, *p* < .01



## ANalysis Of VAriance

ANOVA is similar to the T-tests, but more than two groups

- null hypothesis
  - there is **no difference** between the groups
- if *p-value* (significance) below threshold (e.g., `0.05` or `0.01`)
  - **group means are different**
- assumptions
    - normally distributed values in groups
        - especially if groups have different sizes
    - homogeneity of variance of values in groups
      - if groups have different sizes
    - independence of groups
      - e.g. different conditions of an experiment
      
      

## ANalysis Of VAriance

ANOVA as a general linear model

**General linear model**

- observation $i$ can be predicted by a $model$ (predictors)
- accounting for some amount of error

$$outcome_i = (model) + error_i $$

**ANOVA**

- groups is the predictor (categorical variable)
- single observation value as group mean plus error

$$outcome_i = (group\ mean) + error_i $$



## Example: Petal lengths

:::::: {.cols data-latex=""}

::: {.col style="width: 80%;" data-latex="{0.5\textwidth}"}

Are the petal lengths different between all three species?

1. Check assumptions
    1. Indipendent groups: ok
    2. normal distribution: check using Shapiro-Wilk test
    3. homogeneity of variance: not necessary
2. Run ANOVA
    1. `stats::aov`

:::

::: {.col style="width: 70%; text-align: right;" data-latex="{0.5\textwidth}"}

![](311_L_ComparingMeans_files/figure-epub3/unnamed-chunk-7-1.png)<!-- -->

:::
::::::



## Assumptions: normality

We already checked normality for *versicolor* and *virginica*.

Are values for *setosa* normally distributed?

<div class="small_r_all">


```r
iris %>% dplyr::filter(Species == "setosa") %>% 
  dplyr::pull(Petal.Length) %>% stats::shapiro.test()
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.95498, p-value = 0.05481
```

</div>

Values are normally distributed for all three groups

- although significance for *setosa* is borderline


## stats::aov

The test is significant, the group means are different

<div class="small_r_output">


```r
iris %$%
  stats::aov(Petal.Length ~ Species) %>%
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



How to report:

- *F*(2, 147) = 1180.16, *p* < .01

<!--

## Homogeneity of variance

Just double-checking...

<div class="small_r_all">


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

</div>

The test significant

- the variance in petal length is different in different species
-->


## Summary

Comparing groups

- T-test
- ANOVA

**Next**: Correlation

- Pearson’s r
- Spearman’s rho
- Kendall’s tau
- Pairs panel
- Chi-square


