



<style type="text/css">
.small_r_all pre{
  font-size: 16px;
  line-height: 18px;
}
.small_r_all pre:not(.prettyprint){
  font-size: 16px;
  line-height: 18px;
}
.verysmall_r_all pre:not(.prettyprint){
  font-size: 12px;
  line-height: 14px;
}
.veryverysmall_r_all pre:not(.prettyprint){
  font-size: 10px;
  line-height: 10px;
}
</style>



# Correlation


## Recap

**Prev**: Comparing groups

- T-test
- ANOVA

**Now**: Correlation

- Pearson’s r
- Spearman’s rho
- Kendall’s tau
- Pairs panel
- Chi-square





## Correlation

Two continuous variables can be

- not related at all
- related
    - positively: 
      - entities with *high values* in one 
      - tend to have *high values* in the other
    - negatively: 
      - entities with *high values* in one 
      - tend to have *low values* in the other

**Correlation** is a standardised measure of covariance


## Correlation

Three different approaches

- **Pearson's r**
  - if two variables are **normally distributed**
- **Spearman’s rho**
  - if two variables are **not normally distributed**
- **Kendall’s tau**
  - if **not normally distributed** 
  - and there are a **large number of ties**



## Example

Are flipper length and body mass related in Chinstrap penguins?

<center>
![](312_L_Correlation_files/figure-epub3/unnamed-chunk-2-1.png)<!-- -->
</center>



## Pearson’s r

If  two variables are **normally distributed**, use **Pearson's r**

- null hypothesis
  - there is no relationship between the variables
- assumptions
  - variables are normally distributed

The square of the correlation value indicates the percentage of shared variance


## Assumptions: normality

Flipper length and body mass are normally distributed in Chinstrap penguins

<div class="small_r_all">


```r
palmerpenguins::penguins %>%
  dplyr::filter(species == "Chinstrap") %>%
  dplyr::pull(flipper_length_mm) %>% stats::shapiro.test()
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.98891, p-value = 0.8106
```

```r
palmerpenguins::penguins %>%
  dplyr::filter(species == "Chinstrap") %>%
  dplyr::pull(body_mass_g) %>% stats::shapiro.test()
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.98449, p-value = 0.5605
```

</div>


## stats::cor.test



- Flipper length and body mass are related
  - `p-value < 0.01`
- sharing 41.2% of variance
  - 0.642 `^ 2 =` 0.412

<div class="small_r_all">


```r
palmerpenguins::penguins %>%
  dplyr::filter(species == "Chinstrap") %$%
  stats::cor.test(flipper_length_mm, body_mass_g)
```

```
## 
## 	Pearson's product-moment correlation
## 
## data:  flipper_length_mm and body_mass_g
## t = 6.7947, df = 66, p-value = 3.748e-09
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.4759352 0.7632368
## sample estimates:
##       cor 
## 0.6415594
```

</div>


## Example

But, are flipper length and body mass related in penguins (without considering species as separated groups)?

<center>
![](312_L_Correlation_files/figure-epub3/unnamed-chunk-6-1.png)<!-- -->
</center>



## Assumptions: normality

Flipper length and body mass are not normally distributed when all penguins are taken into account as a single group

<div class="small_r_all">


```r
palmerpenguins::penguins %>%
  dplyr::pull(flipper_length_mm) %>% stats::shapiro.test()
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.95155, p-value = 3.54e-09
```

```r
palmerpenguins::penguins %>%
  dplyr::pull(body_mass_g) %>% stats::shapiro.test()
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.95921, p-value = 3.679e-08
```

</div>


## Spearman’s rho

If  two variables are **not normally distrib.**, use **Spearman’s rho**

- null hypothesis
  - there is no relationship between the variables
- non-parametric
  - uses full dataset to calculate the statistics
  - rather than estimate key parameters of distributions from data
- based on rank difference
- assumptions
  - ties are uncommon

The square of the correlation value indicates the percentage of shared variance


## stats::cor.test (method = "spearman")



- Flipper length and body mass are related
  - `p-value < 0.01`
- sharing 70.6% of variance
  - 0.84 `^ 2 =` 0.706

<div class="small_r_all">


```r
palmerpenguins::penguins %$%
  stats::cor.test(flipper_length_mm, body_mass_g, method = "spearman")
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  flipper_length_mm and body_mass_g
## S = 1066875, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##       rho 
## 0.8399741
```

</div>


## Correlation with ties

Spearman's rho

- `Cannot compute exact p-value with ties`

<div class="small_r_all">


```r
palmerpenguins::penguins %$%
  stats::cor.test(flipper_length_mm, body_mass_g, method = "spearman")
```


```r
## Warning in cor.test.default(flipper_length_mm, body_mass_g, method = "spearman"):
##  Cannot compute exact p-value with ties
```


```
## 
## 	Spearman's rank correlation rho
## 
## data:  flipper_length_mm and body_mass_g
## S = 1066875, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##       rho 
## 0.8399741
```

</div>


## Kendall’s tau

If  two variables are **not normally distributed** and there are **many ties**, use **Kendall’s tau**

- null hypothesis
  - there is no relationship between the variables
- non-parametric
- based on rank difference
- no assumptions
- less *powerful*
  - even if there is a relationship, significance might be high

The square of the correlation value indicates the percentage of shared variance


## stats::cor.test (method = "kendall")



- Flipper length and body mass are related
  - `p-value < 0.01`
- sharing 43.6% of variance
  - 0.66 `^ 2 =` 0.436

<div class="small_r_all">


```r
palmerpenguins::penguins %$%
  stats::cor.test(flipper_length_mm, body_mass_g, method = "kendall")
```

```
## 
## 	Kendall's rank correlation tau
## 
## data:  flipper_length_mm and body_mass_g
## z = 17.898, p-value < 2.2e-16
## alternative hypothesis: true tau is not equal to 0
## sample estimates:
##       tau 
## 0.6604675
```

</div>



## psych::pairs.panels

:::::: {.cols data-latex=""}

::: {.col style="width: 60%;" data-latex="{0.5\textwidth}"}

Combining: 

- histograms
- scatter plots 
- correlations

<div class="small_r_all">


```r
library(psych)

palmerpenguins::penguins %>%
  dplyr::select(
    bill_length_mm,
    bill_depth_mm,
    flipper_length_mm, 
    body_mass_g
  ) %>%
  psych::pairs.panels(
    method = "kendall",
    stars = TRUE
  )

## Signif.: 0 '***' 0.001 '**' 0.01
## 0.01 '*' 0.05 0.05 '.' 0.1 ' ' 1
```

</div>

:::

::: {.col style="width: 80%; text-align: right;" data-latex="{0.5\textwidth}"}

<center>
![](312_L_Correlation_files/figure-epub3/unnamed-chunk-16-1.png)<!-- -->

</center>

:::
::::::

</div>



## Chi-squre

How to test the correlation between two **categorical** variables?

Chi-square test:

- null hypothesis
  - there is no relationship between the variables
- non-parametric
- based on cross-tabulated expected counts
- no assumptions


```r
library(gmodels)
palmerpenguins::penguins %$%
  gmodels::CrossTable(
    island, species, chisq = TRUE, expected = TRUE, prop.c = FALSE, 
    prop.t = FALSE, prop.chisq = FALSE, sresid = TRUE, format = "SPSS")
```


## gmodels::CrossTable

There is a relationship (`p-value < 0.01`), different islands have different amounts of penguins from different species

<div class="veryverysmall_r_all">


```
## 
##    Cell Contents
## |-------------------------|
## |                   Count |
## |         Expected Values |
## |             Row Percent |
## |            Std Residual |
## |-------------------------|
## 
## Total Observations in Table:  344 
## 
##              | species 
##       island |    Adelie  | Chinstrap  |    Gentoo  | Row Total | 
## -------------|-----------|-----------|-----------|-----------|
##       Biscoe |       44  |        0  |      124  |      168  | 
##              |   74.233  |   33.209  |   60.558  |           | 
##              |   26.190% |    0.000% |   73.810% |   48.837% | 
##              |   -3.509  |   -5.763  |    8.152  |           | 
## -------------|-----------|-----------|-----------|-----------|
##        Dream |       56  |       68  |        0  |      124  | 
##              |   54.791  |   24.512  |   44.698  |           | 
##              |   45.161% |   54.839% |    0.000% |   36.047% | 
##              |    0.163  |    8.784  |   -6.686  |           | 
## -------------|-----------|-----------|-----------|-----------|
##    Torgersen |       52  |        0  |        0  |       52  | 
##              |   22.977  |   10.279  |   18.744  |           | 
##              |  100.000% |    0.000% |    0.000% |   15.116% | 
##              |    6.055  |   -3.206  |   -4.329  |           | 
## -------------|-----------|-----------|-----------|-----------|
## Column Total |      152  |       68  |      124  |      344  | 
## -------------|-----------|-----------|-----------|-----------|
## 
##  
## Statistics for All Table Factors
## 
## 
## Pearson's Chi-squared test 
## ------------------------------------------------------------
## Chi^2 =  299.5503     d.f. =  4     p =  1.354574e-63 
## 
## 
##  
##        Minimum expected frequency: 10.27907
```

</div>



## Summary

Correlation

- Pearson’s r
- Spearman’s rho
- Kendall’s tau
- Pairs plot
- Chi-square

**Next**: Data transformations

- Z-scores
- Logarithmic transformations
- Inverse hyperbolic sine transformations


