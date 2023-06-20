#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=12:00:00
#SBATCH -e LMO_multi-%j.err
#SBATCH -o LMO_multi-%j.out
#SBATCH --job-name=LMO_multi

module load cellranger/6.0.0

SAMPLE_SHEET_PATH="/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_multiplexing/metadata/NN263/PBMC/LMO_multi_config.csv";

cellranger multi --id=R010_LMO_multi \
                     --csv=$SAMPLE_SHEET_PATH \
                     --localcores=12 \
                     --localmem=100
