#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=16:00:00
#SBATCH -e pdxFIX-%j.err
#SBATCH -o pdxFIX-%j.out
#SBATCH --job-name=pdxFIX

module load cellranger/7.0.0

SAMPLE_SHEET_PATH="/stornext/Home/data/allstaff/b/brown.d/Projects/G000225_Cell_Multiplexing/OvarianCarcinosarcoma/metadata/S000322/fixed_rna/ov_pdx.csv";

cellranger multi --id=G000225_PDX_fix \
                     --csv=$SAMPLE_SHEET_PATH \
                     --localcores=12 \
                     --localmem=100;
