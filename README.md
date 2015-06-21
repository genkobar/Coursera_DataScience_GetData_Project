### Getting and Cleaning Data
## Course Project

The file "run_analysis.R" contains all the steps necessary to turn the data from the "UCI HAR Dataset.zip" package into a tidy dataset with only mean and standard deviation values, and then into a smaller dataset with the average values of each column, grouped by subject number and activity type.

The script attempts to load the R-package named "dplyr" so please make sure it is installed.

The "UCI HAR Dataset.zip" package should be unzipped into the working directory before the script is run.

Variable names may be found in the file "CodeBook.md"

=====================

####What the script does

Here I will describe the steps taken to clean and subset the data set.

First, we read in the features.txt file. From the second column of the resulting data set we create a string vector named featureNames.

We read in the test data. We overwrite the column names of the test data table with the featureNames string vector.

We read in the test subject data. This results in a vector of the same length as there are rows in the test data set, so we just bind it to the test data set.

We read in the test activity data. We bind it to the test data set in the same manner as we did with the subject data.

Now, we add a new column to the test data set, called “actlabel”. For each activity number, we store the corresponding activity description, as listed in the activity_labels.txt file, in the “actlabel” column.

We process the training data in the same way.

We read in the training data. We overwrite the column names of the training data table with the featureNames string vector.

We read in the training subject data, and bind it to the training data set.

We read in the training activity data, and bind it to the training data set.

We add a new column to the test data set, called “actlabel”, store corresponding activity names in the column.

At this point we confirm that the training and the test data have the same number of columns, and then join them using rbind().

After this, we remove the number activity column, and rename the temporary "actlabel" column “activity”.

Our new, combined, “traintest” data set contains some columns with names that may cause trouble with later processing. Since these are unnecessary for our final data set, we simply remove them with the function traintest <- traintest[!duplicated(names(traintest))].

Most of the column names also contain illegal characters for R, like parentheses and hyphens, so we remove these using the make.names() function.

Here, we subset the data set. Using grep() with the pattern "mean\\.|std|subject|activity"  against the names of the columns of the set, we create a new data set that only contains columns with the words “mean” or “std”, plus our subject and activity columns. The reason for the \\. after the word “mean” in the pattern is to exclude the columns with “meanFreq”, which are not actually mean values.

This results in our bigger set, described in item 2 of the course project instructions. The next few steps are to produce the final tidy data set.

We create a new data table with the group_by() function, that groups the data in the above set according to subject and activity.

Using summarise_each(), we then create a data table with the mean value of each variable in each group. This creates a set with 180 rows and 68 columns - 6 activities for each of the 30 subjects, 33 std-variables, 33 mean-variables, subject column and activity column.

The line for printing the final set to a file has been commented out, but is kept in the script for posterity.


