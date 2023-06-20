#!/bin/bash

# For Jumpcode mouse embryo I used a mix of 4 index primer sets
# Need to concatnate them together into 1 fastq file again

INPUT_DIR="/stornext/Projects/score/GenomicsRnD/DB/NN265/fastq/";
OUTPUT_DIR="/stornext/Projects/score/GenomicsRnD/DB/NN265/fastq/concat/";

cat JMP_CMO_GEX-*_L00*_I1_001.fastq.gz > concat/JMP_CMO_GEX_S5_L001_I1_001.fastq.gz;
cat JMP_CMO_GEX-*_L00*_R1_001.fastq.gz > concat/JMP_CMO_GEX_S5_L001_R1_001.fastq.gz;
cat JMP_CMO_GEX-*_L00*_R2_001.fastq.gz > concat/JMP_CMO_GEX_S5_L001_R2_001.fastq.gz;

cat JMP_LMO_GEX-*_L00*_I1_001.fastq.gz > concat/JMP_LMO_GEX_S1_L001_I1_001.fastq.gz;
cat JMP_LMO_GEX-*_L00*_R1_001.fastq.gz > concat/JMP_LMO_GEX_S1_L001_R1_001.fastq.gz;
cat JMP_LMO_GEX-*_L00*_R2_001.fastq.gz > concat/JMP_LMO_GEX_S1_L001_R2_001.fastq.gz;

cat JMP_NXT_GEX-*_L00*_I1_001.fastq.gz > concat/JMP_LMO_NXT_S9_L001_I1_001.fastq.gz;
cat JMP_NXT_GEX-*_L00*_R1_001.fastq.gz > concat/JMP_LMO_NXT_S9_L001_R1_001.fastq.gz;
cat JMP_NXT_GEX-*_L00*_R2_001.fastq.gz > concat/JMP_LMO_NXT_S9_L001_R2_001.fastq.gz;

cat UTD_CMO_GEX_S14_L00*_I1_001.fastq.gz > concat/UTD_CMO_GEX_S14_L001_I1_001.fastq.gz;
cat UTD_CMO_GEX_S14_L00*_R1_001.fastq.gz > concat/UTD_CMO_GEX_S14_L001_R1_001.fastq.gz;
cat UTD_CMO_GEX_S14_L00*_R2_001.fastq.gz > concat/UTD_CMO_GEX_S14_L001_R2_001.fastq.gz;

# Further add NN258 reads to untreated gene expression library CMO
cat /stornext/Projects/score/GenomicsRnD/DB_NN258/fastq/