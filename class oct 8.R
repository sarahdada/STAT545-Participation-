library("tidyverse")
library("gapminder")

gapminder <- 
  write_csv(gapminder, './gapminder.csv')
View(gapminder)
#comman to save csv is write_csv()

# calculate mean life Exp per continent
gapminder_sumn <- gapminder %>% 
  group_by(continent) %>%
  summarize(ave_lifeExp = mean(lifeExp))

View(gapminder_sum)
write_csv(gapminder_sum, './gapminder_sum.csv')

View(gapminder_sum)
write_csv(gapminder_sum, here::here("gapminder_sum.csv")

gapminder_sum %>%
  ggplot(aes(x=continent, y=ave_lifeExp))
#missed this

install.packages("here")
library(here)

data_url <- "http://gattonweb.uky.edu/sheather/book/docs/datasets/GreatestGivers.xls"

#downloading file, extracting the file, and let you know where it is. 

download.file(url=data_url, destfile=paste('./datasets/',file_name)) #old way bad

download.file(url=data_url, 
              destfile=here::here("test","greatestGivers.xsl")) #new way

#need to make a file in participation

#file name, and 
install.packages("readxl")
library(readxl) #let's you read in data 
philanthropists <-read_excel(here::here("test",file_name), trim_ws = TRUE)

View(philanthropists)

head()

#read_csv tries not to make assumptions about the data
#find and replace blank with 
#XLS file possible does not work on all PCs)

#TODO for firas: Find a way to remove leading white-space from Column 4
#explicitly say that here packaga- dplyr-if loaded last itll use here.
#moved file to test file
