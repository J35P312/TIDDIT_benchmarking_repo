# TIDDIT_benchmarking_repo
This repository contains the scripts used to benchmark TIDDIT
callers
=====
One slurm script to run each caller
All scripts accepts the bam file as their first argument. Some callers require other arguments, such as reference files as well.

Note that there is a wide span in how complicated the callers are to run and install. Delly and TIDDIT are essentialy one liners, and do not require any unusal libraries.
Fermikit and CNvnator are more complicated.
All callers are run using standard settings and minimal configuration.

submit_platinum_genome.sh is used to run all callers on the NA12878 sample

submit_simulated_sample.sh is used to run all callers on the simulated bam file.

The scripts used to run each callers are slurm scripts, to submit them via slurm, you will need to change the account settings
