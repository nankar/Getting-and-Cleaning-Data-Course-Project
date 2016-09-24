This is the code book for Cleaning and Getting Data course project

This CodeBook.md file describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md

run_analysis.R reads in the processed experiment data and performs a number of steps to get it into summary form.

Scripts downloads the file from source link
test and train datasets are read in and merged into one data frame.
The data columns and activity labels are then given names based on the features.txt and activity_labels.txt
using grepl mean or standard deviation measurements are selected from the given dataset and other columns are excluded from the rest of the analysis.
The activity identifiers are replaced with the activity labels based on the activity_labels.txt file.
The data is then grouped by subject and activity, and the mean is calculated for every measurement column.
resultant summary dataset is written to a file, tidy_dataset.txt.

The script Install packages data.table and reshape2 to use as.data.table and melt functionality
Below are the variable names and purpose of use in run_analysis.R:
source_dataset_url - link of source dataset
x_train - data frame created for x_train.txt using read.table
y_train - data frame created for y_train.txt using read.table
subject_train - data frame created for subject_train.txt using read.table
x_test - data frame created for x_test.txt using read.table
y_test - data frame created for y_train.txt using read.table
subject_test - data frame created for subject_test.txt using read.table
features - data frame created for features.txt using read.table which reads data columns
activity_labels - read activity labels using activity_labels.txt
final_train_dataset -merged train dataset
final_test_dataset -merged test data set
final_merged_dataset - merged train and test dataset
target_features - extract only mean and std measurements
train_data - filtered train dataset with only mean and std measurements
test_data - filtered test dataset with only mean and std measurements
final_dataset - merged filtered train and test dataset
labels_data - uses descriptive activity names to name the activities in the data set
melt_dataset - appropriately labels the data set with descriptive variable names
tidy_dataset- final summarized dataset calculated with average of measurments

Columns in output file

The columns included in the output file are listed below:

Subject - The id of the experiment participant 
Activity_Label -Name of the activity that the measurements correspond to
tBodyAcc-mean()-X 
tBodyAcc-mean()-Y 
tBodyAcc-mean()-Z 
tBodyAcc-std()-X 
tBodyAcc-std()-Y 
tBodyAcc-std()-Z 
tGravityAcc-mean()-X 
tGravityAcc-mean()-Y 
tGravityAcc-mean()-Z 
tGravityAcc-std()-X 
tGravityAcc-std()-Y 
tGravityAcc-std()-Z 
tBodyAccJerk-mean()-X 
tBodyAccJerk-mean()-Y 
tBodyAccJerk-mean()-Z 
tBodyAccJerk-std()-X 
tBodyAccJerk-std()-Y 
tBodyAccJerk-std()-Z 
tBodyGyro-mean()-X 
tBodyGyro-mean()-Y 
tBodyGyro-mean()-Z 
tBodyGyro-std()-X 
tBodyGyro-std()-Y 
tBodyGyro-std()-Z 
tBodyGyroJerk-mean()-X 
tBodyGyroJerk-mean()-Y 
tBodyGyroJerk-mean()-Z 
tBodyGyroJerk-std()-X 
tBodyGyroJerk-std()-Y 
tBodyGyroJerk-std()-Z 
tBodyAccMag-mean() 
tBodyAccMag-std() 
tGravityAccMag-mean() 
tGravityAccMag-std() 
tBodyAccJerkMag-mean() 
tBodyAccJerkMag-std() 
tBodyGyroMag-mean() 
tBodyGyroMag-std() 
tBodyGyroJerkMag-mean() 
tBodyGyroJerkMag-std() 
fBodyAcc-mean()-X 
fBodyAcc-mean()-Y 
fBodyAcc-mean()-Z 
fBodyAcc-std()-X 
fBodyAcc-std()-Y 
fBodyAcc-std()-Z 
fBodyAcc-meanFreq()-X 
fBodyAcc-meanFreq()-Y 
fBodyAcc-meanFreq()-Z 
fBodyAccJerk-mean()-X 
fBodyAccJerk-mean()-Y 
fBodyAccJerk-mean()-Z 
fBodyAccJerk-std()-X 
fBodyAccJerk-std()-Y 
fBodyAccJerk-std()-Z 
fBodyAccJerk-meanFreq()-X 
fBodyAccJerk-meanFreq()-Y 
fBodyAccJerk-meanFreq()-Z 
fBodyGyro-mean()-X 
fBodyGyro-mean()-Y 
fBodyGyro-mean()-Z 
fBodyGyro-std()-X 
fBodyGyro-std()-Y 
fBodyGyro-std()-Z 
fBodyGyro-meanFreq()-X 
fBodyGyro-meanFreq()-Y 
fBodyGyro-meanFreq()-Z 
fBodyAccMag-mean() 
fBodyAccMag-std() 
fBodyAccMag-meanFreq() 
fBodyBodyAccJerkMag-mean() 
fBodyBodyAccJerkMag-std() 
fBodyBodyAccJerkMag-meanFreq() 
fBodyBodyGyroMag-mean() 
fBodyBodyGyroMag-std() 
fBodyBodyGyroMag-meanFreq() 
fBodyBodyGyroJerkMag-mean() 
fBodyBodyGyroJerkMag-std() 
fBodyBodyGyroJerkMag-meanFreq() 
angle(tBodyAccMean,gravity) 
angle(tBodyAccJerkMean),gravityMean) 
angle(tBodyGyroMean,gravityMean) 
angle(tBodyGyroJerkMean,gravityMean) 
angle(X,gravityMean) 
angle(Y,gravityMean) 
angle(Z,gravityMean)
