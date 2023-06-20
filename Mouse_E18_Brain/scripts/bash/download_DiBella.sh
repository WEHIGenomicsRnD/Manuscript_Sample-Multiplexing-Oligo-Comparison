# https://singlecell.broadinstitute.org/single_cell/study/SCP1290/molecular-logic-of-cellular-diversification-in-the-mammalian-cerebral-cortex#/

cd /stornext/HPCScratch/home/brown.d/Projects/tenX_GEX/R010_mouseEmbryoBrain/data/SCP1290_regev

curl -k https://singlecell.broadinstitute.org/single_cell/api/v1/bulk_download/generate_curl_config?accessions=SCP1290&auth_code=z1dNUJg0&directory=all&context=study  -o cfg.txt; curl -K cfg.txt && rm cfg.txt