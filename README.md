# master_thesis_code
This is the code used for my analysis of CELLO-seq data for my master's thesis. Here you will find an explanation of what each file does. 

file_uploader.sh - this code was used to prepare the fastq data for demultiplexing and then for SeqMonk. Superlong reads were removed and the
the file was split to render downstream steps faster. 

The following files were ran from the CELLO-seq pipeline, (https://github.com/MarioniLab/CELLOseq): 
1. internal_adaptor_QC.Rmd
2. demultiplex.Rmd

annotator.Rmd - this code was used to annotate the count table from Seqmonk with metadata on the TEs. 

sce_obj_creator_qc.Rmd - this code explains how to turn the metadata and the count table into a Seurat sce
object, necessary for all downstream analysis. The initial qc is conducted here. 

qc_plots.Rmd - code explaining how to make all the remaining qc figures. 

subsets.Rmd - code explaining how to run all the analysis on all the subsets, so any analysis that was not 
conducted on the entire dataset. 

DGE.Rmd - code conducting differential gene expression analysis, DeSeq2, on the dataset. 

dataset_2_analysis.Rmd - code on all the qc and analysis conducted on dataset_2. Preliminary qc can be found in the 
the following paper: https://doi.org/10.1038/s41587-021-01093-1, as the dataset was borrowed. In the paper the 
data is the 50 UMI one. 

