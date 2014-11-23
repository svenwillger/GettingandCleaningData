Getting and Cleaning Data: Course Project
=========================================

The original data
------------------

The features are unlabeled and can be found in the x_test.txt.
The activity labels are in the y_test.txt file.
The test subjects are in the subject_test.txt file.
The same is true for the training set.

The script and the clean dataset
-------------------------------------
The script run_analysis.R which will merge the test and training sets together.
Labels will be added and only the columns with mean and standard deviation will be kept.

Requirements for this script:

1. the file with the original data needs to be downloaded and extracted
2. the working directory must contain the following files and folder
      - activity_labels.txt
      - features.txt
      - features-info.txt
      - README.txt
      - folder: "test", with the original files
      - folder: "train", with the original files

The script will creat a clean dataset containing the means of all the columns per test subject and per activity.
This tab-delimited dataset can be found in the clean.txt file.

About the Code Book
-------------------
The CodeBook.md file explains the transformations performed and the resulting data and variables.

