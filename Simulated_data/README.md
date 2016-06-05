# TIDDIT_benchmarking_repo
This repository contains the scripts used to benchmark TIDDIT
Simulated
=========
use generate_bam_file.sh to generate the bam file. (visit the github repository for more info on how to run it) or have a look at the simulation_example.
The genome was simualated with a coverage of 25x and std insert size 50. Note that only a few chromosomes were simulated(1,2,3,19,20,21).
the config_files folder contain the config file used to generate the bam file.

the vcf folder contains the vcf files of all the tested callers.
Lumpy,TIDDIT and Manta outputs mate breakpoints for each break end event. Thus these mates needs to be filtered so that ony one variant is reported per event.
These filtered vcf files and the script used for filtering is found in filtered_Lumpy_TIDDIT_manta
the db file contains all the simulated variants
