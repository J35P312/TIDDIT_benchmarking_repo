#! /bin/bash -l
#SBATCH -A b2014152
#SBATCH -o /pica/v10/b2014152/opt/NEWEST_FindSV/FindSV/output/P2109/CNVnator/sbatch_out/CNVnator_P2109_162.out
#SBATCH -e /pica/v10/b2014152/opt/NEWEST_FindSV/FindSV/output/P2109/CNVnator/sbatch_err/CNVnator_P2109_162.err
#SBATCH -J lumpy_P2109_162.job
#SBATCH -p core
#SBATCH -t 2-00:00:00
#SBATCH -n 1 
#script used to run lumpy express.
#to run lumpy, the bam file must be pre processed, the split reads as well as the discordant pairs needs to be extracted, more details on this is available on the lumpy repository
# the bam file is $1
# split reads $2
# discordant pairs $3 
module load bioinfo-tools
module load LUMPY

alias awk=gawk
lumpyexpress -B $1 -S $2 -D $3  -o lumpy.vcf
