# DAY 5 HOMEWORK
#
# Name: Kishi Suzuan

# NOTE: In the text below, backticks ``
# are used to indicate code. For example, `library(tidyverse)`

# Before doing anything else, load the packages you need for this assignment:
# `tidyverse` and `nycflights13`
library(tidyverse)
library(nycflights13)

# Q1. The `nycflights13` package includes a dataframe called `planes` that
# contains data for each airplane such as manufacturer, model, etc.
#
# Join the `planes` dataframe to the `flights` dataframe, keeping all rows in
# `flights`. Save the result as answer_1
#colnames(planes)
#colnames(flights) 
#you see tailnum is common
# HINT: the `tailnum` column uniquely identifies each airplane.

answer_1 <- flights |>
  left_join(planes, join_by(tailnum == tailnum))
#colnames(answer_1) Check the rows

# Q2. Use answer_1 to count the number of flights made by each manufacturer,
# then sort the results so the manufacturer with the most flights is at the top.
# Save the result as answer_2
#
# HINT: use `count()`
answer_2 <- 
  answer_1 |> 
  count(manufacturer) |>
  arrange(desc(n)) 

# Q3. Does every flight in the `flights` dataframe have a corresponding
# airplane in `planes`?
#
# Save your answer as a logical vector (either TRUE or FALSE) to answer_3
#How identify each flight to verify every flights has corresponding plane ? 
#perhaps: It is not problem that the same-tailnum-(unique)plane arrive for manytimes.
# if the tailnum is not NA, every flights might have corresponding airplane.
#flights |>
 # count(tailnum)|>
  #filter(n>1)

#?answer_3 <- flights |>
 # filter(is.na(tailnum))

answer_3 <- answer_1 |>
  filter(is.na(tailnum))
  

# Q4. The `nycflights13` package includes a dataframe called `airlines` that
# includes the name of each airline and its corresponding carrier code.
# For example, the carrier code for American Airlines Inc. is AA.
#
# Join the `airlines` dataframe to the `flights` dataframe, keeping all rows in
# `flights`. Save the result as answer_4
answer_4 <- flights |>
  left_join(airlines, join_by(carrier == carrier))

# Q5. Use answer_4 to find the average arrival delay(arr_delay) for each airline
#to identify each airline, I am using (name).
# Exclude missing values from your calculation.
# Save the result as answer_5
#
answer_5 <- answer_4 |>
  group_by(name) |>
  summarize(mean_delay = mean(arr_delay, na.rm = TRUE))

# HINT: remember that you can use `group_by()` and `summarize()` together to
# calculate summary statistics for each group in the data.
#
# HINT: when you use functions like `mean()`, `max()`, or `min()`, use the
# option `na.rm = TRUE` to exclude missing values from the calculation

