#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=12:00:00
#SBATCH -e fresh_PBMC_utd-%j.err
#SBATCH -o fresh_PBMC_utd-%j.out
#SBATCH --job-name=PBMC_utd

module load cellranger/7.0.0

TRANSCRIPTOME="/stornext/Projects/score/Indexes/refdata-gex-GRCh38-2020-A";
INPUT_DIR="/stornext/Projects/score/Analyses/R010_multiplexing/data/fastq/PBMC/jumpcode_PBMC_LMO_GEX";

cellranger count --id=G000225_PBMC_UTD-cr7 \
                   --transcriptome=$TRANSCRIPTOME \
                   --fastqs=$INPUT_DIR \
                   --sample=PBMC_UTD_GEX \
                   --localcores=12 \
                   --localmem=100;
