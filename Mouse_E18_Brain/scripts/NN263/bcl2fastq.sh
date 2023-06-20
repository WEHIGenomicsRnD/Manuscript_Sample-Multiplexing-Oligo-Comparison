#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=18
#SBATCH --mem=100G
#SBATCH --time=4:00:00
#SBATCH -e bcl2fastq-%j.err
#SBATCH -o bcl2fastq-%j.out
#SBATCH --job-name=R010_bcl2fastq.sh

module load bcl2fastq/2.20.0

# NOTE: CellRanger can't process ADT and HTO with bcl2fastq, so have to run this 'manually'
# Followed guidelines from https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/using/bcl2fastq-direct
# Total-Seq A hashtag barcode 15bp
# MULTI-Seq barcode 8bp
# I wanted to avoid lane splitting but cell ranger won't run unless lanes are ket separate

FLOWCELL_DIR="/stornext/Projects/score/GenomicsRnD/DB/NN263/lingL_NN263_201221/211217_NS500643_0948_AH3V7JBGXL";
OUTPUT_DIR="/stornext/Projects/score/GenomicsRnD/DB/NN263/fastq";
INTEROP_DIR="/stornext/Projects/score/GenomicsRnD/DB/NN263/lingL_NN263_201221/211217_NS500643_0948_AH3V7JBGXL/InterOp";
SAMPLE_SHEET_PATH="/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_multiplexing/metadata/NN258/NN258_bcl2fastq.csv";

bcl2fastq --create-fastq-for-index-reads \
  --minimum-trimmed-read-length=8 \
  --mask-short-adapter-reads=8 \
  --ignore-missing-positions \
  --ignore-missing-controls \
  --ignore-missing-filter \
  --ignore-missing-bcls \
  -r 6 -w 6 -p 6 \
  -R ${FLOWCELL_DIR} \
  --output-dir=$OUTPUT_DIR \
  --interop-dir=$INTEROP_DIR \
  --sample-sheet=$SAMPLE_SHEET_PATH
  