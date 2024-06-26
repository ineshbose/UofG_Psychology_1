#---
# title: "Level 1 Lab 3: Pre-Class"
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
library(babynames)


## Activity 2

babynames


## Activity 3

dat <- babynames %>% 
  filter(name %in% c("Emily","Kathleen","Alexandra","Beverly"), sex=="F")

ggplot(data = dat,aes(x = year,y = prop, colour=name))+
  geom_line()


## Activity 4

select(.data = babynames, year, sex, name, prop)

select(.data = babynames, -n)

new_dat <- select(.data = babynames, -n)


## Activity 5

arrange(.data = babynames, name)

arrange(babynames, desc(year))

arrange(babynames, desc(year), desc(sex), desc(prop)) 


## Activity 6

filter(.data = babynames, year > 2000)

years <- 1996:2005
years
years > 2000

filter(babynames, name == "Mary")

filter(babynames, name!="Mary")

filter(babynames, name %in% c("Mary","Elizabeth","Victoria"))

filter(babynames, !(name %in% c("Mary","Elizabeth","Victoria")))


## Activity 7

new_dat <- mutate(.data = babynames, decade = floor(year/10) *10)

new_dat


## Activity 8

summarise(.data = dat, total = sum(n))

group_dat <- group_by(.data = dat, name)

summarise(.data = group_dat, total = sum(n))

summarise(group_dat, mean_year, = mean(n), median_year = median(n))

group_new_dat <- group_by(new_dat, sex, decade)
summarise(group_new_dat, mean_year = mean(n), median_year = median(n))


## Activity 9

pipe_summary <- mutate(babynames, decade = floor(year/10) *10) %>%
  filter(name %in% c("Emily","Kathleen","Alexandra","Beverly"), sex=="F") %>%
  group_by(name, decade) %>%
  summarise(mean_decade = mean(n))

