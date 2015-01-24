#This program will create the tables as instructed in the class project
#for the Getting and Cleaning Data Cousera.org class

# Step 1. Get test and training set and merge together.
test<-read.table(".\\test\\x_test.txt")
train <- read.table(".\\train\\x_train.txt")
all <- rbind(train,test)
# reduce memory required
remove(test)
remove(train)

#Step 2. Extract subset of columns with mean and std.
library(dplyr)
headers <-read.table("features.txt")
headers<-rename(Row=V1,Features=V2)
isMeanOrStd <- grep("(mean\\(\\))|(std\\(\\))",headers$Features,ignore.case=TRUE)
allMeanStd <- all[,isMeanOrStd]
remove(all)

#Step 4a. Create Meaningful headers
meanStdHeaders <- headers[isMeanOrStd,2]
remove(headers)
meanStdHeaders <- sapply(meanStdHeaders,gsub,pattern="\\(|\\)",replacement="",USE.NAMES=FALSE)
meanStdHeaders <- sapply(meanStdHeaders,gsub,pattern="-",replacement="\\.",USE.NAMES=FALSE)
meanStdHeaders <- sapply(meanStdHeaders,tolower,USE.NAMES=FALSE)
meanStdHeaders <- sapply(meanStdHeaders,gsub,pattern="^t",replacement="time\\.",USE.NAMES=FALSE)
meanStdHeaders <- sapply(meanStdHeaders,gsub,pattern="^f",replacement="frequency\\.",USE.NAMES=FALSE)
meanStdHeaders <- sapply(meanStdHeaders,gsub,pattern="acc[\\.]?",replacement="\\.acceleration\\.",USE.NAMES=FALSE)
names(allMeanStd)<-meanStdHeaders

#Step 3. Create meaningful activity names
acttest<-read.table(".\\test\\y_test.txt")
acttrain <- read.table(".\\train\\y_train.txt")
actall <-rbind(acttrain,acttest)
remove(acttest)
remove(acttrain)

#Step 4b. Create Factors for useful activity names
#Use the activity names from the study.
actLabels <- read.table(".\\activity_labels.txt")
actFac <- lapply(actall,factor,labels=actLabels$V2)
allMeanStdAct <- cbind(actFac,allMeanStd)
remove(actFac)
remove(allMeanStdAct)
#rename the new column
allMeanStdAct<-rename(allMeanStdAct,activity=V1)

#Step 5. Create Pivot Table
allMeanStdMelt <- melt(allMeanStdAct,id="activity",measure.vars=meanStdHeaders)
allMeanStdPivot <- dcast(allMeanStdMelt,activity~variable,mean)
