



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



## ggplot2

The `ggplot2` library offers a series of functions for creating graphics **declaratively**, based on the Grammar of Graphics. 

To create a graph in `ggplot2`:

- provide the data
- specify elements
    - which visual variables (`aes`)
    - which marks (e.g., `geom_point`)
- apply transformations
- guides



## Aesthetics

The `aes` element is the second parameter of the main `ggplot` function after the data

It provides a *"mapping"* from the data *columns* (attributes) to the graphic's *visual variables*

- `x` and `y`
- `colour`
- `shape`
- `size`


```r
ggplot2::ggplot(
  aes(
    x = column_1, y = column_2
  )
```



## Graphical primitives

Marks (graphical primitives) can be specified through a series of functions, such as `geom_line`, `geom_bar` or `geom_point`

These can be added to the construction of the graph using `+`


```r
ggplot2::ggplot(
  aes(
    x = column_1, y = column_2
  )
) +
ggplot2::geom_line()
```



## ggplot2::geom_line

- `x`: a column to *"map"* to the x-axis, e.g. days (category)
- `y`: a column to *"map"* to the y-axis, e.g. delay (continuous)
- `geom_line`: line mark (graphical primitive)



```r
nycflights13::flights %>%
  dplyr::filter(!is.na(dep_delay) & month == 11) %>%
  dplyr::mutate(flight_date = ISOdate(year, month, day)) %>%
  dplyr::group_by(flight_date) %>%
  dplyr::summarize(tot_dep_delay = sum(dep_delay)) %>%
  ggplot2::ggplot(aes(
    x = flight_date,
    y = tot_dep_delay
  )) +
  ggplot2::geom_line()
```


## ggplot2::geom_line

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-5-1.png)<!-- -->



## ggplot2::geom_col

- `x`: a column to *"map"* to the x-axis, e.g. days (category)
- `y`: a column to *"map"* to the y-axis, e.g. delay (continuous)
- `geom_col`: bar mark (graphical primitive)
  - `geom_bar` instead illustrates count per category



```r
nycflights13::flights %>%
  dplyr::filter(!is.na(dep_delay) & month == 11) %>%
  dplyr::mutate(flight_date = ISOdate(year, month, day)) %>%
  dplyr::group_by(flight_date) %>%
  dplyr::summarize(tot_dep_delay = sum(dep_delay)) %>%
  ggplot2::ggplot(aes(
    x = flight_date,
    y = tot_dep_delay
  )) +
  ggplot2::geom_col()
```

## ggplot2::geom_col

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-7-1.png)<!-- -->



## ggplot2::geom_col

... then, why not add some colour?

- `fill`: a column to *"map"* to the visual variable *colour* as fill of the mark, e.g. origin (category)
  - `colour` can be used to *"map"* a column to the visual variable *colour* as border of the mark



```r
nycflights13::flights %>%
  dplyr::filter(!is.na(dep_delay) & month == 11) %>%
  dplyr::mutate(flight_date = ISOdate(year, month, day)) %>%
  dplyr::group_by(flight_date, origin) %>%
  dplyr::summarize(tot_dep_delay = sum(dep_delay)) %>%
  ggplot2::ggplot(aes(
    x = flight_date,
    y = tot_dep_delay,
    fill = origin
  )) +
  ggplot2::geom_col()
```

## ggplot2::geom_col

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-9-1.png)<!-- -->




## Histograms

- `x` a column to *"map"* to the x-axis, e.g. delay (continuous)
- `geom_histogram` to illustrate count over intervals of continuous variable on x-axis
  - `geom_bar` instead illustrates count per category


```r
nycflights13::flights %>%
  dplyr::filter(month == 11) %>%
  ggplot2::ggplot(
    aes(
      x = dep_delay
    )
  ) +
  ggplot2::geom_histogram(
    binwidth = 10
  )
```

## Histograms

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-11-1.png)<!-- -->



<!--
## Scale transformation

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

For instance `scale_x_log10` (use only if all values `> 0`)

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-12-1.png)<!-- -->

:::

::: {.col data-latex="{0.5\textwidth}"}


```r
nycflights13::flights %>%
  filter(month == 11) %>%
  ggplot2::ggplot(
    aes(
      x = distance
    )
  ) +
  ggplot2::geom_histogram() +
  scale_x_log10()
```

:::
::::::
-->

## Boxplots

- `x`: a column to *"map"* to the x-axis, e.g. carrier (category)
- `y`: a column to *"map"* to the y-axis, e.g. delay (continuous)
- `geom_boxplot`: to illustrate distribution of continuous variable on y-axis per each category on x-axis


```r
nycflights13::flights %>%
  dplyr::filter(month == 11) %>%
  ggplot2::ggplot(
    aes(
      x = carrier, 
      y = arr_delay
    )
  ) +
  ggplot2::geom_boxplot()
```

## Boxplots

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-15-1.png)<!-- -->



<!--
## Jittered points

- `x` categorical variable
- `y` variable to plot
- `geom_jitter`



```r
nycflights13::flights %>%
  dplyr::filter(month == 11) %>%
  ggplot2::ggplot(
    aes(
      x = carrier, 
      y = arr_delay
    )
  ) +
  ggplot2::geom_jitter()
```

## Jittered points

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-17-1.png)<!-- -->



## Violin plot

- `x` categorical variable
- `y` variable to plot
- `geom_violin`


```r
nycflights13::flights %>%
  dplyr::filter(month == 11) %>%
  ggplot2::ggplot(
    aes(
      x = carrier, 
      y = arr_delay
    )
  ) +
  ggplot2::geom_violin()
```

## Violin plot

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-19-1.png)<!-- -->
-->


## Scatterplots

- `x` and `y` variable to plot
- `geom_point`


```r
nycflights13::flights %>%
  dplyr::filter(
    month == 11, 
    carrier == "US",
    !is.na(dep_delay),
    !is.na(arr_delay)
  ) %>%
  ggplot2::ggplot(aes(
    x = dep_delay,
    y = arr_delay
  )) +
  ggplot2::geom_point()
```

## Scatterplots

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-21-1.png)<!-- -->



## Overlapping points

- `x` and `y` variable to plot
- `geom_count` counts overlapping points and maps the count to size


```r
nycflights13::flights %>%
  dplyr::filter(
    month == 11, carrier == "US",
    !is.na(dep_delay), !is.na(arr_delay)
  ) %>%
  ggplot2::ggplot(aes(
    x = dep_delay,
    y = arr_delay
  )) +
  ggplot2::geom_count()
```

## Overlapping points

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-23-1.png)<!-- -->



## Bin counts

- `x` and `y` variable to plot
- `geom_bin2d`


```r
nycflights13::flights %>%
  dplyr::filter(
    month == 11, 
    carrier == "US",
    !is.na(dep_delay),
    !is.na(arr_delay)
  ) %>%
  ggplot2::ggplot(aes(
    x = dep_delay,
    y = arr_delay
  )) +
  ggplot2::geom_bin2d()
```

## Bin counts

![](301_L_DataVisualisation_files/figure-epub3/unnamed-chunk-25-1.png)<!-- -->



## Summary

Data visualisation

- Grammar of graphics
- ggplot2

**Next**: Descriptive statistics

- stat.desc
- dplyr::across


