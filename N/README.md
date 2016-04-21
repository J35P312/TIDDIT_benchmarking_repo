# TIDDIT_benchmarking_repo
This repository contains the scripts used to benchmark TIDDIT
callers
=========
a folder containing slurm files used to run each caller using standard settings
platinum_500.db
===============
Contains all validated deletions that are larger than 500 bp
VCF_intra_size_filter.py
========================
This script removes all variants that are smaller than 500 bp

Evaluation
========================
    1.  Run each caller
    2.  query each caller using the query_db.py script in the query folder using the following command
        python query_db.py --variations <A vcf file from one of the callers > --files platinum_500.db --no_var >  queried_file.vcf
    3.  count the number of hits:
            grep "OCC=1" queried_file.vcf | wc -l
    4.  run the size filter on queried_file.vcf
        python VCF_intra_size_filter.py --vcf queried_file.vcf > filtered.vcf
    5.  get all the deletions lager than 500 bp
        grep "DEL" filtered.vcf > deletions_500.vcf
    6.  count the number of false positive deletions larger than 500 bp:
        grep "OCC=0" deletions_500.vcf | wc -l

A large number of callers use PASS flags to allow filtering of low quality variants. The efficency of these filters were tested using the cleanVCF.py script:

    python cleanVCF.py --vcf queried_file.vcf > filtered_queried.vcf

Thereafter, the sensitivity and specificity is evaluated by starting using the filtered_queried.vcf file from step 3 of the evalation procedure.
