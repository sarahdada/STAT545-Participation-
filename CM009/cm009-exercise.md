---
title: "cm009 Exercises: tidy data"
output: 
  html_document:
    keep_md: true
    theme: paper
---


```r
library(tidyverse)
lotr  <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/lotr_tidy.csv")
guest <- read_csv("https://raw.githubusercontent.com/STAT545-UBC/Classroom/master/data/wedding/attend.csv")
email <- read_csv("https://raw.githubusercontent.com/STAT545-UBC/Classroom/master/data/wedding/emails.csv")
```

<!---The following chunk allows errors when knitting--->


Start


Tibble function, specify names

Create a name column. and then 
if you are using base r, 
can use trubble function to manually specify. 
list_col tibble. 
expand and explore grid-all combination of variables. all combinations of x =1-2, y=1-2. 
nesting if you dont want x and y lumped together. 
go through implicit NAs on your own. time series tibble where you go through missing date. same idea here. 

Untidy example 1

if tidy format, if different types, all you have to do is group by hair, and then summarize by eyes here. Example 2 , same thing. switched eye and hair color. there are wider. there are more columns as untidy, and there are less rows. untidy lots of columns, but fewer rows. need to reverse this, put it in different format. data that is too wide is not always issue. example data too long, and also untidy, because observations are split into two rows. going to need to group, and then do some spreading. each unique part of body part has a variable, so it should be in its own column, because it is a variable.

does red hair ever occur with blue eyes. 
can filter(hair == "red", eye=="blue")

there isnt such thing as wide format and long format. you can only prepare two formats, and say table one is longer than table two, or table one is wider than table two.

each variable is contained within a single column. what we want to do is take all of these variables and put them into one column
9.2., pivoting tools. pivot wider or pivot takes tibble and makes it either wider or longer.

reshaped package. reshape 2 package. actually pretty convenient to use gather and spread. terminology, gives you a lot more flexibility for widening or funcitonin. its not like the gather and spread functions are going away, just not actively___ not sure. 

what the fuck is gather and spread.
pivoting- multivariate pivoting.
eye color as columns, and we need to move this into a single column. need to take the titles, column names. these are actually values of an observation, so i need to take those into a single row. then i need to take whats underneath, and put those in a single row.

one column names, another column , calues. so names are now in "eye column" and values are in the n column.

pivoting-pivot longer to take the wide format and make it longer. takes a tibble and returns a tibble. besides the first argument that .... the tibble . we have to specify which columns are we working with . so we want all of the eye colour column. thats enough . optional and highly recommended are name to and values_to argument. the names are going to its own column. what do you want that column name to be . and then values too. the values that will be in ___ columns. taking the tidy data, making it longer. saying you want all of these columns green_eye, brown_eye,  and then specify that you want the names to be specified "eye".

I actually cant think of an example where you have two columns and make it wider. maybe if you had eye color and age. 
if there are 29 blue hair black eye peopl....we have list columns. tibbles with list columns. if you look at column blue. you have basically a list.

here, in specifying the columns, instead of - looked at the column to the left, and the column to right. still not entirely robust. tidy select- contain. contain eye. all of the columns i want to work with have the word iye in it

or all columns without hair, so all columns minus hair. that is lengthening. 

hair is going to be the identifyer. name scrub-names of the new column, which column is it coming vrom . and then values. so something needs to come underneath the values.

Pivot. 
 if you put.value it just leaves that column. will have a limit.
 
 taking one column, making it two columns, seperating by
## Exercise 1: Univariate Pivoting

Consider the Lord of the Rings data:


```r
lotr
```

```
## # A tibble: 18 x 4
##    Film                       Race   Gender Words
##    <chr>                      <chr>  <chr>  <dbl>
##  1 The Fellowship Of The Ring Elf    Female  1229
##  2 The Fellowship Of The Ring Hobbit Female    14
##  3 The Fellowship Of The Ring Man    Female     0
##  4 The Two Towers             Elf    Female   331
##  5 The Two Towers             Hobbit Female     0
##  6 The Two Towers             Man    Female   401
##  7 The Return Of The King     Elf    Female   183
##  8 The Return Of The King     Hobbit Female     2
##  9 The Return Of The King     Man    Female   268
## 10 The Fellowship Of The Ring Elf    Male     971
## 11 The Fellowship Of The Ring Hobbit Male    3644
## 12 The Fellowship Of The Ring Man    Male    1995
## 13 The Two Towers             Elf    Male     513
## 14 The Two Towers             Hobbit Male    2463
## 15 The Two Towers             Man    Male    3589
## 16 The Return Of The King     Elf    Male     510
## 17 The Return Of The King     Hobbit Male    2673
## 18 The Return Of The King     Man    Male    2459
```

1. Would you say this data is in tidy format? relative

2. Widen the data so that we see the words spoken by each race, by putting race as its own column.


```r
(lotr_wide <- lotr %>% 
  pivot_wider(id_cols = c(-Race, -Words), 
              names_from = "Race", 
              values_from = "Words")
```

```
## Error: <text>:5:0: unexpected end of input
## 3:               names_from = "Race", 
## 4:               values_from = "Words")
##   ^
```

3. Re-lengthen the wide LOTR data from Question 2 above.


```r
lotr_wide %>% 
  pivot_longer(cols = c(-Film, -Gender), 
               names_to  = "Race", 
               values_to = "Words")
```

```
## Error in eval(lhs, parent, parent): object 'lotr_wide' not found
```

## Exercise 2: Multivariate Pivoting

9.4

Congratulations, you're getting married! In addition to the wedding, you've decided to hold two other events: a day-of brunch and a day-before round of golf.  You've made a guestlist of attendance so far, along with food preference for the food events (wedding and brunch).


```r
guest %>% 
  DT::datatable(rownames = FALSE)
```

<!--html_preserve--><div id="htmlwidget-4e814ee6837e1039a706" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-4e814ee6837e1039a706">{"x":{"filter":"none","data":[[1,1,1,1,2,2,3,4,5,5,5,6,6,7,7,8,9,10,11,12,12,12,12,12,13,13,14,14,15,15],["Sommer Medrano","Phillip Medrano","Blanka Medrano","Emaan Medrano","Blair Park","Nigel Webb","Sinead English","Ayra Marks","Atlanta Connolly","Denzel Connolly","Chanelle Shah","Jolene Welsh","Hayley Booker","Amayah Sanford","Erika Foley","Ciaron Acosta","Diana Stuart","Cosmo Dunkley","Cai Mcdaniel","Daisy-May Caldwell","Martin Caldwell","Violet Caldwell","Nazifa Caldwell","Eric Caldwell","Rosanna Bird","Kurtis Frost","Huma Stokes","Samuel Rutledge","Eddison Collier","Stewart Nicholls"],["PENDING","vegetarian","chicken","PENDING","chicken",null,"PENDING","vegetarian","PENDING","fish","chicken",null,"vegetarian",null,"PENDING","PENDING","vegetarian","PENDING","fish","chicken","PENDING","PENDING","chicken","chicken","vegetarian","PENDING",null,"chicken","PENDING","chicken"],["PENDING","Menu C","Menu A","PENDING","Menu C",null,"PENDING","Menu B","PENDING","Menu B","Menu C",null,"Menu C","PENDING","PENDING","Menu A","Menu C","PENDING","Menu C","Menu B","PENDING","PENDING","PENDING","Menu B","Menu C","PENDING",null,"Menu C","PENDING","Menu B"],["PENDING","CONFIRMED","CONFIRMED","PENDING","CONFIRMED","CANCELLED","PENDING","PENDING","PENDING","CONFIRMED","CONFIRMED","CANCELLED","CONFIRMED","CANCELLED","PENDING","PENDING","CONFIRMED","PENDING","CONFIRMED","CONFIRMED","PENDING","PENDING","PENDING","CONFIRMED","CONFIRMED","PENDING","CANCELLED","CONFIRMED","PENDING","CONFIRMED"],["PENDING","CONFIRMED","CONFIRMED","PENDING","CONFIRMED","CANCELLED","PENDING","PENDING","PENDING","CONFIRMED","CONFIRMED","CANCELLED","CONFIRMED","PENDING","PENDING","PENDING","CONFIRMED","PENDING","CONFIRMED","CONFIRMED","PENDING","PENDING","PENDING","CONFIRMED","CONFIRMED","PENDING","CANCELLED","CONFIRMED","PENDING","CONFIRMED"],["PENDING","CONFIRMED","CONFIRMED","PENDING","CONFIRMED","CANCELLED","PENDING","PENDING","PENDING","CONFIRMED","CONFIRMED","CANCELLED","CONFIRMED","PENDING","PENDING","PENDING","CONFIRMED","PENDING","CONFIRMED","CONFIRMED","PENDING","PENDING","PENDING","CONFIRMED","CONFIRMED","PENDING","CANCELLED","CONFIRMED","PENDING","CONFIRMED"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th>party<\/th>\n      <th>name<\/th>\n      <th>meal_wedding<\/th>\n      <th>meal_brunch<\/th>\n      <th>attendance_wedding<\/th>\n      <th>attendance_brunch<\/th>\n      <th>attendance_golf<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

1. Put "meal" and "attendance" as their own columns, with the events living in a new column.
underscore is seperating the left from the right

- party - name. just wanting to specify what you want. easier to just say i want all the columns except for party and name.
THINGS ON THE LEFT, OWn column, and thing on right own column, so wedding ,  brunch vs __

```r
(guest_long <- guest %>% 
  pivot_longer(cols      = c(-party,-name), 
               names_to  = c("values","event"),
               names_sep="_"))
```

```
## # A tibble: 150 x 5
##    party name            values     event   value     
##    <dbl> <chr>           <chr>      <chr>   <chr>     
##  1     1 Sommer Medrano  meal       wedding PENDING   
##  2     1 Sommer Medrano  meal       brunch  PENDING   
##  3     1 Sommer Medrano  attendance wedding PENDING   
##  4     1 Sommer Medrano  attendance brunch  PENDING   
##  5     1 Sommer Medrano  attendance golf    PENDING   
##  6     1 Phillip Medrano meal       wedding vegetarian
##  7     1 Phillip Medrano meal       brunch  Menu C    
##  8     1 Phillip Medrano attendance wedding CONFIRMED 
##  9     1 Phillip Medrano attendance brunch  CONFIRMED 
## 10     1 Phillip Medrano attendance golf    CONFIRMED 
## # … with 140 more rows
```
filter things called seperate . seperate whatever column you want. name into two new columns.

2. Use `tidyr::separate()` to split the name into two columns: "first" and "last". Then, re-unite them with `tidyr::unite()`.


```r
guest_long %>% 
  separate(name ,into = c("first","last")), sep=" ")%>% 
  unite(col = "name", first, last, sep = " ")
```

```
## Error: <text>:2:43: unexpected ','
## 1: guest_long %>% 
## 2:   separate(name ,into = c("first","last")),
##                                              ^
```

3. Which parties still have a "PENDING" status for all members and all events?
after grouping party

use the gues long here


```r
guest_long %>% 
  group_by(party) %>% 
  summarize(all_pending = all(attendance == "PENDING"))
```

```
## Error: object 'attendance' not found
```

4. Which parties still have a "PENDING" status for all members for the wedding?

put in the original tibble


```r
guest %>% 
  group_by(party) %>% 
  summarize(pending_wedding = all(attendance_wedding == "PENDING"))
```

```
## # A tibble: 15 x 2
##    party pending_wedding
##    <dbl> <lgl>          
##  1     1 FALSE          
##  2     2 FALSE          
##  3     3 TRUE           
##  4     4 TRUE           
##  5     5 FALSE          
##  6     6 FALSE          
##  7     7 FALSE          
##  8     8 TRUE           
##  9     9 FALSE          
## 10    10 TRUE           
## 11    11 FALSE          
## 12    12 FALSE          
## 13    13 FALSE          
## 14    14 FALSE          
## 15    15 FALSE
```


5. Put the data back to the way it was.


```r
guest_long %>% 
  pivot_wider(id_cols     = c(party, name), 
              names_from  = c(event, meal), 
              names_sep   = "_", 
              values_from = c(meal,attendance))
```

```
## Error in map_lgl(.x, .p, ...): object 'meal' not found
```

6. You also have a list of emails for each party, in this worksheet under the variable `email`. Change this so that each person gets their own row. Use `tidyr::separate_rows()`
each row of guest column is just a bunch of names seperated by columns. each party has their own email.
seperate rows, comma space


```r
email %>% 
  separate_rows(guest, sep = ", ")
```

```
## # A tibble: 28 x 2
##    guest           email              
##    <chr>           <chr>              
##  1 Sommer Medrano  sommm@gmail.com    
##  2 Phillip Medrano sommm@gmail.com    
##  3 Blanka Medrano  sommm@gmail.com    
##  4 Emaan Medrano   sommm@gmail.com    
##  5 Blair Park      bpark@gmail.com    
##  6 Nigel Webb      bpark@gmail.com    
##  7 Sinead English  singlish@hotmail.ca
##  8 Ayra Marks      marksa42@gmail.com 
##  9 Jolene Welsh    jw1987@hotmail.com 
## 10 Hayley Booker   jw1987@hotmail.com 
## # … with 18 more rows
```


## Exercise 3: Making tibbles

1. Create a tibble that has the following columns:

- A `label` column with `"Sample A"` in its entries.
- 100 random observations drawn from the N(0,1) distribution in the column `x`
- `y` calculated as the `x` values + N(0,1) error. 
can use the tibble function
if vector length doesnt match, it is entry
rnorm function in R
tibble is backwayrds compatable. 
y, which is x that i just created.
create x, after data frame is created.


```r
n <- 100
FILL_THIS_IN(label = "Sample A",
             FILL_THIS_IN = rnorm(n),
             FILL_THIS_IN)
```

```
## Error in FILL_THIS_IN(label = "Sample A", FILL_THIS_IN = rnorm(n), FILL_THIS_IN): could not find function "FILL_THIS_IN"
```


2. Generate a Gaussian sample of size 100 for each combination of the following means (`mu`) and standard deviations (`sd`).


```r
n <- 100
mu <- c(-5, 0, 5)
sd <- c(1, 3, 10)
FILL_THIS_IN(mu = mu, sd = sd) %>% 
  group_by_all() %>% 
  mutate(z = list(rnorm(n, mu, sd))) %>% 
  FILL_THIS_IN
```

```
## Error in FILL_THIS_IN(mu = mu, sd = sd): could not find function "FILL_THIS_IN"
```

3. Fix the `experiment` tibble below (originally defined in the documentation of the `tidyr::expand()` function) so that all three repeats are displayed for each person, and the measurements are kept. The code is given, but needs one adjustment. What is it? specify what is missing, so name, treatmen. but with complete function it is considering all possible combinations. we dont wat that. we want name and treatmen, and THEN rep


```r
experiment <- tibble(
  name = rep(c("Alex", "Robert", "Sam"), c(3, 2, 1)),
  trt  = rep(c("a", "b", "a"), c(3, 2, 1)),
  rep = c(1, 2, 3, 1, 2, 1),
  measurement_1 = runif(6),
  measurement_2 = runif(6)
)
experiment %>% expand(name, trt, rep)
```

```
## # A tibble: 18 x 3
##    name   trt     rep
##    <chr>  <chr> <dbl>
##  1 Alex   a         1
##  2 Alex   a         2
##  3 Alex   a         3
##  4 Alex   b         1
##  5 Alex   b         2
##  6 Alex   b         3
##  7 Robert a         1
##  8 Robert a         2
##  9 Robert a         3
## 10 Robert b         1
## 11 Robert b         2
## 12 Robert b         3
## 13 Sam    a         1
## 14 Sam    a         2
## 15 Sam    a         3
## 16 Sam    b         1
## 17 Sam    b         2
## 18 Sam    b         3
```

```r
experiment %>% complete(name, trt, rep)
```

```
## # A tibble: 18 x 5
##    name   trt     rep measurement_1 measurement_2
##    <chr>  <chr> <dbl>         <dbl>         <dbl>
##  1 Alex   a         1         0.307        0.0648
##  2 Alex   a         2         0.506        0.226 
##  3 Alex   a         3         0.305        0.653 
##  4 Alex   b         1        NA           NA     
##  5 Alex   b         2        NA           NA     
##  6 Alex   b         3        NA           NA     
##  7 Robert a         1        NA           NA     
##  8 Robert a         2        NA           NA     
##  9 Robert a         3        NA           NA     
## 10 Robert b         1         0.901        0.0261
## 11 Robert b         2         0.513        0.254 
## 12 Robert b         3        NA           NA     
## 13 Sam    a         1         0.494        0.0688
## 14 Sam    a         2        NA           NA     
## 15 Sam    a         3        NA           NA     
## 16 Sam    b         1        NA           NA     
## 17 Sam    b         2        NA           NA     
## 18 Sam    b         3        NA           NA
```

```r
experiment %>% complete(nesting(name, trt), rep)
```

```
## # A tibble: 9 x 5
##   name   trt     rep measurement_1 measurement_2
##   <chr>  <chr> <dbl>         <dbl>         <dbl>
## 1 Alex   a         1         0.307        0.0648
## 2 Alex   a         2         0.506        0.226 
## 3 Alex   a         3         0.305        0.653 
## 4 Robert b         1         0.901        0.0261
## 5 Robert b         2         0.513        0.254 
## 6 Robert b         3        NA           NA     
## 7 Sam    a         1         0.494        0.0688
## 8 Sam    a         2        NA           NA     
## 9 Sam    a         3        NA           NA
```



