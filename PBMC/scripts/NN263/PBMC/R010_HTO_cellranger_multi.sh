#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=12:00:00
#SBATCH -e HTO_multi-%j.err
#SBATCH -o HTO_multi-%j.out
#SBATCH --job-name=HTO_multi

module load cellranger/6.0.0

SAMPLE_SHEET_PATH="/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_multiplexing/metadata/NN263/PBMC/HTO_multi_config.csv";

cellranger multi --id=R010_HTO_JPC \
                     --csv=$SAMPLE_SHEET_PATH \
                     --localcores=12 \
                     --localmem=100
