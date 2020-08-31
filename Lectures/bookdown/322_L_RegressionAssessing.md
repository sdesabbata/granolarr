---
title: "Lecture 322"
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


# Assessing regression assumptions


## Recap

**Prev**: Simple Regression

- Regression
- Ordinary Least Squares
- Fit

**Now**: Assessing regression assumptions

- Normality
- Homoscedasticity
- Independence


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


## Libraries and data


```r
library(tidyverse)
library(magrittr)  
library(nycflights13)

flights_nov_20 <- nycflights13::flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay), month == 11, day ==20) 
```


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
<img src="322_L_RegressionAssessing_files/figure-html/unnamed-chunk-4-1.png" width="288" />
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

<img src="322_L_RegressionAssessing_files/figure-html/unnamed-chunk-6-1.png" width="288" />

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




## Summary

Assessing regression assumptions

- Normality
- Homoscedasticity
- Independence

**Next**: Assessing regression assumptions

- Normality
- Homoscedasticity
- Independence
