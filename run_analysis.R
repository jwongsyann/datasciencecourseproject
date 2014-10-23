### This code extracts the data from the data set, compiles the test data and train data together
### Please find variable descriptions in the code book.

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

# Create factor variable for set
testset<-cbind(rep("test",dim(testset)[1]),testset)
trainset<-cbind(rep("train",dim(trainset)[1]),trainset)

# Merge individual datasets with their subject vectors and label vectors.
totaltestset<-cbind(testsubjects,testlabels,testset)
totaltrainset<-cbind(trainsubjects,trainlabels,trainset)

# Create column names appended with 3 extra id variables, subject, activity and set.
features<-as.character(features[,2])
totalfeatures<-c("Subject","Activity","Set",features)

# Rename individual sets columns
colnames(totaltestset)<-totalfeatures
colnames(totaltrainset)<-totalfeatures

# Merge both sets for both test and train.
totalset<-rbind(totaltestset,totaltrainset)

# Subset data for only mean and std data 
# Creates factor variables for mean and std 
meanlevels<-grep("mean",totalfeatures)
stdlevels<-grep("std",totalfeatures)
# Creates a combined factor variable vector for all mean and std and include the 3 id variables
subsetfeatures<-c("Subject","Activity","Set",totalfeatures[meanlevels],totalfeatures[stdlevels])
# Subsets the data with the new combined factor variable vector
subsetdata<-totalset[,subsetfeatures]

# Use descriptive activity names to name the activities in the data set
subsetdata$Activity<-factor(subsetdata$Activity,levels=activitylabels[,1],labels=activitylabels[,2])

# Renames the subset features
subsetfeatures<-gsub("tBody","timebody",subsetfeatures)
subsetfeatures<-gsub("fBody","frequencybody",subsetfeatures)
subsetfeatures<-gsub("Acc","acceleration",subsetfeatures)
subsetfeatures<-gsub("tGravity","timegravity",subsetfeatures)
subsetfeatures<-gsub("Gyro","gyroscope",subsetfeatures)
subsetfeatures<-gsub("mean","mean",subsetfeatures)
subsetfeatures<-gsub("std","standarddeviation",subsetfeatures)
subsetfeatures<-gsub("Freq","frequency",subsetfeatures)
subsetfeatures<-gsub("-|\\(\\)","",subsetfeatures)

# Replaces the column names of the subsetted data
colnames(subsetdata)<-subsetfeatures

# Create a second tidy data set with average of each variable for each activity and subject
# Transforms data into skinny tidy data with id as subject and activity and all else as variables ex Set.
subsetMelt<-melt(subsetdata,id=names(subsetdata)[1:2],measure.vars=names(subsetdata)[4:dim(subsetdata)[2]])
subsetcast<-dcast(subsetMelt, Subject + Activity ~ variable, mean)

# Write new tidy data to text file
write.table(subsetcast,file="tidydata.txt",row.names=FALSE)
