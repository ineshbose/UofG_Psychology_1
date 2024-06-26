#---
# title: 'Level 1 Lab 4: Homework'
# author: "School of Psychology - University of Glasgow"
# date: "Semester 1 2019"
# output: html_document
#---

{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)


## Top tips for successfully completing this assessment 

# * Use the lab 4 in-class activities as a guide on how to complete each task (HINT: you have done these tasks before but you used different data/variables ;))

# * Attend the Research Methods lectures and consult the lecture slides.

# * Do not delete any backticks or any of the code at the top or bottom of the grey code chunks. Only edit the `NULL` values. 

# **Before you get started on the tasks, ensure that this .Rmd file is saved in your Lab 3 folder that has the data files and that you have set your working directory.**

*NOTE:* use the variable names provided to you (e.g., `dat`, `pinfo`, `all_dat`). Please do not change or re-type the names of the variables!
 
## Activity 1 

# In the code chunk below, replace the `NULL` with the correct code to load the tidyverse package.

library(tidyverse)


## Activity 2 

# Replace the NULLs below with the code that reads in the data files `ahi-cesd.csv` and `participant-info.csv` and save them in two objects named `dat` and `pinfo`.

dat <- read_csv('ahi-cesd.csv')
pinfo <- read_csv('participant-info.csv')


## Activity 3

# Replace the NULL to join the two data frames together by all common columns between the two datasets. Store this in an object named `all_dat`.

all_dat <- inner_join(dat, pinfo, by = c("id","intervention"))


## Activity 4

# Select the following variables in this order, total happiness score, total depression score, sex, age, education level, income, and measurement occasion, and store in 'summarydata`.

summarydata <- select(.data = all_dat, ahiTotal, cesdTotal, sex, age, educ, income, occasion)



## Activity 5

# Use `mutate()` to convert `sex`, `educ`,`income` and `occasion` from `summarydata` into factors. Overwrite the existing variables and objects so that `summarydata` now contains these variables as factors.

summarydata <- summarydata %>%
  mutate(sex = as.factor(sex), educ = as.factor(educ), income = as.factor(income), occasion = as.factor(occasion))



## Activity 6

# Use ggplot to create a scatterplot that has `ahiTotal` on the x-axis and `age` on the y-axis. You do not need to change the labels or colours or make it look fancy, just a basic plot will do. Use the data from `summarydata`. 

ggplot(summarydata, aes(x = ahiTotal, y = age))+
  geom_point()


## Activity 7

# Use `ggplot()` to make a violin-boxplot that shows `cesdTotal` scores for each `occasion`. Use the data from `summarydata`. Be careful to change the axis labels as necessary.

ggplot(summarydata, aes(x = occasion, y = cesdTotal, fill = occasion))+
  geom_violin(trim = FALSE, show.legend = TRUE, alpha = .4)+
  geom_boxplot(width = .2, show.legend = TRUE, alpha = .7)+
  scale_x_discrete(name = "Measurement Occasion")+
  scale_y_continuous(name = "Total Depression Score")+
  theme_minimal()+
  scale_fill_viridis_d()


## Activity 8

# Use`ggplot()` to make a bar plot that shows how many participants were in each education category and use the data from `summarydata`. You do not need to make the plot look fancy or change the axis labels, just a simple plot will do. 

ggplot(summarydata, aes(x = educ, fill = educ))+
  geom_bar()


## Activity 9

# Look at the bar plot you created in Activity 8. Which education level was reported by the most participants? Replace the NULL below with the number that corresponds to your answer. Please only use a single number, do not write the answer in words. 

# 1. Less than Year 12
# 2. Year 12
# 3. Vocational training
# 4. Bachelor’s degree
# 5. Postgraduate degree

answer_9 <- 5


## Activity 10

# The value or score that appears most often in a dataset is known as the :

# 1. Mode
# 2. Median
# 3. Mean

# Replace the NULL below with the number that corresponds to your answer. Please only use a single number, do not write the answer in words. 

answer_10 <- 1


## Activity 11

# In Activity 6 you created a scatterplot that showed the relationship between age and happiness scores. What type of research design does this represent?

# 1. Experimental - within-subjects
# 2. Experimental - between-subjects
# 3. Observational - correlation
# 4. Observational - qualitative

answer_11 <- 3



### Well done! This is the final R homework for Psych 1A - take a moment to recognise how much you've learned and how much you're able to do. You can now do basic data wrangling and visualisation and you can do it in an open and reproducible way - you don't know any different because you've never been taught anything else but trust us, that's amazing and it makes you some of the most competitive and highly skilled psychology students in the UK. Congratulations! Upload your homework assessment  by 12pm 1 week from your lab.