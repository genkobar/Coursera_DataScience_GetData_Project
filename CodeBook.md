#CodeBook
####For the Getting And Cleaning Data Course Project

Here I will describe the steps taken to clean and subset the data set.

First, we read in the features.txt file. From the second column of the resulting data set we create a string vector named featureNames.

We read in the test data. We overwrite the column names of the test data table with the featureNames string vector.

We read in the test subject data. This results in a vector of the same length as there are rows in the test data set, so we just bind it to the test data set.

We read in the test activity data. We bind it to the test data set in the same manner as we did with the subject data.

Now, we add a new column to the test data set, called “actlabel”. For each activity number, we store the corresponding activity description, as listed in the activity_labels.txt file, in the “actlabel” column. After this is done, we remove the number activity column, and rename the new column “activity”.

We process the training data in the same way.

We read in the training data. We overwrite the column names of the training data table with the featureNames string vector.

We read in the training subject data, and bind it to the training data set.

We read in the training activity data, and bind it to the training data set.

We add a new column to the test data set, called “actlabel”, store corresponding activity names in the columns, delete number activity column and rename the new one.

At this point we confirm that the training and the test data have the same number of columns, and then join them using rbind().

Our new, combined, “traintest” data set contains some columns with names that may cause trouble with later processing. Since these are unnecessary for our final data set, we simply remove them with the function traintest <- traintest[!duplicated(names(traintest))].

Most of the column names also contain illegal characters for R, like parentheses and hyphens, so we remove these using the make.names() function.

Here, we subset the data set. Using grep() with the pattern "mean\\.|std|subject|activity"  against the names of the columns of the set, we create a new data set that only contains columns with the words “mean” or “std”, plus our subject and activity columns. The reason for the \\. after the word “mean” in the pattern is to exclude the columns with “meanFreq”, which are not actually mean values.

This results in our bigger set, described in item 2 of the course project instructions. The next few steps are to produce the final tidy data set.

We create a new data table with the group_by() function, that groups the data in the above set according to subject and activity.

Using summarise_each(), we then create a data table with the mean value of each variable in each group. This creates a set with 180 rows and 68 columns - 6 activities for each of the 30 subjects, 33 std-variables, 33 mean-variables, subject column and activity column.

The line for printing the final set to a file has been commented out, but is kept in the script for posterity.


What follows is an excerpt from the features_info.txt file included in the data package. The variables not featured in the data set after the analysis have been removed. Finally, at the bottom, is a list of variables in the tidy data set.


###Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

```
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
```

The set of variables that were estimated from these signals are: 

mean: Mean value
std: Standard deviation

The complete list of variables starts here.

```
1 tBodyAcc.mean...X
2 tBodyAcc.mean...Y
3 tBodyAcc.mean...Z
4 tBodyAcc.std...X
5 tBodyAcc.std...Y
6 tBodyAcc.std...Z
7 tGravityAcc.mean...X
8 tGravityAcc.mean...Y
9 tGravityAcc.mean...Z
10 tGravityAcc.std...X
11 tGravityAcc.std...Y
12 tGravityAcc.std...Z
13 tBodyAccJerk.mean...X
14 tBodyAccJerk.mean...Y
15 tBodyAccJerk.mean...Z
16 tBodyAccJerk.std...X
17 tBodyAccJerk.std...Y
18 tBodyAccJerk.std...Z
19 tBodyGyro.mean...X
20 tBodyGyro.mean...Y
21 tBodyGyro.mean...Z
22 tBodyGyro.std...X
23 tBodyGyro.std...Y
24 tBodyGyro.std...Z
25 tBodyGyroJerk.mean...X
26 tBodyGyroJerk.mean...Y
27 tBodyGyroJerk.mean...Z
28 tBodyGyroJerk.std...X
29 tBodyGyroJerk.std...Y
30 tBodyGyroJerk.std...Z
31 tBodyAccMag.mean..
32 tBodyAccMag.std..
33 tGravityAccMag.mean..
34 tGravityAccMag.std..
35 tBodyAccJerkMag.mean..
36 tBodyAccJerkMag.std..
37 tBodyGyroMag.mean..
38 tBodyGyroMag.std..
39 tBodyGyroJerkMag.mean..
40 tBodyGyroJerkMag.std..
41 fBodyAcc.mean...X
42 fBodyAcc.mean...Y
43 fBodyAcc.mean...Z
44 fBodyAcc.std...X
45 fBodyAcc.std...Y
46 fBodyAcc.std...Z
47 fBodyAccJerk.mean...X
48 fBodyAccJerk.mean...Y
49 fBodyAccJerk.mean...Z
50 fBodyAccJerk.std...X
51 fBodyAccJerk.std...Y
52 fBodyAccJerk.std...Z
53 fBodyGyro.mean...X
54 fBodyGyro.mean...Y
55 fBodyGyro.mean...Z
56 fBodyGyro.std...X
57 fBodyGyro.std...Y
58 fBodyGyro.std...Z
59 fBodyAccMag.mean..
60 fBodyAccMag.std..
61 fBodyBodyAccJerkMag.mean..
62 fBodyBodyAccJerkMag.std..
63 fBodyBodyGyroMag.mean..
64 fBodyBodyGyroMag.std..
65 fBodyBodyGyroJerkMag.mean..
66 fBodyBodyGyroJerkMag.std..
67 subject
68 activity
```
