



# Data visualisation



## Recap

**Prev**: Reproducibility

- 221 Reproducibility
- 222 R and Markdown
- 223 Git
- 224 Practical session

**Now**: Data visualisation

- Grammar of graphics
- ggplot2


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

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-5-1.png)<!-- -->



<!--
## Scale transformation

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

For instance `scale_x_log10` (use only if all values `> 0`)

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-6-1.png)<!-- -->

:::

::: {.col data-latex="{0.5\textwidth}"}


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

:::
::::::
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

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-9-1.png)<!-- -->




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

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-11-1.png)<!-- -->


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

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-13-1.png)<!-- -->


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

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-15-1.png)<!-- -->



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

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-17-1.png)<!-- -->


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

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-19-1.png)<!-- -->


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

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-21-1.png)<!-- -->



## Summary

Data visualisation

- Grammar of graphics
- ggplot2

**Next**: Descriptive statistics

- stat.desc
- dplyr::across


