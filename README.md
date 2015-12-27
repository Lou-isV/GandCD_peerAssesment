# Getting and Cleaning Data - run_analysis code project


##Files in this repo
- README.md 
- CodeBook.md: variables and discriptions
- run_analysis.R: Code that will perform the transformations 

##Goals
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

##What the code does
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Appropriately labels the data set with descriptive activity names.
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Steps
- Download the data source and put into a folder on your local drive.
- Unzip the data
- Set your working directory to the folder in the unzipped file called *UCI HAR Dataset*
- Read the training and test files as well as the features and activity labels files.
- Run `source("run_analysis.R")`, then it will generate a new file **tiny.txt**  in yourworking directory.

The code will automatically install packages needed..