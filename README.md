### The Genetics of TH17 Signaling Cytokines: Interleukin-23 and Interleukin-17A

Dataset:

* Set1: [1015 samples](./extdata/660w/readme.md) (660W,hg18 -> hg19 and cross-mapping with PMRP1 and PMRP2 exome-array)
* Set2: [1000 samples](./extdata/660w/readme.md) (660W,hg18 -> hg19 and cross-mapping with PMRP1 and PMRP2 exome-array)

Timeline:

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
