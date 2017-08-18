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
  
surveys %>%
  group_by(sex) %>%
  tally

#challange1
surveys %>%
  group_by(plot_type) %>%
  tally
#challange2
surveys %>%
  filter(!is.na(hindfoot_length)) %>%
        group_by(species_id) %>%
      summarise(min_hl=min(hindfoot_length),max_hl=max(hindfoot_length))
    
#challange3
challange3<-surveys %>%
  group_by(year) %>%
  filter(weight == max(weight, na.rm=TRUE)) %>%
  arrange(year) %>%
select(year,genus,species_id,weight) 

#challange4
surveys %>%
  group_by(sex) %>%
  summarise(n())

##EXPORTING DATA----------

#surveys_complete<-surveys %>%
#    filter (species_id!="") %>%
#    filter(!is.na(weight)) %>%
#    filter(!is.na(hindfoot_length))%>%
#    filter (sex !="")

surveys_complete<-surveys %>%
  filter(species_id !="",
         !is.na(weight),
         !is.na(hindfoot_length),
          sex !="")
  
# Extract the most common species ID
  species_count<-surveys_complete %>%
    group_by(species_id)%>%
    tally %>%
    filter(n>=50)
 #save data
  write.csv(surveys_complete,file="data/surveys_complete.csv")
  
  
  
  

  