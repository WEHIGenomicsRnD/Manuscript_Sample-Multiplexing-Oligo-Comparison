#!/bin/bash
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=110G
#SBATCH --time=48:00:00
#SBATCH -e LMO_ds-%j.err
#SBATCH -o LMO_ds-%j.out
#SBATCH --job-name=LMO_ds

module load cellranger/6.0.0

SS_1k="/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_multiplexing/metadata/downsampling_tags/LMO_multi_config_1k.csv";
SS_2k="/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_multiplexing/metadata/downsampling_tags/LMO_multi_config_2k.csv";
SS_5k="/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_multiplexing/metadata/downsampling_tags/LMO_multi_config_5k.csv";

cellranger multi --id=LMO_ds_1k \
                     --csv=$SS_1k \
                     --localcores=12 \
                     --localmem=100;

cellranger multi --id=LMO_ds_2k \
                     --csv=$SS_2k \
                     --localcores=12 \
                     --localmem=100;
                     
cellranger multi --id=LMO_ds_5k \
                     --csv=$SS_5k \
                     --localcores=12 \
                     --localmem=100;
