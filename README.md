# Manuscript_Sample-Multiplexing-Oligo-Comparison
Manuscript: A Risk-reward Examination of Sample Multiplexing Reagents for Single Cell RNA-Seq

## Abstract

Single-cell RNA sequencing (scRNA-Seq) has emerged as a powerful tool for understanding cellular heterogeneity and function. However, the choice of sample multiplexing reagents can impact data quality and experimental outcomes. In this study, we compared various multiplexing reagents, including MULTI-Seq, Hashtag antibody, and CellPlex, across diverse sample types such as human peripheral blood mononuclear cells (PBMCs), mouse embryonic brain and patient-derived xenografts (PDXs).
We found that all multiplexing reagents worked well in cell types robust to \textit{ex vivo} manipulation but suffered from signal-to-noise issues in more delicate sample types. We compared multiple cell demultiplexing algorithms which differed in performance depending on data quality. We find that minor improvements to laboratory workflows such as titration and rapid processing are critical to optimal performance.
We also compared the performance of fixed scRNA-Seq kits and highlight the advantages of the Parse Bioscience kit for fragile samples. Highly multiplexed scRNA-Seq experiments require more sequencing resources, therefore we evaluated CRISPR-based destruction of non-informative genes to enhance sequencing value. Our comprehensive analysis provides insights into the selection of appropriate sample multiplexing reagents and protocols for scRNA-Seq experiments,  facilitating more accurate and cost-effective studies.

## Publication

The publication is available open access at https://doi.org/10.1016/j.ygeno.2024.110793

## Data availability

The count matrices and metadata are available as SingleCellExperiment objects at DOI: 10.5281/zenodo.8031078 https://zenodo.org/record/8031079

scRNA-Seq fastq data for PBMCs and mouse embryonic brain is freely available at NCBI Bioproject PRJNA1064602 and PRJNA1064628 respectively.

snRNA-seq fastq data for Ovarian Carcinosarcome PDX nuclei is available through the European Genome-phenome Archive (EGAS50000000153). The use of this sequencing data is subject to a data transfer agreement and is restricted to ethically approved cancer research and cannot be used to assess germline variants.

### Data structure and usage

The processed data is in the form of SingleCellExperiment objects. https://bioconductor.org/packages/devel/bioc/vignettes/SingleCellExperiment/inst/doc/intro.html

I know most people use Seurat but most in my institute use Bioconductor packages therefore for compatibility I do the same.

Each sample multiplexing oligo was performed in a separate 10x Genomics capture = lane = well. I did not do any integration and analysed them as separate objects. Therefore I packaged each experiment into a list of SingleCellExperiment objects. I put the name of the sample multiplexing reagent as the name.

```r
library(SingleCellExperiment)

sces <- readRDS("path_to_file")

# list which sample multiplexing oligos were used
names(sces)
```

You can access each individual capture with its name.

```r
sce <- sces[["CellPlex"]]
```

You may access the cell level metadata with:

```r
colData(sce)
```

You may access the gene expression count matrix with:

```r
counts(sce)
```

You may access the sample multiplexing oligo tag counts with:

```r
counts(altExp(sce))
```

There are functions to convert between SingleCellExperiment and Seurat objects but I did not use them in a long time and cannot guarantee if they work correctly.

Single-cell | RNA-seq | Sample Multiplexing | Fixed | CRISPRclean
Correspondence: brown.d@wehi.edu.au
