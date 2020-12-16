

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



# Principal Component Analysis

## Recap

**Prev**: Comparing data

- 321 Lecture Introduction to Machine Learning
- 322 Lecture 
- 323 Lecture 
- 324 Practical session

**Now**: Principal Component Analysis

- Principal components
- `stats::prcomp`
- Dimensionality reduction






## Principal components

**Principal component** are 

- a set of directions orthogonal to each other
- that best fit a set of data

Can be interpreted as a *"re-projection"* of the data

![](411_L_PrincipalComponents_files/figure-epub3/unnamed-chunk-2-1.png)<!-- -->


## Dimensionality reduction

Alternatively, principal components can be interpreted as 

- **lower-dimensional** representation of the data

Especially useful when working numerous variables

- a limited number of principal components can be retained
  - most variance maintained
  - distance in data space approximated
  - high-dimensional data can be more easily plotted 
- commonly used as dimensionality reduction step
  - supervised learning models
    - linear regression
  - clustering
  

## stats::prcomp

Principal component analysis on body mass, flipper length, and bill length and depth

<div class="small_r_all">


```r
penguins_pca <-
  palmerpenguins::penguins %>%
  dplyr::select(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g) %>%
  # remove missing data
  dplyr::filter(
    !is.na(bill_length_mm) | !is.na(bill_depth_mm) |
    !is.na(flipper_length_mm) | !is.na(body_mass_g)
  ) %>%
  stats::prcomp(center = TRUE, scale. = TRUE) 

summary(penguins_pca)
```

```
## Importance of components:
##                           PC1    PC2     PC3     PC4
## Standard deviation     1.6594 0.8789 0.60435 0.32938
## Proportion of Variance 0.6884 0.1931 0.09131 0.02712
## Cumulative Proportion  0.6884 0.8816 0.97288 1.00000
```

</div>

The first component alone explains 0.69% of variance, and the first two together explain 0.88% of variance



## PCA results

<div class="small_r_all">


```r
penguins_with_pca <- palmerpenguins::penguins %>%
  dplyr::filter(!is.na(bill_length_mm) | !is.na(bill_depth_mm) | 
                !is.na(flipper_length_mm) | !is.na(body_mass_g)) %>%
  dplyr::bind_cols(
      penguins_pca %$% x %>% as.data.frame()
  )
```

</div>

![](411_L_PrincipalComponents_files/figure-epub3/unnamed-chunk-5-1.png)<!-- -->


## Plotting PCA


```r
library(factoextra)

penguins_pca %>% fviz_pca_biplot(label = "var")
```

![](411_L_PrincipalComponents_files/figure-epub3/unnamed-chunk-6-1.png)<!-- -->


## Summary

Principal Component Analysis

- Principal components
- `stats::prcomp`
- Interpretation

**Next**: Centroid-based clustering

- K-means
- Fuzzy c-means
- Geodemographic classification



