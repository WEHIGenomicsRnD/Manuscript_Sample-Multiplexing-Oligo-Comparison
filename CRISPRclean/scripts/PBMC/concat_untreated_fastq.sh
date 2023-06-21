#!/usr/bin/bash

# Concatenate untreated PBMC gene expression libraries
# These have been MULTI-Seq LMO labelled

cat /stornext/Projects/score/2021_Sequencing_Runs/NN232/fastq/HWWHLBGXJ/R010_LMO_GEX_S3_L00*_R1_001.fastq.gz \
    /stornext/Projects/score/2021_Sequencing_Runs/NN236/fastq/demux_fastq/R010_LMO_GEX_S3_L001_R1_001.fastq.gz > \
    /stornext/Projects/score/Analyses/R010_multiplexing/data/fastq/PBMC/untreated_PBMC_LMO_GEX/PBMC_UTD_GEX_S1_L001_R1_001.fastq.gz;
    
cat /stornext/Projects/score/2021_Sequencing_Runs/NN232/fastq/HWWHLBGXJ/R010_LMO_GEX_S3_L00*_R2_001.fastq.gz \
    /stornext/Projects/score/2021_Sequencing_Runs/NN236/fastq/demux_fastq/R010_LMO_GEX_S3_L001_R2_001.fastq.gz > \
    /stornext/Projects/score/Analyses/R010_multiplexing/data/fastq/PBMC/untreated_PBMC_LMO_GEX/PBMC_UTD_GEX_S1_L001_R2_001.fastq.gz