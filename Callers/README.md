# TIDDIT_benchmarking_repo
This repository contains the scripts used to benchmark TIDDIT
callers
=====
One slurm script to run each caller
All scripts accepts the bam file as their first argument. Some callers require other arguments, such as reference files as well.

Note that there is a wide span in how complicated the callers are to run and install. Delly and TIDDIT are essentialy one liners, and do not require any unusal libraries.
Fermikit and CNvnator are more complicated.
All callers are run using standard settings and minimal configuration.