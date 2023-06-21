#!/usr/bin/bash

# Concatenate jumpcode crisprclean PBMC gene expression libraries
# These have been MULTI-Seq LMO labelled

cat /vast/scratch/users/brown.d/S000331/fastq/AAATFCMHV/R010_PBMC_JPB_GEX_S1_L00*_R1_001.fastq.gz > \
    /stornext/Projects/score/Analyses/R010_multiplexing/data/fastq/PBMC/jumpcode_PBMC_LMO_GEX/PBMC_JMP-boost_GEX_S2_L001_R1_001.fastq.gz;
    
cat /vast/scratch/users/brown.d/S000331/fastq/AAATFCMHV/R010_PBMC_JPB_GEX_S1_L00*_R2_001.fastq.gz > \
    /stornext/Projects/score/Analyses/R010_multiplexing/data/fastq/PBMC/jumpcode_PBMC_LMO_GEX/PBMC_JMP-boost_GEX_S2_L001_R2_001.fastq.gz;
    
# The original mitochondrial and ribosomal depeletd samples

cat /stornext/Projects/score/GenomicsRnD/DB/NN263/fastq/H3V7JBGXL/R010_LMO_JPC_GEX_S1_L00*_R1_001.fastq.gz > \
    /stornext/Projects/score/Analyses/R010_multiplexing/data/fastq/PBMC/jumpcode_PBMC_LMO_GEX/PBMC_JMP-orig_GEX_S3_L001_R1_001.fastq.gz;
    
cat /stornext/Projects/score/GenomicsRnD/DB/NN263/fastq/H3V7JBGXL/R010_LMO_JPC_GEX_S1_L00*_R2_001.fastq.gz > \
    /stornext/Projects/score/Analyses/R010_multiplexing/data/fastq/PBMC/jumpcode_PBMC_LMO_GEX/PBMC_JMP-orig_GEX_S3_L001_R2_001.fastq.gz;