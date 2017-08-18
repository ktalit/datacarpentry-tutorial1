##data visualization
library(tidyverse)
surveys_comp <-read.csv("data/surveys_complete.csv")

##ggplot2
ggplot(data=surveys_comp, aes(x=weight, y=hindfoot_length))+geom_point(alpha=0.1, aes(color=species_id))

ggplot(data=surveys_comp, aes(x=species_id, y=weight))+geom_point(alpha=0.1, aes(color=species_id))
                                                                  
       
##boxplot

ggplot(data=surveys_comp, aes(x=species_id, y=weight))+geom_boxplot(alpha=0.1, aes(color=plot_type))+
  labs(x='species',
       y='weight',
       title='weight Vs species graph')


##Time series---
yearly_counts<-surveys_comp %>%
  group_by(year,species_id) %>%
  tally



ggplot(data=yearly_counts, aes(x=year, y=n)) + 
  geom_line(aes(color=species_id)) +
  facet_wrap(~ species_id)



yearly_sex_counts<-surveys_comp %>%
  group_by(year,species_id,sex) %>%
  tally

ggplot(data=yearly_sex_counts, aes(x=year, y=n,color=sex))+
  geom_line()+
  facet_wrap(~ species_id)

yearly_avg_weight<-surveys_comp %>%
  group_by(year,species_id)%>%
  summarize(mean_weight=mean(weight))

myplot<-ggplot(data=yearly_avg_weight, aes(x=year, y=mean_weight)) + 
  geom_line(aes(color=species_id)) +
  facet_wrap(~ species_id)
labs(x="Year",
     y="Mean_Weight(g)")+
  theme_bw()+
  theme(axis.text.x =element_text(angle=90), legend.position = none)
ggsave("my_plot.png", myplot)