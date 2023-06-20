#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=8:00:00
#SBATCH -e mkfastq-%j.err
#SBATCH -o mkfastq-%j.out
#SBATCH --job-name=mkfastq

module load bcl2fastq/2.19.1
module load cellranger/6.1.2

FLOWCELL_DIR="/stornext/Projects/score/GenomicsRnD/DB/NN265/220201_VH00915_2_AAAL25YHV_6086_danielB_NN265";
OUTPUT_DIR="/stornext/Projects/score/GenomicsRnD/DB/NN265/fastq";
INTEROP_DIR="/stornext/Projects/score/GenomicsRnD/DB/NN265/220201_VH00915_2_AAAL25YHV_6086_danielB_NN265/InterOp";
SAMPLE_SHEET_PATH="/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_multiplexing/metadata/NN265/NN265_cellranger-tiny-bcl-simple.csv";

cellranger mkfastq --id=R010_JPC \
                     --run=$FLOWCELL_DIR \
                     --csv=$SAMPLE_SHEET_PATH \
                     --output-dir=$OUTPUT_DIR \
                     --localcores=12 \
                     --localmem=100;
  