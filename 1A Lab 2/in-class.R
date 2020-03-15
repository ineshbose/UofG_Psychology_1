#---
# title: "Level 1 Lab 2: In-Class"
# author: "Inesh Bose"
# date: "Semester 1 2019"
# output: html_document
#---

# * After you complete each activity you should knit the file. This will make it easier to spot when errors have crept into your code rather than waiting until the end and trying to figure out where things have gone wrong.
# * Use the whitespace to add your own notes (e.g., if you make an error, note down what the error was and how you fixed it).
# * You can add additional code chunks if needed.
# * Be careful not to delete or add any backticks () or to change the chunk name (e.g., a1)

## Activity 3

library(tidyverse)


## Activity 4

dat <- read_csv ("ahi-cesd.csv")
pinfo <- read_csv("participant-info.csv")


## Activity 6

all_dat <- inner_join(x = dat, y = pinfo, by = c("id", "intervention"))


## Activity 7

summarydata <- select(.data = all_dat, ahiTotal, cesdTotal, sex, age, educ, income, occasion, elapsed.days)


## Activity 8

ggplot(summarydata, aes(x = as.factor(sex), fill = as.factor(sex))) +
  geom_bar(show.legend = FALSE, alpha = .8) +
  scale_x_discrete(name = "Sex") +
  scale_fill_viridis_d(option = "E") +
  scale_y_continuous(name = "Number of participants")+
  theme_minimal()

ggplot(summarydata, aes(x = as.factor(income), y = ahiTotal, fill = as.factor(income))) +
  geom_violin(trim = FALSE, show.legend = FALSE, alpha = .4) +
  geom_boxplot(width = .2, show.legend = FALSE, alpha = .7)+
  scale_x_discrete(name = "Income", labels = c("Below Average", "Average", "Above Average")) +
  scale_y_continuous(name = "Authentic Happiness Inventory Score")+
  theme_minimal() +
  scale_fill_viridis_d()



