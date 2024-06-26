#---
# title: 'Psych 1B Lab 4 Homework'
# author: "School of Psychology - University of Glasgow"
# output: html_document
#---

knitr::opts_chunk$set(echo = TRUE)


## Top tips for successfully completing this assessment 

# * Use the in-class activities as a guide on how to complete each task.

# * Knit the file after each step to ensure that it works.

# * Pay careful attention to spelling and captialisation and always use the variable names we give you.

# * Do not delete any backticks or any of the code at the top or bottom of the grey code chunks. Only edit the `NULL` values. 

## Activity 1

# In the code chunk below, type in the correct code to load the tidyverse package. You do not need to load any datasets this week.

library(tidyverse)


# The next three questions will all be based on IQ scores. IQ tests are standardised so that scores follow a normal distribution, with a mean of 100 and a standard deviation of 15. If you'd like to read more about intelligence and testing, there's a Noba chapter on it here https://nobaproject.com/modules/intelligence.

## Activity 2 

# Calculate the probability of a person recieving an IQ score of more than 120.

# Replace the `NULL` in the t02 code chunk with your answer rounded to 2 decimal places. Do not save the code, save the number.

pnorm(q = 120, mean = 100, sd = 15, lower.tail = FALSE)
answer_2 <- 0.09


## Activity 3

# Calculate the highest IQ score that would place you in the bottom 5% of IQ scores.

# Replace the `NULL` in the t03 code chunk with your answer rounded to 2 decimal places.Do not save the code, save the number.

qnorm(p = 0.05, mean = 100, sd = 15, lower.tail = TRUE)
answer_3 <- 75.33


## Activity 4 

# Mensa is the high IQ society and is open to anyone who can demonstrate an IQ in the top two per cent of the population https://www.mensa.org.uk/iq-tests. What is the minimum IQ score you need to join Mensa?

# Replace the `NULL` in the t04 code chunk with your answer rounded to 2 decimal places.Do not save the code, save the number.

qnorm(p = 0.02, mean = 100, sd = 15, lower.tail = FALSE)
answer_4 <- 130.81


# The next three questions all relate to the binomial distribution. Imagine you're at the casino and you're playing routlette. A roulette wheel normally has 36 pockets, each of which is either red or black and has a number on it and people bet on what colour/number pocket a ball will land in when the wheel is spun.

# * There are an equal number of red and black pockets
# * There are an equal number of odd and even numbered pockets
# * There are an equal number of low (1-18) and high (19-36) numbers

## Activity 5

# Calculate the probability of the ball landing on red 5 times in a row.

# Replace the `NULL` in the t05 code chunk with your answer rounded to 2 decimal places. Do not save the code, save the number.

answer_5 <- 0.03


## Activity 6

# Calculate the probability of only getting one odd number from 10 spins of the wheel.

# Replace the `NULL` in the t06 code chunk with your answer rounded to 2 decimal places. Do not save the code, save the number.

pbinom(q = 1, size = 10, prob = 0.5)
answer_6 <- 0.01


## Activity 7

# Calculate the probabilty of getting more than 5 high numbers in 20 spins of the wheel.

# Replace the `NULL` in the t07 code chunk with your answer rounded to 2 decimal places. Do not save the code, save the number.

pbinom(q = 5, size = 20, prob = 0.5, lower.tail = TRUE)
answer_7 <- 0.02


# The final four questions are going to give you examples of different experimental results.

## Activity 8

# A researcher runs an experiment to look at the impact of caffiene on reaction times. They have two groups, a control group that drinks decaff coffee and the experimental group that drinks caffienated coffee and then they measure reaction times, which are normally distributed in both groups. 

# The decaff group has a mean reaction time of 350ms with a standard deviation of 23. The caffinated group has a mean reaction time of 300ms with a standard deviation of 20. 

# What is the probability that someone in the decaffinated group would have the mean reaction time of the caffinated group?

# Replace the `NULL` in the t08 code chunk with your answer rounded to 2 decimal places. Do not save the code, save the number.

answer_8 <- NULL # Error in Question


## Activity 9

# A researcher designs an educational intervention that they think will help students learn more and will raise test scores. The test has 100 questions and each question can be scored correct or incorrect. The researcher knows from pilot testing that before the intervention, students perform at chance accuracy on the test, i.e., they have a 50% chance of getting each question correct. 

# What is the minimum score a student would have to achieve on the test after the intervention for the researcher to be able to say that there's only a 5% probability that they would have achieved this score without the intervention?

# Replace the `NULL` in the t09 code chunk with your answer rounded to 2 decimal places. Do not save the code, save the number.

qbinom(p = .05, size = 100, prob = .5, lower.tail = FALSE)
answer_9 <- 58


## Activity 10

# The same researcher from Activity 9 decides to do another version of the intervention, but this time the test only has 10 questions rather than 100. What is the minimum score a student would have to achieve on this shorter test for the researcher to be able to say that there's only a 5% probability that they would have achieved this score without the intervention? 

# Replace the `NULL` in the t10 code chunk with your answer rounded to 2 decimal places. Do not save the code, save the number.

qbinom(p = .05, size = 10, prob = .5, lower.tail = FALSE)
answer_10 <- 8


## Activity 11

# The researcher from Activity 9 and 10 just won't let up. Run the below code chunk to create a plot that simulates the results of 10,000 students' test performance on the 100 question test before the intervention.

library(tidyverse)
binom_dat <- replicate(n = 10000, expr = sample(0:1, 100, TRUE) %>% sum())

dat <- tibble(correct = binom_dat) %>%   
                group_by(correct) %>%      
                summarise(n = n(), 
                          p=n/10000) 

ggplot(dat, aes(x = correct,y = p)) + 
  geom_bar(stat = "identity", aes(fill = correct > 58), show.legend = FALSE, alpha = .8) + 
  labs(x = "Number of Questions Correct", y = "Probability of Number of Questions Correct from 100 (p)") +
  theme_bw() +
  scale_x_continuous(breaks = c(35,40,45,50,55,60,65,70)) +
  scale_fill_viridis_d(option = "E")


# Which code would you use if you wanted to calculate the probability of the yellow part of the plot?

# 1. `pbinom(q = 58, size = 100, prob = .5, lower.tail = FALSE)`
# 2. `pbinom(q = 58, size = 100, prob = .5, lower.tail = TRUE)`

# Replace the NULL below with the number of your answer. Do not save the code, save the number and do not put the number in quotation marks. 

answer_11 <- 1


# Check that you can knit the file to make sure that there are no problems with the code (this does not necessarily mean you have the correct answer, it just means that you have provided legal code). If you have any problems, you can attend the practice sessions or PAL (keep an eye on your e-mail for details of when and where these run).

# Finally, upload your homework assessment to the link in the homework section of the Level 1B Practical Moodle by 12 noon 1 week from your lab and then celebrate having submitted your final 1st year R homework! 
