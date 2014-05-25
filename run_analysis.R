setwd("C:/Users/mnasr/Documents/Data_cleaning/train")
subject_train <- read.table("subject_train.txt")
x_train <- read.table("x_train.txt")
y_train <- read.table("y_train.txt")


setwd("C:/Users/mnasr/Documents/Data_cleaning/test")
subject_test <- read.table("subject_test.txt")
x_test <- read.table("x_test.txt")
y_test <- read.table("y_test.txt")


setwd("C:/Users/mnasr/Documents/Data_cleaning")
features_info <- read.table("features.txt")


dataframe <- rbind(x_train, x_test)
names(dataframe) <- features_info[ ,2]

names(subject_train) <- "subject"
names(subject_test) <- "subject"
#subject_tain
subject <- rbind(subject_train, subject_test)
names(y_test) <- "activity"
names(y_train) <- "activity"
all_labels <- rbind(y_train, y_test)



activity_labels <- read.table("activity_labels.txt")


names(activity_labels)<-c("activity.id","activity.name")
all_labels <-merge(all_labels,activity_labels,by.x="activity",by.y="activity.id")

activity<- all_labels[,2]
dataframe <- cbind(dataframe, activity, subject)

features <- names(dataframe)
 c1<- grep("mean",features)
c2<- grep("std",features)
dataframe <- cbind(dataframe[,c2], dataframe[,c1], activity, subject)

library(reshape2)
col_names <- names(dataframe[,1:79])
 DfMelt <- melt(dataframe, id = "subject", measure.vars= col_names)
 DfMelt <- dcast(DfMelt, activity ~ variable, mean)
tidy_data <- DfMelt

names(tidy_data)
gsub("-",".",names(tidy_data),)
names(tidy_data) <- tolower(names(tidy_data))
names(tidy_data) <- gsub(",",".",names(tidy_data),)
rownames(tidy_data)

tidy_data[ ,1] <- tolower(tidy_data[ ,1])
tidy_data[ ,1] <- sub(".","",tidy_data[,1],)

write.table(tidy_data, "C:/Users/mnasr/Documents/Data_cleaning/result/tidy_data.txt", sep="\t")
