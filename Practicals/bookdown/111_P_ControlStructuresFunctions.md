---
title: "111 Control structures and Functions"
author: "Stefano De Sabbata"
date: "2019-11-19"
output: pdf_document
urlcolor: blue
---



# Control structures and Functions

*[Stefano De Sabbata](https://stefanodesabbata.com)*

[This work](https://github.com/sdesabbata/GY7702) is licensed under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html). Contains public sector information licensed under the [Open Government Licence v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence).


## Conditional structures

Conditional structures are fundamental in (procedural) programming, as they allow to execute or not execute part of a procedure depending on whether a certain condition is true. The condition is tested and the part of the procedure to execute in the case the condition is true is included in a *code block*.


```r
temperature <- 25

if (temperature > 25) {
  cat("It really warm today!")
}
```

A simple conditional structure can be created using `if` as in the example above. A more complex structure can be created using both `if` and `else`, to provide not only a procedure to execute in case the condition is true, but also an alternative procedure, to be executed when the condition is false.


```r
temperature <- 12

if (temperature > 25) {
  cat("It really warm today!")
} else {
  cat("Today is not warm")
}
```

```
## Today is not warm
```

Finally, conditional structures can be **nested**. That is, a conditional structure can be included as part of the code block to be executed after the condition is tested. For instance, in the example below, a second conditional structure is included in the code block to be executed in the case the condition is false.


```r
temperature <- -5

if (temperature > 25) {
  cat("It really warm today!")
} else {
  if (temperature > 0) {
    cat("There is a nice temperature today")
  } else {
    cat("This is really cold!")
  }
}
```

```
## This is really cold!
```



## Loops

Loops are another core component of (procedural) programming and implement the idea of solving a problem or executing a task by performing the same set of steps a number of times.  There are two main kinds of loops in R - **deterministic** and **conditional** loops.  The former is executed a fixed number of times,  specified at the beginning of the loop.  The latter is executed until a specific condition is met. Both deterministic and conditional loops are extremely important in working with vectors.


### Conditional Loops

In R, conditional loops can be implemented using `while` and `repeat`. The difference between the two is mostly syntactical: the first tests the condition first and then execute the related code block if the condition is true; the second executes the code block until a `break` command is given (usually through a conditional statement).


```r
a_value <- 0
# Keep printing as long as x is smaller than 2
while (a_value < 2) {
  cat(a_value, "\n")
  a_value <- a_value + 1
}
```

```
## 0 
## 1
```


```r
a_value <- 0
# Keep printing, if x is greater or equal than 2 than stop
repeat {
  cat(a_value, "\n")
  a_value <- a_value + 1
  if (a_value >= 2) break
}
```

```
## 0 
## 1
```



### Deterministic Loops

The deterministic loop executes the subsequent code block iterating through the elements of a provided vector. During each iteration (i.e., execution of the code block), the current element of the vector (*<VECTOR>* in the definition below) is assigned to the variable in the statement (*<VAR>* in the definition below), and it can be used in the code block.


```r
for (<VAR> in <VECTOR>) {
    ... code in loop ... 
    }
```

It is, for instance, possible to iterate over a vector and print each of its elements.


```r
east_midlands_cities <- c("Derby", "Leicester", "Lincoln", "Nottingham")
for (city in east_midlands_cities){
  cat(city, "\n")
}
```

```
## Derby 
## Leicester 
## Lincoln 
## Nottingham
```

It is common practice to create a vector of integers on the spot (e.g., using the `:` operator) to execute a certain sequence of steps a pre-defined number of times.


```r
for (iterator in 1:3) {
  cat("Exectuion number", iterator, ":\n")
  cat("    Step1: Hi!\n")
  cat("    Step2: How is it going?\n")
}
```

```
## Exectuion number 1 :
##     Step1: Hi!
##     Step2: How is it going?
## Exectuion number 2 :
##     Step1: Hi!
##     Step2: How is it going?
## Exectuion number 3 :
##     Step1: Hi!
##     Step2: How is it going?
```



## Function definition

Recall from the first lecture that *an* **algorithm** *or effective procedure is a mechanical rule, or automatic method, or programme for performing some mathematical operation* (Cutland, 1980). A **program** is a specific set of instructions that implement an abstract algorithm. The definition of an algorithm (and thus a program) can consist of one or more **function**s, which are sets of instructions that perform a task, possibly using an input, possibly returning an output value.

The code below is a simple function with one parameter. The function simply calculates the square root of a number.


```r
cube_root <- function (input_value) {
   result <- input_value ^ (1 / 3)
   result
}
```

Functions can be defined by typing the definition in the Console in RStudio. However,  entering functions from the command line is not always very convenient. If you make a typing error in an early line of the definition, it isn't possible to go back and correct it. You would have to type in the definition every time you used R A more sensible approach is to type the function definition into an R script.

Create a new R project for this practical, named *Practical_06*. Create a new R script named `functions_practical_06.R`. Copy the definition of `cube_root` in the R script, and save the file. If you execute the script, the R interpreter creates the new function from its definition, which should then be visible in the *Environment* tab in RStudio. 

If you type the instruction below in the *Console*, the function is called using `27` as an argument, thus returning `3`.


```r
cube_root(27)
```

```
## [1] 3
```

It is furthermore possible to load the function(s) defined in one script from another script -- in a fashion similar to when a library is loaded. Create a new R script as part of the *Practical_06* project, named `main_practical_06.R` and copy the code below in that second R script and save the file.


```r
source("functions_practical_06.R")

cube_root(27)
```

Executing the `main_practical_06.R` instructs the interpreter first to run the `functions_practical_06.R` script, thus creating the `cube_root` function, and then invoke the function using `27` as an argument, thus returning again `3`. That is a simple example, but this can be an extremely powerful tool to create your own library of functions to be used by different scripts.


<!--
### Euclid's algorithm

The *Euclid's algorithm* - a method for finding the *greatest common divisor* (GCD) of a pair of numbers -- is a very old example of a procedure that can be defined using a conditional loop.  The GCD of a pair of numbers is the largest number that divides exactly (i.e. with remainder zero) into each number in the pair.

The algorithm is set out below:

- Take a pair of numbers `a` and `b` - let the *dividend* be `max(a, b)`,  and the *divisor* be `min(a, b)`
- *loop* Let the *remainder* be the arithmetic remainder when the *dividend* is divided by the *divisor*
- Replace the *dividend* with the *divisor*
- Replace the **divisor** with the *remainder*
- *back* If the *remainder* is not equal to zero,  repeat from step *loop* to here.
- Once the *remainder* is zero,  the GCD is the *dividend*

Even without considering the details of why this algorithm works,  it should be clear that it makes use of a conditional loop.  The test to see whether further looping occurs in step *back*.  It should also be clear that *divisor*, *dividend* and *remainder* are all variables.  

Given these observations, we can turn Euclid's algorithm into the R function below, and include it in the script `functions_practical_06.R`. Remember, the `%%` symbol is the remainder operator - the value of `x %% y` is the remainder when `x` is divided by `y`.


```r
gcd <- function (a, b) {
    divisor <- min(a, b)
    dividend <- max(a, b)
    repeat { 
        remainder <- dividend %% divisor
        dividend <- divisor
        divisor <- remainder
        if (remainder == 0) break
    }
    dividend
 }
```

Execute the script to instruct the R interpreter to create the new function from its definition, and type the instruction below one by one in the *Console* to observe the results.


```r
gcd(6, 15)
```

```
## [1] 3
```

```r
gcd(25, 75)
```

```
## [1] 25
```

```r
gcd(31, 33)
```

```
## [1] 1
```

As an exercise,  try to match up the lines in the function definition with the lines in the description of Euclid's algorithm.  You may also find it useful to step through an example of `gcd` in debug mode.
-->


## Exercise 6.1

Extend the code in the script `functions_practical_06.R` to include the code necessary to solve the questions below.

**Question 6.1.1:** Write a function that calculates the areas of a circle, taking the radius as the first parameter.

**Question 6.1.2:** Write a function that calculates the volume of a cylinder, taking the radius of the base as the first parameter and the height as the second parameter. The function should call the function defined above and multiply the returned value by the height to calculate the result.

**Question 6.1.3:** Write a function with two parameters, a vector of numbers and a vector of characters (text). The function should check that the input has the correct data type. If all the numbers in the first vector are greater than zero, return the elements of the second vector from the first to the length of the first vector. 

<!--
**Question 6.1.4:** Write a function to compute and print out `gcd(x,60)`  for `x` in the range 1 to `n`.  When this is done,  write another function to compute and print out `gcd(x,y)` for `x` in the range 1 to `n1` and `y` in the range 1 to `n2`.  *Hint:* for this exercise you need to nest one deterministic loop inside another one.  As an additional exercise,  try to modify the `cube_root` function so that it computes the cube root of each element from 0.5 in steps of 0.5 to `n`.
-->



## Data Checking

One issue when writing functions is making sure that the data that has been given to the data is the right kind.  For example,  what happens when you try to compute the cube root of a negative number?


```r
cube_root(-343)
```

```
## [1] NaN
```

That probably wasn't the answer you wanted. As you might remember `NaN` (*Not a Number*) is the value return when a mathematical expression is numerically indeterminate.  In this case,  this is actually due to a shortcoming with the `^` operator in R,  which only works for positive base values.  In fact -7 is a perfectly valid cube root of -343,  since (-7)x(-7)x(-7) = -343.  

To work around this limitation, we can state a conditional rule:

- If `x < 0`: calculate the cube root of x 'normally'.
- Otherwise: work out the cube root of the positive number,  then change it to negative.


Those kind of situations can be dealt with in an R function by using an `if` statement, as shown below. Note how the operator `-` (i.e., the symbol minus) is here used to obtain the inverse of a number, in the same way as `-1` is the inverse of the number `1`.
 

```r
cube_root <- function (input_value) {
    if (input_value >= 0){
        result <- input_value^(1 / 3) 
    }else{
        result <- -( (-input_value)^(1/3) )
    }
    result
} 
```

Edit the code in `functions_practical_06.R` accordingly and test the new function using the two commands listed below from the RStudio *Console*.


```r
cube_root(343)
```

```
## [1] 7
```

```r
cube_root(-343)
```

```
## [1] NaN
```

However, other things can go wrong. For example, `cube_root("Leicester")` would cause an error to occur, `Error in x^(1 / 3) : non-numeric argument to binary operator`. That shouldn't be surprising because cube roots only make sense for numbers,  not character variables.  Thus, it might be helpful if the cube root function could spot this and print a warning explaining the problem,  rather than just crashing with a fairly cryptic error message such as the one above,  as it does at the moment.

The function could be re-written to making use of `is.numeric` in a second conditional statement. If the input value is not numeric, the function returns the value `NA` (*Not Available*) instead of a number. Note that here there is an `if` statement inside another `if` statement, as it is always possible to nest code blocks -- and `if` within a `for` within a `while` within an `if` within ... etc.


```r
cube_root <- function (input_value) { 
    if (is.numeric(input_value)) {
        if (input_value >= 0){
            result <- input_value^(1/3) 
        }else{
            result <- -(-input_value)^(1/3)
        }
        result
    }else{
        cat("WARNING: Input variable must be numeric\n") 
        NA
    }
}
```

Finally, `cat` is a printing function, that instructs R to display the provided argument (in this case, the phrase within quotes) as output in the console. The `\n` in `cat` tells R to add a *newline* when printing out the warning.


<!--
## Debugging

The term *bug* is commonly used in computer science to refer to an error, failure, or fault in a system. The term ``debugging'' in programming thus refers to the procedure of searching for mistakes in the code. This procedure can be simply done by re-reading and revising the written code, but R provides a useful command called `debug`, that allows you to follow the execution of the code, and more easily identify mistakes.

Try debugging the function - since it is working properly,  you won't (hopefully!) find any errors,  but that will demonstrate the debug facility, by typing `debug(cube_root)` in the RStudio *Console*.  That tells R that you want to run `cube_root` in debug mode.  Next enter `cube_root(-50)` in the RStudio *Console* and see how repeatedly pressing the return key steps you through the function.  Note particularly what happens at the `if` statement.  

At any stage in the process, you can type an R expression to check its value.  For instance, when you get to the `if` statement, you can enter `input_value > 0` in the RStudio *Console* to see whether it is true or false.  Checking the value of expressions at various points when stepping through the code is a good way of identifying potential bugs or glitches in your code.  Try running through the code for a few other cube root calculations,  by replacing -50 above with different numbers,  to get used to using the debugging facility.  

When you are done, enter `undebug(cube_root)`. That tells R that you are ready to return `cube_root` to running in normal mode.  For further details about the debugger,  enter `help(debug)` in the RStudio *Console*.
-->

## Exercise 6.2

Create a new R script as part of *Project_06*, named `Data_Wrangling_with_Functions.R`. Copy from the script `Data_Wrangling_Example.R` created in *Project_03* the first part that included loading both datasets, the part that created the tibble `leicester_IMD2015_decile_wide` and the part that left-joined it with `leicester_2011OAC` to create `leicester_2011OAC_IMD2015`.

Add the following snippet of code that uses the `pull` from the `dplyr` library to extract the column `supgrpname` from `leicester_2011OAC` as a vector, and the function `unique` to extract the unique values from the vector. That effectively creates the vector `leicester_2011OAC_supergroups` listing all the names of the supergroups.


```r
leicester_2011OAC_supergroups <- leicester_2011OAC %>%
  pull(supgrpname) %>%
  unique()
```

Extend the code in the script `Data_Wrangling_with_Functions.R` to include the code necessary to solve the questions below -- which as you might notice are a variation on the questions seen in Practical 3.

**Question 6.2.1**: Write a piece of code that loops over the supergroups names in `leicester_2011OAC_supergroups`, and for each one of those generates a table showing the percentage of EU citizens over total population, calculated grouping OAs by the related decile of the Index of Multiple Deprivations. **Tip:** use the `print` function at the end of the pipe that generates the table to print each table.

**Question 6.2.2**: Write a piece of code that loops over the supergroups names in `leicester_2011OAC_supergroups`, and for each one of those calculates the overall percentage of EU citizens over total population, and if that percentage is over 5%, then it prints the name of the supergroup. **Tip:** use `pull` at the end of the pipe to extract the calculated percentage.

**Question 6.2.3**: Write a functions named `median_index` with one input parameter `vector_of_numbers` as a numeric vector, implementing the index shown below where $v$ is `vector_of_numbers` and $index$ is the output value of the function. The index tends to `-1` when the median is close to the minimum, and it tends to `1` when the median is close to the maximum. Write a piece of code that extracts a colum of your choice from the `leicester_2011OAC_IMD2015` dataset as a vector and apply the index.

$$index = \frac{median(v)-min(v)}{max(v)-min(v)} - \frac{max(v)-median(v)}{max(v)-min(v)}$$

**Question 6.2.4**: If implemented carelessly, the index above can encounter a problem when all values are the same. In that case, $max(v)-min(v)$ is zero and thus a division by zero might return a `NaN` value. If you haven't done so yet, edit the function to take that case into account and simply return the value `0` in that case. Furthermore, include a check to verify that the input is a numeric vector.


## Solutions



### Exercise 6.1

**Question 6.1.3**: Write a function with two parameters, a vector of numbers and a vector of characters (text). The function should check that the input has the correct data type. If all the numbers in the first vector are larger than zero, return the elements of the second vector from the first to the length of the first vector. 


```r
function_question_1_3 <- function (in_numbers, in_text) {
  if (is.numeric(in_numbers) & is.character(in_text)) {
    if (all(in_numbers > 0)) {
      return(in_text[1:length(in_numbers)])
    } else {
      cat("Not all numbers are greater than zero")
    }
  }else{
      cat("Input error")
  }
}

# Examples
function_question_1_3(c(2, 3), c("Derby", "Leicester", "Lincoln", "Nottingham") )
function_question_1_3(c(3, -1, 0), c("Derby", "Leicester", "Lincoln", "Nottingham") )
```

### Exercise 6.2

A full R Script is available in the Exercise folder of the repository and on BlackBoard (`06_X_Data_Wrangling_with_Functions.R`). Upload the prepared script to your *Practical_06* project folder, click on the uploaded file to open it in a new editor tab and compare it to your script.
