#!/bin/bash

#SBATCH --job-name=downsample
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64G
#SBATCH --time=4:00:00
#SBATCH -e ds-%j.err
#SBATCH -o ds-%j.out

# Downsample the oligo tags to consistent read depths to investigate what reads per cell needed.

module load gcc
module load anaconda3
eval "$(conda shell.bash hook)"
conda activate /stornext/HPCScratch/home/brown.d/ngsQC

# Number of reads to downsample to
DOWNSAMPLE=165480453
# 82740226

# For Jumpcode PBMCs

#seqtk sample -2 -s100 /stornext/Projects/score/Analyses/R010_multiplexing/data/fastq/PBMC/jumpcode_PBMC_LMO_GEX/PBMC_JMP-boost_GEX_S2_L001_R1_001.fastq.gz $DOWNSAMPLE | \
#    gzip >  /stornext/Projects/score/Analyses/R010_multiplexing/data/fastq/PBMC/jumpcode_PBMC_LMO_GEX/PBMC_JMP-boost-ds_GEX_S2_L001_R1_001.fastq.gz;
    
#seqtk sample -2 -s100 /stornext/Projects/score/Analyses/R010_multiplexing/data/fastq/PBMC/jumpcode_PBMC_LMO_GEX/PBMC_JMP-boost_GEX_S2_L001_R2_001.fastq.gz $DOWNSAMPLE | \
#    gzip >  /stornext/Projects/score/Analyses/R010_multiplexing/data/fastq/PBMC/jumpcode_PBMC_LMO_GEX/PBMC_JMP-boost-ds_GEX_S2_L001_R2_001.fastq.gz;
    
# ----- Downsample to half the sequencing reads to the undepeleted library. The 50% decrease comes from Jumpcode advertising
DOWNSAMPLE=82740226

# For Jumpcode PBMCs

seqtk sample -2 -s100 /stornext/Projects/score/Analyses/R010_multiplexing/data/fastq/PBMC/jumpcode_PBMC_LMO_GEX/PBMC_JMP-boost_GEX_S2_L001_R1_001.fastq.gz $DOWNSAMPLE | \
    gzip >  /stornext/Projects/score/Analyses/R010_multiplexing/data/fastq/PBMC/jumpcode_PBMC_LMO_GEX/PBMC_JMP-boost-dsHalf_GEX_S2_L001_R1_001.fastq.gz;
    
seqtk sample -2 -s100 /stornext/Projects/score/Analyses/R010_multiplexing/data/fastq/PBMC/jumpcode_PBMC_LMO_GEX/PBMC_JMP-boost_GEX_S2_L001_R2_001.fastq.gz $DOWNSAMPLE | \
    gzip >  /stornext/Projects/score/Analyses/R010_multiplexing/data/fastq/PBMC/jumpcode_PBMC_LMO_GEX/PBMC_JMP-boost-dsHalf_GEX_S2_L001_R2_001.fastq.gz;
 