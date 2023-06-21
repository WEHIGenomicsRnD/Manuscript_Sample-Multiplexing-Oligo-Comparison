#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=12:00:00
#SBATCH -e HTO_PDX-%j.err
#SBATCH -o HTO_PDX-%j.out
#SBATCH --job-name=HTO_PDX

module load cellranger/7.0.0

TRANSCRIPTOME="/stornext/Projects/score/Indexes/refdata-gex-GRCh38-2020-A";
INPUT_DIR="/stornext/Projects/score/GenomicsRnD/DB/S000322/fastq/AAANMYTHV";
CELLS=7971;

# Cell counts from manual UMI thrresholding = 1A_cell_calling.Rmd
##            CellPlex Hashtag Ab MULTI-Seq CMO Unlabelled
## manual_umi     5509       7971          5156      16181

cellranger count --id=G000225_PDX_HTO-forceCell \
                   --transcriptome=$TRANSCRIPTOME \
                   --fastqs=$INPUT_DIR \
                   --sample=R010_PDX_HTO_GEX \
                   --localcores=12 \
                   --force-cells=$CELLS \
                   --localmem=100;
