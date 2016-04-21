#! /bin/bash -l
#SBATCH -A b2014152
#SBATCH -J FT_P2109_162.job
#SBATCH -p core
#SBATCH -t 1-00:00:00
#SBATCH -n 1 
#script used to run TIDDIT, note that the TIDDIT binary variable needs to be set 
#$1 is the bam file
TIDDIT=/home/jesperei/FindTranslocations/bin/FindTranslocations

$TIDDIT --sv  -b $1 -o TIDDIT
