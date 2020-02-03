### Data Transfer To STANFORD

We generated RNA-seq data to 79 unique human cells with 3 different condation: NULL, LPS_Treatment and Curdlan_Treatment. Each sample have 3 condation and it is pair-end sequencing (R1 and R2), therefore, totally, we have 79x3x2=472 files. 

* MC indicates the samples were collected by MRCI
* UW indicates the samples were collected by UW-Madison

Take MC136NT_TGACCA_L003_R2_001.fastq.gz as example: 

* 1) MC136NT:  Sample ID is MC136, NT indicates No Treatment (NULL)
* 2) R2 indicates it is second reads of pair-wise sequencing. 
* 3) MC136NT_TGACCA_L003_R1_001.fastq.gz is paired files with MC136NT_TGACCA_L003_R1_001.fastq.gz


OTHER USEFUL INFORMATION LIKE: 
* 01/14: library format: paired-end, relative orientation : inward and strandedness : unstranded
* 12/27: first 62 samples completed with mapping ratio from 82% to 91% indicating high quality of the library.

MORE INFORMATION CAN BE FOUND HERE: https://github.com/Shicheng-Guo/cytokine/blob/master/README.md

BAM files saved in: \\mcrfnas2\bigdata\Genetic\Projects\shg047\project\pmrp\cytokine\rnaseq\bam
FASTQ files saved in: \\mcrfnas2\bigdata\Genetic\Projects\Schrodi_IL23_IL17_variants\RNAseq_macrophages\Data

md5 file for FASTQ can be [download here]()
