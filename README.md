
# Getting-and-Cleaning-Data 
## Course Project 
### README.MD

***

#### Purpose of Project:

Demonstrate your ability to collect, work with, and clean a data set.

***

#### Items to be submitted for evaluation: 

Submit the link to a Github repository that contains the following items:

1. a tidy data set that can be used for analysis ( tidyDataset.txt )
2. a script for performing the analysis ( run_analysis.R )
3. a document that describes the variables, the data, and any transformations ( CODEBOOK.md ).
4. a document that explains how all of the scripts work and how they are connected ( README.md). 

***

#### Step-by-Step description of run_analysis.R Script:

1. Merge the training and the test datasets to create one dataset.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set.
4. Label the dataset with descriptive variable names. 
5. From step 4, create a second tidy data set with the average of each variable for each activity and each subject. 

Note: Upload the dataset as a .txt file created with write.table() using row.name=FALSE

***

#### Data Source Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

Check the README.txt file for further details about this dataset. 

Detailed information about the original Data Source can be found by following the link below:  
[link] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

***

#### Data files Information:

* 'README.txt'

* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

* 'train/subject_train.txt': 
	+ Each row identifies the subject who performed the activity for each window sample. 
	+ Its range is from 1 to 30.
 
* 'test/subject_test.txt': 
	+ Each row identifies the subject who performed the activity for each window sample. 
	+ Its range is from 1 to 30.

* 'train/Inertial Signals/': not used

* 'test/Inertial Signals/': not used

***

#### Attribute Information:

For each record in the dataset it is provided: 

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

***
