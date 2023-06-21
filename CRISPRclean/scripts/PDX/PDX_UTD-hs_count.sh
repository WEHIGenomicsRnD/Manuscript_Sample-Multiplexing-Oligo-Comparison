#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=12:00:00
#SBATCH -e fresh_PDXhs-%j.err
#SBATCH -o fresh_PDXhs-%j.out
#SBATCH --job-name=fresh_PDX-hs

module load cellranger/7.0.0

TRANSCRIPTOME="/stornext/Projects/score/Indexes/refdata-gex-GRCh38-2020-A";
INPUT_DIR="/stornext/Projects/score/GenomicsRnD/DB/S000322/fastq/AAANMYTHV/,/vast/scratch/users/brown.d/S000331/fastq/AAATFCMHV";

cellranger count --id=G000225_PDX_UTD-hs \
                   --transcriptome=$TRANSCRIPTOME \
                   --fastqs=$INPUT_DIR \
                   --sample=R010_PDX_UTD_GEX \
                   --localcores=12 \
                   --localmem=100;
