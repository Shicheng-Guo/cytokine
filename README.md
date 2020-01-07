### The Genetics of TH17 Signaling Cytokines: Interleukin-23 and Interleukin-17A

Dataset:

* Set1: [1015 samples](./extdata/660w/readme.md) (660W,hg18 -> hg19 and cross-mapping with PMRP1 and PMRP2 exome-array)
* Set2: [1000 samples](./extdata/660w/readme.md) (660W,hg18 -> hg19 and cross-mapping with PMRP1 and PMRP2 exome-array)

Timeline:

* The NT refers to “no treatment.”  The Curdlan is the curdlan treatment on the cells. LPS is the LPS treatment on the cells
* 2020/01/07: Steven updated the [phenotype files for the RNA-seq](AxialSpA_MasterFile_02Nov2015_corrected_for_SampSwap_2019.xlsx) in which NT, Curdian and LPS is treatment.
* 2020/01/06: remove 5 samples with <60% mapping ratio. these 5 samples were saved in [here](./extdata/5samplewithlowmapping.txt)
* 2020/01/06: bam files were saved in `/home/guosa/hpc/project/pmrp/cytokine/rnaseq/bam`
* 12/27: Expectation-Maximization [algorithm](https://www.rna-seqblog.com/hierarchical-analysis-of-rna-seq-reads-improves-the-accuracy-of-allele-specific-expression/) for Allele-Specific Expression http://churchill-lab.github.io/emase/
* 12/27: first 62 samples completed with [mapping ratio from 82% to 91%](mappingratio.csv) indicating high quality of the library. 
* 12/27: Alignment(bam) are saved in `\\mcrfnas2\bigdata\Genetic\Projects\shg047\project\pmrp\cytokine\rnaseq\bam`
* 12/26: RNA-seq [alignment job](star.sh) submited, applying [STAR pipeline (2-pass)](https://groups.google.com/forum/#!msg/rna-star/4dhcEGFMiK0/XoMh6rB7CwAJ) for alignment same with GTEx and TCGA
* 12/26/2019: we received [484 raw RNA-seq files](filename2.txt) and [472 unqiue file](filename.unique.txt) and ID connection file (filename to samplename).
* 12/26/2019:file quality checking: [6 samples (12 files)](extdata/rnaseq/repeatsample.csv) have duplicate fastq files, such as: UW025Curdlan_CGATGT_L007 
* 12/25: received RNA-seq data: `/mnt/bigdata/Genetic/Projects/Schrodi_IL23_IL17_variants/RNAseq_macrophages/Data`
* 12/18/2019: run the linear regression with exome-chip data as the gentoyping input
* Meet with Steven and discuss: 1) transforms of the cytokine measurements and 2) network approaches.
* Overall IBD analysis to [set1](extdata/cytokine_set2_pmrp.genome.ibd) and [set2](extdata/cytokine_set2_pmrp.genome.ibd) since these two file provide more information to show repeat sample in PMRP
* 12/12/2019: [694 samples](extdata/cytokine_set1_pmrp.ibd.matchid.csv) in set1 were occured in PMRP exome-chip `~/hpc/project/pmrp/cytokine/set1`
* 12/11/2019: [671 samples](extdata/cytokine_set2_pmrp.ibd.matchid.csv) in set2 were occured in PMRP exome-chip`~/hpc/project/pmrp/cytokine/set2`
* 12/10/2019: Set1 data were coverted to hg19 from hg18 `/gpfs/home/guosa/hpc/project/pmrp/cytokine/set1/hg19`
* 12/10/2019: We find the Set1 samples (N=1015) and I saved in `/gpfs/home/guosa/hpc/project/pmrp/cytokine`
* 12/06/2019: Steve find raw data for another 1170 samples saved in `/mnt/bigdata/StudyData/SCH10411/SecondStage/`
* 12/06/2019: Merge with exome1 and exom2 and check the [IT-Remapped id](SCH101411_Crosswalk.csv) again 
* 12/06/2019: Michigan imputation completed and saved `~/hpc/project/pmrp/cytokine/michigan`
* 12/05/2019: Update cytokine data from hg18 to hg19 so that we can doimputation and phasing with Michigan-Server.
* [ID updated](SCH101411_Crosswalk.csv) (12/05/2019): IT department provided wrong ID information and I found them when QC 
* Steven show the raw `illumina 660W (hg18)`data ((12/03/2019)): `/mnt/bigdata/Genetic/Projects/Schrodi_TH17`
* [588 samples](overlapSample.txt) were repeated genotyped in phase 1 and phase 2 by this sample id
* GWAS raw data were saved in `/mnt/bigdata/Genetic/Projects/Harold/GWAS_data_merge`

#### Footnote:

Data analysis flow-chart was as the following

![](https://github.com/Shicheng-Guo/RnaseqBacterial/blob/master/gene-expression-quantification-pipeline-v2.png)

