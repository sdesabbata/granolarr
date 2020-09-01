



# Control structures



## Recap

**Prev**: Data types

- Vectors
- Factors
- Arrays
- Lists

**Now**: Control structures

- Conditional statements
- Loops



## If

Format: **if** (*condition*) *statement*

- *condition*: expression returning a logic value (`TRUE` or `FALSE`)
- *statement*: any valid R statement
- *statement* only executed if *condition* is `TRUE`



```r
a_value <- -7
if (a_value < 0) cat("Negative")
```

```
## Negative
```

```r
a_value <- 8
if (a_value < 0) cat("Negative")
```


## Else
Format: **if** (*condition*) *statement1* **else** *statement2*

- *condition*: expression returning a logic value (`TRUE` or `FALSE`)
- *statement1* and *statement2*: any valid R statements
- *statement1*  executed if *condition* is `TRUE`
- *statement2*  executed if *condition* is `FALSE`



```r
a_value <- -7
if (a_value < 0) cat("Negative") else cat("Positive")
```

```
## Negative
```

```r
a_value <- 8
if (a_value < 0) cat("Negative") else cat("Positive")
```

```
## Positive
```

<!--
## Example


```r
x <- 10
if (is.numeric(x) & (!(x < 0) & (x != 0)) ) cat("greater than zero")
```

```
## greater than zero
```
-->


## Code blocks

Suppose you want to execute **several** statements within a function, or if a condition is true

- Such a group of statements are called **code blocks**
- `{` and `}` contain code blocks


```r
first_value <- 8
second_value <- 5
if (first_value > second_value) {
  cat("First is greater than second\n") 
  difference <- first_value - second_value
  cat("Their difference is ", difference)
}
```

```
## First is greater than second
## Their difference is  3
```



## Loops
Loops are a fundamental component of (procedural) programming.


There are two main types of loops:

- **conditional** loops are executed as long as a defined condition holds true
    - construct `while`
    - construct `repeat`
- **deterministic** loops are executed a pre-determined number of times
    - construct `for`


## While

The *while* construct can be defined using the `while` reserved word, followed by the conditional statement between simple brackets, and a code block. The instructions in the code block are re-executed as long as the result of the evaluation of the conditional statement is `TRUE`.


```r
current_value <- 0

while (current_value < 3) {
  cat("Current value is", current_value, "\n")
  current_value <- current_value + 1
}
```

```
## Current value is 0 
## Current value is 1 
## Current value is 2
```

<!--
## Repeat

The *repeat* construct can be defined using the `repeat` reserved word, followed by a code block. The instructions in the code block are re-executed until the command `break` is given. The latter is currently given through an `if` construct, which tests the condition that would stop the loop.


```r
current_value <- 0

repeat {
  cat("Current value is", current_value, "\n")
  current_value <- current_value + 1
  if (current_value >= 3) break
}
```

```
## Current value is 0 
## Current value is 1 
## Current value is 2
```


## While vs Repeat
The difference between `while` and `repeat` is mostly syntactical.

- Sometimes one or the other might fit better with the algorithm you have in mind
- Use the one that comes easier to you in the given situation
-->

## For

The *for* construct can be defined using the `for` reserved word, followed by the definition of an **iterator**. The iterator is a variable which is temporarily assigned with the current element of a vector, as the construct iterates through all elements of the list. This definition is followed by a code block, whose instructions are re-executed once for each element of the vector.


```r
cities <- c("Derby", "Leicester", "Lincoln", "Nottingham")
for (city in cities) {
  cat("Do you live in", city, "?\n")
}
```

```
## Do you live in Derby ?
## Do you live in Leicester ?
## Do you live in Lincoln ?
## Do you live in Nottingham ?
```


## For

It is common practice to create a vector of integers on the spot in order to execute a certain sequence of steps a pre-defined number of times.


```r
for (i in 1:3) {
  cat("This is exectuion number", i, ":\n")
  cat("    See you later!\n")
}
```

```
## This is exectuion number 1 :
##     See you later!
## This is exectuion number 2 :
##     See you later!
## This is exectuion number 3 :
##     See you later!
```


## Loops with conditional statements


```r
3:0
```

```
## [1] 3 2 1 0
```

```r
#Example: countdown!
for (i in 3:0) {
  if (i == 0) {
    cat("Go!\n")
  } else {
    cat(i, "\n")
  }
}
```

```
## 3 
## 2 
## 1 
## Go!
```



## Summary

Control structures

- Conditional statements
- Loops

**Next**: Functions

- Defining functions
- Scope of a variable
