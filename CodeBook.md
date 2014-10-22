---
title: "CodeBook"
output: html_document
---

The additional variable descriptions are as follows,

- testset         : measurements dataset for test subjects
- testlabels      : label dataset for test subjects
- testsubjects    : subject dataset for test subjects
- trainset        : measurements dataset for train subjects
- trainlabels     : label dataset for train subjects
- trainsubjects   : subject dataset for train subjects
- features        : features dataset.
- activitylabels  : label dataset for all activities
- totaltestset    : measurement, label and subject datasets merged for test subjects
- totaltrainset   : measurement, label and subject datasets merged for train subjects
- totalfeatures   : features dataset appended with 3 additional id variables, "Subject", "Activity" and "Set"
- totalset        : measurement, label and subject datasets merged for both test and train subjects
- meanlevels      : Level factors for mean variables
- stdlevels       : Level factors for standard deviation variables.
- subsetfeatures  : subsetted features dataset appended with the id variables, "Subject", "Activity" and "Set".
- subsetdata      : Tidy data of subsetted totalset dataset using the subsetfeatures as subsetting factors.
- subsetMelt      : Skinny tidy data of id variables "Subject" and "Activity" and all other subsetfeatures except "Set"
- subsetcast      : Tidy dataset of average values of all variables in the subsetMelt dataset, for each subject and activity.

The original variable descriptions are as follows;

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

