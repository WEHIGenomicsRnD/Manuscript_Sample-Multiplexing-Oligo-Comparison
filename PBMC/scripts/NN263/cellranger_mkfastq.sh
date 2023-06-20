#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=8:00:00
#SBATCH --job-name=mkfastq

module load bcl2fastq/2.19.1
module load cellranger/6.1.2

FLOWCELL_DIR="/stornext/Projects/score/GenomicsRnD/DB/NN263/lingL_NN263_201221/211217_NS500643_0948_AH3V7JBGXL";
OUTPUT_DIR="/stornext/Projects/score/GenomicsRnD/DB/NN263/fastq";
INTEROP_DIR="/stornext/Projects/score/GenomicsRnD/DB/NN263/lingL_NN263_201221/211217_NS500643_0948_AH3V7JBGXL/InterOp";
SAMPLE_SHEET_PATH="/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_multiplexing/metadata/NN263/NN263_cellranger-tiny-bcl-simple.csv";

cellranger mkfastq --id=R010_JW \
                     --run=$FLOWCELL_DIR \
                     --csv=$SAMPLE_SHEET_PATH \
                     --output-dir=$OUTPUT_DIR \
                     --localcores=12 \
                     --localmem=100;
  