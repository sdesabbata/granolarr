---
title: "Lecture 502<br/>Univariate analysis"
author: "Dr Stefano De Sabbata<br/>School of Geography, Geology, and the Env.<br/><a href=\"mailto:s.desabbata@le.ac.uk\">s.desabbata&commat;le.ac.uk</a> &vert; <a href=\"https://twitter.com/maps4thought\">&commat;maps4thought</a><br/><a href=\"https://github.com/sdesabbata/GY7702\">github.com/sdesabbata/GY7702</a> licensed under <a href=\"https://www.gnu.org/licenses/gpl-3.0.html\">GNU GPL v3.0</a>"
date: "2020-01-14"
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


# Recap @ 502



## Previous lectures

- Introduction to R
- Data types
- Data wrangling
- Reproducibility
- Exploratory analysis
    - Data visualisation
    - Descriptive statistics
    - Exploring assumptions



## This lecture

- Comparing means
    - t-test
    - ANOVA
- Correlation
    - Pearson's r
    - Spearman's rho
    - Kendall's tau
- Regression
    - univariate



# Lecture 502<br/>Comparing means



## Libraries

<div class="columns-2">

Today's libraries

- mostly working with the usual `nycflights13`
- exposition pipe `%$%` from the library `magrittr`


```r
library(tidyverse)
library(magrittr)  
library(nycflights13)
```

But let's start from a simple example from `datasets`

- 50 flowers from each of 3 species of iris

<img src="502_L_Regression_files/figure-html/unnamed-chunk-2-1.png" width="336" />

</div>



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




# Lecture 502<br/>Correlation



## Correlation

Two variables can be related in three different ways

- related
    - positively: entities with high values in one tend to have high values in the other
    - negatively: entities with high values in one tend to have low values in the other
- not related at all

**Correlation** is a standardised measure of covariance



## Example


```r
flights_nov_20 <- nycflights13::flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay), month == 11, day ==20) 
```

<center>
<img src="502_L_Regression_files/figure-html/unnamed-chunk-10-1.png" width="384" />
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

<div class="columns-2 small_r_output">

If  two variables are **normally distributed**, use **Pearson's r**



The square of the correlation value indicates the percentage of shared variance

*If they were normally distributed, but they are not* 

- 0.882 ^ 2 = 0.778
- departure and arrival delay *would* share 77.8% of variance

<br/><br/>


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

</div>



## Spearman’s rho

<div class="columns-2 small_r_output">



If  two variables are **not normally distributed**, use **Spearman’s rho**

- non-parametric
- based on rank difference

The square of the correlation value indicates the percentage of shared variance

*If few ties, but there are*

- 0.536 ^ 2 = 0.287
- departure and arrival delay *would* share 28.7% of variance



```r
flights_nov_20 %$%
  cor.test(
    dep_delay, arr_delay, 
    method = "spearman")
```

```
## Warning in cor.test.default(dep_delay, arr_delay, method = "spearman"):
## Cannot compute exact p-value with ties
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

</div>



## Kendall’s tau

<div class="columns-2 small_r_output">



If **not normally distributed** and there is a **large number of ties**, use **Kendall’s tau**

- non-parametric
- based on rank difference

The square of the correlation value indicates the percentage of shared variance

**Departure and arrival delay seem actually to share**

- 0.396 ^ 2 = 0.157
- **15.7% of variance**



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

</div>



## Pairs plot

Combines in one visualisation: histograms, scatter plots, and correlation values for a set of variables

<div class="columns-2">


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

<center>
<img src="502_L_Regression_files/figure-html/unnamed-chunk-19-1.png" width="384" />
</center>

</div>



<!--
# Lecture 502<br/>Data transformations


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

<img src="502_L_Regression_files/figure-html/unnamed-chunk-22-1.png" width="384" />

<img src="502_L_Regression_files/figure-html/unnamed-chunk-23-1.png" width="384" />

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

<img src="502_L_Regression_files/figure-html/unnamed-chunk-26-1.png" width="384" />

<img src="502_L_Regression_files/figure-html/unnamed-chunk-27-1.png" width="384" />

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

<img src="502_L_Regression_files/figure-html/unnamed-chunk-30-1.png" width="384" />

<img src="502_L_Regression_files/figure-html/unnamed-chunk-31-1.png" width="384" />

</div>
-->



# Lecture 502<br/> Regression



## Regression analysis

**Regression analysis** is a supervised machine learning approach

Predict the value of one outcome variable as

$$outcome_i = (model) + error_i $$

- one predictor variable (**simple / univariate** regression)

$$Y_i = (b_0 + b_1 * X_{i1}) + \epsilon_i $$
    
- more predictor variables (**multiple / multivariate** regression)

$$Y_i = (b_0 + b_1 * X_{i1} + b_2 * X_{i2} + \dots + b_M * X_{iM}) + \epsilon_i $$



## Least squares

<div class="columns-2">

**Least squares** is the most commonly used approach to generate a regression model

The model fits a line
    
- to minimise the squared values of the **residuals** (errors)
- that is squared difference between
    - **observed values**
    - **model**


<center>
![](Images/489px-Linear_least_squares_example2.svg.png){width=70%}

<br/>
<font size="4">	
by 	Krishnavedala<br/>
via Wikimedia Commons,<br/>CC-BY-SA-3.0
</font>
</center>

</div>

$$deviation = \sum(observed - model)^2$$



## Example

<font size="4">	
$$arr\_delay_i = (b_0 + b_1 * dep\_delay_{i1}) + \epsilon_i $$
</font>

<div class="small_r_output">


```r
delay_model <- flights_nov_20 %$% # Note %$%
  lm(arr_delay ~ dep_delay)

delay_model %>%  summary()
```

```
## 
## Call:
## lm(formula = arr_delay ~ dep_delay)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -43.906  -9.022  -1.758   8.678  57.052 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -4.96717    0.43748  -11.35   <2e-16 ***
## dep_delay    1.04229    0.01788   58.28   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 13.62 on 972 degrees of freedom
## Multiple R-squared:  0.7775,	Adjusted R-squared:  0.7773 
## F-statistic:  3397 on 1 and 972 DF,  p-value: < 2.2e-16
```

</div>



## Overall fit



The output indicates

- **p-value: < 2.2e-16**: $p<.001$ the model is significant
    - derived by comparing the calulated **F-statistic** value to F distribution 3396.74 having specified degrees of freedom (1, 972)
    - Report as: F(1, 972) = 3396.74
- **Adjusted R-squared: 0.7773**: the departure delay can account for 77.73% of the arrival delay
- **Coefficients**
    - Intercept estimate -4.9672 is significant
    - `dep_delay` (slope) estimate 1.0423 is significant



## Parameters

<font size="4">	
$$arr\_delay_i = (Intercept + Coefficient_{dep\_delay} * dep\_delay_{i1}) + \epsilon_i $$
</font>


```r
flights_nov_20 %>%
  ggplot(aes(x = dep_delay, y = arr_delay)) +
  geom_point() + coord_fixed(ratio = 1) +
  geom_abline(intercept = 4.0943, slope = 1.04229, color="red")
```

<center>
<img src="502_L_Regression_files/figure-html/unnamed-chunk-35-1.png" width="288" />
</center>


<!--
## Outliers and residuals
## Influential cases
-->



## Checking assumptions

- **Linearity**
    - the relationship is actually linear
- **Normality** of residuals
    - standard residuals are normally distributed with mean `0`
- **Homoscedasticity** of residuals
    - at each level of the predictor variable(s) the variance of the standard residuals should be the same (*homo-scedasticity*) rather than different (*hetero-scedasticity*) 
- **Independence** of residuals
    - adjacent standard residuals are not correlated
- When more than one predictor: **no multicollinearity**
    - if two or more predictor variables are used in the model, each pair of variables not correlated



## Normality

Shapiro-Wilk test for normality of standard residuals, 

- robust models: should be not significant 

<div class="columns-2">


```r
delay_model %>% 
  rstandard() %>% 
  shapiro.test()
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.98231, p-value = 1.73e-09
```

<font size="4">	
**Standard residuals are NOT normally distributed**
</font>

<center>
<img src="502_L_Regression_files/figure-html/unnamed-chunk-37-1.png" width="288" />
</center>

</div>



## Homoscedasticity

Breusch-Pagan test for homoscedasticity of standard residuals

- robust models: should be not significant

<div class="columns-2 small_r_output">


```r
library(lmtest)

delay_model %>% 
  bptest()
```

```
## 
## 	studentized Breusch-Pagan test
## 
## data:  .
## BP = 0.017316, df = 1, p-value = 0.8953
```

<font size="4">	
**Standard residuals are homoscedastic**
</font>

<img src="502_L_Regression_files/figure-html/unnamed-chunk-39-1.png" width="288" />

</div>



## Independence

Durbin-Watson test for the independence of residuals

- robust models: statistic should be close to 2 (between 1 and 3) and not significant

<div class="small_r_output">


```r
# Also part of the library lmtest
delay_model %>%
  dwtest()
```

```
## 
## 	Durbin-Watson test
## 
## data:  .
## DW = 1.8731, p-value = 0.02358
## alternative hypothesis: true autocorrelation is greater than 0
```

</div>

<font size="4">	
**Standard residuals might not be completely indipendent**

Note: the result depends on the order of the data.
</font>



# Lecture 502<br/>Summary



## Summary

- Comparing means
    - t-test
    - ANOVA
- Correlation
    - Pearson's r
    - Spearman's rho
    - Kendall's tau
- Regression
    - univariate



## Practical session

In the practical session, we will see:

- Comparing means
    - ANOVA
- Regression
    - univariate
    - multivariate



## Next lecture

- Machine Learning
    - Definition
    - Types
- Unsupervised
    - Clustering
- In GIScience
    - Geodemographic classification
