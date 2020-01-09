---
title: "Lecture 501<br/>Exploratory analysis"
author: "Dr Stefano De Sabbata<br/>School of Geography, Geology, and the Env.<br/><a href=\"mailto:s.desabbata@le.ac.uk\">s.desabbata&commat;le.ac.uk</a> &vert; <a href=\"https://twitter.com/maps4thought\">&commat;maps4thought</a><br/><a href=\"https://github.com/sdesabbata/GY7702\">github.com/sdesabbata/GY7702</a> licensed under <a href=\"https://www.gnu.org/licenses/gpl-3.0.html\">GNU GPL v3.0</a>"
date: "2020-01-09"
output:
  ioslides_presentation:
    template: ../Utils/IOSlides/UoL_Template.html
    logo: ../Utils/IOSlides/uol_logo.png
---





# Recap @ 501



## Previous lectures

- What is reproducible data analysis?
    - why is it important?
    - software engineering
    - practical principles
- Tools
    - Markdown
    - RMarkdown
    - Git



## Today

- Data visualisation
    - histograms
    - boxplots
    - scatterplots
- Descriptive statistics
- Exploring assumptions
    - Shapiro–Wilk test
    - skewness and kurtosis
    - Levene’s test



# Data visualisation



## Visual variables

A **visual variable** is an aspect of a **mark** that can be controlled to change its appearance. 

Visual variables include: 

- Size
- Shape 
- Orientation
- Colour (hue)
- Colour value (brightness)
- Texture
- Position (2 dimensions)


## Grammar of graphics

Grammars provide rules for languages

*"The grammar of graphics takes us beyond a limited set of charts (words) to an almost unlimited world of graphical forms (statements)"* (Wilkinson, 2005)

Statistical graphic specifications are expressed in six statements:

1. **Data** manipulation 
2. **Variable** transformations (e.g., rank),
3. **Scale** transformations (e.g., log),
4. **Coordinate system** transformations (e.g., polar),
5. **Element**: mark (e.g., points) and visual variables (e.g., color)
6. **Guides** (axes, legends, etc.).


## ggplot2

The `ggplot2` library offers a series of functions for creating graphics **declaratively**, based on the Grammar of Graphics. 

To create a graph in `ggplot2`:

- provide the data
- specify elements
    - which visual variables (`aes`)
    - which marks (e.g., `geom_point`)
- apply transformations
- guides


```r
library(tidyverse)
library(nycflights13)
library(knitr)
```

<!--
## Aesthetics

The `aes` element is the second parameter of the main `ggplot` function after the data

It provides a mapping from the data's *variables* to the graphic's *visual variables*

- `x` and `y`
- `colour`
- `shape`
- `size`


```r
ggplot(
  aes(
    x = x_var, y = y_var
  )
```



## Graphical primitives

Marks (graphical primitives) can be specified through a series of functions, such as `geom_bar`, `geom_line`, or `geom_point`

These can be added to the construction of the graph using `+`


```r
ggplot(
  aes(
    x = x_var, y = y_var
  )
) +
geom_point()
```
-->

## Histograms

- `x` variable to plot
- `geom_histogram`


```r
nycflights13::flights %>%
  filter(month == 11) %>%
  ggplot(
    aes(
      x = dep_delay
    )
  ) +
  geom_histogram(
    binwidth = 10
  )
```

## Histograms

<img src="501_L_Exploratory_files/figure-html/unnamed-chunk-5-1.png" width="672" />



<!--
## Scale transformation

<div class="columns-2">

For instance `scale_x_log10` (use only if all values `> 0`)

<img src="501_L_Exploratory_files/figure-html/unnamed-chunk-6-1.png" width="384" />

<br/><br/>


```r
nycflights13::flights %>%
  filter(month == 11) %>%
  ggplot(
    aes(
      x = distance
    )
  ) +
  geom_histogram() +
  scale_x_log10()
```

</div>
-->

## Boxplots

- `x` categorical variable
- `y` variable to plot
- `geom_boxplot`


```r
nycflights13::flights %>%
  filter(month == 11) %>%
  ggplot(
    aes(
      x = carrier, 
      y = arr_delay
    )
  ) +
  geom_boxplot()
```

## Boxplots

<img src="501_L_Exploratory_files/figure-html/unnamed-chunk-9-1.png" width="672" />




## Jittered points

- `x` categorical variable
- `y` variable to plot
- `geom_jitter`



```r
nycflights13::flights %>%
  filter(month == 11) %>%
  ggplot(
    aes(
      x = carrier, 
      y = arr_delay
    )
  ) +
  geom_jitter()
```

## Jittered points

<img src="501_L_Exploratory_files/figure-html/unnamed-chunk-11-1.png" width="672" />


## Violin plot

- `x` categorical variable
- `y` variable to plot
- `geom_violin`



```r
nycflights13::flights %>%
  filter(month == 11) %>%
  ggplot(
    aes(
      x = carrier, 
      y = arr_delay
    )
  ) +
  geom_violin()
```

## Violin plot

<img src="501_L_Exploratory_files/figure-html/unnamed-chunk-13-1.png" width="672" />


## Lines

- `x` e.g., a temporal variable
- `y` variable to plot
- `geom_line`



```r
nycflights13::flights %>%
  filter(!is.na(dep_delay)) %>%
  mutate(flight_date = ISOdate(year, month, day)) %>%
  group_by(flight_date) %>%
  summarize(avg_dep_delay = mean(dep_delay)) %>%
  ggplot(aes(
    x = flight_date,
    y = avg_dep_delay
  )) +
  geom_line()
```


## Lines

<img src="501_L_Exploratory_files/figure-html/unnamed-chunk-15-1.png" width="672" />



## Scatterplots

- `x` and `y` variable to plot
- `geom_point`


```r
nycflights13::flights %>%
  filter(
    month == 11, 
    carrier == "US",
    !is.na(dep_delay),
    !is.na(arr_delay)
  ) %>%
  ggplot(aes(
    x = dep_delay,
    y = arr_delay
  )) +
  geom_point()
```


## Scatterplots

<img src="501_L_Exploratory_files/figure-html/unnamed-chunk-17-1.png" width="672" />


## Overlapping points

- `x` and `y` variable to plot
- `geom_count` counts overlapping points and maps the count to size


```r
nycflights13::flights %>%
  filter(
    month == 11, carrier == "US",
    !is.na(dep_delay), !is.na(arr_delay)
  ) %>%
  ggplot(aes(
    x = dep_delay,
    y = arr_delay
  )) +
  geom_count()
```


## Overlapping points

<img src="501_L_Exploratory_files/figure-html/unnamed-chunk-19-1.png" width="672" />


## Bin counts

- `x` and `y` variable to plot
- `geom_bin2d`


```r
nycflights13::flights %>%
  filter(
    month == 11, 
    carrier == "US",
    !is.na(dep_delay),
    !is.na(arr_delay)
  ) %>%
  ggplot(aes(
    x = dep_delay,
    y = arr_delay
  )) +
  geom_bin2d()
```

## Bin counts

<img src="501_L_Exploratory_files/figure-html/unnamed-chunk-21-1.png" width="672" />



# Descriptive statistics



## Descriptive statistics

Quantitatively describe or summarize variables

- `stat.desc` from `pastecs` library
    - `base` includes counts
    - `desc` includes descriptive stats
    - `norm` (default is `FALSE`) includes distribution stats


```r
library(pastecs)

nycflights13::flights %>%
  filter(month == 11, carrier == "US") %>%
  select(dep_delay, arr_delay, distance) %>%
  stat.desc() %>%
  kable()
```


## stat.desc output


                   dep_delay      arr_delay       distance
-------------  -------------  -------------  -------------
nbr.val         1668.0000000    1667.000000   1.699000e+03
nbr.null          58.0000000      35.000000   0.000000e+00
nbr.na            31.0000000      32.000000   0.000000e+00
min              -17.0000000     -63.000000   9.600000e+01
max              193.0000000     191.000000   2.153000e+03
range            210.0000000     254.000000   2.057000e+03
sum              961.0000000   -4450.000000   9.715580e+05
median            -4.0000000      -7.000000   5.290000e+02
mean               0.5761391      -2.669466   5.718411e+02
SE.mean            0.4084206       0.518816   1.464965e+01
CI.mean.0.95       0.8010713       1.017600   2.873327e+01
var              278.2347513     448.706408   3.646264e+05
std.dev           16.6803702      21.182691   6.038430e+02
coef.var          28.9519850      -7.935179   1.055963e+00



## stat.desc: basic

- `nbr.val`: overall number of values in the dataset
- `nbr.null`: number of `NULL` values -- NULL is often returned by expressions and functions whose values are undefined
- `nbr.na`: number of `NA`s -- missing value indicator



## stat.desc: desc

- `min` (also `min()`): **minimum** value in the dataset
- `max` (also `max()`): **minimum** value in the dataset
- `range`: difference between `min` and `max` (different from `range()`)
- `sum` (also `sum()`): sum of the values in the dataset
- `mean` (also `mean()`): **arithmetic mean**, that is `sum` over the number of values not `NA`
- `median` (also `median()`): **median**, that is the value separating the higher half from the lower half the values
- `mode()`functio is available: **mode**, the value that appears most often in the values



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
  stat.desc() %>%
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



# Exploring assumptions



## Normal distribution

<div class="columns-2">

- characterized by the bell-shaped curve 
- majority of values lie around the centre of the distribution
- the further the values are from the centre, the lower their frequency
- about 95% of values within 2 standard deviations from the mean

<br/><br/><br/>

<img src="501_L_Exploratory_files/figure-html/unnamed-chunk-25-1.png" width="100%" />

</div>


## Density histogram

<div class="columns-2">



<img src="501_L_Exploratory_files/figure-html/unnamed-chunk-27-1.png" width="100%" />



```r
nycflights13::flights %>% 
  ggplot(
    aes(
      x = dep_delay
    )
  ) +
  geom_histogram(
    aes(
      y =..density..
    ),
    binwidth = 10
  ) + 
  stat_function(
    fun = dnorm, 
    args = list(
      mean = dep_delay_mean,
      sd = dep_delay_sd),
    colour = "black", size = 1)
```

</div>


## Q-Q plot

<div class="columns-2">

Cumulative values against the cumulative probability of a particular distribution

<img src="501_L_Exploratory_files/figure-html/unnamed-chunk-29-1.png" width="384" />

<br/><br/>


```r
nycflights13::flights %>%
  filter(
    month == 11, 
    carrier == "US"
  ) %>%
  qplot(
    sample = dep_delay, 
    data = .,
    stat = "qq", 
    xlab = "Theoretical", 
    ylab = "Sample"
  )
```

</div>


## stat.desc: norm


```r
nycflights13::flights %>%
  filter(month == 11, carrier == "US") %>%
  select(dep_delay, arr_delay, distance) %>%
  stat.desc(basic = FALSE, desc = FALSE, norm = TRUE) %>%
  kable()
```

                dep_delay    arr_delay     distance
-----------  ------------  -----------  -----------
skewness        4.4187763    2.0716291    2.0030249
skew.2SE       36.8709612   17.2808242   16.8678747
kurtosis       28.8513206    9.5741004    2.6000743
kurt.2SE      120.4418092   39.9557893   10.9542887
normtest.W      0.5545326    0.8657894    0.6012442
normtest.p      0.0000000    0.0000000    0.0000000



## Normality

**Shapiro–Wilk test** compares the distribution of a variable with a normal distribution having same mean and standard deviation

- If significant, the distribution is not normal
- `normtest.W` (test statistics) and `normtest.p` (significance)
- also, `shapiro.test` function is available


```r
nycflights13::flights %>%
  filter(month == 11, carrier == "US") %>%
  pull(dep_delay) %>%
  shapiro.test()
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  .
## W = 0.55453, p-value < 2.2e-16
```



## Significance

Most statistical tests are based on the idea of hypothesis testing

- a **null hypothesis** is set
- the data are fit into a statistical model
- the model is assessed with a **test statistic**
- the **significance** is the probability of obtaining that test statistic value by chance

The threshold to accept or reject an hypotheis is arbitrary and based on conventions (e.g., *p < .01* or *p < .05*)

**Example:** The null hypotheis of the Shapiro–Wilk test is that the sample is normally distributed and *p < .01* indicates that the probability of that being true is very low.



## Skewness and kurtosis

In a normal distribution, the values of *skewness* and *kurtosis* should be zero

- `skewness`: **skewness** value indicates
    - positive: the distribution is skewed towards the left
    - negative: the distribution is skewed towards the right
- `kurtosis`: **kurtosis** value indicates
    - positive: heavy-tailed distribution
    - negative: flat distribution
- `skew.2SE` and `kurt.2SE`: skewness and kurtosis divided by 2 standard errors. If greater than 1, the respective statistics is significant (*p < .05*).



## Homogeneity of variance

**Levene’s test** for equality of variance in different levels

- If significant, the variance is different in different levels


```r
dep_delay_carrier <- nycflights13::flights %>%
  filter(month == 11) %>%
  select(dep_delay, carrier)

library(car)
leveneTest(dep_delay_carrier$dep_delay, dep_delay_carrier$carrier)
```

```
## Levene's Test for Homogeneity of Variance (center = median)
##          Df F value    Pr(>F)    
## group    15  20.203 < 2.2e-16 ***
##       27019                      
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```


# Summary



## Summary

- Data visualisation
    - histograms
    - boxplots
    - scatterplots
- Descriptive statistics
- Exploring assumptions
    - Shapiro–Wilk test
    - skewness and kurtosis
    - Levene’s test



## Practical session

In the practical session, we will see:

- Data visualisation
    - histograms
    - boxplots
    - scatterplots
- Descriptive statistics
- Exploring assumptions
    - Shapiro–Wilk test
    - skewness and kurtosis
    - Levene’s test
