#!/bin/bash

# Annoyingly the MGI splitbarcode program renames files automatically
# The run name and lane number are automatically included in the file name
# They also use a different fastq naming format to Illumina bcl2fastq
# Will have to renmae to [Sample Name]_S1_L00[Lane Number]_[Read Type]_001.fastq.gz format for Cellranger to work

INPUT_DIR="/stornext/Projects/score/2021_Sequencing_Runs/NN236/fastq/demux_fastq/";

mv $INPUT_DIR"V300058802_L01_R010_CMO_GEX_1.fq.gz" $INPUT_DIR"R010_CMO_GEX_S5_L001_R1_001.fastq.gz";
mv $INPUT_DIR"V300058802_L01_R010_CMO_GEX_2.fq.gz" $INPUT_DIR"R010_CMO_GEX_S5_L001_R2_001.fastq.gz";

mv $INPUT_DIR"V300058802_L01_R010_HTO_GEX_1.fq.gz" $INPUT_DIR"R010_HTO_GEX_S4_L001_R1_001.fastq.gz";
mv $INPUT_DIR"V300058802_L01_R010_HTO_GEX_2.fq.gz" $INPUT_DIR"R010_HTO_GEX_S4_L001_R2_001.fastq.gz";

mv $INPUT_DIR"V300058802_L01_R010_LMO_GEX_1.fq.gz" $INPUT_DIR"R010_LMO_GEX_S3_L001_R1_001.fastq.gz";
mv $INPUT_DIR"V300058802_L01_R010_LMO_GEX_2.fq.gz" $INPUT_DIR"R010_LMO_GEX_S3_L001_R2_001.fastq.gz";

