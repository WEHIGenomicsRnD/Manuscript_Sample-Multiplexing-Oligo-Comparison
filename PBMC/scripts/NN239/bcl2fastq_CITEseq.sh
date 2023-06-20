#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=100G
#SBATCH --time=3:00:00
#SBATCH --job-name=C038_bcl2fastq.sh

module load bcl2fastq/2.19.1

# NOTE: CellRanger can't process ADT and HTO with bcl2fastq, so have to run this 'manually'
# Followed guidelines from https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/using/bcl2fastq-direct
# Total-Seq A hashtag barcode 15bp
# MULTI-Seq barcode 8bp
# I wanted to avoid lane splitting but cell ranger won't run unless lanes are ket separate

FLOWCELL_DIR="/stornext/Projects/score/2021_Sequencing_Runs/NN239/210903_NS500643_0894_AHJ3LHBGXK";
OUTPUT_DIR="/stornext/Projects/score/2021_Sequencing_Runs/NN239/nn239_fastq";
INTEROP_DIR="/stornext/Projects/score/2021_Sequencing_Runs/NN239/210903_NS500643_0894_AHJ3LHBGXK/InterOp";
SAMPLE_SHEET_PATH="/stornext/Projects/score/2021_Sequencing_Runs/NN239/samplesheets/NN239_bcl2fastq.csv";

bcl2fastq --use-bases-mask=Y28,I8nn,nnnnnnnnnn,Y15N* \
  --create-fastq-for-index-reads \
  --minimum-trimmed-read-length=8 \
  --mask-short-adapter-reads=8 \
  --ignore-missing-positions \
  --ignore-missing-controls \
  --ignore-missing-filter \
  --ignore-missing-bcls \
  -r 6 -w 6 \
  -R ${FLOWCELL_DIR} \
  --output-dir=$OUTPUT_DIR \
  --interop-dir=$INTEROP_DIR \
  --sample-sheet=$SAMPLE_SHEET_PATH
