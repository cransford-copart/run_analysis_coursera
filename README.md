The run analysis first starts by loading the training and testing data frames into R. All necessary files must be unzipped and loaded into your working directory in order for this to work. 
Add the subject and activity vectors as the first and second columns in the test and train dataframes. 

Merge both dataframes before reducing the number of columns to only those with either "mean" or "std" in the column name. Please note that in order to index on these values, two 
spaces must be made for the subject and activity columns that were added into the original dataframes. 

Use the activity reference table provided to replace the numeric descriptors with descriptive descriptions. Remove special characters from colnames of the merged dataframe

Summarize the data by finding the mean of each subject and activity