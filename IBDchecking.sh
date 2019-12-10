cd /gpfs/home/guosa/hpc/project/pmrp/phase1
touch -m FinalRelease_QC_20140311_Team1_Marshfield.bim
touch -m FinalRelease_QC_20140311_Team1_Marshfield.fam
touch -m FinalRelease_QC_20140311_Team1_Marshfield.bed

cd /gpfs/home/guosa/hpc/project/pmrp/phase2
cp S_Hebbring_Unr.Guo.Forward.bed FinalRelease_QC_20190311_Team1_Marshfield.bed
cp S_Hebbring_Unr.Guo.Forward.bim FinalRelease_QC_20190311_Team1_Marshfield.bim
cp S_Hebbring_Unr.Guo.Forward.fam FinalRelease_QC_20190311_Team1_Marshfield.fam

bim1<-read.table("./phase1/FinalRelease_QC_20140311_Team1_Marshfield.bim")
bim2<-read.table("./phase2/FinalRelease_QC_20190311_Team1_Marshfield.bim")

head(bim1)
head(bim2)

bimid1<-paste(bim1[,1],bim1[,4],bim1[,5],bim1[,6],sep=":")
bimid2<-paste(bim2[,1],bim2[,4],bim2[,5],bim2[,6],sep=":")

bim1<-na.omit(bim1[match(bimid2,bimid1),])
bim2<-na.omit(bim2[match(bimid1,bimid2),])

snp1<-data.frame(bim1[,2])
snp2<-data.frame(bim2[,2])

write.table(snp1,file="phase1.sharesnp.txt",sep="\t",quote=F,col.names=F,row.names=F)
write.table(snp2,file="phase2.sharesnp.txt",sep="\t",quote=F,col.names=F,row.names=F)

awk '{print $1,$1}' OFS="\t" phase1.sample.txt > phase1.samples.txt
awk '{print $1,$1}' OFS="\t" phase2.sample.txt > phase2.samples.txt

plink --bfile FinalRelease_QC_20140311_Team1_Marshfield --extract phase1.sharesnp.txt --keep phase1.samples.txt --make-bed --out FinalRelease_QC_20140311_Team1_Marshfield_subset
plink --bfile FinalRelease_QC_20190311_Team1_Marshfield --extract phase2.sharesnp.txt --keep phase2.samples.txt --make-bed --out FinalRelease_QC_20190311_Team1_Marshfield_subset

plink --bfile FinalRelease_QC_20140311_Team1_Marshfield_subset --bmerge FinalRelease_QC_20190311_Team1_Marshfield_subset --make-bed --out FinalRelease_QC_20200311_Team1_Marshfield_Subset

plink --bfile FinalRelease_QC_20200311_Team1_Marshfield_Subset --make-rel

plink --bfile FinalRelease_QC_20200311_Team1_Marshfield_Subset --genome

phen<-read.table("crosswalk.txt")
ibd<-read.table("plink.genome",head=T)
out<-c()
for(i in 1:nrow(phen)){
out<-rbind(out,ibd[ibd$FID2 %in% phen[i,1] & ibd$FID1 %in% phen[i,2],])
}
write.table(out,file="SampleSimiliarity.txt",sep="\t",col.names=T,row.names=F,quote=F)

