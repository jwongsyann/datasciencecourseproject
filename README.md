---
title: "README"
output: html_document
---

This README file lays out the step by step details on how the original raw dataset (UCI HAR) is transformed into tidy data. Please see CodeBook for the description of variables.

Firstly, the code requires the reshape2 package and it is loaded first. Secondly, the appropriate working directory is set for easy referencing.

The following steps are then taken,

1. This code extracts the data from the subject_test.txt, X_test.txt, y_test.txt, subject_train.txt, X_train.txt, y_train.txt, features.txt and the activity_labels.txt files.
2. A factor variable "Set" (with value either test or train) is created and attached to both testset (with value "test"") and trainset (with value "train").
3. The testset is merged with the testsubjects and testlabels columnwise into the totaltestset. The same process is replicated for the trainset to form the totaltrainset.
4. The features is forced into character class.
5. The features vector is attached with additional values "Subject", "Activity" and "Set".
6. The column names for the totaltestset and totaltrainset is changed to the features vector.
7. Both totaltestset and totaltrainset is merged into totalset
8. To identify those features with mean and standard deviation, a grep function is used to create two level factor vectors (one for mean and one for standard deviation).
9. The two level factor vectors are used to subset the features vector and appended with "Subject", "Activity" and "Set" to create a new factor vector.
10. The totalset is subsetted using the subsetfeatures factor vector to form the subsetdata.
11. The activity variables are changed using the activity_labels factor vectors to reflect the character names of the activities.
12. The subsetfeatures vector is amended to change abbreviations to full form text. Eg, tBody -> timeBody. Special characters like "-", "(" and ")" are removed.
13. The columnnames for the subsetdata are amended to the new subsetfeatures vector.
13. The subsetdata is melted into a skinny tidy data table with id as "Subject" and "Activity" and all other columns as variables except for "Set".
14. The subsetdata is summarized using the dcast function to give the means of all variables for each subject and activity into the subsetcast dataset.
15. Writes the subsetcast dataset into tidydata.txt file.

End.