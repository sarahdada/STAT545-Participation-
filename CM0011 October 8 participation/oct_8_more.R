library("tidyverse")
gapminder_csv <- read_csv('./gapminder_sum.csv')
#on windows it is .\gapminder_sum.csv
View(gapminder_csv)
ls()
list=ls()
remove(list=ls())
remove(list)
ls()

library("tidyverse")
library("here")
ls()

#everytime you store files 

#anotehr way using here

read_csv('./test/tes/te/t/gapminder_sum.csv')

read_csv(here::here("test","tes","te","t","gapminder_sum.csv"))
         
         
      #   jenny- here, here

