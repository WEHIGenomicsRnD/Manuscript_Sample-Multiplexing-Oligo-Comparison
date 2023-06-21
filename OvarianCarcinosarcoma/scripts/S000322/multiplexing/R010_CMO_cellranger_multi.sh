#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=6:00:00
#SBATCH -e CMO_multi-%j.err
#SBATCH -o CMO_multi-%j.out
#SBATCH --job-name=CMO_multi

module load cellranger/7.0.0

SAMPLE_SHEET_PATH="/stornext/Home/data/allstaff/b/brown.d/Projects/G000225_Cell_Multiplexing/OvarianCarcinosarcoma/metadata/S000322/multiConfig/CMO_multi_config.csv";

cellranger multi --id=G000225_PDX_CMO \
                     --csv=$SAMPLE_SHEET_PATH \
                     --localcores=12 \
                     --localmem=100;
