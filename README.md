# Getting and Cleaning Data Course Project
## Assignment Overview
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone 
Up are racing to develop the most advanced algorithms to attract new users.

This project seeks to retrieve, structure, clean, and summarize data retrieved from the accelerometer and gyroscope of the Samsung Galaxy S smartphone 
to gain a better understanding of user's health. 

## This repository includes the following:
* run_analysis.R - R script that retrieves, compiles, and summarizes the data described above
* code_book.md - Description of the files obtained, and summarized values

## run_analysis.R accomplishes this goal by performing the following steps
1. The run analysis first starts by loading the training and testing data frames into R. All necessary files must be unzipped and loaded into your working directory in order for this to work. 
2. Add the subject and activity vectors as the first and second columns in the test and train dataframes. 
3. Merge both dataframes before reducing the number of columns to only those with either "mean" or "std" in the column name. Please note that in order to index on these values, two spaces must be made for the subject and activity columns that were added into the original dataframes. 
4. Use the activity reference table provided to replace the numeric descriptors with descriptive descriptions. Remove special characters from colnames of the merged dataframe
5. Summarize the data by finding the mean of each subject and activity