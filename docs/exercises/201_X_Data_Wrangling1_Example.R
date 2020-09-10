##########
# Example for Practical 3
# Author: Stefano De Sabbata
# Date: 18 October 2019
# Licensed under the GNU General Public License v3.0 https://www.gnu.org/licenses/gpl-3.0.html
##########

library(tidyverse)
library(knitr)
library(nycflights13)

flights_from_nyc <- nycflights13::flights

# Exercises solutions -----------------------------------------------------

# Solution to question 3.1.1
# Write a piece of code using the pipe operator and the `dplyr` library to generate 
# a table showing the average air time in hours, 
# calculated grouping flights by carrier, 
# but only for flights starting from the JFK airport.

flights_from_nyc %>%
  select(flight, origin, carrier, air_time) %>%
  filter(origin == "JFK") %>%
  filter(!is.na(air_time)) %>%
  group_by(carrier) %>%
  summarize(
    avg_air_time = mean(air_time)
  ) %>%
  mutate(
    avg_air_time_hours = avg_air_time / 60
  ) %>%
  select(-avg_air_time) %>%
  kable()

# Solution to question 3.1.2
# Write a piece of code using the pipe operator and the `dplyr` library to generate 
# a table showing the average arrival delay compared to the overall air time 
# (**tip**: use manipulate to create a new column that takes the result of `arr_delay / air_time`) 
# calculated grouping flights by carrier, 
# but only for flights starting from the JFK airport.

flights_from_nyc %>%
  select(flight, origin, carrier, arr_delay, air_time) %>%
  filter(origin == "JFK") %>%
  filter(!is.na(arr_delay)) %>%
  filter(!is.na(air_time)) %>%
  group_by(carrier) %>%
  mutate(
    arr_delay_prop = arr_delay / air_time
  ) %>%
  summarize(
    avg_arr_delay_prop = mean(arr_delay_prop)
  ) %>%
  kable()

# Solution to question 3.1.3
# Write a piece of code using the pipe operator and the `dplyr` library to generate 
# a table showing the average arrival delay compared to the overall air time 
# calculated grouping flights by origin and destination, 
# sorted by destination.

flights_from_nyc %>%
  select(flight, origin, dest, carrier, arr_delay, air_time) %>%
  filter(!is.na(arr_delay)) %>%
  filter(!is.na(air_time)) %>%
  group_by(origin, dest) %>%
  mutate(
    arr_delay_prop = arr_delay / air_time
  ) %>%
  summarize(
    avg_arr_delay_prop = mean(arr_delay_prop)
  ) %>%
  arrange(dest) %>%
  kable()
