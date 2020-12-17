

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



# Artificial Neural Networks

## Recap

**Prev**: Machine Learning

- What's Machine Learning?
- Types
- Limitations

**Now**: Artificial Neural Networks

- Logistic regression
- Artificial neural networks
- Deep learning






## Neural networks

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

Supervised learning approach simulating simplistic neurons

- Classic model with 3 sets 
    - input neurons
    - output neurons
    - hidden layer(s)
        - combines input values using **weights**
        - **activation function**
- The **traning algorithm** is used to define the best weights

:::

::: {.col data-latex="{0.5\textwidth}"}

<center>
![](images/ANN_description.png){width=70%}

<br/>
<font size="4">	
by Egm4313.s12 and Glosser.ca<br/>
via Wikimedia Commons,<br/>
CC-BY-SA-3.0
</font>
</center>

:::
::::::


## Artificial neurons

A model of the relationship between

- a series of **input** values (predictors, independent variables)
- one **output** value (outcome, dependent variable)

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

Learns 

  - one **weight** (coefficient) per input

Using 

  - an **activation function**
  - a **training algorithm**

:::

::: {.col data-latex="{0.5\textwidth}"}

<br/>

![](images/artificial_neuron.png)

:::
::::::

## Logistic regression

The most common activation function is the *logistic sigmoid*

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

$$f(x) = \frac{1}{1 + e^{-x}}$$
<br/>

That would render each neuron a **logistic regression model**

  - special case of the general linear model
  - categorical outcomes

:::

::: {.col style="width: 70%; text-align: right;" data-latex="{0.5\textwidth}"}

![](402_L_NeuralNetworks_files/figure-epub3/unnamed-chunk-2-1.png)<!-- -->

:::
::::::


## Example

Can we automatically identify the two species based on the penguins' body mass?


```r
penguins_to_learn <-
  palmerpenguins::penguins %>%
  dplyr::filter(species %in% c("Adelie", "Gentoo")) %>%
  dplyr::mutate(species = forcats::fct_drop(species)) %>%
  dplyr::filter(!is.na(body_mass_g) | !is.na(bill_depth_mm)) %>%
  dplyr::mutate(dplyr::across(bill_length_mm:body_mass_g, scale))
```


<center>
![](402_L_NeuralNetworks_files/figure-epub3/unnamed-chunk-4-1.png)<!-- -->
</center>



## Example


```r
penguins_to_learn <-
  palmerpenguins::penguins %>%
  dplyr::filter(species %in% c("Adelie", "Gentoo")) %>%
  dplyr::mutate(species = forcats::fct_drop(species)) %>%
  dplyr::filter(!is.na(body_mass_g) | !is.na(bill_depth_mm)) %>%
  dplyr::mutate(dplyr::across(bill_length_mm:body_mass_g, scale)) %>%
  dplyr::mutate(
    species_01 = dplyr::recode(species, Adelie = 0, Gentoo = 1)
  )
```


<center>
![](402_L_NeuralNetworks_files/figure-epub3/unnamed-chunk-6-1.png)<!-- -->
</center>



## Example


```r
penguins_to_learn <-
  palmerpenguins::penguins %>%
  dplyr::filter(species %in% c("Adelie", "Gentoo")) %>%
  dplyr::mutate(species = forcats::fct_drop(species)) %>%
  dplyr::filter(!is.na(body_mass_g) | !is.na(bill_depth_mm)) %>%
  dplyr::mutate(dplyr::across(bill_length_mm:body_mass_g, scale)) %>%
  dplyr::mutate(
    species_01 = dplyr::recode(species, Adelie = 0, Gentoo = 1)
  )
```


<center>
![](402_L_NeuralNetworks_files/figure-epub3/unnamed-chunk-8-1.png)<!-- -->
</center>



## stats::glm

<div class="small_r_all">


```r
sp_bm_model <- penguins_to_learn %$%
  stats::glm(species_01 ~ body_mass_g, family = binomial())

sp_bm_model %>%  
  summary()
```

```
## 
## Call:
## stats::glm(formula = species_01 ~ body_mass_g, family = binomial())
## 
## Deviance Residuals: 
##      Min        1Q    Median        3Q       Max  
## -2.17324  -0.16597  -0.02288   0.14154   2.42133  
## 
## Coefficients:
##             Estimate Std. Error z value Pr(>|z|)    
## (Intercept)  -0.5839     0.2666  -2.190   0.0285 *  
## body_mass_g   5.2072     0.7271   7.161 7.98e-13 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 376.98  on 273  degrees of freedom
## Residual deviance: 102.07  on 272  degrees of freedom
## AIC: 106.07
## 
## Number of Fisher Scoring iterations: 7
```

</div>


## Logistic regression

Assumptions

- **Linearity** of the logit
    - predictors have linear relationship with log of outcome
- When more than one predictor: **no multicollinearity**
    - if two or more predictor variables are used in the model, each pair of variables not correlated

Pseudo-R2

- Approaches to calculating model quality (power)

Adding complexity

- Multiple logistic regression: multiple predictors
- Multinomial logistic regression: several categories as outcome



## Network topology

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

Number of layers

- Single-layer network
  - effectively a logistic regression
- Multi-layer network
  - usually add one hidden layer
- Deep neural networks

<br/>
Number of nodes

:::

::: {.col style="width: 40%; text-align: right;" data-latex="{0.5\textwidth}"}

<center>
![](images/ANN_description.png)

<br/>
<font size="4">	
by Egm4313.s12 and Glosser.ca<br/>
via Wikimedia Commons,<br/>
CC-BY-SA-3.0
</font>
</center>

:::
::::::


## Defining a network

- Activation function
  - sigmoids
  - [Rectified Linear Unit (ReLU)](https://en.wikipedia.org/wiki/Rectifier_(neural_networks))
- Training algorithm
  - Stochastic Gradient Descent
  - Adam 
  - L-BFGS (quasi-Newton method)
- Training approach
  - feedforward (*"simple"* iterative training)
  - recurrent (*"short-memory"* of previous values)
  - backpropagation (of errors)


## Deep neural networks

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

Neural networks with **multiple hidden layers**

The fundamental idea is that *"deeper"* neurons allow for the encoding of more complex characteristics

<font size="4">	
**Example**: De Sabbata, S. and Liu, P. (2019). [Deep learning geodemographics with autoencoders and geographic convolution](https://www.researchgate.net/publication/334251358_Deep_learning_geodemographics_with_autoencoders_and_geographic_convolution). In proceedings of the 22nd AGILE Conference on Geographic Information Science, Limassol, Cyprus.
</font>

:::

::: {.col style="width: 140%; text-align: right;" data-latex="{0.5\textwidth}"}

<center>
![](images/Colored_deep_neural_network-01.png)

<br/>
<font size="4">	
derived from work by Glosser.ca<br/>
via Wikimedia Commons,<br/>
CC-BY-SA-3.0
</font>
</center>

:::
::::::


## Convolutional neural networks

Deep neural networks with **convolutional hidden layers**

- used very successfully on image object recognition
- convolutional hidden layers *"convolve"* the images
    - a process similar to applying smoothing filters

<center>
![](images/Typical_cnn.png){width=70%}

<br/>
<font size="4">	
by Aphex34 via Wikimedia Commons, CC-BY-SA-4.0
</font>
</center>



## neuralnet::neuralnet

<div class="small_r_all">


```r
penguins_for_training <- penguins_to_learn %>% slice_sample(prop = 0.8)

penguins_for_test <- penguins_to_learn %>% anti_join(penguins_for_training)

species_nnet <-
  neuralnet::neuralnet(
    species ~ body_mass_g + bill_length_mm + bill_depth_mm +flipper_length_mm,
    hidden = 3, data = penguins_for_training
  )

species_nnet %>%  plot(rep = "best")
```

![](402_L_NeuralNetworks_files/figure-epub3/unnamed-chunk-10-1.png)<!-- -->

</div>



## Performance

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

<div class="small_r_all">


```r
# Use the model to predict species
penguins_predicted <-
  neuralnet::compute(
    species_nnet, 
    penguins_for_test
)

# Add predicted species to table
penguins_for_test <-
  penguins_for_test %>%
  dplyr::mutate(
    predicted_species = 
      penguins_predicted %$%
      net.result %>%
      max.col %>%
      recode(
        `1` = "Adelie",
        `2` = "Gentoo"
      )
  )

# Calculate confusion matrix
caret::confusionMatrix(
  penguins_for_test %>% 
    pull(predicted_species) %>% 
    forcats::as_factor(),
  penguins_for_test %>% 
    pull(species) %>% 
    forcats::as_factor()
  )
```

</div>

:::

::: {.col data-latex="{0.5\textwidth}"}

<div class="small_r_all">


```
## Confusion Matrix and Statistics
## 
##           Reference
## Prediction Adelie Gentoo
##     Adelie     27      0
##     Gentoo      0     28
##                                      
##                Accuracy : 1          
##                  95% CI : (0.9351, 1)
##     No Information Rate : 0.5091     
##     P-Value [Acc > NIR] : < 2.2e-16  
##                                      
##                   Kappa : 1          
##                                      
##  Mcnemar's Test P-Value : NA         
##                                      
##             Sensitivity : 1.0000     
##             Specificity : 1.0000     
##          Pos Pred Value : 1.0000     
##          Neg Pred Value : 1.0000     
##              Prevalence : 0.4909     
##          Detection Rate : 0.4909     
##    Detection Prevalence : 0.4909     
##       Balanced Accuracy : 1.0000     
##                                      
##        'Positive' Class : Adelie     
## 
```

</div>

:::
::::::



## Summary

Artificial Neural Networks

- Logistic regression
- Artificial neural networks
- Deep learning

**Next**: Support vector machines

- Hyperplanes
- Linear separability
- Kernels


