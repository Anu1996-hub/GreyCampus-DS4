 ## 1 Result of final world cup football is france 4 and crotia 2. Please use control structure to print result as team_ win._ should be country name

france <- 4
crotia <- 2

if(france>crotia){
  print("France Win")
}else{
  print("crotia Win")
}

##2 mtcars dataset has severeal factor variables. However R is reading them as numeric. Please convert them into factor using for loop
  # Please use column 8:11 for loop.

for(i in 8:11){
  mtcars[,i] <- as.factor(mtcars[,i])
}
str(mtcars)

##3 Write to get percentage of NAs in each column using data_set.xlsx.
library(readxl)
install.packages("DT")
library(DT)
data_set <- read_excel("C:\\Greycampus\\Statistics_Class\\Day_2\\Data_set.xlsx")
is.na(data_set)
# create function to check percentage
# function(x){
#sum(is.na(x)/length(x)*100)
#}

Missing_na <-function(x){
  sum(is.na(x))/length(x)*100
}

Missing_per_na <-apply(data_set,2,Missing_na)
Missing_per_na

head(Missing_per_na)

##4Write a function to get percentage of NAs in each row

Missing_na_row <- apply(data_set,1,Missing_na)
Missing_na_row
head(Missing_na_row)

##5 Write a function to get summary of numeric column(use summary function)such as THC,CO,CO2,etc.
##in data set in same function try t use box plot using base R.

Summary_data <- function(y){
  print(summary(y)) 
  boxplot(y)
}
 Summary_data(data_set$THC)
 Summary_data(data_set$CO)
Summary_data(data_set$CO2) 

##6 Write a function to create histogram of numeric column such as THC,CO,CO2,in data set. use ggplot2 to generate figure.
library(ggplot2)
gg_function <- function(x,y){
ggplot(x)+
    aes(y)+
  geom_histogram()
}

gg_function(data_set,data_set$THC)
gg_function(data_set,data_set$CO) 
gg_function(data_set,data_set$CO2)

##7 Data set contains data column are untidy.please create a better formatted dataset. Data should be dd/mm/yyyy in final format. Use column 2,3 and five only, using assignment2.xlsx
library(readr)
library(tidyverse)
library(tidyr)
library(lubridate)
Dataset_2<- read.csv("C:\\Greycampus\\Statistics_Class\\Day_2\\dataset_2.csv",
                    na.strings =c( "","NA"),
                    stringsAsFactors = FALSE)
head(Dataset_2)
Dataset_2$First.FD.Date <- mdy(Dataset_2$First.FD.Date)
Dataset_2$First.FD.Date
Dataset_2$Last.FD.Date <-mdy(Dataset_2$Last.FD.Date)
Dataset_2$FD.termination.date<- mdy(Dataset_2$FD.termination.date)
Dataset_2
head(Dataset_2)

##8 The date of birth column contains month in string format. Please create a tidy data column with month in numeric format. noe your data should be similar to the previous question
library(dplyr)
Tidy_data<- Dataset_2 %>% 
separate('Date.of.Birth',c("Day","Month","Year")) %>% 
  mutate(yr=case_when(Year>20 ~ '19',
                      Year<=20 ~ '20')) %>% 
  unite(Year,c("yr","Year"), sep="")
Tidy_data

Tidy_data$Month <- match(Tidy_data$Month,month.abb)
Tidy_data_2 <-Tidy_data %>% 
 unite(Date_of_Birth, c("Day","Month","Year"),sep ="/" )
Tidy_data_2

##9 Convert all dates into date format they are currently in character variable format
Tidy_data_2$Date_of_Birth<- gsub(pattern = "NA/NA/NANA","NA",Tidy_data_2$Date_of_Birth)
head(Tidy_data_2)
Tidy_data_2
class(Tidy_data_2$Date_of_Birth)
Tidy_data_2$Date_of_Birth <- as.Date(Tidy_data_2$Date_of_Birth, format = "%d/%m/%Y")
Tidy_data_2$First.FD.Date <- as.Date(Tidy_data_2$First.FD.Date, format= "%d/%m/%Y")
Tidy_data_2$Last.FD.Date <- as.Date(Tidy_data_2$Last.FD.Date, format= "%d/%m/%Y")
Tidy_data_2$FD.termination.date<- as.Date(Tidy_data_2$FD.termination.date, format="%d/%m/%Y")
class(Tidy_data_2$Date_of_Birth)
 
##10 Create a new column age based on the date of birth column and the first FD column. Date format is necessary to do basic arithmetic.
Tidy_data_3 <- Tidy_data_2 %>% 
  mutate(Age = (First.FD.Date - Date_of_Birth)/365) %>% 
  separate(Age,(c("Age","Decimal"))) %>% 
  select(-("Decimal"))
Tidy_data_3
