## my first R_csript
## Kuntal ktalit@ucmerced.edu


##download data -------
# download.file("https://ndownloader.figshare.com/files/2292169",
#               "data/portal_data_joined.csv")


## read in data into R----
 surveys <-read.csv("data/portal_data_joined.csv")
#explore our data
 head(surveys)  #show first 6 rows 
 tail(surveys)  #show last 6 rows
 tail(surveys, 12) #show last 12 rows
 ##summaries
 str(surveys) #structure of the data
 summary(surveys)
 
 ##explore size
 dim(surveys)
 
 names(surveys)
 
 
 ## the $ operator for isolating collumns
 tail(surveys$weight)
 str(surveys$weight)
 summary(surveys$weight)
 
 ## plot
 plot(surveys$year,surveys$weight)
 plot(surveys$hindfoot_length,surveys$weight)
 
 ## explore month
 summary(surveys$month)
 hist(surveys$month)
 
 ## explore factor variable
 summary(surveys$taxa)
 levels(surveys$taxa)
 nlevels(surveys$taxa)
 #hist(surveys$taxa) #error
 class(surveys$taxa) #turns it into a table
 class(table(surveys$taxa))
 barplot(table(surveys$taxa))
 
 ## subset in base R----
 ##[rows,columns]
 ## return all the collumns for genus Ammodromus
 surveys[surveys$genus=='Ammodramus',]
 
 ##return afew columns
 #surveys[survey$genus == 'Ammodramus', c('record_id','month',"weight")]
 ##display count for month Jan and Feb---
 summary(surveys$month==1 | surveys$month==2)
 summary(surveys$month==2)
 
 ##-----------------------------------
 ##--Day2--

  
 