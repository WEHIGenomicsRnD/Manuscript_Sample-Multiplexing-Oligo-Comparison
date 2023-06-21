#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=16:00:00
#SBATCH -e flex-%j.err
#SBATCH -o flex-%j.out
#SBATCH --job-name=flex

module load cellranger/7.0.0

SAMPLE_SHEET1="/stornext/Home/data/allstaff/b/brown.d/Projects/G000225_Cell_Multiplexing/OvarianCarcinosarcoma/metadata/S000378/samplesheet_cr_multi-cap1.csv";
SAMPLE_SHEET2="/stornext/Home/data/allstaff/b/brown.d/Projects/G000225_Cell_Multiplexing/OvarianCarcinosarcoma/metadata/S000378/samplesheet_cr_multi-cap2.csv";

# cellranger multi --id=R010_PDX_FLEX-1 \
#                      --csv=$SAMPLE_SHEET1 \
#                      --localcores=12 \
#                      --localmem=100;

cellranger multi --id=R010_PDX_FLEX-2 \
                      --csv=$SAMPLE_SHEET2 \
                      --localcores=12 \
                      --localmem=100;
