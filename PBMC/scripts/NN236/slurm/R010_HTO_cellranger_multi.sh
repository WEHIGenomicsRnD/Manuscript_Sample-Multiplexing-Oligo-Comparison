#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=16:00:00
#SBATCH -e HTO_multi-slurm-%j.err
#SBATCH -o HTO_multi-slurm-%j.out
#SBATCH --job-name=R010_HTO_multi

module load cellranger/6.0.0

SAMPLE_SHEET_PATH="/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_multiplexing/metadata/NN236/HTO_multi_config.csv";

cellranger multi --id=R010_HTO_multi \
                     --csv=$SAMPLE_SHEET_PATH \
                     --localcores=12 \
                     --localmem=100
