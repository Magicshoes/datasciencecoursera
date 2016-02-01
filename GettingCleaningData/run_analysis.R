## Data collected from the accelerometers from the Samsung Galaxy S smartphone stored at
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## Create one R script called run_analysis.R that does the following.
## 1 Merges the training and the test sets to create one data set.
## 2 Extracts only the measurements on the mean and standard deviation for each measurement.
## 3 Uses descriptive activity names to name the activities in the data set
## 4 Appropriately labels the data set with descriptive variable names.
## 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

require("data.table")
require("reshape2")

# loads features and activity labels
features <- read.csv("Downloads/UCI HAR Dataset/features.txt", sep= " ", header=FALSE)[,2]
activity_labels <- read.csv("Downloads/UCI HAR Dataset/activity_labels.txt", sep= " ", header=FALSE)[,2]

## Extracts only mean and STDev feature labels
extract_features <- grepl("mean|std", features)

# Loads test data
X_test  <- read.csv("Downloads/UCI HAR Dataset/test/X_test.txt", sep= " ", header=FALSE)
y_test <- read.csv("Downloads/UCI HAR Dataset/test/y_test.txt", sep= " ", header=FALSE)
subject_test <- read.csv("Downloads/UCI HAR Dataset/test/subject_test.txt", sep= " ", header=FALSE)

# renames columns with features vector
names(X_test) <- features

# Test data will only have extracted means and STDev features
X_test <- X_test[,extract_features]

# labels the activity and subject Data frames
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# combine all three to create test data frame
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

# Loads train data
X_train  <- read.csv("Downloads/UCI HAR Dataset/train/X_train.txt", sep= " ", header=FALSE)
y_train <- read.csv("Downloads/UCI HAR Dataset/train/y_train.txt", sep= " ", header=FALSE)
subject_train <- read.csv("Downloads/UCI HAR Dataset/train/subject_train.txt", sep= " ", header=FALSE)

# renames columns with features vector
names(X_train) <- features

# Train data will only have extracted means and STDev features
X_train <- X_train[,extract_features]

# labels the activity and subject Data frames
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# combine all three to create train data frame
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Add train data to bottom of test data 
test_train_data = rbind(test_data, train_data)

# Melt data using the ID variables, all others are measurement variables, remove NA for mean function later
id_variables <- c("subject", "Activity_ID", "Activity_Label")
melted_data <- melt(test_train_data, id.vars=id_variables, na.rm=TRUE)

# create tidy data set of mean of each variable for each activity for each subject
tidy_data <- dcast(melted_data, subject + Activity_Label ~ variable, mean)

