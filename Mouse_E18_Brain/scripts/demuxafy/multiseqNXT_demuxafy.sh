#!/bin/bash
#SBATCH --job-name=demux-nxt
#SBATCH --partition=regular
#SBATCH --ntasks=1
#SBATCH --time=6:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=128G
#SBATCH -e demux-nxt-%j.err
#SBATCH -o demux-nxt-%j.out

# I follow the instructions of https://demultiplexing-doublet-detecting-docs.readthedocs.io/en/latest/Installation.html

module load singularity

# Singularity only loads the directories directly downstream from where you execute the singularity command. 
# If any of the files that need to be accessed by the command are not downstream of the that location, 
# you will receive an error
# The easiest solution to this problem is to “bind” a path upstream of all the files that will need to be accessed by your command:
# singularity exec --bind /path Demuxafy.sif

# --------------- Protocol specific parameters ----------------
PROTOCOL="multiseqCMO";
N_DOUB=5886;
SRT="nxt_cluster.srt.rds"
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

# --------------- Make output folders ----------------
# mkdir $DOUBLETDECON_OUTDIR;
# mkdir $DOUBLETDETECTION_OUTDIR;
# mkdir $DOUBLETFINDER_OUTDIR;
# mkdir $SCDBLFINDER_OUTDIR;
# mkdir $SCDS_OUTDIR;
# mkdir $SCRUBLET_OUTDIR;
# mkdir $SOLO_OUTDIR

echo $COUNTS;
echo $SEURAT_RDS;

# singularity exec --bind /stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_mouseEmbryoBrain,/stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out \
#     /stornext/HPCScratch/home/brown.d/demuxify/Demuxafy.sif \
#     DoubletDecon.R \
#     -r 1 \
#     -o $DOUBLETDECON_OUTDIR \
#     -s $SEURAT_RDS;

# singularity exec --bind /stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_mouseEmbryoBrain,/stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out \
#     /stornext/HPCScratch/home/brown.d/demuxify/Demuxafy.sif \
#     DoubletFinder.R \
#     -o $DOUBLETFINDER_OUTDIR \
#     -s $SEURAT_RDS \
#     -c TRUE \
#     -d $N_DOUB;

# singularity exec --bind /stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out \
#      /stornext/HPCScratch/home/brown.d/demuxify/Demuxafy.sif \
#      scDblFinder.R \
#      -o $SCDBLFINDER_OUTDIR \
#      -t $COUNTS;
 
# singularity exec --bind /stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out \
#      /stornext/HPCScratch/home/brown.d/demuxify/Demuxafy.sif \
#      scds.R \
#      -o $SCDS_OUTDIR \
#      -t $COUNTS;

# singularity exec --bind /stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out \
#     /stornext/HPCScratch/home/brown.d/demuxify/Demuxafy.sif \
#     Scrublet.py \
#     -m $COUNTS \
#     -o $SCRUBLET_OUTDIR;
    
# singularity exec --bind /stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out \
#     /stornext/HPCScratch/home/brown.d/demuxify/Demuxafy.sif \
#     solo -o $SOLO_OUTDIR \
#     -e $N_DOUB \
#     -j $PARAMETERS \
#     -d $COUNTS;

# singularity exec --bind /stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out \
#      /stornext/HPCScratch/home/brown.d/demuxify/Demuxafy.sif \
#      DoubletDetection.py \
#      -m $COUNTS \
#      -o $DOUBLETDETECTION_OUTDIR;

# --------------- Merge ----------------

R_LIBS_USER="/usr/local/lib/R/site-library"
R_LIBS_SITE="/usr/local/lib/R/site-library"

singularity exec --bind /stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_mouseEmbryoBrain,/stornext/Projects/score/GenomicsRnD/DB/NN265/cellranger_multi_out \
    /stornext/HPCScratch/home/brown.d/demuxify/Demuxafy.sif \
    Combine_Results.R \
    -o $COMBINE_OUTDIR \
    --DoubletFinder $DOUBLETFINDER_OUTDIR \
    --scDblFinder $SCDBLFINDER_OUTDIR \
    --scds $SCDS_OUTDIR \
    --scrublet $SCRUBLET_OUTDIR;
    #--DoubletDecon $DOUBLETDECON_OUTDIR \
    