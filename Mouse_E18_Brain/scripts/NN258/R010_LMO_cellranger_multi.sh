#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=12:00:00
#SBATCH --job-name=LMO_Multi
#SBATCH -e lmo-%j.err
#SBATCH -o lmo-%j.out

module load cellranger/6.1.2;

SAMPLE_SHEET_PATH="/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_multiplexing/metadata/NN258/LMO_multi_config.csv";

cellranger multi --id=R010_LMO_ME \
                     --csv=$SAMPLE_SHEET_PATH \
                     --localcores=12 \
                     --localmem=100;

