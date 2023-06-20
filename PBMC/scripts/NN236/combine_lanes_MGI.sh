#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=6:00:00
#SBATCH --job-name=NN236_combine_lanes

OUTPUT_DIR="/stornext/HPCScratch/home/brown.d/Projects/MGI/NN236/unsplit_fq/";
INPUT_DIR="/stornext/Sysbio/data/ppilot/MGI/NN236/V300058802/";

cat $INPUT_DIR"L01/V300058802_L01_read_1.fq.gz" \
    $INPUT_DIR"L02/V300058802_L02_read_1.fq.gz" \
    $INPUT_DIR"L03/V300058802_L03_read_1.fq.gz" > \
    $OUTPUT_DIR"NN236_GEX_combined_R1.fastq.gz";
    
cat $INPUT_DIR"L01/V300058802_L01_read_2.fq.gz" \
    $INPUT_DIR"L02/V300058802_L02_read_2.fq.gz" \
    $INPUT_DIR"L03/V300058802_L03_read_2.fq.gz" > \
    $OUTPUT_DIR"NN236_GEX_combined_R2.fastq.gz";
    
cp $INPUT_DIR"L04/V300058802_L04_read_1.fq.gz" $OUTPUT_DIR"NN236_MULTI_combined_R1.fastq.gz";
cp $INPUT_DIR"L04/V300058802_L04_read_2.fq.gz" $OUTPUT_DIR"NN236_MULTI_combined_R2.fastq.gz";
