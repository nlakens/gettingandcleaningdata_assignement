
Human Activity Recognition Using Smartphones Dataset
Summary of the basic data files for analysis
======================================================

Nicole Lakens, Delfgauw, The Netherlands
For the final assignment of the Getting and Cleaning Data course by Coursera
======================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The train and test data where combined into one dataset. For each subject and each activity, a mean value for the columns with mean and standard deviation values was calculated.
======================================================

The dataset includes the following files:
- ‘README.txt’
- ‘MeanPerSubjectidActivity.txt’: average of each variable for each activity and each subject
- ‘run_analysis.R’: script with steps on how the final dataset was created
- ‘CodeBook.docx’: document with description of all the variables in the final dataset
======================================================

For each record it is provided:
- An identifier of the subject who carried out the experiment
- Its activity label
- Mean values of the mean and standard deviation features that were found and calculated during the experiments carried out on the subject
