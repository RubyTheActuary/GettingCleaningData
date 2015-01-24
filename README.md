# GettingCleaningData
This is the repository for the Getting and Cleaning Data coursera.org course

# Step 1. Get test and training set and merge together.
* test - it contains the test data  
* train - it contains the training data 
* all - contains the merged test and training data

#Step 2. Extract subset of columns with mean and std.
* headers - contains the features supplied from the "features.txt" file
* isMeanOrStd - contains the indexes of all the features that contain mean() or std() in their name.
* allMeanStd - contains the data for the mean and standard deviation features.

#Step 4a. Create Meaningful headers
* meanStdHeaders - contains the subset of headers that have mean() or std() in the name.

#Step 3. Create meaningful activity names
* acttest - contains the test activities
* acttrain - contains the training activities
* actall - contains both the test and training activities

#Step 4b. Create Factors for useful activity names
#Use the activity names from the study.
* actLabels - contains the labels for the different activities
* actFac - is a list of factors for the activities
* allMeanStdAct - contains the activities in the first column and the mean and standard deviation data in the remaining columns.

This program works in following
#Step 1 - Get the training and test data and merge together
#Step 2 - Get the subset of headers with mean or std in the name and rename the columns accordingly
#Step 4a. - It becomes before step 3 to avoid duplicate names in the table after the column bind. This steps renames all the header columns to give them a little more meaningful name. It updates allMeanStdAct, so it has the corresponding headers.
#Step 3. Gets the test activity data and the training activity data and merges them together.
#Step 4b. - Turns the activity data into factors for more readability. It makes the first column in the table. Lastly, it renames the column to activity to give it a meaningful name.

