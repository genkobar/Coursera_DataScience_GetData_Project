### You should create one R script called run_analysis.R that does the following. 
# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names. 
# 5 From the data set in step 4, creates a second, independent tidy data set with the 
#   average of each variable for each activity and each subject.

library(dplyr)
# 1)
# read in variable names
features <- read.csv("UCI HAR Dataset/features.txt", header=FALSE, sep=" ", stringsAsFactors = FALSE)
featureNames <- features[,2]
remove(features)

#read in test data
test <- read.table("UCI HAR Dataset/test/X_test.txt", blank.lines.skip = FALSE, header=FALSE)

#set variable names in test data frame
names(test) <- featureNames

#read in test subject data
testsub <- read.table("UCI HAR Dataset/test/subject_test.txt", blank.lines.skip = FALSE, header=FALSE)
names(testsub) <- "subject"

#bind subject data to test data
test <- cbind(test, testsub)
remove(testsub)

#read in test activity data
testact <- read.table("UCI HAR Dataset/test/y_test.txt", blank.lines.skip = FALSE, header=FALSE)
names(testact) <- "activity"

#bind activity data to test data
test <- cbind(test, testact)
remove(testact)

test$actlabel <- "unset"

test$actlabel[test$activity == 1] <- "WALKING"
test$actlabel[test$activity == 2] <- "WALKING_UPSTAIRS"
test$actlabel[test$activity == 3] <- "WALKING_DOWNSTAIRS"
test$actlabel[test$activity == 4] <- "SITTING"
test$actlabel[test$activity == 5] <- "STANDING"
test$actlabel[test$activity == 6] <- "LAYING"

############################
#read in training data
train <- read.table("UCI HAR Dataset/train/X_train.txt", blank.lines.skip = FALSE, header=FALSE)

#set variable names in test data frame
names(train) <- featureNames
remove(featureNames)
#read in training subject data
trainsub <- read.table("UCI HAR Dataset/train/subject_train.txt", blank.lines.skip = FALSE, header=FALSE)
names(trainsub) <- "subject"

#bind subject data to training data
train <- cbind(train, trainsub)
remove(trainsub)

#read in training activity data
trainact <- read.table("UCI HAR Dataset/train/y_train.txt", blank.lines.skip = FALSE, header=FALSE)
names(trainact) <- "activity"

#bind activity data to training data
train <- cbind(train, trainact)
remove(trainact)

#add new column with corresponding activity names
train$actlabel <- "unset"
train$actlabel[train$activity == 1] <- "WALKING"
train$actlabel[train$activity == 2] <- "WALKING_UPSTAIRS"
train$actlabel[train$activity == 3] <- "WALKING_DOWNSTAIRS"
train$actlabel[train$activity == 4] <- "SITTING"
train$actlabel[train$activity == 5] <- "STANDING"
train$actlabel[train$activity == 6] <- "LAYING"

#check if columns are the same
sum(names(test) != names(train))

#combine test and training data
traintest <- rbind(train, test)

remove(test)
remove(train)

#remove troublesome data that we don't need for this analysis
traintest <- traintest[!duplicated(names(traintest))]

#remove activity number column
traintest$activity <- NULL

#rename activity name column to "activity"
names(traintest)[names(traintest) == "actlabel"] <- "activity"

#make variable names valid according to R
valid_col_names <- make.names(names=names(traintest), unique = TRUE, allow_ = TRUE)
names(traintest) <- valid_col_names

#subset columns that include mean or std, and also the subject and activity columns
ttsm <- traintest[grep("mean\\.|std|subject|activity", names(traintest))]
remove(traintest)

bySubAct <- group_by(ttsm, subject, activity)
ttsm_means <- summarise_each(bySubAct, funs(mean))
remove(bySubAct)

#write.table(ttsm_means, file="tidy_set.txt", row.names = FALSE)
