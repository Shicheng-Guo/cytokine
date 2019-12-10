cd /gpfs/home/guosa/hpc/project/pmrp/
mkdir cytokine

cd /gpfs/home/guosa/hpc/project/pmrp/cytokine

# find the raw phase 2 PMRP plink dataset
cd /gpfs/home/guosa/hpc/project/pmrp/phase1
touch -m FinalRelease_QC_20140311_Team1_Marshfield.bim
touch -m FinalRelease_QC_20140311_Team1_Marshfield.fam
touch -m FinalRelease_QC_20140311_Team1_Marshfield.bed

# find the raw phase 2 PMRP plink dataset
cd /gpfs/home/guosa/hpc/project/pmrp/phase2
cp S_Hebbring_Unr.Guo.Forward.bed FinalRelease_QC_20190311_Team1_Marshfield.bed
cp S_Hebbring_Unr.Guo.Forward.bim FinalRelease_QC_20190311_Team1_Marshfield.bim
cp S_Hebbring_Unr.Guo.Forward.fam FinalRelease_QC_20190311_Team1_Marshfield.fam

# read phase 1 and phase 2 bim file
bim1<-read.table("../phase1/FinalRelease_QC_20140311_Team1_Marshfield.bim")
bim2<-read.table("../phase2/FinalRelease_QC_20190311_Team1_Marshfield.bim")

head(bim1)
head(bim2)

bimid1<-paste(bim1[,1],bim1[,4],bim1[,5],bim1[,6],sep=":")
bimid2<-paste(bim2[,1],bim2[,4],bim2[,5],bim2[,6],sep=":")

bim<-na.omit(bim2[match(bimid1,bimid2),])
out<-data.frame(bim[,1],bim[,4])
write.table(out,file="sharedconservedSNP.bed",sep="\t",quote=F,col.names=F,row.names=F)

cp ../phase1/FinalRelease_QC_20140311_Team1_Marshfield.bim ./
cp ../phase1/FinalRelease_QC_20140311_Team1_Marshfield.fam ./
cp ../phase1/FinalRelease_QC_20140311_Team1_Marshfield.bed ./

cp ../phase2/FinalRelease_QC_20190311_Team1_Marshfield.bim ./
cp ../phase2/FinalRelease_QC_20190311_Team1_Marshfield.fam ./
cp ../phase2/FinalRelease_QC_20190311_Team1_Marshfield.bed ./

plink2 --bfile FinalRelease_QC_20190311_Team1_Marshfield --recode vcf --out FinalRelease_QC_20190311_Team1_Marshfield
plink2 --bfile FinalRelease_QC_20140311_Team1_Marshfield --recode vcf --out FinalRelease_QC_20140311_Team1_Marshfield

bcftools view FinalRelease_QC_20140311_Team1_Marshfield.vcf -Oz -o FinalRelease_QC_20190311_Team1_Marshfield.vcf.gz
bcftools view FinalRelease_QC_20140311_Team1_Marshfield.vcf -Oz -o FinalRelease_QC_20140311_Team1_Marshfield.vcf.gz

tabix -p vcf FinalRelease_QC_20190311_Team1_Marshfield.vcf.gz
tabix -p vcf FinalRelease_QC_20140311_Team1_Marshfield.vcf.gz


##### 2019/10/12
# copy the raw data from vascod's origin fold.
cd /gpfs/home/guosa/hpc/project/pmrp/cytokine/set1/hg18
cp /mnt/bigdata/Center/CHG/vascod/th17/support_files/th17.map ./
cp /mnt/bigdata/Center/CHG/vascod/th17/support_files/th17.ped ./
setwd("/gpfs/home/guosa/hpc/project/pmrp/cytokine/vascod")
d1<-read.table("input.txt",sep="\t",head=T)
d2<-read.table("th17.fam")
d<-d2[d2[,2] %in% d1[,3],]  
write.table(d,file="mylist1015.txt",sep="\t",quote=F,col.names =F, row.names = F)
plink --file th17 --keep mylist1015.txt --make-bed --out ../Th17Set1


