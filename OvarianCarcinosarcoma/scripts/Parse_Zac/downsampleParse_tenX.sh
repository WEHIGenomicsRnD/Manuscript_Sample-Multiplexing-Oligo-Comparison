#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=12:00:00
#SBATCH -e ds_Parse-%j.err
#SBATCH -o ds_Parse-%j.out
#SBATCH --job-name=ds_Parse

# 10x Genomics fresh nuclei capture
# 16181 cells
# 207,384,474 reads
# For a fair comparison to Parse downsample to 207,384,474 / 16,181 = 12,817 reads per cell

# Parse 8,948
# So at 12,817 reads per cell need 12,817 * 8,948 = 114,686,516 reads

module load miniconda3/4.10.3;
conda activate /vast/scratch/users/brown.d/ngsQC;

# mkdir /vast/scratch/users/brown.d/Parse_PDX_Zac/fastq;

DOWNSAMPLE="114686516";
BASE_DIR="/vast/scratch/users/brown.d/Parse_PDX_Zac/fastq/";
FASTQ_DIR="/stornext/Projects/score/Analyses/R010_multiplexing/data/fastq/Parse_Zac_V350120324/";

zcat ${FASTQ_DIR}V350120324_concat_read_1.fq.gz |\
    seqtk sample - $DOWNSAMPLE | gzip > ${BASE_DIR}parse_ds_read_1.fq.gz;
    
zcat ${FASTQ_DIR}V350120324_concat_read_2.fq.gz |\
    seqtk sample - $DOWNSAMPLE | gzip > ${BASE_DIR}parse_ds_read_2.fq.gz;
