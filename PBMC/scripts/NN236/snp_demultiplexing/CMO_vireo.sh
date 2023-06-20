#!/bin/bash
#SBATCH --cpus-per-task=20
#SBATCH --ntasks=1
#SBATCH --mem=60G
#SBATCH --time=2:00:00
#SBATCH --job-name=CMO_vireo.sh
#SBATCH --output=CMO-vireo_%A_%a.out
#SBATCH --partition=regular

# Run vireo on capture-specific BAMs
# Peter Hickey modified by Dan Brown
# 2021-08-08

# Setup ------------------------------------------------------------------------

module load vireoSNP/0.5.6

echo "SLURM_JOBID: " $SLURM_JOBID

# Project specific variables ---------------------------------------------------

SAMPLE="CMO"
PROJECT_ROOT="/stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_multiplexing"
CELLSNPDIR=${PROJECT_ROOT}/data/cellsnp-lite/NN236/${SAMPLE}
OUTDIR=${PROJECT_ROOT}/data/vireo/NN236/${SAMPLE}

# Run vireo  -------------------------------------------------------------------

# vireo -c $CELL_DATA -N $n_donor -o $OUT_DIR
# CELL_DATA The cell genotype file in VCF format or cellSNP folder with sparse matrices
# N_INIT    Number of random initializations, when GT needs to learn [default: 50]

# NOTE: Unclear why plotting is no longer working. But skipping it to ensure
#       that vireo actually completes.
vireo --cellData=$CELLSNPDIR \
      --nDonor=4 \
      --outDir=$OUTDIR \
      --nInit=200 \
      --noPlot \
      --nproc=20
