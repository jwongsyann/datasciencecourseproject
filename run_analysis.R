# Source libraries
library(reshape2)

# Set working directory
setwd("C:/Users/Justin/Documents/Data Science/Getting and Cleaning Data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

# Extracting data
testset<-read.table("./test/X_test.txt")
testlabels<-read.table("./test/y_test.txt")
testsubjects<-read.table("./test/subject_test.txt")
trainset<-read.table("./train/X_train.txt")
trainlabels<-read.table("./train/y_train.txt")
trainsubjects<-read.table("./train/subject_train.txt")
features<-read.table("features.txt")
activitylabels<-read.table("activity_labels.txt")

# Create variable for set
testset<-cbind(rep("test",dim(testset)[1]),testset)
trainset<-cbind(rep("train",dim(trainset)[1]),trainset)

# Merge individually
totaltestset<-cbind(testsubjects,testlabels,testset)
totaltrainset<-cbind(trainsubjects,trainlabels,trainset)

# Create column names
features<-as.character(features[,2])
totalfeatures<-c("Subject","Activity","Set",features)

# Rename individual sets columns
colnames(totaltestset)<-totalfeatures
colnames(totaltrainset)<-totalfeatures

# Merge both sets
totalset<-rbind(totaltestset,totaltrainset)

# Subset data to only mean and std data 
meanlevels<-grep("mean",totalfeatures)
stdlevels<-grep("std",totalfeatures)
subsetfeatures<-c("Subject","Activity","Set",totalfeatures[meanlevels],totalfeatures[stdlevels])
subsetdata<-totalset[,subsetfeatures]

# Use descriptive activity names to name the activities in the data set
subsetdata$Activity<-factor(subsetdata$Activity,levels=activitylabels[,1],labels=activitylabels[,2])

# Renames the subset features
subsetfeatures<-gsub("tBody","timeBody",subsetfeatures)
subsetfeatures<-gsub("fBody","frequencyBody",subsetfeatures)
subsetfeatures<-gsub("Acc","Acceleration",subsetfeatures)
subsetfeatures<-gsub("tGravity","timeGravity",subsetfeatures)
subsetfeatures<-gsub("Gyro","Gyroscope",subsetfeatures)
subsetfeatures<-gsub("mean","Mean",subsetfeatures)
subsetfeatures<-gsub("std","StandardDeviation",subsetfeatures)
subsetfeatures<-gsub("Freq","Frequency",subsetfeatures)
subsetfeatures<-gsub("-","",subsetfeatures)
subsetfeatures<-gsub("\\(\\)","",subsetfeatures)

# Replaces the column names of the subsetted data
colnames(subsetdata)<-subsetfeatures

# Create a second tidy data set with average of each variable for each activity and subject
subsetMelt<-melt(subsetdata,id=names(subsetdata)[1:2],measure.vars=names(subsetdata)[4:dim(subsetdata)[2]])
subsetcast<-dcast(subsetMelt, Subject + Activity ~ variable, mean)
