# TIDDIT_benchmarking_repo
This repository contains the scripts used to benchmark TIDDIT
A recursive download is needed to get all the scripts:

git clone --recursive https://github.com/J35P312/TIDDIT_benchmarking_repo.git

Simulated
=========
Contains the scripts used to create the simulated bam files, run the callers as well as counting the precision and specificity on the simulated samples
NA12878
=========
Contains the scripts used to count the precision and specificity on NA12878. The deletions are validated through the Genome in a Bottle initiative. The downloaded deletions as well as the bam files are available via this web site:
ftp://ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/NIST_NA12878_HG001_HiSeq_300x/
The downsampled(30x) bam file was used to benchmark the callers.

database
=========
contains the commands used to generate the databases, as well as the script used to generate the plots
callers
=====
One slurm script to run each caller. The following versions of the callers was used for bencmarking:
cnvnator v0.3.2
delly  v0.7.2
fermikit r178
TIDDIT-1.0
Lumpy 0.2.12
Manta 0.27.1

