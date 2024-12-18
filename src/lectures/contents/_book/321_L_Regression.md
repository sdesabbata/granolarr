

<style type="text/css">
.small_r_all pre{
  font-size: 16px !important;
  line-height: 18px !important;
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




```r
library(tidyverse)
library(magrittr)  
library(palmerpenguins)
library(lmtest)
```


## Regression analysis

**Regression analysis** is a supervised machine learning approach

Predict the value of one outcome variable as

$$outcome_i = (model) + error_i $$

- one predictor variable (**simple / univariate** regression)

$$Y_i = (b_0 + b_1 * X_{i1}) + \epsilon_i $$
    
- more predictor variables (**multiple / multivariate** regression)

$$Y_i = (b_0 + b_1 * X_{i1} + b_2 * X_{i2} + \dots + b_M * X_{iM}) + \epsilon_i $$



## Least squares

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

**Least squares** is the most commonly used approach to generate a regression model

The model fits a line
    
- to **minimise** the squared values of the **residuals** (errors)
- that is squared difference between
    - **observed values**
    - **model**

:::

::: {.col data-latex="{0.5\textwidth}"}

<center>
![](images/489px-Linear_least_squares_example2.svg.png){width=70%}

<br/>
<font size="4">	
by 	Krishnavedala<br/>
via Wikimedia Commons,<br/>CC-BY-SA-3.0
</font>
</center>

:::
::::::

$$deviation = \sum(observed - model)^2$$


## Assumptions

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


## Example

Can we predict a penguin's body mass from flipper length?

$$body\ mass_i = (b_0 + b_1 * flipper\ length_{i}) + \epsilon_i $$

<center>
<img src="321_L_Regression_files/figure-html/unnamed-chunk-2-1.png" width="576" />
</center>


## Example

Can we predict a penguin's body mass from flipper length?

$$body\ mass_i = (b_0 + b_1 * flipper\ length_{i}) + \epsilon_i $$

<center>
<img src="321_L_Regression_files/figure-html/unnamed-chunk-3-1.png" width="576" />
</center>


## stats::lm

<div class="small_r_all">


```r
palmerpenguins::penguins %$% 
  stats::lm(body_mass_g ~ flipper_length_mm) ->
  fit_bm_fl

fit_bm_fl %>%  
  summary()
```

```
## 
## Call:
## stats::lm(formula = body_mass_g ~ flipper_length_mm)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1058.80  -259.27   -26.88   247.33  1288.69 
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)       -5780.831    305.815  -18.90   <2e-16 ***
## flipper_length_mm    49.686      1.518   32.72   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 394.3 on 340 degrees of freedom
##   (2 observations deleted due to missingness)
## Multiple R-squared:  0.759,	Adjusted R-squared:  0.7583 
## F-statistic:  1071 on 1 and 340 DF,  p-value: < 2.2e-16
```

</div>



## Overall fit



The output indicates

- **p-value: < 2.2e-16**: $p<.01$ the model is significant
  - derived by comparing **F-statistic** to F distribution 1070.74 having specified degrees of freedom (1, 340)
  - Report as: F(1, 340) = 1070.74
- **Adjusted R-squared: 0.7583**: 
  - flipper length can account for 75.83% variation in body mass
- **Coefficients**
  - Intercept estimate -5780.8314 is significant
  - `dep_delay` (slope) estimate 49.6856 is significant




## Checking assumptions: normality

Shapiro-Wilk test for normality of standard residuals, 

- robust models: should be **not** significant 

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}


```r
fit_bm_fl %>% 
  stats::rstandard() %>% 
  stats::shapiro.test()
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.99295, p-value = 0.1085
```

<font size="4">	
**Standard residuals are normally distributed!**
</font>

:::

::: {.col data-latex="{0.5\textwidth}"}

<center>
<img src="321_L_Regression_files/figure-html/unnamed-chunk-7-1.png" width="288" />
</center>

:::
::::::

</div>



## Checking assumpt.: homoscedasticity

Breusch-Pagan test for homoscedasticity of standard residuals

- robust models: should be **not** significant

<div class="small_r_output">

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}


```r
fit_bm_fl %>% 
  lmtest::bptest()
```

```
## 
## 	studentized Breusch-Pagan test
## 
## data:  .
## BP = 2.1579, df = 1, p-value = 0.1418
```

<font size="4">	
**Standard residuals are homoscedastic!**
</font>

:::

::: {.col data-latex="{0.5\textwidth}"}

<img src="321_L_Regression_files/figure-html/unnamed-chunk-9-1.png" width="288" />

:::
::::::

</div>



## Checking assumptions: independence

Durbin-Watson test for the independence of residuals

- robust models: statistic should be close to 2 (advised between 1 and 3) and **not** significant

<div class="small_r_output">


```r
fit_bm_fl %>%
  lmtest::dwtest()
```

```
## 
## 	Durbin-Watson test
## 
## data:  .
## DW = 2.1896, p-value = 0.9572
## alternative hypothesis: true autocorrelation is greater than 0
```

</div>

<font size="4">	
**Standard residuals are independent!**

Note: the result depends on the order of the data.
</font>



## Example

Yes, we can predict a penguin's body mass from flipper length!

$$body\ mass_i = (-5780.83 + 49.69 * flipper\ length_{i}) + \epsilon_i $$

<center>
<img src="321_L_Regression_files/figure-html/unnamed-chunk-11-1.png" width="576" />
</center>


## Confidence intervals

Yes, we can predict a penguin's body mass from flipper length!

$$body\ mass_i = (-5780.83 + 49.69 * flipper\ length_{i}) + \epsilon_i $$


```r
fit_bm_fl %>%
  stats::confint()
```

```
##                         2.5 %      97.5 %
## (Intercept)       -6382.35801 -5179.30471
## flipper_length_mm    46.69892    52.67221
```

| flipper length | Intercept | flipper length coefficient | body mass |
|----------------|-----------|----------------------------|-----------|
| 200            | -5780.83  | 49.69                      | 4157.17   |
| 200            | -6382.36  | 46.70                      | 2957.43   |
| 200            | -6382.36  | 52.67                      | 4152.08   |
| 200            | -5179.30  | 46.70                      | 4160.48   |
| 200            | -5179.30  | 52.67                      | 5355.14   |

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


