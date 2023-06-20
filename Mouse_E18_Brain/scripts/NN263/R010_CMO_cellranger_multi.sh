#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=12:00:00
#SBATCH --job-name=CMO_Multi
#SBATCH -e cmo-%j.err
#SBATCH -o cmo-%j.out

module load cellranger/6.1.2;

SAMPLE_SHEET_PATH="/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_mouseEmbryoBrain/metadata/NN263/CMO_multi_config.csv";

cellranger multi --id=R010_CMO_Jmp \
                     --csv=$SAMPLE_SHEET_PATH \
                     --localcores=12 \
                     --localmem=100;

