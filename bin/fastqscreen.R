### Unique 

file<-list.files(pattern="*screen.txt")
data1<-read.table(file[1],fill=T)[2:15,2]
data2<-read.table(file[1],fill=T)[2:15,5]
data<-data2/data1
rowname<-as.character(read.table(file[1],fill=T)[2:15,1])
for(i in 2:length(file)){
temp1<-read.table(file[i],fill=T)[2:15,2]
temp2<-read.table(file[i],fill=T)[2:15,5]
data<-data.frame(data,temp2/temp1)
}
newcolname<-gsub("_screen.txt","",file)
colnames(data)<-newcolname
rownames(data)<-rowname

write.csv(data,file="cytokine.rnaseq.readsdistribution.uniquehit.csv",quote=F)


### Multiple 

file<-list.files(pattern="*screen.txt")
data1<-read.table(file[1],fill=T)[2:15,2]
data2<-read.table(file[1],fill=T)[2:15,7]
data<-data2/data1
rowname<-as.character(read.table(file[1],fill=T)[2:15,1])
for(i in 2:length(file)){
temp1<-read.table(file[i],fill=T)[2:15,2]
temp2<-read.table(file[i],fill=T)[2:15,7]
data<-data.frame(data,temp2/temp1)
}
newcolname<-gsub("_screen.txt","",file)
colnames(data)<-newcolname
rownames(data)<-rowname

write.csv(data,file="cytokine.rnaseq.readsdistribution.multiplehit.csv",quote=F)


### Overall mapping 

file<-list.files(pattern="*screen.txt")
data1<-read.table(file[1],fill=T)[2:15,2]
data2<-read.table(file[1],fill=T)[2:15,3]
data<-data2/data1
rowname<-as.character(read.table(file[1],fill=T)[2:15,1])
for(i in 2:length(file)){
temp1<-read.table(file[i],fill=T)[2:15,2]
temp2<-read.table(file[i],fill=T)[2:15,3]
data<-data.frame(data,temp2/temp1)
}
newcolname<-gsub("_screen.txt","",file)
colnames(data)<-newcolname
rownames(data)<-rowname
mean(data.matrix(data[1,1]))
write.csv(data,file="cytokine.rnaseq.readsdistribution.nonhit.csv",quote=F)
