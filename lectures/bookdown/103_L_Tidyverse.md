



# Tidyverse



## Recap

**Prev**: Core concepts

- Variables
- Functions
- Libraries

**Now**: Tidyverse

- Tidyverse libraries
- *pipe* operator



## The pipe operator

The [Tidyverse](https://www.tidyverse.org/) also provide a clean and effective way of combining multiple manipulation steps

The pipe operator `%>%`

- takes the result from one function
- and passes it to the next function
- as the **first argument**
- that doesn't need to be included in the code anymore



## Pipe example
<center>
![](images/PipeOperator.png){width=100%}
</center>


## Pipe example

The two codes below are equivalent

- the first simply invokes the functions
- the second uses the pipe operator `%>%`


```r
round(sqrt(2), digits = 2)
```

```
## [1] 1.41
```


```r
library(tidyverse)
```

```
## ── Attaching packages ──────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.3.0 ──
```

```
## ✓ ggplot2 3.3.2     ✓ purrr   0.3.4
## ✓ tibble  3.0.3     ✓ dplyr   1.0.0
## ✓ tidyr   1.1.0     ✓ stringr 1.4.0
## ✓ readr   1.3.1     ✓ forcats 0.5.0
```

```
## ── Conflicts ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
sqrt(2) %>%
 round(digits = 2)
```

```
## [1] 1.41
```




## Summary

Tidyverse

- Tidyverse libraries
- *pipe* operator

**Next**: Practical session

- The R programming language
- Interpreting values
- Variables
- Basic types
- Tidyverse
- Coding style


