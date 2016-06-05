#! /bin/bash -l
#SBATCH -A b2014152
#SBATCH -J TIDDIT_benchmark
#SBATCH -p core
#SBATCH -t 1-00:00:00
#SBATCH -n 1 
#script used to run TIDDIT, note that the TIDDIT binary variable needs to be set 
#$1 is the bam file, second is the output prefix
#this script is used for the simulated data, here the coverage across the simulated regions is supplied through the -c flag
TIDDIT=/home/jesperei/FindTranslocations/bin/TIDDIT

module load bioinfo-tools
module load vcftools

$TIDDIT --sv  -b $1 -c 20 -o $2
vcf-concat $2_inter_chr_events.vcf $2_intra_chr_events.vcf > $2.TIDDIT.vcf
