install.packages("tidyr")
install.packages("plyr")
install.packages("dplyr")
install.packages("knitr")
library(tidyr)
library(plyr)
library(dplyr)
library(knitr)

y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")

x_train <- read.table("train/X_train.txt")
x_test <- read.table("test/X_test.txt")

features <- read.table("features.txt")

activity_labels <- read.table("activity_labels.txt")
colnames(activity_labels)<- c("ID","Activity")

subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")

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



