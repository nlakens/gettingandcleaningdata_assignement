library(plyr)
library(data.table)
library(dplyr)
library(stringr)

##Download, unzip, read in the data

setwd("C:/Users/m01e770/Data Science/courseragettingcleaningdata")



if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")


unzip(zipfile = "./data/Dataset.zip", exdir="./data")

fp <- file.path("./data" , "UCI HAR Dataset")

list.files(fp, recursive = TRUE)

subject_train <- read.csv(file.path(fp,"train","subject_train.txt"), header = FALSE)

xtrain <- read.table(file.path(fp,"train", "X_train.txt"),header = FALSE)
ytrain <- read.table(file.path(fp,"train","Y_train.txt"), header = FALSE)

subject_test <- read.csv(file.path(fp,"test","subject_test.txt"), header = FALSE)

xtest <- read.table(file.path(fp,"test","X_test.txt"), header = FALSE)
ytest <- read.table(file.path(fp,"test","y_test.txt"), header = FALSE)


features<- read.table(file.path(fp,"features.txt"), header = FALSE)
activity_labels <- read.table(file.path(fp,"activity_labels.txt"), header = FALSE)


##colnames to make clear what is in the data; this is part of making the data tidy

colnames(xtrain) <- features[,2]
colnames(xtest)  <- features[,2]
colnames(ytrain) <- c("activityId")
colnames(ytest)  <- c("activityId")
colnames(activity_labels) <- c("activityId","activityLabel")
colnames(subject_train) <- c("subjectId")
colnames(subject_test) <- c("subjectId")

## 1. Merges the training and the test stets to create one data set

merged_train <- cbind(subject_train, ytrain, xtrain)
merged_test <- cbind(subject_test, ytest, xtest)

merged <- rbind(merged_train, merged_test)


##2. Extracts only the measurements on the mean and standard deviation for each measurment

colnames_merged <- colnames(merged)
merged_mean_std <- cbind(merged[,1:2],merged[,grep("[Mm]ean|[Ss]td",colnames_merged)])


##3. Uses descriptive activity names to name the activities in the data set


merged_mean_std$activityId <- factor(merged_mean_std$activityId,
                                     levels = activity_labels[,1],
                                     labels = activity_labels[,2])

##4. Approppriately labels the data set with descriptive variable names
##this was already done in lines 51/52; script furthes cleanes the column names.
##clean column names ensure that scripts can be run correctly

colnames_mms<- colnames(merged_mean_std)
colnames_mms<- sub("\\(\\)","",colnames_mms,)                                    ##removes "()" from column names
colnames_mms2<- sapply(strsplit(colnames_mms,",",""),paste, collapse = "")       ##removes "," from column names
colnames_mms3 <- sapply(strsplit(colnames_mms2, "-",""), paste, collapse = "")   ##removes "-" from column names
colnames_mms4 <- sapply(strsplit(colnames_mms3, "\\(",""), paste, collapse = "") ##removes "(" from column names
colnames_mms5 <- sapply(strsplit(colnames_mms4, "\\)",""), paste, collapse = "") ##removes ")" from column names

colnames(merged_mean_std) <- colnames_mms5

##5 From the data set in step 4, creates a second, independent tidy data set with the average of each activity and each
##subject.

mean_mms <- aggregate(. ~subjectId + activityId, merged_mean_std, mean)

write.table(mean_mms, "MeanPerSubjectidActivity.txt", sep = "\t", row.names = FALSE)


colnames(mean_mms)
