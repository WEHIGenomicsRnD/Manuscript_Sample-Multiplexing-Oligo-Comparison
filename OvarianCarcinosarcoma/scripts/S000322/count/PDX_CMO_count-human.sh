#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=12:00:00
#SBATCH -e cmo_PDX-%j.err
#SBATCH -o cmo_PDX-%j.out
#SBATCH --job-name=CMO_PDX

module load cellranger/7.0.0;

# To run cell snp-lite and vireo I need to map against human genome only

TRANSCRIPTOME="/stornext/Projects/score/Indexes/refdata-gex-GRCh38-2020-A";
INPUT_DIR="/stornext/Projects/score/GenomicsRnD/DB/S000322/fastq/AAANMYTHV/";
#FEATURE="/stornext/Home/data/allstaff/b/brown.d/Projects/G000225_Cell_Multiplexing/OvarianCarcinosarcoma/metadata/S000322/featureRef/"

cellranger count --id=G000225_PDX_CMO \
                   --transcriptome=$TRANSCRIPTOME \
                   --fastqs=$INPUT_DIR \
                   --sample=R010_PDX_CMO_GEX \
                   --localcores=12 \
                   --localmem=100;
