#! /bin/bash -l
#SBATCH -A b2015375
#SBATCH -J CNVnator_benchmark
#SBATCH -p core
#SBATCH -t 2-00:00:00
#SBATCH -n 1 
#the script used to run cnvnator, note that the output directories needs to be changed, argument 1 is the bam file, argument 2 is the reference, split per chromosome, third argument is the output prefix
#further note that the chromosomes which cnvnator will analyse needs to be set for the simulated data
#this script will use bins of size 500

module load bioinfo-tools
module load CNVnator

cnvnator -root $3.root -tree $1
cnvnator -root $3.root -his 500 -d $2
cnvnator -root $3.root -stat 500 >> $3.cnvnator.log 
cnvnator -root $3.root -partition 500 
cnvnator -root $3.root -call 500 > $3.out 
cnvnator2VCF.pl $3.out  >  $3.cnvnator.vcf 


