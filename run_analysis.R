##---------------------------------------------------------------------- 
## Getting-and-Cleaning-Data
##    Course Project
##        run_analysis.R
##----------------------------------------------------------------------

##----------------------------------------------------------------------
## Step 1.0 - Prepare environment, download and unzip input dataset 
##----------------------------------------------------------------------

  library(plyr)
  library(dplyr)

## Create a directory to hold input data -------------------------------

  if(!file.exists("./ProjectData")){
    dir.create("./ProjectData")
  }

## Link to zipped input dataset --------------------------------------- 

  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## Download zipped input dataset --------------------------------------

  download.file(url,destfile="./ProjectData/Dataset.zip")

## Unzip files into a directory ---------------------------------------

  unzip(zipfile="./ProjectData/Dataset.zip",exdir="./ProjectData")

  ## Note: Inertial Signals files are not used.

##----------------------------------------------------------------------
## Step 1.1 - Read training & test data files 
##----------------------------------------------------------------------

## Read training data files --------------------------------------------

  x_train <- read.table("./ProjectData/UCI HAR Dataset/train/X_train.txt")

  y_train <- read.table("./ProjectData/UCI HAR Dataset/train/y_train.txt")

  subject_train <- read.table("./ProjectData/UCI HAR Dataset/train/subject_train.txt")

## Read test data files ----------------------------------------------

  x_test <- read.table("./ProjectData/UCI HAR Dataset/test/X_test.txt")

  y_test <- read.table("./ProjectData/UCI HAR Dataset/test/y_test.txt")

  subject_test <- read.table("./ProjectData/UCI HAR Dataset/test/subject_test.txt")

##----------------------------------------------------------------------
## Step 1.2 - Merge data files 
##----------------------------------------------------------------------

  features <- rbind(x_train, x_test)
  
  activities <- rbind(y_train, y_test)

  subjects <- rbind(subject_train, subject_test)

##----------------------------------------------------------------------
## Step 1.3 - Read features data file - 561 features 
##----------------------------------------------------------------------

  feature_names <- read.table("./ProjectData/UCI HAR Dataset/features.txt")

##----------------------------------------------------------------------
## Step 1.4 - Read activity_labels data files -  6 activities
##----------------------------------------------------------------------

  activity_labels <- read.table("./ProjectData/UCI HAR Dataset/activity_labels.txt")

##----------------------------------------------------------------------
## Step 1.5 - Appropriately name each columns of 3 separate data frames
##----------------------------------------------------------------------

  names(features) <- feature_names$V2

  names(activities) <- c("activity")

  names(subjects) <- c("subject")

##----------------------------------------------------------------------
## Step 2.0 - Extract column names having mean & std. deviation 
##            Note: get the factors using function grepl()
##----------------------------------------------------------------------

  mean.and.sd <- feature_names$V2[grepl("mean|std", feature_names$V2)]

##----------------------------------------------------------------------
## Step 2.1 - Obtain the subset having mean & std. deviation columns
##----------------------------------------------------------------------

  subsetData <- subset(features, select=mean.and.sd)

##----------------------------------------------------------------------
## Step 2.2 - Merge columns ( 3 data files )
##----------------------------------------------------------------------

  df1 <- cbind(subjects,activities)

  data <- cbind(df1,subsetData)

##----------------------------------------------------------------------
## Step 3.0 - Use descriptive activity names to name the activities 
##            in the data set. Update values of column activity.
##----------------------------------------------------------------------

  data[,2] <- activity_labels[activities[,1], 2]

##----------------------------------------------------------------------
## Step 3.1 - Use descriptive activity names to name the activities 
##            in the data set. Update values of column subject.
##----------------------------------------------------------------------

  data$subject <- as.character(data$subject)

  data$subject[data$subject == 1] <- "Volunteer 01"
  data$subject[data$subject == 2] <- "Volunteer 02"
  data$subject[data$subject == 3] <- "Volunteer 03"
  data$subject[data$subject == 4] <- "Volunteer 04"
  data$subject[data$subject == 5] <- "Volunteer 05"
  data$subject[data$subject == 6] <- "Volunteer 06"
  data$subject[data$subject == 7] <- "Volunteer 07"
  data$subject[data$subject == 8] <- "Volunteer 08"
  data$subject[data$subject == 9] <- "Volunteer 09"
  data$subject[data$subject == 10] <- "Volunteer 10"

  data$subject[data$subject == 11] <- "Volunteer 11"
  data$subject[data$subject == 12] <- "Volunteer 12"
  data$subject[data$subject == 13] <- "Volunteer 13"
  data$subject[data$subject == 14] <- "Volunteer 14"
  data$subject[data$subject == 15] <- "Volunteer 15"
  data$subject[data$subject == 16] <- "Volunteer 16"
  data$subject[data$subject == 17] <- "Volunteer 17"
  data$subject[data$subject == 18] <- "Volunteer 18"
  data$subject[data$subject == 19] <- "Volunteer 19"
  data$subject[data$subject == 20] <- "Volunteer 20"

  data$subject[data$subject == 21] <- "Volunteer 21"
  data$subject[data$subject == 22] <- "Volunteer 22"
  data$subject[data$subject == 23] <- "Volunteer 23"
  data$subject[data$subject == 24] <- "Volunteer 24"
  data$subject[data$subject == 25] <- "Volunteer 25"
  data$subject[data$subject == 26] <- "Volunteer 26"
  data$subject[data$subject == 27] <- "Volunteer 27"
  data$subject[data$subject == 28] <- "Volunteer 28"
  data$subject[data$subject == 29] <- "Volunteer 29"
  data$subject[data$subject == 30] <- "Volunteer 30"

##----------------------------------------------------------------------
## Step 4.0 - Label the dataset with descriptive variable names.
##            Correctly spell out the variable names.
##----------------------------------------------------------------------

  names(data) <- gsub("^t", "time", names(data))
  names(data) <- gsub("^f", "frequency", names(data))
  names(data) <- gsub("Acc", "Accelerometer", names(data))
  names(data) <- gsub("Gyro", "Gyroscope", names(data))
  names(data) <- gsub("Mag", "Magnitude", names(data))
  names(data) <- gsub("BodyBody", "Body", names(data))

##----------------------------------------------------------------------
## Step 5.0 - create a second tidy data set with the average of 
##            each variable for each activity and each subject. 
##----------------------------------------------------------------------

  data2 <- ddply(data,.(subject,activity),numcolwise(mean))

  write.table(data2, file = "./ProjectData/tidyDataset.txt",row.name=FALSE)


