



# Descriptive statistics


## Summary

Data visualisation

- Grammar of graphics
- ggplot2

**Next**: Descriptive statistics

- pastecs::stat.desc
- dplyr::across





## Meet the Palmer penguins

:::::: {.cols data-latex=""}
::: {.col style="width: 70%;" data-latex="{0.5\textwidth}"}

Original data collected and released by [Dr. Kristen Gorman](https://www.uaf.edu/cfos/people/faculty/detail/kristen-gorman.php) and the [Palmer Station, Antarctica LTER](Palmer Station, Antarctica LTER), a member of the [Long Term Ecological Research Network](https://lternet.edu/).

Horst AM, Hill AP, Gorman KB (2020). [palmerpenguins: Palmer Archipelago (Antarctica) penguin data](https://allisonhorst.github.io/palmerpenguins/). R package version 0.1.0. doi:10.5281/zenodo.3960218.

<br>

```r
library(palmerpenguins)
```


:::
::: {.col style="width: 60%; text-align: right;" data-latex="{0.5\textwidth}"}

![](https://raw.githubusercontent.com/allisonhorst/palmerpenguins/master/man/figures/lter_penguins.png)

![](https://raw.githubusercontent.com/allisonhorst/palmerpenguins/master/man/figures/culmen_depth.png)

<br/>
*Artwork by @allison_horst*

:::
::::::




## Descriptive statistics

Quantitatively describe or summarize variables

- `stat.desc` from `pastecs` library
    - `base` includes counts
    - `desc` includes descriptive stats
    - `norm` (default is `FALSE`) includes distribution stats


```r
library(pastecs)

palmerpenguins::penguins %>%
  dplyr::select(bill_length_mm, bill_depth_mm) %>%
  pastecs::stat.desc() %>%
  knitr::kable(digits = c(2, 2))
```


## stat.desc output


|             | bill_length_mm| bill_depth_mm|
|:------------|--------------:|-------------:|
|nbr.val      |         342.00|        342.00|
|nbr.null     |           0.00|          0.00|
|nbr.na       |           2.00|          2.00|
|min          |          32.10|         13.10|
|max          |          59.60|         21.50|
|range        |          27.50|          8.40|
|sum          |       15021.30|       5865.70|
|median       |          44.45|         17.30|
|mean         |          43.92|         17.15|
|SE.mean      |           0.30|          0.11|
|CI.mean.0.95 |           0.58|          0.21|
|var          |          29.81|          3.90|
|std.dev      |           5.46|          1.97|
|coef.var     |           0.12|          0.12|



## stat.desc: basic

- `nbr.val`: overall number of values in the dataset
- `nbr.null`: number of `NULL` values -- NULL is often returned by expressions and functions whose values are undefined
- `nbr.na`: number of `NA`s -- missing value indicator


|         | bill_length_mm| bill_depth_mm|
|:--------|--------------:|-------------:|
|nbr.val  |          342.0|         342.0|
|nbr.null |            0.0|           0.0|
|nbr.na   |            2.0|           2.0|
|min      |           32.1|          13.1|
|max      |           59.6|          21.5|
|range    |           27.5|           8.4|
|sum      |        15021.3|        5865.7|


## stat.desc: basic

- `min` (also `min()`): **minimum** value in the dataset
- `max` (also `max()`): **maximum** value in the dataset
- `range`: difference between `min` and `max` (different from `range()`)
- `sum` (also `sum()`): sum of the values in the dataset


|         | bill_length_mm| bill_depth_mm|
|:--------|--------------:|-------------:|
|nbr.val  |          342.0|         342.0|
|nbr.null |            0.0|           0.0|
|nbr.na   |            2.0|           2.0|
|min      |           32.1|          13.1|
|max      |           59.6|          21.5|
|range    |           27.5|           8.4|
|sum      |        15021.3|        5865.7|



## stat.desc: desc

- `mean` (also `mean()`): **arithmetic mean**, that is `sum` over the number of values not `NA`
- `median` (also `median()`): **median**, that is the value separating the higher half from the lower half the values
- `mode()`function is available: **mode**, the value that appears most often in the values


|             | bill_length_mm| bill_depth_mm|
|:------------|--------------:|-------------:|
|median       |          44.45|         17.30|
|mean         |          43.92|         17.15|
|SE.mean      |           0.30|          0.11|
|CI.mean.0.95 |           0.58|          0.21|
|var          |          29.81|          3.90|
|std.dev      |           5.46|          1.97|
|coef.var     |           0.12|          0.12|



## Sample statistics

Assuming that the data in the dataset are a sample of a population

- `SE.mean`: **standard error of the mean** -- estimation of the variability of the mean calculated on different samples of the data (see also *central limit theorem*)

- `CI.mean.0.95`: **95% confidence interval of the mean** -- indicates that there is a 95% probability that the actual mean is within that distance from the sample mean

<!--
Excerpt From: Field, Andy. “Discovering Statistics Using R.” iBooks. 

Section 2.5.1

“If you were to calculate the standard deviation between sample means then this too would give you a measure of how much variability there was between the means of different samples. The standard deviation of sample means is known as the standard error of the mean (SE). Therefore, the standard error could be calculated by taking the difference between each sample mean and the overall mean, squaring these differences, adding them up, and then dividing by the number of samples. Finally, the square root of this value would need to be taken to get the standard deviation of sample means, the standard error.”

“as samples get large (usually defined as greater than 30), the sampling distribution has a normal distribution with a mean equal to the population mean, and a standard deviation of: stddev / sqrt(N)”

“This is known as the central limit theorem and it is useful in this context because it means that if our sample is large we can use the above equation to approximate the standard error (because, remember, it is the standard deviation of the sampling distribution).7 When the sample is relatively small (fewer than 30) the sampling distribution has a different shape, known as a t-distribution, which we’ll come back to later.”
-->


## Estimating variation

- `var`: **variance** ($\sigma^2$), it quantifies the amount of variation as the average of squared distances from the mean

$$\sigma^2 = \frac{1}{n} \sum_{i=1}^n (\mu-x_i)^2$$

- `std.dev`: **standard deviation** ($\sigma$), it quantifies the amount of variation as the square root of the variance

$$\sigma = \sqrt{\frac{1}{n} \sum_{i=1}^n (\mu-x_i)^2}$$

- `coef.var`: **variation coefficient** it quantifies the amount of variation as the standard deviation divided by the mean

<!--
## Broom

Part `tidymodels` (under development), converts statistical analysis objects into tidy format


```r
library(broom)

nycflights13::flights %>%
  filter(month == 11, carrier == "US") %>%
  select(dep_delay, arr_delay, distance) %>%
  pastecs::stat.desc() %>%
  tidy()
```

```
## # A tibble: 3 x 13
##   column     n   mean     sd median trimmed   mad   min    max  range  skew
##   <chr>  <dbl>  <dbl>  <dbl>  <dbl>   <dbl> <dbl> <dbl>  <dbl>  <dbl> <dbl>
## 1 dep_d…    14   245. 4.83e2   30.0   148.   31.8   -17   1668   1685  2.22
## 2 arr_d…    14  -134. 1.32e3   11.1    75.2  22.4 -4450   1667   6117 -2.58
## 3 dista…    14 95996. 2.70e5  550.  31032.  550.      0 971558 971558  2.76
## # … with 2 more variables: kurtosis <dbl>, se <dbl>
```
-->



## dplyr::across

The `dplyr` verb `across` allows to apply `summarise` verbs on multiple columns. Instead of...



```r
palmerpenguins::penguins %>%
  # filter out raws with missing data
  dplyr::filter(!is.na(bill_length_mm)) %>%
  # summarise
  dplyr::summarise(
    avg_bill_len_mm = mean(bill_length_mm), 
    avg_bill_dpt_mm = mean(bill_depth_mm),
    avg_flip_len_mm = mean(flipper_length_mm),
    avg_body_mass_g = mean(body_mass_g)
  ) %>%
  knitr::kable(digits = c(2, 2, 2, 2))
```



| avg_bill_len_mm| avg_bill_dpt_mm| avg_flip_len_mm| avg_body_mass_g|
|---------------:|---------------:|---------------:|---------------:|
|           43.92|           17.15|          200.92|         4201.75|



## dplyr::across

The verb `across` can also be used with `mutate`, to apply the same function to a number of columns


```r
palmerpenguins::penguins %>%
  # mutate cross columns
  dplyr::mutate(
    dplyr::across(
      c(bill_length_mm, bill_depth_mm, flipper_length_mm),
      # add 1 to all values in the columns above
      function(x){ x / 25.4 }
    )
  ) %>%
  rename(
    bill_length_in = bill_length_mm,
    bill_depth_in = bill_depth_mm,
    flipper_length_in = flipper_length_mm
  )
```


## dplyr::across

Old columns:


```
## # A tibble: 344 x 3
##   bill_length_mm bill_depth_mm flipper_length_mm
##            <dbl>         <dbl>             <int>
## 1           39.1          18.7               181
## 2           39.5          17.4               186
## # … with 342 more rows
```

New columns:


```
## # A tibble: 344 x 3
##   bill_length_in bill_depth_in flipper_length_in
##            <dbl>         <dbl>             <dbl>
## 1           1.54         0.736              7.13
## 2           1.56         0.685              7.32
## # … with 342 more rows
```




## Summary

Descriptive statistics

- pastecs::stat.desc
- dplyr::across

**Next**: Exploring assumptions

- Normality
- Skewness and kurtosis
- Homogeneity of variance


