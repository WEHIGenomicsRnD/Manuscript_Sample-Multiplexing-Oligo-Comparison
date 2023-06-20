#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=12:00:00
#SBATCH -e R010_LMO_multi-slurm-%j.err
#SBATCH -o R010_LMO_multi-slurm-%j.out
#SBATCH --job-name=R010_LMO_multi

module load cellranger/6.0.0

SAMPLE_SHEET_PATH="/stornext/Projects/score/2021_Sequencing_Runs/NN239/samplesheets/R010_DB/LMO_multi_config.csv";

cellranger multi --id=R010_LMO_multi \
                     --csv=$SAMPLE_SHEET_PATH \
                     --localcores=12 \
                     --localmem=100
