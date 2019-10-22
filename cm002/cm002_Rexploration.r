Lecture 2, r exploration

operations- 
number * 2
number <- 5 + 2
number * 2
a * 2

vectors
(times <-c(60, 40, 33, 15, 20, 55, 35))
times / 60

functions
mean(times)
sqrt(times)
range(times)

#Logical
times < 30
times == 20
times != 20
times > 20 & times < 50
times < 20 | times > 50
which(times < 30)
sum(times < 30)
a <- all(times < 30)

#Subsetting:
times[3]
times[-3]
times[c(2,4)]
times[c(4,2)]

times[1:5]
times[times<30]
times

#altering data set to cap off too large entries
times[times >50] <- 50

times[8] <- NA
times
mean(times)


?mean
mean(times, na.rm = TRUE)

#dataframes
mtcars
str(mtcars)
names(mtcars)

#extracting a column
mtcars$mpg
