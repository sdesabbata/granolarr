---
title: "Lecture 321"
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



# Simple Regression


## Recap

**Prev**: Comparing data

- 311 Lecture Comparing groups
- 312 Lecture Correlation
- 313 Lecture Data transformations
- 314 Practical session

**Now**: Simple Regression

- Regression
- Ordinary Least Squares
- Fit



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
<img src="321_L_Regression_files/figure-html/unnamed-chunk-5-1.png" width="288" />
</center>


<!--
## Outliers and residuals
## Influential cases
-->



## Summary

Simple Regression

- Regression
- Ordinary Least Squares
- Fit

**Next**: Assessing regression assumptions

- Normality
- Homoscedasticity
- Independence
