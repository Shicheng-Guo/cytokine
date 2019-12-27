##########################################################################################################################################
##########################################################################################################################################
## build STAR Genome Index 
wget http://ftp.ensemblorg.ebi.ac.uk/pub/grch37/release-98/gtf/homo_sapiens/Homo_sapiens.GRCh37.87.gtf.gz
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_29/GRCh37_mapping/gencode.v29lift37.annotation.gtf.gz
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_32/GRCh37_mapping/gencode.v32lift37.annotation.gtf.gz
gunzip Homo_sapiens.GRCh37.87.gtf.gz
STAR --runMode genomeGenerate --genomeDir ~/hpc/db/hg19/STAR/ --genomeFastaFiles ~/hpc/db/hg19/hg19.fa --sjdbGTFfile ~/hpc/db/hg19/gencode.v29lift37.annotation.gtf --runThreadN 30 --sjdbOverhang 89
echo chrLength.txt
echo chrNameLength.txt
echo chrName.txt
echo chrStart.txt

## Mapping RNA-seq with STAR pipeline
cd /gpfs/home/guosa/hpc/project/pmrp/cytokine/rnaseq/bam
mkdir  AC90P8ANXX
mkdir AC90KJANXX
mkdir AC907MANXX

cd /mnt/bigdata/Genetic/Projects/Schrodi_IL23_IL17_variants/RNAseq_macrophages/Data/AC90P8ANXX
cd /mnt/bigdata/Genetic/Projects/Schrodi_IL23_IL17_variants/RNAseq_macrophages/Data/AC907MANXX
cd /mnt/bigdata/Genetic/Projects/Schrodi_IL23_IL17_variants/RNAseq_macrophages/Data/AC90KJANXX
mkdir temp
OPTS_P1="--outReadsUnmapped Fastx --outSAMtype BAM SortedByCoordinate --limitBAMsortRAM 100000000000 --genomeLoad LoadAndKeep --seedSearchStartLmax 8 --outFilterMultimapNmax 100 --outFilterMismatchNoverLmax 0.5"
DBDIR=~/hpc/db/hg19/STAR
ZCAT="--readFilesCommand zcat"
for i in $(ls *.fastq.gz | rev | cut -c 17- | rev | uniq)
do
echo $i
echo \#PBS -N $i  > $i.job
echo \#PBS -l nodes=1:ppn=12 >> $i.job
echo \#PBS -M Guo.shicheng\@marshfieldresearch.org >> $i.job
echo \#PBS -m abe  >> $i.job
echo \#PBS -o $(pwd)/temp/ >>$i.job
echo \#PBS -e $(pwd)/temp/ >>$i.job
echo cd $(pwd) >> $i.job
#echo bowtie2 -p 6 -x /gpfs/home/guosa/hpc/db/hg19/bowtie2/hg19 -1 $i\_1.fastq.gz -2 $i\_2.fastq.gz -S $i.sam >> $i.job
#echo samtools view -bS $i.sam \> $i.bam >> $i.job
#echo samtools sort $i.bam -o $i.sorted.bam >> $i.job
#echo samtools mpileup -uf ~/hpc/db/hg19/hg19.db $i.sorted.bam \| bcftools view -Ov - \> $i.bcf >> $i.job
#echo samtools depth $i.sorted.bam \> $i.wig >> $i.job
# echo STAR --runThreadN 24 $OPTS_P1 --outBAMsortingThreadN 6 $ZCAT --genomeDir $DBDIR --outFileNamePrefix ~/hpc/project/pmrp/cytokine/rnaseq/bam/AC90P8ANXX/$i --readFilesIn $i\_R1_001.fastq.gz $i\_R2_001.fastq.gz >> $i.job
# echo STAR --runThreadN 24 --outSAMtype BAM SortedByCoordinate --outBAMsortingThreadN 6 $ZCAT --genomeDir $DBDIR --outFileNamePrefix ~/hpc/project/pmrp/cytokine/rnaseq/bam/AC907MANXX/$i --readFilesIn $i\_R1_001.fastq.gz $i\_R2_001.fastq.gz >> $i.job
echo STAR --runThreadN 24 --outSAMtype BAM SortedByCoordinate --outBAMsortingThreadN 6 $ZCAT --genomeDir $DBDIR --outFileNamePrefix ~/hpc/project/pmrp/cytokine/rnaseq/bam/AC90KJANXX/$i --readFilesIn $i\_R1_001.fastq.gz $i\_R2_001.fastq.gz >> $i.job
qsub  $i.job
done
