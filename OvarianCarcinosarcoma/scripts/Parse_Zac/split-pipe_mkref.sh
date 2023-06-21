#!/bin/bash
#SBATCH --job-name=parse-mkref
#SBATCH -e mkref-%j.err
#SBATCH -o mkref-%j.out
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --mem=256G
#SBATCH --partition regular

module load miniconda3/4.10.3
## module load python/3.10.4

## conda create --prefix /vast/scratch/users/brown.d/spipe python=3.10
## conda init bash
conda activate /vast/scratch/users/brown.d/spipe

## cd /vast/scratch/users/brown.d/Parse_PDX_Zac/ParseBiosciences-Pipeline.1.0.3p
## bash ./install_dependencies_conda.sh -y
## pip install .

BASE_DIR="/vast/scratch/users/brown.d/Parse_PDX_Zac/";
REF_DIR="/vast/scratch/users/brown.d/Parse_PDX_Zac/genomes/";

#wget -P ${BASE_DIR}genomes/ https://ftp.ensembl.org/pub/release-109/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz;
#wget https://ftp.ensembl.org/pub/release-109/gtf/homo_sapiens/Homo_sapiens.GRCh38.109.gtf.gz;
#wget https://ftp.ensembl.org/pub/release-109/fasta/mus_musculus/dna/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz;
#wget https://ftp.ensembl.org/pub/release-109/gtf/mus_musculus/Mus_musculus.GRCm39.109.gtf.gz;

split-pipe \
    --mode mkref \
    --genome_name hg38 mm10 \
    --fasta ${REF_DIR}Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz \
        ${REF_DIR}Mus_musculus.GRCm39.dna.primary_assembly.fa.gz \
    --genes ${REF_DIR}Homo_sapiens.GRCh38.109.gtf.gz \
        ${REF_DIR}Mus_musculus.GRCm39.109.gtf.gz \
    --output_dir ${REF_DIR}hg38_mm10;
