install.packages("tidyr")
install.packages("plyr")
install.packages("dplyr")
install.packages("knitr")
library(tidyr)
library(plyr)
library(dplyr)
library(knitr)

y_train <- read.table("train/y_train.txt", quote="\"")
y_test <- read.table("test/y_test.txt", quote="\"")

x_train <- read.table("train/X_train.txt", quote="\"")
x_test <- read.table("test/X_test.txt", quote="\"")

features <- read.table("features.txt", quote="\"")

activity_labels <- read.table("activity_labels.txt", quote="\"")
colnames(activity_labels)<- c("ID","Activity")

subject_train <- read.table("train/subject_train.txt", quote="\"")
subject_test <- read.table("test/subject_test.txt", quote="\"")

actID <- rbind(y_test, y_train)
colnames(actID) <- c("ID")
actID <- join(actID, activity_labels, by = "ID")

features_dat <- rbind(x_test, x_train)
colnames(features_dat) <- features[,2]
subjects <- rbind(subject_test, subject_train)
colnames(subjects) <- c("Subject")

tidy <- cbind(subjects, actID, features_dat)
tidy <- tidy[,-2]
tidy <- select(tidy, Subject, Activity, contains("mean()"), contains("std()")) %>%
  group_by(Subject, Activity) %>%
  summarize_each(funs(mean))

write.table(tidy, "tidy.txt", row.name=FALSE)



