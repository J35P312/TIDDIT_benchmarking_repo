#!/bin/bash -l
 
#SBATCH -A b2014152
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 48:00:00
#SBATCH -J simualted_bam
#Install CreateTranslocations and put this script into that folder. add the config file found in config_files, thereafter run this script to generate a bam file for benchmarking
module load bioinfo-tools
module load bwa
module load samtools
 
python wrapper.py --threads 8 --coverage 20 --fa ref/hg19.fa --prefix benchmark_sample --config config.txt
