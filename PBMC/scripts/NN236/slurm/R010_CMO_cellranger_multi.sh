#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=16:00:00
#SBATCH --job-name=R010_CMO_multi
#SBATCH -e CMO_multi-slurm-%j.err
#SBATCH -o CMO_multi-slurm-%j.out

module load cellranger/6.0.0

SAMPLE_SHEET_PATH="/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_multiplexing/metadata/NN236/CMO_multi_config.csv";

cellranger multi --id=R010_CMO_multi \
                     --csv=$SAMPLE_SHEET_PATH \
                     --localcores=7 \
                     --localmem=60
