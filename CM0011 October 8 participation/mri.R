library("tidyverse")
library("here")
library("readxl")

#put in test file the xcel
mri_file=here("test","Firas-MRI") 
mri <- read_excel (mri_file, range = "A1:L12")

View(mri)
mri <-[.-10]
#need to do it in the y format

mri %>% pivot_longer (cols= 'slice 1': 'slice 8',
                      names_to= 'slice_no',
                      values_to = 'value')


#need to convert these columns into one column
