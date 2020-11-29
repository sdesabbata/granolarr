

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



# Multiple Regression


## Recap

**Prev**: Simple Regression

- Regression
- Ordinary Least Squares
- Interpretation
- Checking assumptions

**Now**: Multiple Regression

- Multiple regression
- Interpretation
- Checking assumptions






## Multiple regression

**Regression analysis** is a supervised machine learning approach

Special case of the general linear model

$$outcome_i = (model) + error_i $$

Predict (estimate) value of one outcome (dependent) variable as

- one predictor (independent) variable: **simple / univariate**

$$Y_i = (b_0 + b_1 * X_{i1}) + \epsilon_i $$
    
- more predictor (independent) variables: **multiple / multivar.**

$$Y_i = (b_0 + b_1 * X_{i1} + b_2 * X_{i2} + \dots + b_M * X_{iM}) + \epsilon_i $$




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



## Boston housing

:::::: {.cols data-latex=""}

::: {.col style="width: 80%;" data-latex="{0.5\textwidth}"}

A classic R dataset

- price of houses in Boston
- in relation to: 
  - house characteristics
  - neighborhood 
  - air quality

<br/>
Harrison, D., and D. L. Rubinfeld. 1978. [Hedonic Housing Prices and the Demand for Clean Air](https://doi.org/10.1016/0095-0696(78)90006-2). Journal of Environmental Economics and Management 5 (1): 81–102.

:::

::: {.col style="width: 70%; text-align: right;" data-latex="{0.5\textwidth}"}

![](322_L_RegressionMultiple_files/figure-epub3/unnamed-chunk-2-1.png)<!-- -->

:::
::::::




## Example

Can we predict price based on number of rooms and air quality?

$$house\ value_i = (b_0 + b_1 * rooms_{i} + b_2 * NO\ conc_{i}) + \epsilon_i $$

<center>
![](322_L_RegressionMultiple_files/figure-epub3/unnamed-chunk-3-1.png)<!-- -->
</center>


## stats::lm

<div class="small_r_all">


```r
MASS::Boston %$% 
  stats::lm(medv ~ rm + nox) ->
  medv_model

medv_model %>%  
  summary()
```

```
## 
## Call:
## stats::lm(formula = medv ~ rm + nox)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -17.889  -3.287  -0.636   2.518  39.638 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -18.2059     3.3393  -5.452 7.82e-08 ***
## rm            8.1567     0.4173  19.546  < 2e-16 ***
## nox         -18.9706     2.5304  -7.497 2.97e-13 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 6.281 on 503 degrees of freedom
## Multiple R-squared:  0.5354,	Adjusted R-squared:  0.5336 
## F-statistic: 289.9 on 2 and 503 DF,  p-value: < 2.2e-16
```

</div>



## Overall fit



The output indicates

- **p-value: < 2.2e-16**: $p<.01$ the model is significant
  - derived by comparing **F-statistic** to F distribution 289.87 having specified degrees of freedom (2, 503)
  - Report as: F(2, 503) = 289.87
- **Adjusted R-squared: 0.5336**: 
  - number of rooms and air quality can account for 53.36% variation in house prices
- **Coefficients**
  - Intercept estimate -18.2059 is significant
  - `rm` (slope) estimate -18.9706 is significant
  - `nox` (slope) estimate 8.1567 is significant



## Standardised coefficients

- Indicate amount of change
  - in the outcome variable
  - per one standard deviation change in the predictor variable
- Can also be interpreted as importance of predictor


```r
medv_model %>%
  lm.beta::lm.beta()
```

```
## 
## Call:
## stats::lm(formula = medv ~ rm + nox)
## 
## Standardized Coefficients::
## (Intercept)          rm         nox 
##   0.0000000   0.6231316  -0.2390178
```



## Confindence intervals

- Coefficients' 95% confidence intervals
  - can be interpreted as interval containing true coefficient values
  - good models should result in small intervals


```r
medv_model %>%
  stats::confint()
```

```
##                 2.5 %     97.5 %
## (Intercept) -24.76666 -11.645106
## rm            7.33676   8.976551
## nox         -23.94200 -13.999233
```




## Outliers and influential cases

<div class="small_r_all">


```r
MASS::Boston %>%
  mutate(
    model_stdres = medv_model %>% stats::rstandard(),
    model_cook_dist = medv_model %>% stats::cooks.distance()
  ) ->
  boston_output

boston_output %>%
  dplyr::select(medv, model_stdres, model_cook_dist) %>%
  dplyr::filter(abs(model_stdres) > 2.58 | model_cook_dist > 1)
```

```
##    medv model_stdres model_cook_dist
## 1  50.0     2.975511      0.02911770
## 2  21.9    -2.907328      0.11856922
## 3  27.5     4.899644      0.26329818
## 4  23.1     3.511137      0.10891047
## 5  50.0     6.339016      0.12065579
## 6  50.0     4.094574      0.02308311
## 7  50.0     3.665060      0.02786674
## 8  50.0     4.699311      0.02109333
## 9  50.0     5.257825      0.03746931
## 10  7.5    -2.672594      0.01576071
```

</div>

No influential cases (Cook's distance `> 1`) but there are many outliers (7 abs std res `> 3.29`, 2% `> 2.58`)



## Checking assumptions: normality

Shapiro-Wilk test for normality of standard residuals, 

- robust models: should be **not** significant 

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}


```r
boston_output %$% 
  stats::shapiro.test(
    model_stdres
  )
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  model_stdres
## W = 0.8979, p-value < 2.2e-16
```

<font size="4">	
**Standard residuals are NOT normally distributed**
</font>

:::

::: {.col data-latex="{0.5\textwidth}"}

<center>
![](322_L_RegressionMultiple_files/figure-epub3/unnamed-chunk-10-1.png)<!-- -->
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
medv_model %>% 
  lmtest::bptest()
```

```
## 
## 	studentized Breusch-Pagan test
## 
## data:  .
## BP = 22.342, df = 2, p-value = 1.407e-05
```

<font size="4">	
**Standard residuals are NOT homoscedastic**
</font>

:::

::: {.col data-latex="{0.5\textwidth}"}

![](322_L_RegressionMultiple_files/figure-epub3/unnamed-chunk-12-1.png)<!-- -->

:::
::::::

</div>



## Checking assumptions: independence

Durbin-Watson test for the independence of residuals

- robust models: statistic should be close to 2 (advised between 1 and 3) and **not** significant

<div class="small_r_output">


```r
medv_model %>%
  lmtest::dwtest()
```

```
## 
## 	Durbin-Watson test
## 
## data:  .
## DW = 0.68451, p-value < 2.2e-16
## alternative hypothesis: true autocorrelation is greater than 0
```

</div>

<font size="4">	
**Standard residuals are NOT independent**

Note: the result depends on the order of the data.
</font>



## Checking assumpt.: multicollinearity

Checking the variance inflation factor (VIF)

- robust models should have no multicollinearity: 
  - largest VIF should be lower than 10 or the average VIF should not be greater than 1



```r
library(car)

medv_model %>%
  car::vif()
```

```
##       rm      nox 
## 1.100495 1.100495
```

<font size="4">	
**There is no multicollinearity**
</font>



## Example

No, we can't predict house prices based only on number of rooms and air quality.

- predictors are statistically significant
- but model is not robust, as it doesn't satisfy most assumptions
  - Standard residuals are NOT normally distributed
  - Standard residuals are NOT homoscedastic
  - Standard residuals are NOT independent
  - (although there is no multicollinearity)

We seem to be on the right path, but something is missing...


<!--

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
## Model 1: medv ~ rm + nox
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

-->



## Summary

Multiple Regression

- Multiple regression
- Interpretation
- Checking assumptions

**Next**: Comparing regression models

- Information criteria
- Model difference
- Systematic variable choice


