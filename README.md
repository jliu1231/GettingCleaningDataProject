# GettingCleaningDataProject
Data analysis project for Getting and Cleaning Data Course in Coursera

This file explains how to run the analysis for Human Activity Recognition Using Smartphones using the data files.

Downloading data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

File usage:
run_analysis.R provides a 5-step analysis of the downloaded data with the following goals:
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Code book.pdf provides descriptions for all variables involved in run_analysis.R.
TidyData.txt is the final data table after performing data analysis using run_analysis.R.
