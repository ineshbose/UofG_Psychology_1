#---
# title: 'Level 1 Lab 3: Homework'
# author: "School of Psychology - University of Glasgow"
# date: "Semester 1 2019"
# output: html_document
#---

knitr::opts_chunk$set(echo = TRUE)


## Top tips for successfully completing this assessment 

# * Use the lab 3 in-class activities as a guide on how to complete each task (HINT: you have done these tasks before but you used different data/variables ;))

# * Attend the Research Methods lectures and consult the lecture slides.

# * Do not delete any backticks or any of the code at the top or bottom of the grey code chunks. Only edit the `NULL` values. 

# **Before you get started on the tasks, ensure that this .Rmd file is saved in your Lab 3 folder that has the data files and that you have set your working directory.**

# *NOTE:* use the variable names provided to you (e.g., `dat`, `pinfo`, `all_dat`). Please do not change or re-type the names of the variables!

## Activity 1 

# In the code chunk below, replace the `NULL` with the correct code to load the tidyverse package.

library(tidyverse)


## Activity 2 

# Replace the NULLs below with the code that reads in the data files `ahi-cesd.csv` and `participant-info.csv` and save them in two objects named `dat` and `pinfo`.

dat <- read_csv('ahi-cesd.csv')
pinfo <- read_csv('participant-info.csv')



## Activity 3

# Replace the NULL to join the two data frames together by all common columns between the two datasets. Store this in an object named `all_dat`.

all_dat <- inner_join(dat, pinfo, by = c("id", "intervention"))


## Activity 4 

# Replace the NULL with the code that selects the following variables in this order: id, age, sex, cesdTotal, and ahiTotal. Store this in `summarydata`. 

summarydata <- select(all_dat, id, age, sex, cesdTotal, ahiTotal)


## Activity 5

# Arrange the data in summarydata with highest cesdTotal score first and save it in an object called dep_sort.

dep_sort <- arrange(summarydata, by = desc(cesdTotal))


## Activity 6 

# Filter summarydata by removing those who are under 20 years of age and save it as a new object named age20min.

age20min <- filter(summarydata, age>=20)


## Activity 7

# Group the data stored in age20min by sex, and save it as a new object named data_sex 

data_sex <- group_by(age20min, sex)


## Activity 8

# Use summarise to calculate the median `cesdTotal` score for male and female participants using the grouped data and store it in a new object named `data_median`. Then, view the object and replace the NULLs in median_score_M and median_score_F with the median scores to 1 decimal place for each respective sex. Please replaces these nulls with numbers, please do not use code. 

data_median <- summarise(data_sex, median_score=median(cesdTotal))
median_score_M <- 12.0
median_score_F <- 9.5


## Activity 9

# Use mutate to create a new column called `Depression_Male` which evaluates whether participants score above the median cesdTotal score for males. Store this in the existing tibble `data_sex`.

data_sex <- mutate(data_sex, Depression_Male = (cesdTotal > 12))


## Activity 10

# Run the below code chunk to produce a plot of the number of participants who have a depression score above or below the median for male participants. This plot will not display when you knit the file. This is ok. 

ggplot(data_sex, aes(x = as.factor(Depression_Male), fill = as.factor(Depression_Male))) +
  geom_bar(show.legend = FALSE, alpha = .8) +
  scale_x_discrete(name = "Depression Score Above Male Median") +
  scale_fill_viridis_d(option = "E") +
  scale_y_continuous(name = "Number of participants")+
  theme_minimal()


# Are there more participants who have a depression score above the median score for males than those who score below? Replace the NULL below with the number that corresponds to your answer. Please only use a single number, do not write the answer in words. 

# 1. There are more participants who score **above** the median score for males than there are participants who score **below** the median score for males.
# 2. There are more participants who score **below** the median score for males than there are participants who score **above** the median score for males.


answer_10 <- 2


## Activity 11

# Why should you only use bar plots to display counts rather than aggregated data such as means?

# 1. Because they show standard deviation.
# 2. Because they show standard error.
# 3. Because they hide the true distribution of the data. 
# 4. Because they show the true distribution of the data. 

answer_11 <- 3


# Well done! Check that you can knit the file to make sure that there are no problems with the code (this does not necessarily mean you have the correct answer, it just means that you have provided legal code). If you have any problems, you can attend the practice sessions or PAL (keep an eye on your e-mail for details of when and where these run).

# Finally, upload your homework assessment to the link in the homework section of Level 1A Practical Moodle by 12pm 1 week from your lab. 
 