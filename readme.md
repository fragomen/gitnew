---
title: "Readme"
author: "Breno Fragomeni"
date: "Friday, August 21, 2015"
output: html_document
---

This file is a readme for the code for the course project gettind and cleaning data from coursera.
The code run_analyis.R is in the same repository.
There are five steps in order to achieve the final file, that is attached in the coursera website.
```
-Merging training and testing dataset
```
For this step I used the code to open data in R, Y, X and subject files.
The next step was to merge all of them in the files ys (for Y data), sub (for subject data) and all_data (for X data).
To be sure that I was doing everything in the correct way I checked the dimension of all files.
Files with labels for activities and features were loaded in this step
```
-Extracting only measures with mean and sd
```
This step was simple, I included the features as variable names and simply used select verb of dplyr to select variables that contained mean or std in their names.
```
-Use descriptive activity names
```
I create a vector with labels for descriptive activity names, which made it very simple to change the numbers for the activity in the dataset
```
-Appropriately labels the data set with descriptive variable names
```
This step was actually made out of order. In order to avoid loosing control of the features I always had the descriptive variable names in the dataset. An extra step was made in order to use the original names, instead of using those created by the command make.names. It was performed after creating data for step 5 with the command names and data names.5.
```
- creates a second, independent tidy data (...)
```
To create this data I create a new variable called group, which included subject and acitivity. Then I grouped the data by it, and finally, I used summarize_each in order to calculate mean for each variable within groups. The results was saved in a text file. I used tab delimeter in order to make it look a little bit less messy at notepad. 


