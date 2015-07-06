install.packages("dplyr")
library(dplyr)

qtest <- NULL
qtrain <- NULL

qTest <- read.table("C:/Users/Mark/Documents/Coursera/GettingAndCleaningData/UCI HAR Dataset/test/X_test.txt")
qTrain <- read.table("C:/Users/Mark/Documents/Coursera/GettingAndCleaningData/UCI HAR Dataset/train/X_train.txt")

qTestActivities <- NULL
qTrainActivities <- NULL

qTestActivities <- read.table("C:/Users/Mark/Documents/Coursera/GettingAndCleaningData/UCI HAR Dataset/test/Y_test.txt")
qTrainActivities <- read.table("C:/Users/Mark/Documents/Coursera/GettingAndCleaningData/UCI HAR Dataset/train/Y_train.txt")

qActivities <- NULL
qActivities <- read.table("C:/Users/Mark/Documents/Coursera/GettingAndCleaningData/UCI HAR Dataset/activity_labels.txt")

qTestActivities[qTestActivities == 1] <- "STANDING"
qTestActivities[qTestActivities == 2] <- "WALKING_UPSTAIRS"
qTestActivities[qTestActivities == 3] <- "WALKING_DOWNSTAIRS"
qTestActivities[qTestActivities == 4] <- "SITTING"
qTestActivities[qTestActivities == 5] <- "STANDING"
qTestActivities[qTestActivities == 6] <- "LAYING"

qTrainActivities[qTrainActivities == 1] <- "STANDING"
qTrainActivities[qTrainActivities == 2] <- "WALKING_UPSTAIRS"
qTrainActivities[qTrainActivities == 3] <- "WALKING_DOWNSTAIRS"
qTrainActivities[qTrainActivities == 4] <- "SITTING"
qTrainActivities[qTrainActivities == 5] <- "STANDING"
qTrainActivities[qTrainActivities == 6] <- "LAYING"

qTest["activity"] <- qTestActivities
qTrain["activity"] <- qTrainActivities

qTestsubj <- read.table("C:/Users/Mark/Documents/Coursera/GettingAndCleaningData/UCI HAR Dataset/test/subject_test.txt")
qTrainsubj <- read.table("C:/Users/Mark/Documents/Coursera/GettingAndCleaningData/UCI HAR Dataset/train/subject_train.txt")

qTest["subject"] <- qTestsubj
qTrain["subject"] <- qTrainsubj

q <- NULL
q <- rbind(qTest,qTrain)

# Load Table containing column names (Feature.txt)
qColName <- NULL
qColName <- read.table("C:/Users/Mark/Documents/Coursera/GettingAndCleaningData/UCI HAR Dataset/features.txt")

# Transpose column to a row then assign the names to q
qColNameT <- t(qColName)
names(q) <- qColNameT[2,]


# Read the subset of column names requested for first dataframe
qColNameSub <- NULL
qColNameSub <- read.table("C:/Users/Mark/Documents/Coursera/GettingAndCleaningData/UCI HAR Dataset/featuresMeanStd.txt")

# Write a dataframe containing just the columns requested
qsub <- NULL
qsub <- q[as.character(t(qColNameSub))]

# Read the subset of column names requested for second dataframe

qColNameMean <- NULL
qColNameMean <- read.table("C:/Users/Mark/Documents/Coursera/GettingAndCleaningData/UCI HAR Dataset/featuresMean.txt")

# Write a dataframe containing just the columns requested

qmeans <- NULL
qmeans <- q[as.character(t(qColNameMean))]

# Aggregate the mean of means by activity and subject

qma <- NULL
qms <- NULL
qm <- NULL

# This is the original aggregation, but the second line would not run a second time so it is commented out here.

#qma <- qsub %>% group_by(activity) %>% summarise_each(funs(mean))
#qms <- qsub %>% group_by(subject) %>% summarise_each(funs(mean))

# Final aggregation statements.

qma <- aggregate(qsub[,1:62], by=list(qsub$activity), FUN=mean)
qms <- aggregate(qsub[,1:62], by=list(qsub$subject), FUN=mean)

# rename the aggragate column to group, and drop the unused group column

colnames(qma)[1] <- "group"
colnames(qms)[1] <- "group"
qma$subject <- NULL
qms$activity <- NULL

# combine to form the second dataframe requested

qm <- rbind(qma,qms)


# othercoursework
jpg <- readJPEG("C:/Users/Mark/Documents/Coursera/GettingAndCleaningData/getdata_jeff.jpg", native=TRUE)
quantile(jpg,probs=c(0.3,0.8))
eds <- read.csv("C:/Users/Mark/Documents/Coursera/GettingAndCleaningData/getdata_data_EDSTATS_Country.csv", stringsAsFactors=FALSE, header=FALSE)
gdp <- read.csv("C:/Users/Mark/Documents/Coursera/GettingAndCleaningData/getdata_data_GDP.csv", stringsAsFactors=FALSE, header=FALSE)

mg <- merge(gdp, eds, by.x="X", by.y="CountryCode",all=TRUE)

eds[1:54,1:2]
join(gdp[order(gdp$X),1:2][103:156,],eds[1:54,1:2])
nrow(join(gdp[order(gdp$CountryCode),1:2][103:330,],eds[1:234,1:2]))
nrow(join(eds[1:234,1:2],gdp[order(gdp$CountryCode),1:2][103:330,]))
colnames(gdp)[1] <- "CountryCode"

join(eds[eds$Income.Group == "High income: OECD",1],gdp[,1:2]) 
    
