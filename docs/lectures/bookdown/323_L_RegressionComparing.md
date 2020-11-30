

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
- Stepwise selection
- Validation






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
MASS::Boston %>% filter(medv < 50) %$% 
  stats::lm(medv ~ rm + nox) ->
  medv_model1

medv_model1 %>%  
  summary()
```

```
## 
## Call:
## stats::lm(formula = medv ~ rm + nox)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -15.0255  -2.8916  -0.3794   2.6363  28.2653 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  -9.1677     2.9516  -3.106  0.00201 ** 
## rm            6.9550     0.3763  18.481  < 2e-16 ***
## nox         -22.7914     2.1064 -10.820  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 5.145 on 487 degrees of freedom
## Multiple R-squared:  0.5739,	Adjusted R-squared:  0.5721 
## F-statistic:   328 on 2 and 487 DF,  p-value: < 2.2e-16
```

</div>


## Checking assumptions

<div class="small_r_all">


```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.96913, p-value = 1.222e-08
```

```
## 
## 	studentized Breusch-Pagan test
## 
## data:  .
## BP = 38.776, df = 2, p-value = 3.8e-09
```

```
## 
## 	Durbin-Watson test
## 
## data:  .
## DW = 0.80228, p-value < 2.2e-16
## alternative hypothesis: true autocorrelation is greater than 0
```

```
##       rm      nox 
## 1.116167 1.116167
```

</div>


## Model 1

No, we can't predict house prices based only on number of rooms and air quality.

- predictors are statistically significant
- but model is not robust, as it doesn't satisfy most assumptions
  - Standard residuals are NOT normally distributed
  - Standard residuals are NOT homoscedastic
  - Standard residuals are NOT independent
  - (although there is no multicollinearity)

We seem to be on the right path, but something is missing...



## stats::lm

<div class="small_r_all">


```r
MASS::Boston %>% filter(medv < 50) %$% 
  stats::lm(medv ~ rm + nox + ptratio + log(crim)) ->
  medv_model2

medv_model2 %>%  
  summary()
```

```
## 
## Call:
## stats::lm(formula = medv ~ rm + nox + ptratio + log(crim))
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -12.1957  -2.7435  -0.1094   2.2879  26.9646 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  10.4676     4.0846   2.563 0.010687 *  
## rm            5.9404     0.3421  17.366  < 2e-16 ***
## nox         -13.0203     2.9408  -4.427 1.18e-05 ***
## ptratio      -1.0344     0.1107  -9.345  < 2e-16 ***
## log(crim)    -0.5558     0.1676  -3.316 0.000983 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 4.526 on 485 degrees of freedom
## Multiple R-squared:  0.6715,	Adjusted R-squared:  0.6688 
## F-statistic: 247.9 on 4 and 485 DF,  p-value: < 2.2e-16
```

</div>

## Logarithmic transformations

- 10% change in criminality score leads to
  - $log(110/100) * b_{crim}= 0.0953 * b_{crim}$ change
  - `0.0953 * -0.5558 = 0.0529` 

<center>
![](323_L_RegressionComparing_files/figure-epub3/unnamed-chunk-6-1.png)<!-- -->
</center>



## Checking assumptions

<div class="small_r_all">


```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.95777, p-value = 1.231e-10
```

```
## 
## 	studentized Breusch-Pagan test
## 
## data:  .
## BP = 14.78, df = 4, p-value = 0.005179
```

```
## 
## 	Durbin-Watson test
## 
## data:  .
## DW = 0.99915, p-value < 2.2e-16
## alternative hypothesis: true autocorrelation is greater than 0
```

```
##        rm       nox   ptratio log(crim) 
##  1.191368  2.810505  1.302618  3.125288
```

</div>



## Model 2

No, we still can't robustly predict house prices based on number of rooms, air quality, student/teacher ratio and crime level.

- predictors are statistically significant
- but model is not robust
  - Standard residuals are NOT normally distributed
  - Standard residuals are NOT homoscedastic
  - Standard residuals are NOT independent
  - There is some sign of multicollinearity

Still possibly on the right path, not quite there yet...

Is there a difference between:

- Model1's $R^2 =$ 0.5721 and Model2's $R^2 =$ 0.6688?



## Comparing R-squared

- $R^2$
  - measure of correlation between
    - values predicted by the model (fitted values)
    - observed values for outcome variable
- Adjusted $R^2$
  - adjusts the $R^2$ depending on
    - number of cases
    - number of predictor (independent) variables
  - *"unnecessary"* variables lower the value

The model with the highest adjusted $R^2$ has the best fit



## Model difference with ANOVA

Can be used to test whether adjusted $R^2$ are signif. different

- if models are hierarchical
  - one uses all variables of the other
  - plus some additional variables
  
<div class="small_r_all">


```r
stats::anova(medv_model1, medv_model2)
```

```
## Analysis of Variance Table
## 
## Model 1: medv ~ rm + nox
## Model 2: medv ~ rm + nox + ptratio + log(crim)
##   Res.Df     RSS Df Sum of Sq      F    Pr(>F)    
## 1    487 12890.0                                  
## 2    485  9936.7  2    2953.3 72.073 < 2.2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

</div>

Still, neither model is robust



## Information criteria

- Akaike Information Criterion (**AIC**)
  - measure of model fit 
    - penalising model with more variables
  - not interpretable per-se, used to compare similar models
    - lower value, better fit
- Bayesian Information Criterion (**BIC**)
  - similar to AIC
  
<div class="small_r_all">


```r
stats::AIC(medv_model1)
```

```
## [1] 3000.763
```

```r
stats::AIC(medv_model2)
```

```
## [1] 2877.258
```

</div>


## Stepwise selection

**Stepwise selection** of predictor (independent) variables

- iteratively adding and/or removing predictors 
- to obtain best performing model

Three approaches

- forward: from no variable, iteratively add variables
- backward: from all variables, iteratively remove variables
- both (a.k.a. step-wise): 
  - from no variable
  - one step forward, add most promising variable
  - one step backward, remove any variable not improving


## MASS::stepAIC


```r
MASS::Boston %$% 
  MASS::stepAIC(
    object = 
      lm(medv ~ 1),
    scope = 
      medv ~ 
        crim + zn + indus + chas + rm + nox + age + 
        dis + rad + tax + ptratio + black + lstat,
    direction = "both",
    trace = FALSE
  ) ->
  medv_model3

medv_model3 %>%
  summary()
```


## Model 3

<div class="small_r_all">


```
## 
## Call:
## lm(formula = medv ~ lstat + rm + ptratio + dis + nox + chas + 
##     black + zn + crim + rad + tax)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -15.5984  -2.7386  -0.5046   1.7273  26.2373 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  36.341145   5.067492   7.171 2.73e-12 ***
## lstat        -0.522553   0.047424 -11.019  < 2e-16 ***
## rm            3.801579   0.406316   9.356  < 2e-16 ***
## ptratio      -0.946525   0.129066  -7.334 9.24e-13 ***
## dis          -1.492711   0.185731  -8.037 6.84e-15 ***
## nox         -17.376023   3.535243  -4.915 1.21e-06 ***
## chas          2.718716   0.854240   3.183 0.001551 ** 
## black         0.009291   0.002674   3.475 0.000557 ***
## zn            0.045845   0.013523   3.390 0.000754 ***
## crim         -0.108413   0.032779  -3.307 0.001010 ** 
## rad           0.299608   0.063402   4.726 3.00e-06 ***
## tax          -0.011778   0.003372  -3.493 0.000521 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 4.736 on 494 degrees of freedom
## Multiple R-squared:  0.7406,	Adjusted R-squared:  0.7348 
## F-statistic: 128.2 on 11 and 494 DF,  p-value: < 2.2e-16
```

</div>



## Checking assumptions

<div class="small_r_all">


```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.89904, p-value < 2.2e-16
```

```
## 
## 	studentized Breusch-Pagan test
## 
## data:  .
## BP = 59.907, df = 11, p-value = 9.647e-09
```

```
## 
## 	Durbin-Watson test
## 
## data:  .
## DW = 1.0779, p-value < 2.2e-16
## alternative hypothesis: true autocorrelation is greater than 0
```

```
##    lstat       rm  ptratio      dis      nox     chas    black 
## 2.581984 1.834806 1.757681 3.443420 3.778011 1.059819 1.341559 
##       zn     crim      rad      tax 
## 2.239229 1.789704 6.861126 7.272386
```

</div>



## Validation

Can the model be generalised?

- split data into
  - training set: used to train the model
  - test set: used to test the model

Approaches:

- Validation
  - simple split: e.g. 80% traning, 20% test
- Cross-validation
  - leave-p-out: repeated split, leaving out p cases for test
     - leave-1-out
  - k-fold: repeated split, k equal size samples
  

## caret::train

Use caret::train to cross-validate Model 3


```r
library(caret)

train(
  formula(medv_model3),
  data = MASS::Boston,                        
  trControl = trainControl(
    method = "cv", # crossvalidate
    number = 5 # folds
  ),              
  method = "lm", # regression model
  na.action = na.pass
) ->
medv_model3_crossv
```


## Crossvalidate Model 3

<div class="small_r_all">




```r
medv_model3_crossv
```

```
## Linear Regression 
## 
## 506 samples
##  11 predictor
## 
## No pre-processing
## Resampling: Cross-Validated (5 fold) 
## Summary of sample sizes: 403, 406, 405, 406, 404 
## Resampling results:
## 
##   RMSE     Rsquared  MAE     
##   4.79003  0.729601  3.332228
## 
## Tuning parameter 'intercept' was held constant at a value of TRUE
```

```r
medv_model3_crossv$resample
```

```
##       RMSE  Rsquared      MAE Resample
## 1 4.521453 0.7398752 3.190820    Fold1
## 2 5.343629 0.7144533 3.408707    Fold2
## 3 4.248468 0.8004829 2.981942    Fold3
## 4 4.780203 0.6512789 3.189664    Fold4
## 5 5.056398 0.7419147 3.890007    Fold5
```

</div>


## Summary

Comparing regression models

- Information criteria
- Model difference
- Stepwise selection
- Validation

**Next**: Practical session

- Simple regression
- Multiple regression


