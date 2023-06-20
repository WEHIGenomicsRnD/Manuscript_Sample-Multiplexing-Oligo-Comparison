#!/usr/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=100G
#SBATCH --time=6:00:00
#SBATCH --job-name=fastqcsreen
#SBATCH -e fqc-%j.err
#SBATCH -o fqc-%j.out

eval "$(conda shell.bash hook)";
conda activate /home/users/allstaff/brown.d/scratchHOME/ngsQC;
module load fastqc;
module load bowtie2;

INPUT_DIR="/stornext/Projects/score/GenomicsRnD/DB_NN258/fastq/H3MGLBGXL/";
OUTPUT_DIR="/stornext/Projects/score/GenomicsRnD/DB_NN258/fastq/FastQC";

fastqc $INPUT_DIR"*R*_001.fastq.gz" -o $OUTPUT_DIR;

fastq_screen --conf ~/scratchHOME/fastq_screen.conf \
    $INPUT_DIR"*R2_001.fastq.gz" \
    -o $OUTPUT_DIR;
    
multiqc $OUTPUT_DIR
