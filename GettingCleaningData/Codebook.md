---
title: "CodeBook"
author: "Mike McLaughlin"
date: "February 3, 2016"
output: html_document
---

Codebook

This codebook includes the data, the variables and any transformations that I have performed to clean up the data.

Data

The original data set is UCI Machine Learning Repository.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Variables

Here are the variables that are present in tidy data set.

subject = Each row identifies the subject who performed the activity for each window sample
activity = type of activity

[1] "tBodyAccmeanX" "tBodyAccmeanY"
[3] "tBodyAccmeanZ" "tBodyAccstdX"
[5] "tBodyAccstdY" "tBodyAccstdZ"
[7] "tGravityAccmeanX" "tGravityAccmeanY"
[9] "tGravityAccmeanZ" "tGravityAccstdX"
[11] "tGravityAccstdY" "tGravityAccstdZ"
[13] "tBodyAccJerkmeanX" "tBodyAccJerkmeanY"
[15] "tBodyAccJerkmeanZ" "tBodyAccJerkstdX"
[17] "tBodyAccJerkstdY" "tBodyAccJerkstdZ"
[19] "tBodyGyromeanX" "tBodyGyromeanY"
[21] "tBodyGyromeanZ" "tBodyGyrostdX"
[23] "tBodyGyrostdY" "tBodyGyrostdZ"
[25] "tBodyGyroJerkmeanX" "tBodyGyroJerkmeanY"
[27] "tBodyGyroJerkmeanZ" "tBodyGyroJerkstdX"
[29] "tBodyGyroJerkstdY" "tBodyGyroJerkstdZ"
[31] "tBodyAccMagmean" "tBodyAccMagstd"
[33] "tGravityAccMagmean" "tGravityAccMagstd"
[35] "tBodyAccJerkMagmean" "tBodyAccJerkMagstd"
[37] "tBodyGyroMagmean" "tBodyGyroMagstd"
[39] "tBodyGyroJerkMagmean" "tBodyGyroJerkMagstd"
[41] "fBodyAccmeanX" "fBodyAccmeanY"
[43] "fBodyAccmeanZ" "fBodyAccstdX"
[45] "fBodyAccstdY" "fBodyAccstdZ"
[47] "fBodyAccmeanFreqX" "fBodyAccmeanFreqY"
[49] "fBodyAccmeanFreqZ" "fBodyAccJerkmeanX"
[51] "fBodyAccJerkmeanY" "fBodyAccJerkmeanZ"
[53] "fBodyAccJerkstdX" "fBodyAccJerkstdY"
[55] "fBodyAccJerkstdZ" "fBodyAccJerkmeanFreqX"
[57] "fBodyAccJerkmeanFreqY" "fBodyAccJerkmeanFreqZ"
[59] "fBodyGyromeanX" "fBodyGyromeanY"
[61] "fBodyGyromeanZ" "fBodyGyrostdX"
[63] "fBodyGyrostdY" "fBodyGyrostdZ"
[65] "fBodyGyromeanFreqX" "fBodyGyromeanFreqY"
[67] "fBodyGyromeanFreqZ" "fBodyAccMagmean"
[69] "fBodyAccMagstd" "fBodyAccMagmeanFreq"
[71] "fBodyBodyAccJerkMagmean" "fBodyBodyAccJerkMagstd"
[73] "fBodyBodyAccJerkMagmeanFreq" "fBodyBodyGyroMagmean"
[75] "fBodyBodyGyroMagstd" "fBodyBodyGyroMagmeanFreq"
[77] "fBodyBodyGyroJerkMagmean" "fBodyBodyGyroJerkMagstd"
[79] "fBodyBodyGyroJerkMagmeanFreq" "angletBodyAccJerkMean,gravityMean" [81] "angletBodyGyroMearavityMean" "angletBodyGyroJerkMearavityMean"
[83] "angleravityMean" "angleravityMean"
[85] "angleravityMean"

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. Prefix t and f is showing time and frequncy respectively. Acceleration is of two type, one is body acceleration (BodyAcc) and another one is gravity acceleration (GravityAcc).Gyro stands for gyroscope and Mag stands for magnitude.

Transformations

I merged the train and test data set with the additional variables subject and activity.
I replaced the train and test lables with the activity names.
I filtered out the variables to include only mean and Standard Dev variables.
I averaged all variables for each subject and activity.