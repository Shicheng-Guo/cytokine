library(readxl)

ReAnalysisResult2019Guo_FirstSet.xlsx
ReAnalysisResult2019Guo_SecondSet.xlsx

setwd("//mcrfnas2/bigdata/Genetic/Projects/shg047/rheumatology/cytokine")

ref<-read.table("//mcrfnas2/bigdata/Genetic/Projects/shg047/db/hg19/refGene.hg19.bed")
colnames(ref)<-c("CHROM","MAPINFO","END","Chain","NMID","Symbol")

file1<-c("IL23","IL6","INF","IL8","IL12","IL1b","TNFa","IL17","IL10")
file2<-c("IL1b","IL6","IL8","IL12","IL17","IL23","TNFa","IFN","IL10")

for(i in 1:9){
# data<-data.frame(read_excel("ReAnalysisResult2019Guo_FirstSet.xlsx",sheet = i))
data<-data.frame(read_excel("ReAnalysisResult2019Guo_SecondSet.xlsx",sheet = i))

input<-na.omit(data.frame(data,ref[match(data$Gene,ref$Symbol),]))
head(input)
colnames(input)[match("Chr",colnames(input))]<-"CHR"
colnames(input)[match("FCP",colnames(input))]<-"P.Value"
input<-input[match(unique(input$Symbol),input$Symbol),]
rownames(input)<-input$Symbol
head(input)
ManhattanmyDMP(input,file1[i])
print(i)
}

ManhattanmyDMP<-function(myDMP,filename){
  library("qqman")
  library("Haplin")
  SNP=rownames(myDMP)
  CHR=myDMP$CHR
  if(length(grep("X",CHR))>0){
    CHR<-sapply(CHR,function(x) gsub(pattern = "X",replacement = "23",x))
    CHR<-sapply(CHR,function(x) gsub(pattern = "Y",replacement = "24",x))
  }
  CHR<-as.numeric(CHR)
  BP=myDMP$MAPINFO
  P=myDMP$P.Value
  manhattaninput=na.omit(data.frame(SNP,CHR,BP,P))
  max<-max(2-log(manhattaninput$P,10))
  genomewideline=0.05/nrow(manhattaninput)
  seed=sample(1:10000,1)
  pdf(paste("manhattan",filename,seed,"pdf",sep="."))
  manhattan(manhattaninput,col = c("blue4", "orange3"),ylim = c(0,8),lwd=2, suggestiveline=F,genomewideline=FALSE)
  dev.off()
  pdf(paste("qqplot",filename,seed,"pdf",sep="."))
  pQQ(P, nlabs =length(P), conf = 0.95)
  dev.off()
}

