## 12/11/2019
## 660W cytokine data 
## hg18 to hg19
## imputation and phasing
# download database and script
wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/liftOver
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg18/liftOver/hg18ToHg19.over.chain.gz
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg19/liftOver/hg19ToHg38.over.chain.gz
wget https://raw.githubusercontent.com/Shicheng-Guo/GscPythonUtility/master/liftOverPlink.py
wget https://raw.githubusercontent.com/Shicheng-Guo/Gscutility/master/ibdqc.pl
# rebuild plink file to avoid chromsome-miss-order problem
plink --bfile Th17Set1 --make-bed --out Th17Set1.sort
# space to tab to generate bed files for liftOver from hg18 to hg19
plink --bfile Th17Set1.sort --recode tab --out Th17Set1.tab
# apply liftOverPlink.py to update hg18 to hg19 or hg38
# Only works in BIRC10, Not HPC, Caused by Python version
mkdir liftOver
./liftOverPlink.py -m Th17Set1.tab.map -p  Th17Set1.tab.ped -o Th17Set1.hg19 -c hg18ToHg19.over.chain.gz -e ./liftOver

xplink="Th17Set1.hg19"
plink --file $xplink --make-bed --out $xplink
plink --bfile $xplink --list-duplicate-vars ids-only suppress-first
grep DEL $xplink.bim >> plink.dupvar
awk '{$5==0}' $xplink.bim
awk '{$5==I}' $xplink.bim
awk '{$5==D}' $xplink.bim
awk '{$6==0}' $xplink.bim
awk '{$6==I}' $xplink.bim
awk '{$6==D}' $xplink.bim

plink --bfile $plink --exclude plink.dupvar --make-bed --out $plink.uni

plink="Th17Set1.hg19.uni"
wget https://faculty.washington.edu/browning/beagle/beagle.16May19.351.jar -O beagle.16May19.351.jar
wget https://faculty.washington.edu/browning/conform-gt/conform-gt.24May16.cee.jar -O conform-gt.24May16.cee.jar
mkdir temp
for i in {1..23} 
do
echo \#PBS -N $i  > $i.job
echo \#PBS -l nodes=1:ppn=6 >> $i.job
echo \#PBS -M Guo.shicheng\@marshfieldresearch.org >> $i.job
echo \#PBS -m abe  >> $i.job
echo \#PBS -o $(pwd)/temp/ >>$i.job
echo \#PBS -e $(pwd)/temp/ >>$i.job
echo cd $(pwd) >> $i.job
echo plink --bfile $plink --chr $i --recode vcf-iid --out $plink.chr$i >> $i.job
echo java -jar ./conform-gt.24May16.cee.jar gt=$plink.chr$i.vcf chrom=$i ref=~/hpc/db/hg19/beagle/EUR/chr$i.1kg.phase3.v5a.dedup.norm.EUR.vcf.gz out=$plink.chr$i.beagle >> $i.job
# echo bcftools norm -m-any chr$i.1kg.phase3.v5a.EUR.vcf.gz -Oz -o chr$i.1kg.phase3.v5a.dedup.EUR.vcf.gz  >>$i.job
# echo bcftools norm -d all chr$i.1kg.phase3.v5a.dedup.EUR.vcf.gz -Oz -o chr$i.1kg.phase3.v5a.dedup.norm.EUR.vcf.gz  >>$i.job
# echo plink --bfile S_Hebbring_Unr.Guo --recode vcf --chr $i --snps-only just-acgt --out ./beagle/S_Hebbring_Unr.Guo.Forward.chr$i >> chr$i.job
# echo unzip -P fptULXgh3wF9Q chr_$i.zip  >> $i.job
qsub $i.job
done
