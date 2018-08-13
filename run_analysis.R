setwd() #set working directory to the appropriate repository 

# Load and create training dataframe
x_train_file <- "./X_train.txt"
subject_train_file <- "./subject_train.txt"
y_train_labels_file <- "./y_train.txt"

x_train <- read.table(file = x_train_file)
subject_train_df <- read.table(file = subject_train_file)
y_train_labels <- read.table(file = y_train_labels_file)
x_train_df <- data.frame(subject_train_df, y_train_labels, x_train)
rm(list = c('x_train','subject_train_df','y_train_labels'))

# Load and create the test dataframe
x_test_file <- "./X_test.txt"
subject_test_file <- "./subject_test.txt"
y_test_labels_file <- "./y_test.txt"

x_test <- read.table(file = x_test_file)
subject_test_df <- read.table(file = subject_test_file)
head(subject_test_df)
y_test_labels <- read.table(file = y_test_labels_file)
x_test_df <- data.frame(subject_test_df, y_test_labels, x_test)
rm(list = c('x_test','subject_test_df','y_test_labels'))

# Combine the two dataframes
mergeData <- rbind(x_test_df, x_train_df)

# Create the feature_labels vector and index only the rows with either "mean" or "std" in the name
feature_labels <- read.table(file = "./features.txt")
head(feature_labels)
toMatch <- c("mean","std")
labelValues <- feature_labels[grepl(paste(toMatch, collapse = "|"), feature_labels$V2),]$V1
head(labelValues)
labelValuesAdd <- labelValues+2 

# Apply feature_labels index to merged test and train dataframes in order to obtain only columns with "mean" or "std" in the name
x_merge_data <- mergeData[,c(1,2,labelValuesAdd)]

# Create data frame with activity labels values - then apply merged test and train dataframe in order to replace the existing numeric values with more descriptive value names
activity_labels <- read.table("./activity_labels.txt")

x_merge_data$V1.1 <- activity_labels$V2[match(x_merge_data$V1.1, activity_labels$V1)]

# Replace column names with more descriptive variable names
meanStVars <- feature_labels[grepl(paste(toMatch, collapse = "|"), feature_labels$V2),]
meanStVars$V2 <- as.character(meanStVars$V2)

colnames(x_merge_data) <- c("subjectId","activity",meanStVars$V2)
colnames(x_merge_data) <- gsub("-",".",colnames(x_merge_data))

# Summarize the data by finding the mean of each subject and activity
summData <- as.data.table(x_merge_data)[, lapply(.SD, mean), by = c("subjectId","activity"), .SDcols = 3:81]

write.table(summData, "./run_analysis_final_data.txt", row.names = FALSE)


# Modify original code book to fit our updated dataframe
codeBook <- read.table("./features_info.txt")

