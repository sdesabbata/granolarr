



# Functions


## Summary

**Prev**:Control structures

- Conditional statements
- Loops

**Now**: Functions

- Defining functions
- Scope of a variable



## Defining functions

A function can be defined 

- using an **identifier** (e.g., `add_one`) 
- on the left of an **assignment operator** `<-`
- followed by the corpus of the function


```r
add_one <- function (input_value) {
  output_value <- input_value + 1
  output_value
  }
```

## Defining functions

The corpus 

- starts with the reserved word `function`
- followed by the **parameter(s)** (e.g., `input_value`) between simple brackets
- and the instruction(s) to be executed in a code block
- the value of the last statement is returned as output


```r
add_one <- function (input_value) {
  output_value <- input_value + 1
  output_value
  }
```


## Defining functions

After being defined, a function can be invoked by specifying the **identifier**


```r
add_one (3)
```

```
## [1] 4
```


## More parameters

- a function can be defined as having two or more **parameters** by specifying  more than one parameter name (separated by **commas**) in the function definition
- a function always take as input as many values as the number of parameters specified in the definition
    - otherwise an error is generated


```r
area_rectangle <- function (hight, width) {
  area <- hight * width
  area
}

area_rectangle(3, 2)
```

```
## [1] 6
```


## Functions and control structures

Functions can contain both loops and conditional statements in their corpus


```r
factorial <- function (input_value) {
  result <- 1
  for (i in 1:input_value) {
    cat("current:", result, " | i:", i, "\n")
    result <- result * i
  }
  result
}
factorial(3)
```

```
## current: 1  | i: 1 
## current: 1  | i: 2 
## current: 2  | i: 3
```

```
## [1] 6
```


<!--
## Functions and control structures

Factorial using `while`


```r
factorial <- function (input_value) {
  result <- 1
  while (input_value > 0) {
    cat("current:", result, " | input:", input_value, "\n")
    result <- result * input_value
    input_value <- input_value - 1
  }
  result
}
factorial(3)
```

```
## current: 1  | input: 3 
## current: 3  | input: 2 
## current: 6  | input: 1
```

```
## [1] 6
```
-->



## Scope

The **scope of a variable** is the part of code in which the variable is ``visible''

In R, variables have a **hierarchical** scope:

- a variable defined in a script can be used referred to from within a definition of a function in the same scrip
- a variable defined within a definition of a function will **not** be referable from outside the definition
- scope does **not** apply to `if` or loop constructs


## Example

In the case below

- `x_value` is **global** to the function `times_x`
- `new_value` and `input_value` are **local** to the function `times_x`
    - referring to `new_value` or `input_value` from outside the definition of `times_x` would result in an error


```r
x_value <- 10
times_x <- function (input_value) {
  new_value <- input_value * x_value
  new_value
}
times_x(2)
```

```
## [1] 20
```
<!--
Hint: try *debug* the function above and observe how the *local* environment is created and then discarded
-->


<!--
# Debugging

## What is debugging?

- Hardly any reasonably sized function works first time!
- Two broad kinds of problem
    - The function crashes (i.e. throws up an error)
    - The function doesn't crash  but returns the wrong answer
    - Generally, the second kind of error is the worst
- Prevention is better than cure, test the code as you write.
- **Debugging** is the process of finding the problems in the code.
- A typical approach
    - `Step' through the function line by line.  Find out where a crash occurs,  if one does.
    - Check the values of variables, and see if they are doing what they are supposed to.
- R has tools to help with this.


## To debug a function

- Enter `debug( <<Function Name>> )`
- For example: `debug(area.tri)`
- Then just use the function - it goes into 'debug mode'.
- Prompt becomes `Browse>`
- Line of function about to be executed is listed
- Pressing return executes it and goes to the next line
- Typing in a variable name lists the value of that variable
- Typing in any other command executes that command
- Typing in `c` and the return runs to the end of a function/block
- Typing in `Q` exits the function
- R can `see' variables that are specific to the function
- Enter `undebug(<<Function Name>>)` to return to normal


## Example

Debug the following example


```r
percentage_change <- function (before, after){
  difference <- before - after
  prop_change <- difference / before
  perc_change <- prop_change * 100
  perc_change
```
-->


## Summary

Functions

- Defining functions
- Scope of a variable

**Next**: Practical session

- Conditional statements
- Loops
    - While
    - For
- Functions
    - Loading functions from scripts
- Debugging


