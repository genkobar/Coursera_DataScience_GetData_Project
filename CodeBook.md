#CodeBook

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

=================

Variable names in the intermediate data set, stored in the R working space under the name "ttsm" by the run_analysis script.

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
=======================

Variable names in the final data set, stored in the R working space under the name "ttsm_means" by the run_analysis script.

```
1 subject                   
2 activity                  
3 tBodyAcc.mean...X
4 tBodyAcc.mean...Y
5 tBodyAcc.mean...Z
6 tBodyAcc.std...X
7 tBodyAcc.std...Y
8 tBodyAcc.std...Z
9 tGravityAcc.mean...X
10 tGravityAcc.mean...Y
11 tGravityAcc.mean...Z
12 tGravityAcc.std...X
13 tGravityAcc.std...Y
14 tGravityAcc.std...Z
15 tBodyAccJerk.mean...X
16 tBodyAccJerk.mean...Y
17 tBodyAccJerk.mean...Z
18 tBodyAccJerk.std...X
19 tBodyAccJerk.std...Y
20 tBodyAccJerk.std...Z
21 tBodyGyro.mean...X
22 tBodyGyro.mean...Y
23 tBodyGyro.mean...Z
24 tBodyGyro.std...X
25 tBodyGyro.std...Y
26 tBodyGyro.std...Z
27 tBodyGyroJerk.mean...X
28 tBodyGyroJerk.mean...Y
29 tBodyGyroJerk.mean...Z
30 tBodyGyroJerk.std...X
31 tBodyGyroJerk.std...Y
32 tBodyGyroJerk.std...Z
33 tBodyAccMag.mean..
34 tBodyAccMag.std..
35 tGravityAccMag.mean..
36 tGravityAccMag.std..
37 tBodyAccJerkMag.mean..
38 tBodyAccJerkMag.std..
39 tBodyGyroMag.mean..
40 tBodyGyroMag.std..
41 tBodyGyroJerkMag.mean..
42 tBodyGyroJerkMag.std..
43 fBodyAcc.mean...X
44 fBodyAcc.mean...Y
45 fBodyAcc.mean...Z
46 fBodyAcc.std...X
47 fBodyAcc.std...Y
48 fBodyAcc.std...Z
49 fBodyAccJerk.mean...X
50 fBodyAccJerk.mean...Y
51 fBodyAccJerk.mean...Z
52 fBodyAccJerk.std...X
53 fBodyAccJerk.std...Y
54 fBodyAccJerk.std...Z
55 fBodyGyro.mean...X
56 fBodyGyro.mean...Y
57 fBodyGyro.mean...Z
58 fBodyGyro.std...X
59 fBodyGyro.std...Y
60 fBodyGyro.std...Z
61 fBodyAccMag.mean..
62 fBodyAccMag.std..
63 fBodyBodyAccJerkMag.mean..
64 fBodyBodyAccJerkMag.std..
65 fBodyBodyGyroMag.mean..
66 fBodyBodyGyroMag.std..
67 fBodyBodyGyroJerkMag.mean..
68 fBodyBodyGyroJerkMag.std..
```
