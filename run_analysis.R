# 1. Merge the training and the test sets to create one data set.


# test filenames

subjecttestFile<-"./UCI HAR Dataset/test/subject_test.txt"
xtestFile<-"./UCI HAR Dataset/test/X_test.txt"
ytestFile<-"./UCI HAR Dataset/test/y_test.txt"

# Define train filenames

subjecttrainFile<-"./UCI HAR Dataset/train/subject_train.txt"
xtrainFile<-"./UCI HAR Dataset/train/X_train.txt"
ytrainFile<-"./UCI HAR Dataset/train/y_train.txt"

# Load test files into data frames

subjecttestDF<-read.table(subjecttestFile)
xtestDF<-read.table(xtestFile)
ytestDF<-read.table(ytestFile)

# Creating data frames

subjecttrainDF<-read.table(subjecttrainFile)
xtrainDF<-read.table(xtrainFile)
ytrainDF<-read.table(ytrainFile)

# Merging Data Frames

subjectDF<-rbind(subjecttestDF,subjecttrainDF)
xDF<-rbind(xtestDF,xtrainDF)
yDF<-rbind(ytestDF,ytrainDF)

# Column Names

colnames(subjectDF)<-"subject"
colnames(yDF)<-"activity"

featuresFile<-"./UCI HAR Dataset/features.txt"
featuresDF<-read.table(featuresFile)
colnames(featuresDF)<-c("feature","featureName")
featuresV<-featuresDF$featureName 
colnames(xDF)<-featuresV

# creating a single data frame 

comboDF<-cbind(subjectDF,yDF,xDF)

# 2. Measurement. 

comboDFCOLS<-colnames(comboDF)
comboDFCOLSIDX<-grep("-mean\\(\\)|-std\\(\\)", comboDFCOLS)
comboDF<-comboDF[,c(1,2,comboDFCOLSIDX)]

# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 

  
  activityFile<-"./UCI HAR Dataset/activity_labels.txt"
activityDF<-read.table(activityFile, stringsAsFactors=FALSE)
colnames(activityDF)<-c("activity","activityName")
comboDF<-merge(comboDF, activityDF, by="activity")
