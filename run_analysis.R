## Getting and Cleanning data final Project - 
## Human Activity Recognition data Sets
## This project is divided in 5 Activities however the specific order was not 
##followed

## First, we read the data into R

setwd("~/Learning R/Proyect 3/UCI HAR Dataset")
features <- read.table("features.txt")
activity_labels <-read.table("activity_labels.txt")
colnames(activity_labels) <- c("code","activity")
var_names <- features[,2]

setwd("~/Learning R/Proyect 3/UCI HAR Dataset/test")
subject_test <- read.table("subject_test.txt")
colnames(subject_test) <- c("subject")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")

setwd("~/Learning R/Proyect 3/UCI HAR Dataset/train")
subject_train <- read.table("subject_train.txt")
colnames(subject_train) <- c("subject")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")


## Second (Activity 4) . Name variables in the data with descriptive names
## and (Activity 3). Name activities in the data set using descriptive names

colnames(y_test) <- "activity"
colnames(x_test) <- var_names
test_data <- cbind(subject_test,y_test,x_test)

colnames(y_train) <- "activity"
colnames(x_train) <- var_names
train_data <- cbind(subject_train,y_train,x_train)

## Next (Activity 2). 
## Extract measurements: MEAN and STD DEVIATION for each measurement

library(dplyr)

train_ms <- select(train_data,subject, activity,
                grep("mean", names(train_data),value=TRUE),
                grep("std", names(train_data),value=TRUE))
train_ms = merge(activity_labels, train_ms, by.x="code",by.y="activity")
train_ms <- select(train_ms,-code)

t_ms <- select(test_data, subject, activity, 
               grep("mean", names(test_data),
                    value=TRUE),
               grep("std", names(test_data),value=TRUE))

t_ms = merge(activity_labels, t_ms, by.x="code",by.y="activity")
t_ms <- select(t_ms,-code)



## Next (Activity 1). Merge the test (30%) and training (70%) data sets
## Which are already tidy

project_dataset <- rbind(t_ms,train_ms)


## Lastly (Activity 5). Create a second, independent tidy data set with the 
##AVERAGE of each variable for each activity and each subject

a_data <- group_by(project_dataset, activity)
a_data <- summarize_all(a_data, mean)
a_data <- select(a_data, -subject)

s_data <- select(project_dataset, -activity)
s_data <- group_by(s_data, subject)
s_data <- arrange(s_data,subject)
s_data <- summarize_all(s_data, mean)

avg_data = merge(a_data,s_data, all=TRUE)
avg_data <- select(avg_data, activity,subject,names(avg_data[,1:79]))
avg_data <- arrange(avg_data, activity, subject)

setwd("~/Learning R/Proyect 3/UCI HAR Dataset")
write.table(avg_data, file ="step 5.txt", row.name=FALSE)





