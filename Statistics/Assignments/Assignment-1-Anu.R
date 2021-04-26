#########  Assignment 1 #####################

##1.1 Deference b/t vector and matrix- Vector is one dimentional and metrix is two dimentional.
##1.2 Similarity B/t vector and matrix - Both can store element of the same data type.


##2.1 deference b/t data frame and matrix- matri can store element of the same data type but data frame can store multiple data type.
##2.2 Similarity b/t data frame and matrix- Both are two dimentional.

##3 Creating a vectore for (15, TRUE, "World")
Create_vector <- c(15, TRUE, "World")
Create_vector
#As result All three are showing as a character.

##4 Create a vector for 3 subject and give name to the elements of the vector based on their subject.
Subject_score <- c(95,91,88)
Subject_name <- c("Statistics", "Linear Algebra", " Calculas")
names(Subject_score) <- Subject_name
Subject_score

##5 Check type for created vector
class(Subject_score)
#Result"numeric"
class(Subject_name)
# Result "Character"

##6 Create a matrix with row name and coloumn name

Student_1 <- c(95,91,88)
Student_2 <- c(96,94,97)
Student_3 <- c(88,98,85)

All_three <-c(Student_1, Student_2, Student_3)
Total_student <-matrix(data =All_three, nrow = 3, byrow= TRUE)
Total_student
rownames(Total_student) <- c("Anu", "Ashwati", "Surbhi")
colnames(Total_student) <- c("Statistics", "Linear Algebra", "Calculas")
Total_student


##7 Convert the created matrix into data frame

Total_student_df <- data.frame(Total_student)
Total_student_df
typeof(Total_student_df)
class(Total_student_df)

## Create a data frame

Country_5 <- c("USA", "India", "Brazil","France", "Russia")
Total_cases <- c(32669212, 16263695, 14172139,5408606,4736121)            
Total_death <- c (584226, 186928, 383757,102164, 107103)
Create_df <- data.frame(Country_5,Total_cases, Total_death)
Create_df

##9 Read the mtcars dataset

mtcars
str(mtcars)

mtcars$cyl <- factor(mtcars$cyl)
class(mtcars$cyl)
mtcars[,8:11] <- lapply(mtcars[,8:11],as.factor)
str(mtcars)
New_name_df <-mtcars
New_name_df
str(New_name_df)
