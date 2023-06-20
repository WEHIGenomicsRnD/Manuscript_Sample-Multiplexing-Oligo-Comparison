#!/bin/bash

#SBATCH --job-name=downsample
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64G
#SBATCH --time=2:00:00
#SBATCH -e ds-%j.err
#SBATCH -o ds-%j.out

# Downsample to the same number of reads to allow a fair comparison of Jumpcode CRISPRclean with untreated

module load gcc
module load anaconda3
eval "$(conda shell.bash hook)"
conda activate ~/scratchHOME/ngsQC

# Number of reads to downsample to
DOWNSAMPLE=50000000;

seqtk sample -s100 fastq/concat/UTD_CMO_GEX_S14_L001_I1_001.fastq.gz $DOWNSAMPLE | gzip >  fastq/downsample/UTD_CMO_GEX_S14_L001_I1_001.fastq.gz;
seqtk sample -s100 fastq/concat/UTD_CMO_GEX_S14_L001_R1_001.fastq.gz $DOWNSAMPLE | gzip >  fastq/downsample/UTD_CMO_GEX_S14_L001_R1_001.fastq.gz;
seqtk sample -s100 fastq/concat/UTD_CMO_GEX_S14_L001_R2_001.fastq.gz $DOWNSAMPLE | gzip >  fastq/downsample/UTD_CMO_GEX_S14_L001_R2_001.fastq.gz;

seqtk sample -s100 fastq/concat/JMP_CMO_GEX_S5_L001_I1_001.fastq.gz $DOWNSAMPLE | gzip >  fastq/downsample/JMP_CMO_GEX_S5_L001_I1_001.fastq.gz;
seqtk sample -s100 fastq/concat/JMP_CMO_GEX_S5_L001_R1_001.fastq.gz $DOWNSAMPLE | gzip >  fastq/downsample/JMP_CMO_GEX_S5_L001_R1_001.fastq.gz;
seqtk sample -s100 fastq/concat/JMP_CMO_GEX_S5_L001_R2_001.fastq.gz $DOWNSAMPLE | gzip >  fastq/downsample/JMP_CMO_GEX_S5_L001_R2_001.fastq.gz;
