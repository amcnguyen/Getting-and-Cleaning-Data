
# Getting-and-Cleaning-Data 
## Course Project 
### CODEBOOK.MD

***

#### Purpose of document:

Describe the variables, the data, and any transformations or work that you performed to clean up the data .


#### Output data file description: 

* The run_analysis.R script will create the output dataset __tidyDataset.txt__ with write.table() using row.name=FALSE.

* That tidy dataset contains the average of each variable for each activity and each subject.

* There are 180 rows ( 30 volunteers * 6 activities ).

* Each row has 68 columns ( mean and standard deviation ).

***

#### Attribute information:

For each record, we have:  

* subject: 
	+ representing subjects who carried out the experiment
	+ Original domain of values: 1:30
	+ Numeric values are later converted to 'Volunteer 01', ..., 'Volunteer 30'

* activity:	 
	+ representing six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  
	+ Original domain of values: 1:6
	+ Values are later converted to the proper character values

* feature: 
	+ time and frequency domain variables
	+ 66 columns of mean and standard deviation data recorded 

***