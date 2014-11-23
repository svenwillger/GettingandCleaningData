if (!require("data.table")) {
  install.packages("data.table")
}
if (!require("reshape2")) {
  install.packages("reshape2")
}
library("data.table")
library("reshape2")
# Assign the activity labels to the parameter "label"
labels <- read.table("activity_labels.txt")[,2]
# Assign the data column names to the parameter "feature"
features <- read.table("features.txt")[,2]
# Extract only the measurements on the mean and standard deviation for each measurement.
measurement <- grepl("mean|std", features)
# Assign the X_test, y_test and subject_test files to the respectiv parameters
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")
names(X_test) = features
# Extract only the above defined measurements
X_test = X_test[,measurement]
# Assign the above defined labels to the y-test file
y_test[,2] = labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"
# Combine the Y-test and x-test data
data1 <- cbind(as.data.table(subject_test), y_test, X_test)
# Assign the X_train, y_train and subject_train files to the respectiv parameters
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")
names(X_train) = features
# Extract only the above defined measurements
X_train = X_train[,measurement]
# Assign the above defined labels to the y-train file
y_train[,2] = labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"
# Combine the Y-train and x-train data
data2 <- cbind(as.data.table(subject_train), y_train, X_train)
# Merge test and train data
data = rbind(data1, data2)
id_labels = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data = melt(data, id = id_labels, measure.vars = data_labels)
# Apply mean function to dataset using dcast function
clean_data = dcast(melt_data, subject + Activity_Label ~ variable, mean)
write.table(clean_data, file = "clean_data.txt")
