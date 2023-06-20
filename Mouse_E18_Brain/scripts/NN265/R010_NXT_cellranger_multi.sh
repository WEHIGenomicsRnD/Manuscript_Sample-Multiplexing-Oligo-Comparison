#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=12:00:00
#SBATCH --job-name=NXT_Multi
#SBATCH -e nxt-%j.err
#SBATCH -o nxt-%j.out

module load cellranger/6.0.0

SAMPLE_SHEET_PATH="/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_mouseEmbryoBrain/metadata/NN265/NXT_multi_config.csv";

cellranger multi --id=R010_Mm_NXT \
                     --csv=$SAMPLE_SHEET_PATH \
                     --localcores=12 \
                     --localmem=100;

