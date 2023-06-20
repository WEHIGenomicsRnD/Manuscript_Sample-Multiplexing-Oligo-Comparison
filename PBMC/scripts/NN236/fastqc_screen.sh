#!/bin/bash

source activate /stornext/HPCScratch/home/brown.d/ngsQC
module load fastqc
module load bowtie2

INPUT_DIR="/stornext/HPCScratch/home/brown.d/Projects/MGI/NN236/unsplit_fq/";

fastqc -o $INPUT_DIR"FastQC" \
    -t 7 \
    $INPUT_DIR"*.fastq.gz";
    
fastq_screen --outdir $INPUT_DIR"FastScreen/" \
    --conf "/stornext/HPCScratch/home/brown.d/fastq_screen.conf" \
    --threads 7 \
    $INPUT_DIR"*R2.fastq.gz";