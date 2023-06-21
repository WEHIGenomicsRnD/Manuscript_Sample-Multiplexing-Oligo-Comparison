#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=100G
#SBATCH --time=3:00:00
#SBATCH -e bcl2fastq-%j.err
#SBATCH -o bcl2fastq-%j.out
#SBATCH --job-name=bcl2fastq

module load bcl2fastq/2.19.1

# NOTE: CellRanger can't process ADT and HTO with bcl2fastq, so have to run this 'manually'
# Followed guidelines from https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/using/bcl2fastq-direct
# Total-Seq A hashtag barcode 15bp
# MULTI-Seq barcode 8bp
# I wanted to avoid lane splitting but cell ranger won't run unless lanes are ket separate

FLOWCELL_DIR="/vast/scratch/users/brown.d/S000322/220830_VH00914_89_AAANMYTHV_6587_danielB_S000322";
INTEROP_DIR="/vast/scratch/users/brown.d/S000322/220830_VH00914_89_AAANMYTHV_6587_danielB_S000322/InterOp";

OUTPUT_DIR="/stornext/Projects/score/GenomicsRnD/DB/S000322/fastq/HTO";
SAMPLE_SHEET_PATH="/stornext/Home/data/allstaff/b/brown.d/Projects/G000225_Cell_Multiplexing/OvarianCarcinosarcoma/metadata/S000322/mkfastq/S000322_bcl2fastq_HTO.csv";

bcl2fastq --create-fastq-for-index-reads \
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
