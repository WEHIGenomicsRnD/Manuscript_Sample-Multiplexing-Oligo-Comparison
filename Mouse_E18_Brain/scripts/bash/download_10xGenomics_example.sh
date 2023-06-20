#!/bin/bash

# Data from https://www.10xgenomics.com/resources/datasets/30-k-mouse-e-18-combined-cortex-hippocampus-and-subventricular-zone-cells-multiplexed-12-cm-os-3-1-standard-6-0-0

cd /stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_mouseEmbryoBrain/data/10xGenomicsExample;

curl -O https://cf.10xgenomics.com/samples/cell-exp/6.0.0/SC3_v3_NextGem_DI_CellPlex_Neurons_30K_Multiplex/SC3_v3_NextGem_DI_CellPlex_Neurons_30K_Multiplex_count_raw_feature_bc_matrix.tar.gz;
tar -zxvf /stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_mouseEmbryoBrain/data/10xGenomicsExample/SC3_v3_NextGem_DI_CellPlex_Neurons_30K_Multiplex_count_raw_feature_bc_matrix.tar.gz

curl -O https://cf.10xgenomics.com/samples/cell-exp/6.0.0/SC3_v3_NextGem_DI_CellPlex_Neurons_30K_Multiplex/SC3_v3_NextGem_DI_CellPlex_Neurons_30K_Multiplex_multiplexing_analysis_assignment_confidence_table.csv
curl -O https://cf.10xgenomics.com/samples/cell-exp/6.0.0/SC3_v3_NextGem_DI_CellPlex_Neurons_30K_Multiplex/SC3_v3_NextGem_DI_CellPlex_Neurons_30K_Multiplex_multiplexing_analysis_cells_per_tag.json;
curl -O https://cf.10xgenomics.com/samples/cell-exp/6.0.0/SC3_v3_NextGem_DI_CellPlex_Neurons_30K_Multiplex/SC3_v3_NextGem_DI_CellPlex_Neurons_30K_Multiplex_multiplexing_analysis_tag_calls_per_cell.csv;
curl -O https://cf.10xgenomics.com/samples/cell-exp/6.0.0/SC3_v3_NextGem_DI_CellPlex_Neurons_30K_Multiplex/SC3_v3_NextGem_DI_CellPlex_Neurons_30K_Multiplex_multiplexing_analysis_tag_calls_summary.csv;