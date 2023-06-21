#!/bin/bash
#SBATCH --job-name=parse-DS
#SBATCH -e parseDS-%j.err
#SBATCH -o parseDS-%j.out
#SBATCH --time=24:00:00
#SBATCH --partition regular
#SBATCH --cpus-per-task=18
#SBATCH --ntasks=1
#SBATCH --mem=128G

module load miniconda3/4.10.3;
## module load python/3.10.4

## conda create --prefix /vast/scratch/users/brown.d/spipe python=3.10
conda init bash
conda activate /vast/scratch/users/brown.d/spipe

## cd /vast/scratch/users/brown.d/Parse_PDX_Zac/ParseBiosciences-Pipeline.1.0.3p
## bash ./install_dependencies_conda.sh -y
## pip install .

BASE_DIR="/vast/scratch/users/brown.d/Parse_PDX_Zac/";
REF_DIR="/vast/scratch/users/brown.d/Parse_PDX_Zac/genomes/";
META_DIR="/stornext/Home/data/allstaff/b/brown.d/Projects/G000225_Cell_Multiplexing/OvarianCarcinosarcoma/metadata/Parse_Zac/meta/";

${BASE_DIR}ParseBiosciences-Pipeline.1.0.3p/split-pipe --mode all \
    --chemistry v2 \
    --parfile ${BASE_DIR}parfile.txt \
    --genome_dir ${REF_DIR}hg38_mm10/ \
    --fq1 ${BASE_DIR}fastq/parse_ds_read_1.fq.gz \
    --fq2 ${BASE_DIR}fastq/parse_ds_read_2.fq.gz \
    --output_dir ${BASE_DIR}output_downsample/ \
    --sample nuclei_pdx_1 A7-A8 \
    --sample nuclei_pdx_2 A9-A10;
