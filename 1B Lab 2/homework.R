#---
# title: 'Psych 1B Lab 2 Homework'
# author: "School of Psychology - University of Glasgow"
# output: html_document
#---

knitr::opts_chunk$set(echo = TRUE)


## Top tips for successfully completing this assessment 

# * Use the in-class activities as a guide on how to complete each task.

# * Knit the file after each step to ensure that it works.

# * Pay careful attention to spelling and captialisation and always use the variable names we give you.

# * Do not delete any backticks or any of the code at the top or bottom of the grey code chunks. Only edit the `NULL` values. 

# **Before you get started on the tasks, ensure that this .Rmd file is saved in your Psych 1B folder that has the data files and that you have set your working directory to this folder.**

## Activity 1

# In the code chunk below, type in the correct code to load the tidyverse package and load the relevant data into `scoring`, `responses`, and `qformats`.

library(tidyverse)
scoring <- read_csv('scoring.csv')
responses <- read_csv('responses.csv')
qformats <- read_csv('qformats.csv')


## Activity 2 

# Transform the questionnaire data in `responses` from wide-format to long-format using `pivot_longer()`and store it in an object named `responses_long`.

responses_long <- pivot_longer(responses, names_to = "Question", values_to = "Response", cols = Q1:Q10)


## Activity 3

# Create a new object called `responses_long100` that contains only the data from participant 100.

responses_long100 <- filter(responses_long, Id == 100)


## Activity 4 

# Create an object named `join1` that joins together `responses_long100` and `qformats` then create an object named that joins this dataset with `scoring` by all their common columns.

join1 <- inner_join(responses_long100, qformats, "Question")
scores_100 <- inner_join(join1, scoring, c("Response", "QFormat"))



## Activity 5

# Use `summarise()` to calculate the total AQ score for participant 100. Replace the NULL in the t05 code chunk below with this score. 

AQ_100 <- summarise(scores_100, AQ_score = sum(Score))


## Activity 6

# Now, do the same steps as above but for all participants. First, create an object named `join2` that joins together `responses_long` and `qformats` and then an object named `all_scores` that joins together `join2` and `scoring` by all their common columns. 

join2 <- inner_join(responses_long, qformats, "Question")
all_scores <- inner_join(join2, scoring, c("Response", "QFormat"))


## Activity 7

# Next, group the data by `Id` and store it in `all_grouped` and then used this grouped data and `summarise()` to calculate the total AQ score for each participant. Store this in `all_AQ` and name the variable that contains the scores `total_score`.

all_grouped <- group_by(all_scores, Id)
all_AQ <- summarise(all_grouped, total_score = sum(Score))


## Activity 8

# Run `summary()` on `all_AQ` and view the results. Replace the NULL below with the mean total AQ score rounded to 2 decimal places.

summary(all_AQ)
mean_AQ <- 3.08


## Activity 9

# Copy, paste, and run the below code to generate the histogram of the AQ scores. This graph will not display when you knit the file. This is ok.

ggplot(all_AQ, aes(x = total_score)) +
  geom_histogram(binwidth = 1, colour = "black", fill = "grey") +
  theme_minimal()+
  scale_x_continuous(name = "Total AQ Score", breaks = c(0,1,2,3,4,5,6,7,8,9,10)) +
  scale_y_continuous(name = "Count")


# It is important to understand the distribution of your data. Skewness is the degree of distortion from the symmetrical bell curve or the normal distribution. It measures the lack of symmetry in data distribution. There are two types of skew:

# Positive Skewness means when the tail on the right side of the distribution is longer or fatter. The mean and median will be greater than the mode.

# Negative Skewness is when the tail of the left side of the distribution is longer or fatter than the tail on the right side. The mean and median will be less than the mode.

# The way I (Emily) remember this is "where there is skew, there are few".

# If you would like more information about skewness, visit the below website.

# https://codeburst.io/2-important-statistics-terms-you-need-to-know-in-data-science-skewness-and-kurtosis-388fef94eeaa

# Look at the distribution of the total AQ scores. Are the data:

# 1. Positively skewed
# 2. Negatively skewed
# 3. Not skewed/symmetrical

# Replace the NULL below with the number that corresponds to your answer. Please only use a single number, do not write the answer in words. 

skew <- 1


## Activity 10

# Look at the above histogram. What is the modal score?

# Replace the NULL below with your answer.

modeal_score <- 2


## Activity 11

# What is the correct definition of a p-value?

# 1. The probability that the results are due to chance
# 2. The probability of the observed data under the null hypothesis
# 3. The probability of the observed data under the alternative hypothesis

# Replace the NULL below with the number that corresponds to your answer. Please only use a single number, do not write the answer in words. 

p_value <- 2


# Check that you can knit the file to make sure that there are no problems with the code (this does not necessarily mean you have the correct answer, it just means that you have provided legal code). If you have any problems, you can attend the practice sessions or PAL (keep an eye on your e-mail for details of when and where these run).

# Finally, upload your homework assessment to the link in the homework section of the Level 1B Practical Moodle by 12 noon 1 week from your lab. 
