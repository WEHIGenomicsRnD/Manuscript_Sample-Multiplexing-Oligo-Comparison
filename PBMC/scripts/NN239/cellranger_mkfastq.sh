#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=6:00:00
#SBATCH --job-name=R010_mkfastq.sh

module load bcl2fastq/2.19.1
module load cellranger/6.0.0

FLOWCELL_DIR="/stornext/Projects/score/2021_Sequencing_Runs/NN239/210903_NS500643_0894_AHJ3LHBGXK";
OUTPUT_DIR="/stornext/Projects/score/2021_Sequencing_Runs/NN239/nn239_fastq";
INTEROP_DIR="/stornext/Projects/score/2021_Sequencing_Runs/NN239/210903_NS500643_0894_AHJ3LHBGXK/InterOp";
SAMPLE_SHEET_PATH="/stornext/Projects/score/2021_Sequencing_Runs/NN239/samplesheets/NN239_cellranger-tiny-bcl-simple.csv";

cellranger mkfastq --id=R010 \
                     --run=$FLOWCELL_DIR \
                     --csv=$SAMPLE_SHEET_PATH \
                     --output-dir=$OUTPUT_DIR \
                     --localcores=12 \
                     --localmem=100
  