wget https://imputationserver.sph.umich.edu/share/results/36b770e03ad7b7925d037b199df96a65/chr_1.zip
wget https://imputationserver.sph.umich.edu/share/results/3eb5ff6d81b167b2abf56c7910409a51/chr_10.zip
wget https://imputationserver.sph.umich.edu/share/results/2749781dae9e000ab463feb2aa436b97/chr_11.zip
wget https://imputationserver.sph.umich.edu/share/results/7ebdae007191244939bab3734df73fb0/chr_12.zip
wget https://imputationserver.sph.umich.edu/share/results/cdb29070638945807e42029d16b2261c/chr_13.zip
wget https://imputationserver.sph.umich.edu/share/results/6bcd96d49b4fdb12d9c193449c356f21/chr_14.zip
wget https://imputationserver.sph.umich.edu/share/results/312c26011e751a1c54268270865e738b/chr_15.zip
wget https://imputationserver.sph.umich.edu/share/results/92f437da038c1c855709efe29c72533f/chr_16.zip
wget https://imputationserver.sph.umich.edu/share/results/ad1cc1e6f2cfe8b0bf369e643216b1b1/chr_17.zip
wget https://imputationserver.sph.umich.edu/share/results/e072a68834914c745023f3a378d61fc4/chr_18.zip
wget https://imputationserver.sph.umich.edu/share/results/2046b800aae5eb44e3972378a24c23aa/chr_19.zip
wget https://imputationserver.sph.umich.edu/share/results/ee8077133def8cff33abeca119170524/chr_2.zip
wget https://imputationserver.sph.umich.edu/share/results/24571773a54eedf9035dc59f015fc93a/chr_20.zip
wget https://imputationserver.sph.umich.edu/share/results/61c09d68a5f11453e771a0371bd86d7f/chr_21.zip
wget https://imputationserver.sph.umich.edu/share/results/45e156cc8bc432086b34ef5b6d50feb1/chr_22.zip
wget https://imputationserver.sph.umich.edu/share/results/be3ba39741199c02a9e687d731b3bd47/chr_3.zip
wget https://imputationserver.sph.umich.edu/share/results/f59258d970f02db6da053cb9c438e9ce/chr_4.zip
wget https://imputationserver.sph.umich.edu/share/results/a53ce49df4c633a43273a93348843258/chr_5.zip
wget https://imputationserver.sph.umich.edu/share/results/d26c66911c2c4a11aa7a1e772f4da4e1/chr_6.zip
wget https://imputationserver.sph.umich.edu/share/results/a30cabb609ed2fdff737e669c30a3726/chr_7.zip
wget https://imputationserver.sph.umich.edu/share/results/f2da4a9883cc58d3bf7c294ad57c0d5b/chr_8.zip
wget https://imputationserver.sph.umich.edu/share/results/811b7f295fd87a3d9f0e500c7c42161d/chr_9.zip

mkdir temp
for i in {1..23} 
do
echo \#PBS -N $i  > $i.job
echo \#PBS -l nodes=1:ppn=1 >> $i.job
echo \#PBS -M Guo.shicheng\@marshfieldresearch.org >> $i.job
echo \#PBS -m abe  >> $i.job
echo \#PBS -o $(pwd)/temp/ >>$i.job
echo \#PBS -e $(pwd)/temp/ >>$i.job
echo cd $(pwd) >> $i.job
# echo plink --bfile $plink --chr $i --recode vcf-iid --out $plink.chr$i >> $i.job
# echo java -jar ./conform-gt.24May16.cee.jar gt=$plink.chr$i.vcf chrom=$i ref=~/hpc/db/hg19/beagle/EUR/chr$i.1kg.phase3.v5a.dedup.norm.EUR.vcf.gz out=$plink.chr$i.beagle >> $i.job
# echo bcftools norm -m-any chr$i.1kg.phase3.v5a.EUR.vcf.gz -Oz -o chr$i.1kg.phase3.v5a.dedup.EUR.vcf.gz  >>$i.job
# echo bcftools norm -d all chr$i.1kg.phase3.v5a.dedup.EUR.vcf.gz -Oz -o chr$i.1kg.phase3.v5a.dedup.norm.EUR.vcf.gz  >>$i.job
# echo plink --bfile S_Hebbring_Unr.Guo --recode vcf --chr $i --snps-only just-acgt --out ./beagle/S_Hebbring_Unr.Guo.Forward.chr$i >> chr$i.job
echo unzip -P Cb4JK4gwlscStP chr_$i.zip  >> $i.job
qsub $i.job
done
