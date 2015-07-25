## Project description ##

The project is to get data on sport activities collected from smartphone's accelerometers (see [1]) and to transform it into a tidy dataset of mean values of certains measurements.


## Raw data ##
The data is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip than unzipped.
The general description of data, stored in multiple txt files, available in 'readme.txt'. The detailed description is in 'features_info.txt'.
Briefly the data from accelerometer is collected on 30 individuals doing 6 activities.

The data of features is stored in 'X_test.txt' and 'X_train.txt'.
'X_test.txt' contains 2947 records
'X_train.txt' contains 7352 records

Each record corresponds to one row, where feature data is stored in form of sting with 561 features values separated by spaces.
The 'features.txt' explains what position in the line a given feature takes. For example the feature ' tBodyAcc-std()-X' - standard deviation of body acceleration along the axe X is always the 4th value in the string.

The files 'y_test.txt' and 'y_train' contains information on the activity corresponding to each record. The activity is coded in numerical labels, which is linked to activity name in 'activity_labels.txt' file.

The files 'subject_train.txt' and 'subject_test.txt' contain information of subject for each record.

##Codebook
One variable corresponds to one column, one observation is stored in one row. There are 180 observations and 68 variables.

The subject number is stored in numerical variable 'subject', there are 30 subjects.
The activity name is stored in factor variable 'activity', there are 6 activities:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

All other measurements are stored in numerical form and represent mean values of mean and standard deviation of  values calculated by dataset creators form accelerometer data. 

All measurement are normalised and bounded between 1- and 1,

There are two types of data among measurements time data and frequency data obtained from time data processing by Fast Fourier Transformation. The first letter in variable name indicates it's type.
- t stands for time domain data
- f stands for frequency domain data

Most of variables concern body-related measurements, but variables starting with 'Gravity' contain gravity acceleration signal. There are triaxial measurements of gravity with axis label at the end of variable name as in 'tGravityAcc_mean_X' and calculation of magnitude of gravity, stored in variable including GyroMag in the name. 

Body-related measurements include triaxial measurements of:
- Acceleration - labeled Acc
- Acceleration jerk - labeled AccJerk
- Angular velocity - labeled Gyro
- Angular velocity jerk - labeled GyroJerk

The axis name is at the end of variable name.


Body-related measurement include also the calculated magnitude of measured triaxial values, stored in variables including Mag in their name.


## References ##
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

