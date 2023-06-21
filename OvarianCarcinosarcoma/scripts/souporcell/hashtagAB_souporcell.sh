#!/bin/bash
#SBATCH --job-name=Hashtag_souporcell
#SBATCH --partition=regular
#SBATCH --ntasks=1
#SBATCH --time=12:00:00
#SBATCH --cpus-per-task=18
#SBATCH --mem=240G
#SBATCH -e HTOspc-%j.err
#SBATCH -o HTOspc-%j.out

# I follow the instructions of https://github.com/wheaton5/souporcell

module load singularity

# Singularity only loads the directories directly downstream from where you execute the singularity command. 
# If any of the files that need to be accessed by the command are not downstream of the that location, 
# you will receive an error
# The easiest solution to this problem is to “bind” a path upstream of all the files that will need to be accessed by your command:
# singularity exec --bind /path Demuxafy.sif

# --------------- Protocol specific parameters ----------------
BIND_PATH="/stornext/Projects/score,/vast/scratch/users/brown.d"
CELLRANGERDIR="/vast/scratch/users/brown.d/S000322/Cellranger_count_human/G000225_PDX_HTO/outs/";
BCPATH="/stornext/Home/data/allstaff/b/brown.d/Projects/G000225_Cell_Multiplexing/OvarianCarcinosarcoma/data/S000322/cell_bcs/";
FASTA="/stornext/Projects/score/Indexes/refdata-gex-GRCh38-2020-A/fasta/";
OUTPUT="/vast/scratch/users/brown.d/S000322/souporcell/";

singularity exec --bind $BIND_PATH,$BCPATH,$OUTPUT \
    /vast/scratch/users/brown.d/souporcell_latest.sif \
    souporcell_pipeline.py \
    -i ${CELLRANGERDIR}possorted_genome_bam.bam \
    -b ${BCPATH}HashtagAb_wellBCs-hypen.csv \
    -f ${FASTA}genome.fa \
    -t 18 \
    -o ${OUTPUT}HashtagAB \
    -k 4;
