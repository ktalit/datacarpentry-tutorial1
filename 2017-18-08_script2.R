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

surveys %>%
  filter(!is.na(weight)) %>%
  mutate(weight_kg=weight/1000, 
         weight_kg2=weight_kg*2) %>%
  tail

survey_test<-surveys %>%
 
  mutate(hindfoot_half=(hindfoot_length)/2) %>%
  filter(hindfoot_half<30) %>%
  filter(!is.na(hindfoot_half)) %>%
  select(species_id, hindfoot_half)

#group by and summarize
surveys %>%
  filter(!is.na(weight), sex=='F' | sex=='M')%>%
  group_by(sex, species_id) %>%
  summarise(mean_weight=mean(weight, na.rm=TRUE),
            min_weight = min(weight))
  
      
        
    
  