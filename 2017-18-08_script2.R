surveys<-read.csv("data/portal_data_joined.csv")
install.packages("tidyverse")
library(tidyverse)


select(surveys, plot_id,species_id,weight)

##select rows
filter(surveys,year==1995)

#PIPES!!!

## This is a pipe %>%

survey_sml<-surveys %>%
  filter(year==1995) %>%
  select(year,plot_id,species_id,weight)
  