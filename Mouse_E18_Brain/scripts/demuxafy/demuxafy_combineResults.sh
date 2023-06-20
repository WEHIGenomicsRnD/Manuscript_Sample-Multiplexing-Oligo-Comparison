#!/bin/bash
#SBATCH --job-name=comb_results
#SBATCH --partition=regular
#SBATCH --ntasks=1
#SBATCH --time=1:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH -e demux-cr-%j.err
#SBATCH -o demux-cr-%j.out

# I follow the instructions of https://demultiplexing-doublet-detecting-docs.readthedocs.io/en/latest/Installation.html

# Singularity only loads the directories directly downstream from where you execute the singularity command. 
# If any of the files that need to be accessed by the command are not downstream of the that location, 
# you will receive an error
# The easiest solution to this problem is to “bind” a path upstream of all the files that will need to be accessed by your command:
# singularity exec --bind /path Demuxafy.sif

# --------------- Protocol specific parameters ----------------
PROTOCOL="cellplex";
N_DOUB=4000;
SRT="cmo_cluster.srt.rds"
PARAMETERS=/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_mouseEmbryoBrain/scripts/demuxafy/parameters.json;

# --------------- Global parameters ----------------
COUNTS=/stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out/forDemuxafy/${PROTOCOL}/filtered_feature_bc_matrix;
SEURAT_RDS=/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_mouseEmbryoBrain/data/NN265/SRTs/${SRT};

DOUBLETDECON_OUTDIR=/stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out/demuxafy/${PROTOCOL}/ddec_out;
DOUBLETFINDER_OUTDIR=/stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out/demuxafy/${PROTOCOL}/df_out;
DOUBLETDETECTION_OUTDIR=/stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out/demuxafy/${PROTOCOL}/dd_out;
SCDBLFINDER_OUTDIR=/stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out/demuxafy/${PROTOCOL}/scdbl_out;
SCDS_OUTDIR=/stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out/demuxafy/${PROTOCOL}/scds_out;
SCRUBLET_OUTDIR=/stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out/demuxafy/${PROTOCOL}/scrb_out;
SOLO_OUTDIR=/stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out/demuxafy/${PROTOCOL}/solo_out;
COMBINE_OUTDIR=/stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out/demuxafy/${PROTOCOL}/combined_out;

Rscript /stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_mouseEmbryoBrain/scripts/demuxafydemuxafy_combineResults.R \
    -o $COMBINE_OUTDIR \
    --DoubletDecon $DOUBLETDECON_OUTDIR \
    --DoubletFinder $DOUBLETFINDER_OUTDIR \
    --scDblFinder $SCDBLFINDER_OUTDIR \
    --scds $SCDS_OUTDIR \
    --scrublet $SCRUBLET_OUTDIR;