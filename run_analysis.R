#course project
library(dplyr)
#merge training and test sets

setwd("C:/Users/BRENO/Documents/dataset/UCI HAR Dataset") 

test_x<-read.table("./test/X_test.txt") 
test_y<-read.table("./test/Y_test.txt") %>% rename(y=V1)
test_s<-read.table("./test/subject_test.txt") %>% rename(subject=V1)

dim(test_x)
dim(test_y)
dim(test_s)


train_x<-read.table("./train/X_train.txt")
train_y<-read.table("./train/Y_train.txt") %>% rename(y=V1)
train_s<-read.table("./train/subject_train.txt") %>% rename(subject=V1)


dim(train_x)
dim(train_y)
dim(train_s)
var.names<-read.table("./features.txt")
labels<-read.table("./activity_labels.txt")


#merging datasets


sub<-rbind(test_s,train_s)
ys<-rbind(test_y,train_y)

all_data<-tbl_df(rbind(test_x,train_x)) 
names(all_data)<-make.names(var.names$V2,unique=T)

#extract only measures with mean and SD

data_mean_sd<-all_data %>% select(matches('mean|std'))


#change number for activity description
ylabel<-labels$V2[ys[,]]

#now we merge all data 

data_step34<-tbl_df(cbind(sub,ylabel,data_mean_sd)) %>% rename (activity=ylabel)


#finally, create a variable for subject and activity called group; 
#group by this variable and use summarize in order to calculate means for each group

data_step5 <- data_step34 %>% mutate(group=paste(subject,activity,sep="")) %>% group_by(group) %>% 
  select(group,tBodyAcc.mean...X:angle.Z.gravityMean.) %>%   summarise_each(funs(mean))


#Change new features names to original ones
names.Xref<-cbind(as.character(var.names$V2),make.names(var.names$V2,unique=T))

names_new<-names(data_step34[-(1:2)])
temp<-NULL
for (i in c(1:length(names_new))){
  temp[i]<-grep(names_new[i],names.Xref)
}
names.5<-c("group",names.Xref[temp])      
names(data_step5)<-names.5



#save data

write.table(data_step5,"coursera_project.txt",row.name=FALSE,quote = FALSE,sep="\t")




