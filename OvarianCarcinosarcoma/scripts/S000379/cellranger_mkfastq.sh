#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=6:00:00
#SBATCH -e mkfastq-%j.err
#SBATCH -o mkfastq-%j.out
#SBATCH --job-name=mkfastq

module load bcl2fastq/2.19.1
module load cellranger/7.0.0

FLOWCELL_DIR="/vast/scratch/users/brown.d/S000379/230301_VH00914_168_AACJ2MTM5_7074_danielB_S379";
INTEROP_DIR="/vast/scratch/users/brown.d/S000379/230301_VH00914_168_AACJ2MTM5_7074_danielB_S379/InterOp";

OUTPUT_DIR="/vast/scratch/users/brown.d/S000379/fastq";
SAMPLE_SHEET_PATH="/stornext/Home/data/allstaff/b/brown.d/Projects/G000225_Cell_Multiplexing/OvarianCarcinosarcoma/metadata/S000378/S000378_cellranger_mkfastq_simple.csv";

cellranger mkfastq --id=S000379 \
                     --run=$FLOWCELL_DIR \
                     --csv=$SAMPLE_SHEET_PATH \
                     --output-dir=$OUTPUT_DIR \
                     --localcores=12 \
                     --localmem=100;
