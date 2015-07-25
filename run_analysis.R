# Course Project Getting and Cleaning Data 
setwd("C:/A/Work/Séminiares/Coursera/Data Science/Getting And Cleaning Data/CourseProject")
library(dplyr)
if(!file.exists("UCI HAR Dataset"))
{     
  url_a<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  # to make download.file work with https
  date.downloaded<-date()
  setInternet2(use = TRUE)
  download.file(url = url_a, destfile = "data_a.zip")
  unzip("data_a.zip")
}
# reading and subsetting training dataset
# train features list for  records
X_train<-read.table(file="UCI HAR Dataset/train/X_train.txt")
# activity data (labels) for each record in train dataset
y_train<-read.table(file="UCI HAR Dataset/train/y_train.txt")
# data on subject for every record in train dataset
subject_train<-read.table(file="UCI HAR Dataset/train/subject_train.txt")

# reading file with feature desctiption 
features<-read.table("UCI HAR Dataset/features.txt")

# gettin indicies of columns containg mean and standard deviation
meansd_f <- grep("mean\\(\\)|std\\(\\)",features$V2)
# subsetting columns with mean and std
train_sbst<-X_train[,meansd_f]
# giving descriptive names to variables, taking them from features list
colnames(train_sbst)<-features[meansd_f,2]

# adding subject and activity data to the subset of feature dataset
train_sbjact<-cbind(subject_train,y_train,train_sbst)

# doing the same for test dataset, reusing 'features' and 'meansd_f'
# reading and subsetting test dataset
# train features list for 7352 records
X_test<-read.table(file="UCI HAR Dataset/test/X_test.txt")
# activity data (labels) for each record in test dataset
y_test<-read.table(file="UCI HAR Dataset/test/y_test.txt")
# data on subject for every record in test dataset
subject_test<-read.table(file="UCI HAR Dataset/test/subject_test.txt")

# subsetting columns with mean and std
test_sbst<-X_test[,meansd_f]
# giving descriptive names to variables, taking them from features list
colnames(test_sbst)<-features[meansd_f,2]

# adding subject and activity data to the subset of feature dataset
test_sbjact<-cbind(subject_test,y_test,test_sbst)


# merging test and train
data <- rbind(test_sbjact,train_sbjact)
colnames(data)[1:2]<-c("subject","activity")
#removing characters that can make problems in variables names 
colnames(data)<-gsub("\\(|\\)","",colnames(data))
colnames(data)<-gsub("-","_",colnames(data))

table(tidy_d$activity)
# adding descriptive activity names 
# reading activity labels 
act_labels <- read.table(file="UCI HAR Dataset/activity_labels.txt")
# transforming variable to factor with meaningfull level labels
data$activity<-factor(data$activity, labels=act_labels$V2)

# output: calculating mean for each variable
tidy_d<-aggregate(data[,3:68],by=data[,1:2],FUN=mean)

#writing to file
write.table(tidy_d,file="tidy.txt",row.names = F)
