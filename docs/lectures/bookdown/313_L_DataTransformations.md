



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



# Data transformations


## Recap

**Prev**: Correlation

- Pearson’s r
- Spearman’s rho
- Kendall’s tau
- Pairs panel
- Chi-square

**Now**: Data transformations

- Z-scores
- Logarithmic transformations
- Inverse hyperbolic sine transformations







## Z-scores

Transform the values as relative to

- the distribution's mean 
- and standard deviation

- the z-score of a value i-th $x_i$ is calculated as below, where
  - $\mu$ is the distribution's mean
  - $\sigma$ is the distribution's standard deviation

$$
z_i = \frac{x_i - \mu}{\sigma} 
$$

Commonly used to render two variables easier to compare



## Example

Distribution of flipper lengths in Palmer's penguins


```r
palmerpenguins::penguins %>%
  ggplot(aes(x = flipper_length_mm)) +
  geom_histogram() + theme_bw()
```

![](313_L_DataTransformations_files/figure-epub3/unnamed-chunk-2-1.png)<!-- -->


## base::scale

Distribution of **zscores** derived from flipper lengths


```r
palmerpenguins::penguins %>%
  mutate(flipper_length_zscore = scale(flipper_length_mm)) %>%
  ggplot(aes(x = flipper_length_zscore)) +
  geom_histogram() + theme_bw()
```

![](313_L_DataTransformations_files/figure-epub3/unnamed-chunk-3-1.png)<!-- -->



## base::scale

Distribution of **zscores** derived from body mass


```r
palmerpenguins::penguins %>%
  mutate(body_mass_g_zscore = scale(body_mass_g)) %>%
  ggplot(aes(x = body_mass_g_zscore)) +
  geom_histogram() + theme_bw()
```

![](313_L_DataTransformations_files/figure-epub3/unnamed-chunk-4-1.png)<!-- -->



## Comparison

But, are flipper length and body mass related in penguins (without considering species as separated groups)?

<center>
![](313_L_DataTransformations_files/figure-epub3/unnamed-chunk-5-1.png)<!-- -->
</center>



## Log transformation

**Logarithmic** transformations are useful to *"un-skew"* variables

Common approaches include:

- natural logarithm (`log`)
- binary logarithm (`log2`)
- logarithm base 10 (`log10`)

Only possible on values `> 0`

<img src="313_L_DataTransformations_files/figure-epub3/unnamed-chunk-6-1.png" style="display: block; margin: auto;" />


## Example

:::::: {.cols data-latex=""}

::: {.col style="width: 80%;" data-latex="{0.5\textwidth}"}

The number of residents aged 20 to 24 (`u011`) in the areas of Leicester described as *"Cosmopolitans"* by the [2011 Output Area Classification](https://www.gov.uk/government/statistics/2011-area-classification-for-super-output-areas) is skewed

:::

::: {.col style="width: 80%; text-align: right;" data-latex="{0.5\textwidth}"}

![](313_L_DataTransformations_files/figure-epub3/unnamed-chunk-7-1.png)<!-- -->

:::

::::::


|           |  u011|
|:----------|-----:|
|skewness   | 1.521|
|skew.2SE   | 2.879|
|kurtosis   | 2.089|
|kurt.2SE   | 1.999|
|normtest.W | 0.847|
|normtest.p | 0.000|


## Example

:::::: {.cols data-latex=""}

::: {.col style="width: 80%;" data-latex="{0.5\textwidth}"}

However, it's logarithm base 10 is normally distributed, thus it can be used with tests requiring normally distributed values


```r
mutate(log10_u011 = log10(u011))
```

:::

::: {.col style="width: 80%; text-align: right;" data-latex="{0.5\textwidth}"}

![](313_L_DataTransformations_files/figure-epub3/unnamed-chunk-10-1.png)<!-- -->

:::

::::::


|           | log10_u011|
|:----------|----------:|
|skewness   |     -0.504|
|skew.2SE   |     -0.953|
|kurtosis   |      0.872|
|kurt.2SE   |      0.834|
|normtest.W |      0.976|
|normtest.p |      0.118|



## Inverse hyperbolic sine

**Inverse hyperbolic sine** transformations are useful to *"un-skew"* variables

- similar to logarithmic transformations
- defined on all values
- in R: `asinh`

<img src="313_L_DataTransformations_files/figure-epub3/unnamed-chunk-12-1.png" style="display: block; margin: auto;" />


## Example

:::::: {.cols data-latex=""}

::: {.col style="width: 80%;" data-latex="{0.5\textwidth}"}

The Inverse hyperbolic sine is also normally distributed


```r
mutate(ihs_u011 = asinh(u011))
```

:::

::: {.col style="width: 80%; text-align: right;" data-latex="{0.5\textwidth}"}

![](313_L_DataTransformations_files/figure-epub3/unnamed-chunk-14-1.png)<!-- -->

:::

::::::


|           | log10_u011|
|:----------|----------:|
|skewness   |     -0.504|
|skew.2SE   |     -0.953|
|kurtosis   |      0.872|
|kurt.2SE   |      0.834|
|normtest.W |      0.976|
|normtest.p |      0.118|



## Example

Logarithmic transformation can't be applied to arrival delays in the New York City 2013 flights dataset

- skewed towards left
- but there are values lower or equal to zero


![](313_L_DataTransformations_files/figure-epub3/unnamed-chunk-16-1.png)<!-- -->



## Example

:::::: {.cols data-latex=""}

::: {.col style="width: 80%;" data-latex="{0.5\textwidth}"}

*Inverse hyperbolic sine* can still be applied. Here it partially unskews the distribution


```r
mutate(
  dep_delay_ihs = 
    asinh(dep_delay)
)
```

:::

::: {.col style="width: 80%; text-align: right;" data-latex="{0.5\textwidth}"}

![](313_L_DataTransformations_files/figure-epub3/unnamed-chunk-18-1.png)<!-- -->

:::

::::::


|           | dep_delay_ihs|
|:----------|-------------:|
|skewness   |         1.273|
|skew.2SE   |         8.122|
|kurtosis   |         0.242|
|kurt.2SE   |         0.773|
|normtest.W |         0.778|
|normtest.p |         0.000|




## Summary

Data transformations

- Z-scores
- Logarithmic transformations
- Inverse hyperbolic sine transformations

**Next**: Practical session

- Comparing means
- Correlation


