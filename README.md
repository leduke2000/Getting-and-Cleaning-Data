## Cleaning data from Human Activity Recognition Using Smartphones Data Set ##

The script works with data from Human Activity Recognition database (see [1]).
The description of data is in Codebook.md

If the files with the data are not in current working directory, the script downloads it and unzips it.
The download date is stored in download.date variable.
The scrøpt will work if the downloaded folder is not reorganized.

Thenthe data on features, activity type and subject is read both for test and train datasets.

Using the information on the structure of records form 'feature.txt' the script finds the position of variables containing data on mean and standard deviation for each measurement. The expression used to select variable is looking for variable names containing 'mean()' and 'sd()', with brackets, because some variables having 'mean' in their names, such as 'angle(tBodyAccJerkMean),gravityMean)' do not contain mean of a measurement.

Both test and train dataset are subsetted using vector containing positions of measurements from the previous step.

The columns are given descriptive names using data from the file describing features. 

The columns with subject and activity data are appended to the subsets of test and train datasets from previous step. 

Thenthe datasets from previous step are merged.

The columns with data on subject and activity are given the descriptive names.
Thenbrackets are removed from column names and dashes are replaced by low line (both characters can cause problems later).

Thenthe activity labels are replaced by descriptive names  

The output summary table tidy_d contains information on the mean of mean and standard deviation of measurements for each combination of subject and activity.
The output data is written in the file 'tidy.txt' in working directory. It can be read using the following command

 
data <- read.table("tidy.txt", header = TRUE) 

## Refs ##
1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 