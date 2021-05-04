
##1 Use mtcars datasetand create a boxplot camparing mpg and cylinder.
mtcars
str(mtcars)
boxplot(mtcars$mpg ~ mtcars$cyl)

##2 Use mt cars data set and create histogram of mgp

hist(mtcars$mpg)

##3 Use airquality dataset and calculate NAs in each column
airquality
str(airquality)
colSums(is.na(airquality))

##4 Please check month column of airquqlity dataset and convery it into factor

airquality$Month <- as.factor(airquality$Month)
str(airquality)

## Use gapminder dataset and calculate meam median by continent
install.packages("dplyr")
library(dplyr)
library(gapminder)
gapminder%>%
  group_by(continent)%>%
  summarize(mean_life_exp = mean(lifeExp),
            median_life_exp =median(lifeExp))
