#!/bin/bash
#SBATCH --cpus-per-task=20
#SBATCH --ntasks=1
#SBATCH --mem=15G
#SBATCH --time=12:00:00
#SBATCH --job-name=HTO_cellsnp-lite
#SBATCH --output=HTO-cellsnp-lite_%A_%a.out
#SBATCH --partition=regular

# Run cellsnp-lite on capture-specific BAMs
# Peter Hickey modified by Dan Brown
# 2021-09-30

# Setup ------------------------------------------------------------------------

module load cellsnp-lite/1.2.0

# Project specific variables ---------------------------------------------------

PROJECT_ROOT="/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_multiplexing"
CELLRANGERDIR="/stornext/Projects/score/2021_Sequencing_Runs/NN236/fastq/demux_fastq/R010_HTO_multi/outs/per_sample_outs/"
OUTDIR=${PROJECT_ROOT}/data/cellsnp-lite/NN236
REGIONSVCF="/stornext/Projects/score/Indexes/cellSNP/genome1K.phase3.SNP_AF5e4.chr1toX.hg38.vcf.bgz"

# Sample names ---------------------------------------------------

SampleArray=("VBDR1233_Rep-One_HTO_1" "VBDR1233_Rep-Two_HTO_2" "VBDR1206_Rep-One_HTO_3" \
"VBDR1206_Rep-Two_HTO_4" "VBDR1186_Rep-One_HTO_5" "VBDR1186_Rep-Two_HTO_6" \
"VBDR1216_Rep-One_HTO_7" "VBDR1216_Rep-Two_HTO_8")

# Run cellsnp-lite  ------------------------------------------------------------

cellsnp-lite --samFile ${CELLRANGERDIR}/${SampleArray[0]}/count/sample_alignments.bam,${CELLRANGERDIR}/${SampleArray[1]}/count/sample_alignments.bam,\
${CELLRANGERDIR}/${SampleArray[2]}/count/sample_alignments.bam,${CELLRANGERDIR}/${SampleArray[3]}/count/sample_alignments.bam,\
${CELLRANGERDIR}/${SampleArray[4]}/count/sample_alignments.bam,${CELLRANGERDIR}/${SampleArray[5]}/count/sample_alignments.bam,\
${CELLRANGERDIR}/${SampleArray[6]}/count/sample_alignments.bam,${CELLRANGERDIR}/${SampleArray[7]}/count/sample_alignments.bam,\
/stornext/Projects/score/2021_Sequencing_Runs/NN236/fastq/demux_fastq/R010_HTO_multi/outs/multi/count/unassigned_alignments.bam \
             --outDir ${OUTDIR}/HTO \
             --regionsVCF ${REGIONSVCF} \
             --barcodeFile ${PROJECT_ROOT}/data/SCEs/NN236/cellBarcodes/htoNonEmpty.txt \
             --nproc 20 \
             --minMAF 0.1 \
             --minCOUNT 20 \
             --gzip
             