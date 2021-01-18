fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "C:/Users/Bunnylulu/Desktop/Lulu/Coursera/projectdata.zip", method = "curl")
setwd("C:/Users/Bunnylulu/Desktop/Lulu/Coursera")
unzip("projectdata.zip")

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)
merged_data <- cbind(subject_data, y_data, x_data)

library(dplyr)
step2data <- select(merged_data, subject, code, contains("mean"), contains("std"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
activity_labels <- as.character(activity_labels[,2])
step2data$code <- activity_labels[step2data$code]

names(step2data)[2] = "activity"
names(step2data)<-gsub("^t", "Time", names(step2data))
names(step2data)<-gsub("^f", "Frequency", names(step2data))
names(step2data)<-gsub("tBody", "TimeBody", names(step2data))
names(step2data)<-gsub("-mean()", "Mean", names(step2data), ignore.case = TRUE)
names(step2data)<-gsub("-std()", "StandardDeviation", names(step2data), ignore.case = TRUE)
names(step2data)<-gsub("-freq()", "Frequency", names(step2data), ignore.case = TRUE)
names(step2data)<-gsub("Acc", "Accelerometer", names(step2data))
names(step2data)<-gsub("Gyro", "Gyroscope", names(step2data))
names(step2data)<-gsub("BodyBody", "Body", names(step2data))
names(step2data)<-gsub("Mag", "Magnitude", names(step2data))

group_data <-group_by(step2data, subject, activity)
tidy_data <- summarise_all(group_data,funs(mean))
write.table(tidy_data, "TidyData.txt", row.name=FALSE)                           
head(tidy_data)
