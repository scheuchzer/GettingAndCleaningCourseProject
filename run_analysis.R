#
# Script that runs the analysis task of the Coursera Getting and Cleaning Course Project.
# 
#
library(dplyr)

# assuming that the data is in the working directory
unzip("getdata-projectfiles-UCI HAR Dataset.zip")

# Load the feature names. We'll use these names to label the columns of the dataset
features <- read.table("UCI HAR Dataset/features.txt")
featureNames <- features$V2

# Load the activity names. We'll use these names as descriptive activity names instead of just a number
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
# Load the training data set
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")
# Load the train subject identifiers
trainSubjectData <- read.table("UCI HAR Dataset/train/subject_train.txt")
# Load the train activies
trainActivityData <- read.table("UCI HAR Dataset/train/y_train.txt")

# Load the test data set
testData <- read.table("UCI HAR Dataset/test/X_test.txt")
# Load the test subject identifiers
testSubjectData <- read.table("UCI HAR Dataset/test/subject_test.txt")
# Load the test activies
testActivityData <- read.table("UCI HAR Dataset/test/y_test.txt")

# concat training and test data
allMeasurementData <- rbind(trainData, testData)
names(allMeasurementData) <- featureNames
allSubjectData <- rbind(trainSubjectData, testSubjectData)
allActivityData <- rbind(trainActivityData, testActivityData)
allActivityLabelled <- merge(x = allActivityData, y = activityLabels)
<<<<<<< HEAD
=======
#names(allActivityLabelled) <- c("activityId", "activity")
>>>>>>> 707ff679d0d8626fc76a271b675812ff1f6064c3
# merge together
allData <- cbind(allSubjectData, allActivityLabelled, allMeasurementData)
# name the columns
names(allData) <- c('subject', 'activityId', 'activity', names(allMeasurementData))

<<<<<<< HEAD
=======

>>>>>>> 707ff679d0d8626fc76a271b675812ff1f6064c3
# extract the measurements on the mean and standard deviation for each measurement. First columns are the subject and activity
columnsOfInterest <- c(1, 3, grep("std|mean", names(allData)))
stdAndMeanData <- allData[, columnsOfInterest]

# group by subject and activity
grouped <- group_by_(stdAndMeanData, .dots=c('subject','activity'))
# an run mean on every column
meansBySubjectAndActivity <- grouped %>% summarise_each(funs(mean)) %>% arrange(subject, activity)

write.table(meansBySubjectAndActivity, file="tidyData.txt", row.name=FALSE)
<<<<<<< HEAD

=======
>>>>>>> 707ff679d0d8626fc76a271b675812ff1f6064c3
