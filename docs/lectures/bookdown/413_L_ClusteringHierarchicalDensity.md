



# Hierarchical and density-based clustering



## Recap

**Prev**: Centroid-based clustering

- K-means
- Fuzzy c-means
- Geodemographic classification

**Now**: Hierarchical and density-based clustering

- Hierarchical
- Mixed 
- Density-based


```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──
```

```
## ✔ ggplot2 3.3.2     ✔ purrr   0.3.4
## ✔ tibble  3.0.3     ✔ dplyr   1.0.0
## ✔ tidyr   1.1.0     ✔ stringr 1.4.0
## ✔ readr   1.3.1     ✔ forcats 0.5.0
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```

```
## 
## Attaching package: 'magrittr'
```

```
## The following object is masked from 'package:purrr':
## 
##     set_names
```

```
## The following object is masked from 'package:tidyr':
## 
##     extract
```


## Example

Can we automatically identify the two groups visible in the scatterplot, without any previous knowledge of the groups?


:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}


```r
# First, normalise values
penguins_norm <-
  palmerpenguins::penguins %>%
  dplyr::filter(
    !is.na(body_mass_g) | 
      !is.na(bill_depth_mm)
  ) %>%
  dplyr::mutate(
  	body_mass_norm = 
  	  scale(body_mass_g),
  	bill_depth_norm = 
  	  scale(bill_depth_mm)
  )
```

:::

::: {.col data-latex="{0.5\textwidth}"}

![](413_L_ClusteringHierarchicalDensity_files/figure-epub3/unnamed-chunk-3-1.png)<!-- -->

:::
::::::


## Hierarchical clustering

Bottom-up approach

- rather than splitting objects into clusters
- aggregate from single objects upwards

**Algorithm**: 

- each object is initialised as it's own cluster
- then repeat
  - join the two most similar clusters 
    - based on a distance-based metric
    - e.g., Ward's (1963) approach is based on variance
  - until only one single cluster is achieved

**Limitation**: computationally expensive


## stats::hclust


```r
penguins_hclust_result <- 
  penguins_norm %>%
  dplyr::select(
    body_mass_norm, 
    bill_depth_norm
  ) %>%
  # Calculate distance matrix
  stats::dist(method="euclidean") %>%
  # Cluster data
  stats::hclust(method="ward.D2")

penguins_bm_bd_hclust <- penguins_norm %>%
  add_column(
    bm_bd_hclust = cutree(
      penguins_hclust_result, 
      k = 2
    )
  )
```



## clustering tree

Generates a clustering tree (dendrogram), which can then be *"cut"* at the desired height

![](413_L_ClusteringHierarchicalDensity_files/figure-epub3/unnamed-chunk-5-1.png)<!-- -->

```
## integer(0)
```



## Hierarchical clustering result

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

![](413_L_ClusteringHierarchicalDensity_files/figure-epub3/unnamed-chunk-6-1.png)<!-- -->

:::

::: {.col data-latex="{0.5\textwidth}"}

![](413_L_ClusteringHierarchicalDensity_files/figure-epub3/unnamed-chunk-7-1.png)<!-- -->

:::
::::::


## Bagged clustering

Bootstrap aggregating (*b-agg-ed*) clustering approach

- first, k-means
  - randomly select a sample
  - calculate K-means
  - repeat on *many* samples
- then, hierarchical 
  - execute hierarchical clustering on the centroids of the clusters generated in the previous step
- finally
  - select required number of clusters
  - assign object to closest centroid
  
<font size="4">	
Leisch, F., 1999. Bagged clustering.
</font>

## e1071::bclust


```r
penguins_bclust_result <- 
  penguins_norm %>%
  dplyr::select(body_mass_norm, bill_depth_norm) %>%
  e1071::bclust(
    hclust.method = "ward.D2", 
    resample = TRUE
  )

penguins_bm_bd_bclust <- 
  penguins_norm %>%
  add_column(
    bm_bd_bclust = clusters.bclust(
      penguins_bclust_result, 
      2
    )
  )
```

## Bagged clustering result

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

![](413_L_ClusteringHierarchicalDensity_files/figure-epub3/unnamed-chunk-9-1.png)<!-- -->

:::

::: {.col data-latex="{0.5\textwidth}"}

![](413_L_ClusteringHierarchicalDensity_files/figure-epub3/unnamed-chunk-10-1.png)<!-- -->

:::
::::::



## Density based clustering

Density-based spatial clustering of applications with noise (DBSCAN)

- start from a random unclustered point
  - proceed by aggregating its neighbours to the same cluster
    - as long as they are within a certain distance `eps`
- once no more objects can be added
  - select another random point
  - and start aggregating again to a new cluster

**Limitation**: selection of `eps`

<font size="4">	
Ester, M., Kriegel, H.P., Sander, J. and Xu, X., 1996, August. Density-based spatial clustering of applications with noise. In Int. Conf. Knowledge Discovery and Data Mining (Vol. 240, p. 6).
</font>
  
## dbscan::dbscan


```r
penguins_dbscan_result <- 
  penguins_norm %>%
  dplyr::select(body_mass_norm, bill_depth_norm) %>%
  dbscan::dbscan(
    eps = 1, 
    minPts = 5
  )

penguins_bm_bd_dbscan <- 
  penguins_norm %>%
  add_column(
    bm_bd_dbscan = 
      penguins_dbscan_result %$% 
      cluster
  )
```



## DBSCAN result

Using: `dbscan(eps = 1, minPts = 5)`

:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

![](413_L_ClusteringHierarchicalDensity_files/figure-epub3/unnamed-chunk-12-1.png)<!-- -->

:::

::: {.col data-latex="{0.5\textwidth}"}

![](413_L_ClusteringHierarchicalDensity_files/figure-epub3/unnamed-chunk-13-1.png)<!-- -->

:::
::::::


## DBSCAN result

Using: `dbscan(eps = 0.5, minPts = 5)`




:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

![](413_L_ClusteringHierarchicalDensity_files/figure-epub3/unnamed-chunk-15-1.png)<!-- -->

:::

::: {.col data-latex="{0.5\textwidth}"}

![](413_L_ClusteringHierarchicalDensity_files/figure-epub3/unnamed-chunk-16-1.png)<!-- -->

:::
::::::


## DBSCAN result

Using: `dbscan(eps = 0.1, minPts = 5)`




:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

![](413_L_ClusteringHierarchicalDensity_files/figure-epub3/unnamed-chunk-18-1.png)<!-- -->

:::

::: {.col data-latex="{0.5\textwidth}"}

![](413_L_ClusteringHierarchicalDensity_files/figure-epub3/unnamed-chunk-19-1.png)<!-- -->

:::
::::::


## Not alwasy that easy...



:::::: {.cols data-latex=""}

::: {.col data-latex="{0.5\textwidth}"}

![](413_L_ClusteringHierarchicalDensity_files/figure-epub3/unnamed-chunk-21-1.png)<!-- -->

![](413_L_ClusteringHierarchicalDensity_files/figure-epub3/unnamed-chunk-22-1.png)<!-- -->

:::

::: {.col data-latex="{0.5\textwidth}"}

![](413_L_ClusteringHierarchicalDensity_files/figure-epub3/unnamed-chunk-23-1.png)<!-- -->

![](413_L_ClusteringHierarchicalDensity_files/figure-epub3/unnamed-chunk-24-1.png)<!-- -->

:::
::::::



## Summary

Hierarchical and density-based clustering

- Hierarchical
- Mixed 
- Density-based

**Next**: Practical session

- Geodemographic classification


