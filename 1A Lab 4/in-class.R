#---
# title: "Level 1 Lab 4: In-Class"
# author: "Inesh Bose"
# date: "Semester 1 2019"
# output: html_document
#---

# * After you complete each activity you should knit the file. This will make it easier to spot when errors have crept into your code rather than waiting until the end and trying to figure out where things have gone wrong.
# * Use the whitespace to add your own notes (e.g., if you make an error, note down what the error was and how you fixed it).
# * You can add additional code chunks if needed.
# * Be careful not to delete or add any backticks () or to change the chunk name (e.g., a1)


## Activity 1

library(tidyverse)

dat <- read_csv ('ahi-cesd.csv')
pinfo <- read_csv('participant-info.csv')
all_dat <- inner_join(dat, pinfo, by=c("id", "intervention")


## Activity 2

summarydata <- select(all_dat, ahiTotal, cesdTotal, sex, age, educ, income, occasion, elapsed.days)


## Activity 3

ahi_asc <- arrange(summarydata, by = ahiTotal)


## Activity 4

age_65max <- filter(ahi_asc, age <= 65)


## Activity 5

median_score <- summarise(age_65max, median = median(ahiTotal))
data_sex <- group_by(age_65max, sex)
data_median <- summarise(data_sex, median_score = median(ahiTotal))


## Activity 6


happy <- mutate(data_sex, Happiness = (ahiTotal > 73))


## Activity 7

ggplot(age_65max, aes(x = ahiTotal , y = cesdTotal)) + 
  geom_point(colour = "red") +
  scale_x_continuous(name = "Happiness Score") +
  scale_y_continuous(name = "Depression Score") +
  theme_minimal()

