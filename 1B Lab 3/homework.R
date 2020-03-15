#---
# title: 'Psych 1B Lab 3 Homework'
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

# Create an object named `join` that joins together `responses_long` and `qformats` and then an object named `scores` that joins together `join` and `scoring` by all their common columns. 

join <- inner_join(responses_long, qformats, "Question")
scores <- inner_join(join, scoring, c("QFormat", "Response"))


## Activity 4 

# Rewrite the below code using pipes to form a single pipeline in the t04 code chunk and save the final # output in an object named `pipe1`

responses_long <- pivot_longer(data = responses, names_to = "Question", values_to = "Response", cols = Q1:Q10)

responses_filtered <- filter(responses_long, Question == "Q1")

pipe1 <- pivot_longer(data = responses, names_to = "Question", values_to = "Response", cols = Q1:Q10) %>%
  filter(Question == "Q1")
  


## Activity 5

# Rewrite the below code using pipes to form a single pipeline in the t05 code chunk and save the final # output in an object named `pipe2`

responses_male <- filter(scores, gender == "male")

male_scores <- responses_male %>%
  summarise(mean_score = mean(Score, na.rm = TRUE))

pipe2 <- filter(scores, gender == "male") %>%
  summarise(mean_score = mean(Score, na.rm = TRUE))


## Activity 6 

# Rewrite the below code using pipes to form a single pipeline in the t06 code chunk and save the final # output in an object named `pipe3`

responses_Q2 <- filter(scores, Question == "Q2")

grouped_gender <- group_by(responses_Q2, gender)

scores_by_gender <- summarise(grouped_gender, mean_scores = mean(Score, na.rm = TRUE))

pipe3 <- filter(scores, Question == "Q2") %>%
  group_by(gender) %>%
  summarise(mean_scores = mean(Score, na.rm = TRUE))


## Activity 7

# Rewrite the below code using pipes to form a single pipeline in the t07 code chunk. You do not need to save the resulting plot to an object. 

grouped_Id <- group_by(scores, Id, gender)

scores_by_Id <- summarise(grouped_Id, tot_scores = sum(Score, na.rm = TRUE))

ggplot(scores_by_Id, aes(gender, tot_scores, fill = gender)) +
  geom_boxplot(show.legend = FALSE) +
  scale_fill_viridis_d() +
  theme_minimal()

group_by(scores, Id, gender) %>%
  summarise(tot_scores = sum(Score, na.rm = TRUE)) %>%
  ggplot(aes(gender, tot_scores, fill = gender)) +
  geom_boxplot(show.legend = FALSE) +
  scale_fill_viridis_d() +
  theme_minimal()


## Activity 8

# Using the data from `scores`, calculate the total (sum) AQ score using `summarise()` for each participant (i.e., grouped by Id), then, create a density plot of these scores. Do this all in a single pipeline. Your plot should look like the plot in the instruction file.

group_by(scores, Id) %>%
  summarise(AQ_score = sum(Score)) %>%
  ggplot(aes(x = AQ_score, fill = Id)) +
  geom_density(alpha = .3) +
  theme_minimal() +
  scale_fill_viridis_d(option = "D") +
  scale_x_continuous(name = "Total AQ Score", breaks = c(1,2,3,4,5,6,7,8,9,10)) +
  scale_y_continuous(name = "Density")


## Activity 9

# Next, group the data in `scores` by `Id` and then use this grouped data and `summarise()` to calculate the total AQ score for each participant. Store this in `all_AQ` and name the variable that contains the scores `total_score`.

all_AQ <- group_by(scores, Id) %>%
  summarise(AQ_score = sum(Score))



## Activity 10

# Using the data from `all_AQ`, calculate the mean, median, standard deviation, minimum and maximum AQ scores across all participants using `summarise()` and save it in the object `descriptive_stats`. Your table should look **exactly** like the table in the instruction file, i.e., make sure that the names of the columns are identical and in the same order. 

descriptive_stats <- summarise(all_AQ, mean_score = mean(AQ_score), median_score = median(AQ_score),
                               standard_deviation = sd(AQ_score), minimum_score = min(AQ_score),
                               maximum_score = max(AQ_score))


## Activity 11

# Which of the following measures of central tendancy is most likely to be affected by outliers:

# 1. Mean
# 2. Median
# 3. Mode

# Replace the NULL below with the number of your answer. Please use a single number, please do not write the answer in words.

activity_11 <- 1


# Check that you can knit the file to make sure that there are no problems with the code (this does not necessarily mean you have the correct answer, it just means that you have provided legal code). If you have any problems, you can attend the practice sessions or PAL (keep an eye on your e-mail for details of when and where these run).

# Finally, upload your homework assessment to the link in the homework section of the Level 1B Practical Moodle by 12 noon 1 week from your lab. 

