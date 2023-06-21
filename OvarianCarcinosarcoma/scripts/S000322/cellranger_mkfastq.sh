#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=12:00:00
#SBATCH -e mkfastq-%j.err
#SBATCH -o mkfastq-%j.out
#SBATCH --job-name=mkfastq

module load bcl2fastq/2.19.1
module load cellranger/7.0.0

FLOWCELL_DIR="/vast/scratch/users/brown.d/S000322/220830_VH00914_89_AAANMYTHV_6587_danielB_S000322";
INTEROP_DIR="/vast/scratch/users/brown.d/S000322/220830_VH00914_89_AAANMYTHV_6587_danielB_S000322/InterOp";

OUTPUT_DIR="/stornext/Projects/score/GenomicsRnD/DB/S000322/fastq";
SAMPLE_SHEET_PATH="/stornext/Home/data/allstaff/b/brown.d/Projects/G000225_Cell_Multiplexing/OvarianCarcinosarcoma/metadata/S000322/mkfastq/S000322_cellranger_mkfastq_simple.csv";

cellranger mkfastq --id=S000322 \
                     --run=$FLOWCELL_DIR \
                     --csv=$SAMPLE_SHEET_PATH \
                     --output-dir=$OUTPUT_DIR \
                     --localcores=12 \
                     --localmem=100;
