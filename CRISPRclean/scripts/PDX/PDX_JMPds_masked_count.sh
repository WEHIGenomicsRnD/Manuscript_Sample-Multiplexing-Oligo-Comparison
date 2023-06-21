#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=6:00:00
#SBATCH -e MSK_PDX-%j.err
#SBATCH -o MSK_PDX-%j.out
#SBATCH --job-name=MSK_PDX

# Also process the fastqs with the CRISPRclean_Single_Cell_RNA_Boost_Ref_Homo_sapiens.GRCh38.104.chr.MASKED_RiboMito_NVG.protein_coding.gtf
# Reference recomended by Jumpcode

#If you want to download it from the terminal, use this command:
# module load awscli/2.5.2
# aws s3 cp s3://jumpcodegenomics-public/public-datasets/CRISPRclean_Single_Cell_RNA_Boost_References/CRISPRclean_Single_Cell_RNA_Boost_Ref_Homo_sapiens.GRCh38.104.chr.MASKED_RiboMito_NVG.protein_coding.gtf .

module load cellranger/7.0.0

# Human only is available so need to remap the untreated PDX with Human reference

TRANSCRIPTOME="/stornext/Projects/score/Indexes/refdata-gex-GRCh38-2020_MASKED_9010_NVG";
INPUT_DIR="/vast/scratch/users/brown.d/S000331/fastq/downsample";

cellranger count --id=G000225_PDX_JMPds-mask \
                   --transcriptome=$TRANSCRIPTOME \
                   --fastqs=$INPUT_DIR \
                   --sample=R010_PDX_JPBds_GEX \
                   --localcores=12 \
                   --localmem=100;
