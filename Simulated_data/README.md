# TIDDIT_benchmarking_repo
This repository contains the scripts used to benchmark TIDDIT
Simulated
=========
use CreateTranslocations to generate the bam files. (visit the github repository for more info on how to run it) or have a look at the simulation_example.

The config file used to simulate the genomes are located in the config_files directory.
The genomes were simualted with a coverage of 30x and std insert size 50. Note that only a few chromosomes were simulated.
The balanced translocations file will contain both deletions and trnaslocations, to query the resulting db properly, the output database should be split on deletions "DEL", and translocations "BND" this could be done using grep.
