

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



# Comparing regression models


## Recap

**Prev**: Multiple Regression

- Multiple regression
- Interpretation
- Checking assumptions

**Now**: Comparing regression models

- Information criteria
- Model difference
- Systematic variable choice






## Multiple regression

**Regression analysis** is a supervised machine learning approach

Special case of the general linear model

$$outcome_i = (model) + error_i $$

Predict (estimate) value of one outcome (dependent) variable as

- one predictor (independent) variable: **simple / univariate**

$$Y_i = (b_0 + b_1 * X_{i1}) + \epsilon_i $$
    
- more predictor (independent) variables: **multiple / multivar.**

$$Y_i = (b_0 + b_1 * X_{i1} + b_2 * X_{i2} + \dots + b_M * X_{iM}) + \epsilon_i $$


## Example

Can we predict price based on number of rooms and air quality?

$$house\ value_i = (b_0 + b_1 * rooms_{i} + b_1 * NO\ conc_{i}) + \epsilon_i $$

<center>
![](323_L_RegressionComparing_files/figure-epub3/unnamed-chunk-2-1.png)<!-- -->
</center>


## stats::lm

<div class="small_r_all">


```r
MASS::Boston %$% 
  stats::lm(medv ~ nox + rm) ->
  medv_model

medv_model %>%  
  summary()
```

```
## 
## Call:
## stats::lm(formula = medv ~ nox + rm)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -17.889  -3.287  -0.636   2.518  39.638 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -18.2059     3.3393  -5.452 7.82e-08 ***
## nox         -18.9706     2.5304  -7.497 2.97e-13 ***
## rm            8.1567     0.4173  19.546  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 6.281 on 503 degrees of freedom
## Multiple R-squared:  0.5354,	Adjusted R-squared:  0.5336 
## F-statistic: 289.9 on 2 and 503 DF,  p-value: < 2.2e-16
```

</div>


## Example

No, we can't predict house prices based only on number of rooms and air quality.

- predictors are statistically significant
- but model is not robust, as it doesn't satisfy most assumptions
  - Standard residuals are NOT normally distributed
  - Standard residuals are NOT homoscedastic
  - Standard residuals are NOT independent
  - (although there is no multicollinearity)

We seem to be on the right path, but something is missing...


## Example

<div class="small_r_all">


```r
MASS::Boston %$% 
  stats::lm(medv ~ nox + rm + ptratio + crim) ->
  medv_model2

medv_model2 %>%  
  summary()
```

```
## 
## Call:
## stats::lm(formula = medv ~ nox + rm + ptratio + crim)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -13.966  -3.207  -0.563   1.881  39.588 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   6.64051    4.36496   1.521    0.129    
## nox         -13.15253    2.49470  -5.272 2.01e-07 ***
## rm            6.90415    0.40150  17.196  < 2e-16 ***
## ptratio      -1.06741    0.12943  -8.247 1.44e-15 ***
## crim         -0.13906    0.03362  -4.136 4.14e-05 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 5.724 on 501 degrees of freedom
## Multiple R-squared:  0.6157,	Adjusted R-squared:  0.6126 
## F-statistic: 200.6 on 4 and 501 DF,  p-value: < 2.2e-16
```

</div>




## Information criteria

<!--

Gareth James • Daniela Witten • Trevor Hastie Robert Tibshirani
An Introduction to Statistical Learning
with Applications in R

p213

Therefore, in theory, the model with the largest adjusted R2 will have only correct variables and no noise variables. Unlike the R2 statistic, the adjusted R2 statistic pays a price for the inclusion of unnecessary variables in the model

Cp, AIC, and BIC all have rigorous theoretical justifications that are
beyond the scope of this book. These justifications rely on asymptotic ar- guments (scenarios where the sample size n is very large). Despite its pop- ularity, and even though it is quite intuitive, the adjusted R2 is not as well motivated in statistical theory as AIC, BIC, and Cp. All of these measures are simple to use and compute. Here we have presented the formulas for AIC, BIC, and Cp in the case of a linear model fit using least squares; however, these quantities can also be defined for more general types of models.

-->


- Akaike Information Criterion (**AIC**)
  - measure of model fit 
    - penalising model with more variables
  - not interpretable per-se, used to compare similar models
    - lower value, better fit
- Bayesian Information Criterion (**BIC**)
  - similar to AIC
  
<div class="small_r_all">


```r
stats::AIC(medv_model)
```

```
## [1] 3300.55
```

```r
stats::AIC(medv_model2)
```

```
## [1] 3208.623
```

</div>


## Model difference with ANOVA

Can be used to test whether $R^2$ are significantly different

- if models are hierarchical
  - one uses all variables of the other
  - plus some additional variables
  
<div class="small_r_all">


```r
stats::anova(medv_model, medv_model2)
```

```
## Analysis of Variance Table
## 
## Model 1: medv ~ nox + rm
## Model 2: medv ~ nox + rm + ptratio + crim
##   Res.Df   RSS Df Sum of Sq     F    Pr(>F)    
## 1    503 19844                                 
## 2    501 16417  2      3427 52.29 < 2.2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

</div>


## Checking assumptions

<div class="small_r_all">


```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.8428, p-value < 2.2e-16
```

```
## 
## 	studentized Breusch-Pagan test
## 
## data:  .
## BP = 8.7909, df = 4, p-value = 0.06654
```

```
## 
## 	Durbin-Watson test
## 
## data:  .
## DW = 0.80585, p-value < 2.2e-16
## alternative hypothesis: true autocorrelation is greater than 0
```

```
##      nox       rm  ptratio     crim 
## 1.287836 1.226384 1.210074 1.288687
```

</div>


## Systematic choice

**Stepwise selection** of predictor (independent) variables

- iteratively adding and/or removing predictors 
- to obtain best performing model

Three approaches

- forward selection: from no variable, iteratively add variables
- backward selection: from all variables, iteratively remove variables
- step-wise (both) selection: 
  - from a given model
  - one step forward, add most promising variable
  - one step backward, remove any variable not improving


<!--
## Outliers and residuals
## Influential cases
-->



## Summary

Comparing regression models

- Information criteria
- Model difference
- Systematic variable choice

**Next**: Practical session

- Simple regression
- Multiple regression


