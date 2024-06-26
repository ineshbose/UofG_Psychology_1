#---
# title: "Level 1 Lab 4: Pre-Class"
# author: "Inesh Bose"
# date: "Semester 1 2019"
# output: html_document
#---

# * After you complete each activity you should knit the file. This will make it easier to spot when errors have crept into your code rather than waiting until the end and trying to figure out where things have gone wrong.
# * Use the whitespace to add your own notes (e.g., if you make an error, note down what the error was and how you fixed it).
# * You can add additional code chunks if needed.
# * Be careful not to delete or add any backticks () or to change the chunk name (e.g., a1)


## Activity 2

library(tidyverse) 

dat <- read_csv('ahi-cesd.csv')
pinfo <- read_csv('participant-info.csv')
all_dat <- inner_join(dat, pinfo, by= c("id", "intervention"))
summarydata <- select(.data = all_dat, ahiTotal, cesdTotal, sex, age, educ, income, occasion, elapsed.days) 


## Activity 3

str(summarydata)

summarydata <- summarydata %>%
  mutate(sex = as.factor(sex), educ = as.factor(educ), income = as.factor(income))


## Activity 4

ggplot(summarydata, aes(x = sex))

ggplot(summarydata, aes(x = sex)) + geom_bar()

ggplot(summarydata, aes(x = sex, fill = sex)) + geom_bar()

ggplot(summarydata, aes(x = sex, fill = sex)) + geom_bar(show.legend = FALSE)

ggplot(summarydata, aes(x = sex, fill = sex)) +
  geom_bar(show.legend = FALSE) +
  scale_x_discrete(name = "Participant Sex", 
                   labels = c("Female", "Male")) +
  scale_y_continuous(name = "Number of participants")

ggplot(summarydata, aes(x = sex, fill = sex)) +
  geom_bar(show.legend = FALSE) +
  scale_x_discrete(name = "Participant Sex", 
                   labels = c("Female", "Male")) +
  scale_y_continuous(name = "Number of participants") +
  theme_minimal()

ggplot(summarydata, aes(x = sex, fill = sex)) +
  geom_bar(show.legend = FALSE) +
  scale_x_discrete(name = "Participant Sex", 
                   labels = c("Female", "Male")) +
  scale_y_continuous(name = "Number of participants") +
  theme_minimal() +
  scale_fill_viridis_d(option = "E")

ggplot(summarydata, aes(x = sex, fill = sex)) +
  geom_bar(show.legend = FALSE, alpha = .8) +
  scale_x_discrete(name = "Participant Sex", 
                   labels = c("Female", "Male")) +
  scale_y_continuous(name = "Number of participants") +
  theme_minimal() +
  scale_fill_viridis_d(option = "E")


## Activity 5

ggplot(summarydata, aes(x = income, y = ahiTotal, fill = income)) +
  geom_violin(trim = FALSE, show.legend = FALSE, alpha = .4) +
  geom_boxplot(width = .2, show.legend = FALSE, alpha = .7)+
  scale_x_discrete(name = "Income",
                   labels = c("Below Average", "Average", "Above Average")) +
  scale_y_continuous(name = "Authentic Happiness Inventory Score")+
  theme_minimal() +
  scale_fill_viridis_d()


## Activity 6

ggplot(summarydata, aes(x = income, y = ahiTotal)) +
  geom_violin() +
  geom_boxplot()

ggplot(summarydata, aes(x = income, y = ahiTotal)) +
  geom_boxplot() +
  geom_violin()





