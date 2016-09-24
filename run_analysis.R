

## Getting and cleaning data-Week4 Assignment
## This run_analysis.R script performs below functionality:
## 1.Merges the training and the test sets to create one data set.
## 2.Extracts only the measurements on the mean and standard deviation for each measurement.
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive variable names.
## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## download required dataset and unzip it for processing

dataset.file <- paste( "./dataset.zip", sep="/")
dataset.dir <- paste( "./UCI HAR Dataset", sep="/")
source_dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists(dataset.file) && !file.exists(dataset.dir)) { 
    download.file(source_dataset_url,destfile = dataset.file)
    unzip(dataset.file)
} else {
    print("Files already exists at source location")
}

## Read files in table format and creates a data frame for train dataset from it
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Read files in table format and creates a data frame for test dataset from it
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Read activity labels and data columns from provided source dataset

features <- read.table("./UCI HAR Dataset/features.txt")[,2]
names(x_test) = features
names(x_train) = features

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) <- c("Activity_ID", "Activity_Label")
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) <- c("Activity_ID", "Activity_Label")
names(subject_test) = "Subject"
names(subject_train) <- "Subject"

## package required to use as.data.table
if (!require("data.table")) {
install.packages("data.table")
}

require("data.table")

## package required to use melt functionality
if (!require("reshape2")) {
install.packages("reshape2")
}
  
require("reshape2")

final_train_dataset <- cbind(as.data.table(subject_train), y_train, x_train)
final_test_dataset <- cbind(as.data.table(subject_test), y_test, x_test)
final_merged_dataset <- rbind(final_train_dataset, final_test_dataset)


## Extract required measurements on the mean and standard deviation for each measurement.

target_features <- grepl("[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]", features)
final_x_test = x_test[,target_features]
final_x_train = x_train[,target_features]

## Merge final data set for mean and standard only
train_data <- cbind(as.data.table(subject_train), y_train, final_x_train)
test_data <- cbind(as.data.table(subject_test), y_test, final_x_test)
final_dataset <- rbind(test_data, train_data)

##label data set
labels_for_id   <- c("Subject", "Activity_ID", "Activity_Label")
labels_data <- setdiff(colnames(final_dataset), labels_for_id)
melt_dataset   <- melt(final_dataset, id = labels_for_id, measure.vars = labels_data)

# Apply mean function to dataset using dcast function to calculate average
tidy_dataset <- dcast(melt_dataset, Subject + Activity_Label ~ variable, mean)

## write final tidy data set
write.table(tidy_dataset, file = "./tidy_data.txt")

