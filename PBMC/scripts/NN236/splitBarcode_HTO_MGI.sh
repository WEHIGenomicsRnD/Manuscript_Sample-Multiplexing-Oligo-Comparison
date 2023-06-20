#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=4:00:00
#SBATCH --job-name=NN236_splitRev_HTO
#SBATCH -e slurm-%_split_HTOrev.err
#SBATCH -o slurm-%_split_HTOrev.out

SPLIT_path="/stornext/HPCScratch/home/brown.d/Projects/MGI/splitBarcode_V2.0.0_release_4_basecallLite_MGI/splitBarcode_V2.0.0_release/linux/bin/";
OUTPUT_DIR="/stornext/HPCScratch/home/brown.d/Projects/MGI/NN236/split_fq/RevComp/";
INPUT_DIR="/stornext/HPCScratch/home/brown.d/Projects/MGI/NN236/unsplit_fq/";
GEX_BC_FILE="/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_multiplexing/metadata/NN236/NN236_GEX_samplesheet.txt";
HTO_BC_FILE="/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_multiplexing/metadata/NN236/NN236_HTO_samplesheet.txt";

#-b 118 10 1 
# How barcode is located. Three integers mean read length before barcode, barcode length and barcode mismatch. 
# This example means: there are 118bp of read before barcode (28bpP READ 1, 90bp read 2)
# and there is 10bp of barcode allowing 1 mismatch.

echo "running " $INPUT_DIR"NN236_MULTI_combined_R1.fastq.gz";
echo "and " $INPUT_DIR"NN236_MULTI_combined_R2.fastq.gz"

$SPLIT_path/splitBarcode \
    -B $HTO_BC_FILE \
    -1 $INPUT_DIR"NN236_MULTI_combined_R1.fastq.gz" \
    -2 $INPUT_DIR"NN236_MULTI_combined_R2.fastq.gz" \
    -o $OUTPUT_DIR \
    -t 12 -m 100 \
    -r \
    -b 118 8 1;

# /stornext/HPCScratch/home/brown.d/Projects/MGI/splitBarcode_V2.0.0_release_4_basecallLite_MGI/splitBarcode_V2.0.0_release/linux/bin/splitBarcode \
#     -1 /stornext/HPCScratch/home/brown.d/Projects/MGI/NN236/unsplit_fq/NN236_MULTI_combined_R1.fastq.gz \
#     -2 /stornext/HPCScratch/home/brown.d/Projects/MGI/NN236/unsplit_fq/NN236_MULTI_combined_R2.fastq.gz \
#     -o /stornext/HPCScratch/home/brown.d/Projects/MGI/NN236/split_fq/RevComp/ \
#     -B /stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_multiplexing/metadata/NN236/NN236_HTO_samplesheet.txt \
#     -t 7 -m 64 \
#     -b 118 8 1;
