

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



# Support vector machines

## Recap

**Prev**: Artificial Neural Networks

- Logistic regression
- Artificial neural networks
- Deep learning

**Now**: Support vector machines

- Hyperplanes
- Linear separability
- Kernels






## Classification task

Can we learn to distinguish the two species from body mass and bill depth?

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

<div class="small_r_all">


```r
penguins_to_learn <-
  palmerpenguins::penguins %>%
  dplyr::filter(
    species %in% c("Adelie", "Gentoo")
  ) %>%
  dplyr::mutate(
    species = forcats::fct_drop(species)
  ) %>%
  dplyr::filter(
    !is.na(body_mass_g) 
    | !is.na(bill_depth_mm)
  ) %>%
  dplyr::mutate(dplyr::across(
      bill_length_mm:body_mass_g,
      scale
  ))

penguins_for_training <- 
  penguins_to_learn %>% 
  slice_sample(prop = 0.8)

penguins_for_testing <- 
  penguins_to_learn %>% 
  anti_join(penguins_for_training)
```

</div>

:::

::: {.col data-latex="{0.5\textwidth}"}


<center>
![](403_L_SupportVectorMachines_files/figure-epub3/unnamed-chunk-3-1.png)<!-- -->
</center>

:::
::::::



## Support vector machines

Supervised learning approach to classification

- a series of **input** values (predictors, independent variables)
- one **output** categorical value (outcome, dependent variable)

Partition of multidimensional space

- finding boundaries (*"hyperplanes"*) 
- between homogenous groups of observations
- approach akin to
  - linear regression modelling
  - nearest neighbours approaches
  


## Nearest Neighbours (k-NN)

One of the simplest approaches to classification

Classification of a new observation:

- select `k` closest observations in multidimensional space
- new observation classified as most frequent class

<div class="small_r_all">


```r
library(class)

species_3nn <- class::knn(
    train = penguins_for_training %>% dplyr::pull(body_mass_g, bill_depth_mm),
    test = penguins_for_testing %>% dplyr::pull(body_mass_g, bill_depth_mm),
    cl = penguins_for_training %>% dplyr::pull(species),
    k = 3
  )

penguins_for_testing <- penguins_for_testing %>%
  tibble::add_column(predicted_species_3nn = species_3nn)

caret::confusionMatrix(
  penguins_for_testing %>% dplyr::pull(predicted_species_3nn),
  penguins_for_testing %>% dplyr::pull(species)
)
```

</div>

## Performance

<div class="small_r_all">


```
## Confusion Matrix and Statistics
## 
##           Reference
## Prediction Adelie Gentoo
##     Adelie     32      1
##     Gentoo      2     20
##                                           
##                Accuracy : 0.9455          
##                  95% CI : (0.8488, 0.9886)
##     No Information Rate : 0.6182          
##     P-Value [Acc > NIR] : 2.202e-08       
##                                           
##                   Kappa : 0.8855          
##                                           
##  Mcnemar's Test P-Value : 1               
##                                           
##             Sensitivity : 0.9412          
##             Specificity : 0.9524          
##          Pos Pred Value : 0.9697          
##          Neg Pred Value : 0.9091          
##              Prevalence : 0.6182          
##          Detection Rate : 0.5818          
##    Detection Prevalence : 0.6000          
##       Balanced Accuracy : 0.9468          
##                                           
##        'Positive' Class : Adelie          
## 
```

</div>


## Hyperplanes

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

If a hyperplane can be drawn between classes

  - e.g., a line in bi-dimensional space, a plane in three dimensions, etc
  - classes are linearly separable

Find maximum-margin hyperplane

- line that maximises separation between classes
- conceptually similar to regression

:::

::: {.col style="width: 90%; text-align: right;" data-latex="{0.5\textwidth}"}


<center>
![](403_L_SupportVectorMachines_files/figure-epub3/unnamed-chunk-6-1.png)<!-- -->
</center>

:::
::::::

## e1071::svm

<div class="small_r_all">


```r
library(e1071)

species_svm <- penguins_for_training %$%
  e1071::svm(
    species ~ 
      body_mass_g + bill_depth_mm, 
    kernel = "linear", 
    scale = FALSE
  )

penguins_for_testing <-
  penguins_for_testing %>%
  tibble::add_column(
    predicted_species_svn = 
      stats::predict(
        species_svm,
        penguins_for_testing %>% 
          dplyr::select(body_mass_g, bill_depth_mm)
      )
  )

caret::confusionMatrix(
  penguins_for_testing %>% 
    dplyr::pull(predicted_species_svn),
  penguins_for_testing %>% 
    dplyr::pull(species)
  )
```

</div>

## Performance

<div class="small_r_all">


```
## Confusion Matrix and Statistics
## 
##           Reference
## Prediction Adelie Gentoo
##     Adelie     34      0
##     Gentoo      0     21
##                                      
##                Accuracy : 1          
##                  95% CI : (0.9351, 1)
##     No Information Rate : 0.6182     
##     P-Value [Acc > NIR] : 3.246e-12  
##                                      
##                   Kappa : 1          
##                                      
##  Mcnemar's Test P-Value : NA         
##                                      
##             Sensitivity : 1.0000     
##             Specificity : 1.0000     
##          Pos Pred Value : 1.0000     
##          Neg Pred Value : 1.0000     
##              Prevalence : 0.6182     
##          Detection Rate : 0.6182     
##    Detection Prevalence : 0.6182     
##       Balanced Accuracy : 1.0000     
##                                      
##        'Positive' Class : Adelie     
## 
```



## Not linearly separable


:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

What if classes are *not* linearly separable?

- slack variable `C`
  - soft margin between classes
  - a *"cost"* is applied to cases beyond margins
- kernels *"trick"*
  - functions used to create additional dimensions
  - as functions of input values
    - linear, polinomial, sigmoids, Gaussian

:::

::: {.col style="width: 50%; text-align: right;" data-latex="{0.5\textwidth}"}


<center>
![](403_L_SupportVectorMachines_files/figure-epub3/unnamed-chunk-9-1.png)<!-- -->![](403_L_SupportVectorMachines_files/figure-epub3/unnamed-chunk-9-2.png)<!-- -->
</center>

:::
::::::

## e1071::svm

<div class="small_r_all">


```r
class_AB_svm <- 
  data_AB_for_training %$%
  e1071::svm(
    class_AB ~ 
      x + y, 
    kernel = "linear", 
    scale = FALSE
  )

data_AB_for_testing <-
  data_AB_for_testing %>%
  tibble::add_column(
    predicted_AB_svm = 
      stats::predict(
        class_AB_svm,
        data_AB_for_testing %>% 
          dplyr::select(x, y)
      )
  )

caret::confusionMatrix(
  data_AB_for_testing %>% 
    dplyr::pull(predicted_AB_svm),
  data_AB_for_testing %>% 
    dplyr::pull(class_AB)
  )
```

</div>

## Performance

<div class="small_r_all">


```
## Confusion Matrix and Statistics
## 
##           Reference
## Prediction  A  B
##          A 18 14
##          B  4  4
##                                           
##                Accuracy : 0.55            
##                  95% CI : (0.3849, 0.7074)
##     No Information Rate : 0.55            
##     P-Value [Acc > NIR] : 0.56505         
##                                           
##                   Kappa : 0.0426          
##                                           
##  Mcnemar's Test P-Value : 0.03389         
##                                           
##             Sensitivity : 0.8182          
##             Specificity : 0.2222          
##          Pos Pred Value : 0.5625          
##          Neg Pred Value : 0.5000          
##              Prevalence : 0.5500          
##          Detection Rate : 0.4500          
##    Detection Prevalence : 0.8000          
##       Balanced Accuracy : 0.5202          
##                                           
##        'Positive' Class : A               
## 
```

## e1071::svm

<div class="small_r_all">


```r
class_AB_svm_radial <- 
  data_AB_for_training %$%
  e1071::svm(
    class_AB ~ x + y,  
    kernel = "radial", 
    scale = FALSE,
    cost = 10
  )

data_AB_for_testing <-
  data_AB_for_testing %>%
  tibble::add_column(
    predicted_AB_svm_radial = 
      stats::predict(
        class_AB_svm_radial,
        data_AB_for_testing %>% 
          dplyr::select(x, y)
      )
  )

caret::confusionMatrix(
  data_AB_for_testing %>% 
    dplyr::pull(predicted_AB_svm_radial),
  data_AB_for_testing %>% 
    dplyr::pull(class_AB)
  )
```

</div>

## Performance

<div class="small_r_all">


```
## Confusion Matrix and Statistics
## 
##           Reference
## Prediction  A  B
##          A 22  1
##          B  0 17
##                                           
##                Accuracy : 0.975           
##                  95% CI : (0.8684, 0.9994)
##     No Information Rate : 0.55            
##     P-Value [Acc > NIR] : 1.388e-09       
##                                           
##                   Kappa : 0.9492          
##                                           
##  Mcnemar's Test P-Value : 1               
##                                           
##             Sensitivity : 1.0000          
##             Specificity : 0.9444          
##          Pos Pred Value : 0.9565          
##          Neg Pred Value : 1.0000          
##              Prevalence : 0.5500          
##          Detection Rate : 0.5500          
##    Detection Prevalence : 0.5750          
##       Balanced Accuracy : 0.9722          
##                                           
##        'Positive' Class : A               
## 
```



## Summary

Support vector machines

- Hyperplanes
- Linear separability
- Kernels

**Next**: Practical session

- Artificial neural networks
- Support vector machines



