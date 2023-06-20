#!/bin/bash
#SBATCH --job-name=demux-utd
#SBATCH --partition=regular
#SBATCH --ntasks=1
#SBATCH --time=12:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=128G
#SBATCH -e demux-utd-%j.err
#SBATCH -o demux-utd-%j.out

# I follow the instructions of https://demultiplexing-doublet-detecting-docs.readthedocs.io/en/latest/Installation.html

# Get common variants vcf file
# wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=13aebUpEKrtjliyT9rYzRijtkNJVUk5F_' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=13aebUpEKrtjliyT9rYzRijtkNJVUk5F_" -O common_variants_grch38.vcf && rm -rf /tmp/cookies.txt


module load singularity;

# Singularity only loads the directories directly downstream from where you execute the singularity command. 
# If any of the files that need to be accessed by the command are not downstream of the that location, 
# you will receive an error
# The easiest solution to this problem is to “bind” a path upstream of all the files that will need to be accessed by your command:
# singularity exec --bind /path Demuxafy.sif

# --------------- Protocol specific parameters ----------------
PROTOCOL="Unlabelled";
N=4;
BARCODES=/stornext/Home/data/allstaff/b/brown.d/Projects/G000225_Cell_Multiplexing/OvarianCarcinosarcoma/data/S000322/cell_bcs/Unlabelled_wellBCs-hypen.tsv.gz;
BAM=/stornext/Projects/score/GenomicsRnD/DB/S000322/cellranger_outs/G000225_PDX_UTD/possorted_genome_bam.bam;

# --------------- Global parameters ----------------
THREADS=8
# must be .vcf right now we dont accept gzip or bcf sorry
VCF=/vast/scratch/users/brown.d/common_snp/common_variants_grch38.vcf;
# FASTA=/stornext/Projects/score/Indexes/refdata-gex-GRCh38-and-mm10-2020-A/fasta/genome.fa;
FASTA=/stornext/Projects/score/Indexes/refdata-gex-GRCh38-2020-A/fasta/genome.fa;

# --------------- Output directories ----------------

SOUPORCELL_OUTDIR=/stornext/Projects/score/GenomicsRnD/DB/S000322/demuxafy/${PROTOCOL}/soc_out;

COMBINE_OUTDIR=/stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out/demuxafy/${PROTOCOL}/combined_out;

# --------------- Make output folders ----------------
mkdir $SOUPORCELL_OUTDIR;

singularity exec --bind /stornext/Home/data/allstaff/b/brown.d/Projects/G000225_Cell_Multiplexing/OvarianCarcinosarcoma,/stornext/Projects/score,/vast/scratch/users/brown.d \
    /stornext/HPCScratch/home/brown.d/demuxify/Demuxafy.sif \
    souporcell_pipeline.py \
    -i $BAM \
    -b $BARCODES \
    -f $FASTA \
    -t $THREADS \
    -o $SOUPORCELL_OUTDIR \
    -k $N \
    --common_variants $VCF;

# --------------- Merge ----------------

# R_LIBS_USER="/usr/local/lib/R/site-library"
# R_LIBS_SITE="/usr/local/lib/R/site-library"

# singularity exec /stornext/HPCScratch/home/brown.d/demuxify/Demuxafy.sif which R

# singularity exec --bind /stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_mouseEmbryoBrain,/stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out \
#     /stornext/HPCScratch/home/brown.d/demuxify/Demuxafy.sif \
#     Combine_Results.R \
#     -o $COMBINE_OUTDIR \
#     --DoubletFinder $DOUBLETFINDER_OUTDIR \
#     --scDblFinder $SCDBLFINDER_OUTDIR \
#     --scds $SCDS_OUTDIR \
#     --scrublet $SCRUBLET_OUTDIR;
    