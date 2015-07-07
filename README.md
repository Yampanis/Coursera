# Coursera
Project for Getting and Cleaning Data: How the "run_analysis.R" script works

Load  dplyr package.

intialize variables

Load test and train Data activities and activity labels into tables from UCI HAR Dataset

Replace numerical activity indicators with the text description and append column to Test/Train tables

append subject data column to Test/Train tables

combine test/train data

Load Table containing column names (Feature.txt)

  Transpose column to a row then assign the names to a dataset

Read the subset of column names requested for first dataframe

  Write a dataframe containing just the columns requested

Read the subset of column names requested for second dataframe

  Write a dataframe containing just the columns requested

Aggregate the mean of means into tables by activity and subject

rename the aggragate column to group, and drop the unused group column

combine the tables to form the second dataframe requested
