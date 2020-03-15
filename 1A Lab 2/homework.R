#---
# title: 'Level 1 Lab 2: Homework'
# author: "School of Psychology - University of Glasgow"
# date: "Semester 1 2019"
# output: html_document
#---

knitr::opts_chunk$set(echo = TRUE)

## Top tips for successfully completing this assessment 

# * Use the lab 2 in-class activities as a guide on how to complete each task (HINT: you have done these tasks before but you used different data/variables ;))

# * Attend the Research Methods lecture in week 3 and consult the lecture slides.

# * Do not delete any backticks or any of the code at the top or bottom of the grey code chunks. Only edit the `NULL` values. 

# **Before you get started on the tasks, ensure that this .Rmd file is saved in your Lab 2 folder that has the data files and that you have set your working directory.**

# *NOTE:* use the variable names provided to you (e.g., `dat`, `pinfo`, `all_dat`). Please do not change or re-type the names of the variables!

## Activity 1

# In the code chunk below, type in the correct code to load the tidyverse package.

library(tidyverse)


## Activity 2 

# Replace the NULLs below with the code that reads in the data files `ahi-cesd.csv` and `participant-info.csv` and save them in two objects named `dat` and `pinfo`.

dat <- read_csv("ahi-cesd.csv")
pinfo <- read_csv("participant-info.csv")


## Activity 3

# Replace the NULL to join the two data frames together by all common columns between the two datasets. Store this in an object named `all_dat`.

all_dat <- inner_join(x = dat, y = pinfo, by = c("id","intervention"))


## Activity 4 

# Replace the NULL with the code that selects the following variables in this order - id, sex, age, ahiTotal and  cesdTotal. Store this in `summarydata`. Note that these are different variables and in a different order than the one you did in the Lab 2 activities.

summarydata <- select(.data = all_dat, id, sex, age, ahiTotal, cesdTotal)


## Activity 5

# Run `summary()` on `summarydata` to check the data. Replace the NULL below with the mean `ahiTotal` score to 2 decimal places. Please use numbers to answer this question, please do not use code. 

summary(summarydata)
mean_ahi <- 72.79


## Activity 6

# Replace the NULL below with the age of the oldest participant in whole years. Please use numbers to answer this question, please do not use code. 

oldest <- 83


## Activity 7

# Run the below code chunk to produce a plot of depression scores by sex (when you knit the file it will not produce the plot, this is ok).

ggplot(all_dat, aes(x = as.factor(sex), y = cesdTotal, fill = as.factor(sex))) +
  geom_violin(trim = FALSE, show.legend = FALSE, alpha = .4) +
  geom_boxplot(width = .2, show.legend = FALSE, alpha = .7)+
  scale_x_discrete(name = "Sex") +
  theme_minimal() +
  scale_fill_viridis_d()


# Which sex has the highest median depression scores? Replace the NULL below with "M" for male or "F" for female. Be sure to include the quotation marks and use a capital letter. 

sex_cesd <- "F"


# The following questions relate to content covered in the week 3 Research Methods lecture.

## Activity 8

# Is `educ` a between-subject or within-subject variable? Replace the NULL below with the number that corresponds to your answer. Please only use a single number, do not write the answer in words. 

# 1. Between-subject
# 2. Within-subject

income_variable <- 1


## Activity 9

# A researcher states the hypothesis "People with low incomes will have higher depression scores than those on average or high incomes".

# Is this hypothesis:

# 1. Directional
# 2. Non-directional

# Replace the NULL below with the number that corresponds to your answer. Please only use a single number, do not write the answer in words. 

hypothesis <- 1


## Activity 10

# Imagine that your results show that happiness scores increase with age. Is this an example of a:

# 1. Positive correlation
# 2. Negative correlation

# Replace the NULL below with the number that corresponds to your answer. Please only use a single number, do not write the answer in words. 

correlation <- 1


## Activity 11

# An independent variable is a variable:

# 1. That a researcher measures
# 2. That a researcher manipulates or changes

# Replace the NULL below with the number that corresponds to your answer. Please only use a single number, do not write the answer in words. 

iv <- 2


# Well done! You have started on your journey to become a confident and competent member of the open scientific community! Check that you can knit the file to make sure that there are no problems with the code (this does not necessarily mean you have the correct answer, it just means that you have provided legal code). If you have any problems, you can attend the practice sessions or PAL (keep an eye on your e-mail for details of when and where these run).

# Finally, upload your homework assessment to the link in the homework section of Level 1A Practical Moodle by 12pm 1 week from your lab. 

