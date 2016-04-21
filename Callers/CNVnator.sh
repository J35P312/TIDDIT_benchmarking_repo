#! /bin/bash -l
#SBATCH -A b2011162
#SBATCH -J CNVnator_P2109_162.job
#SBATCH -p core
#SBATCH -t 2-00:00:00
#SBATCH -n 1 
#the script used to run cnvnator, note that the output directories needs to be changed, argument 1 is the bam file, argument 2 is the reference, split per chromosome
#further note that the chromosomes which cnvnator will analyse needs to be set for the simulated data
#this script will use bins of size 200, for the simulated data, as well as one of the NA sample runs, bins of size 1000 were used

module load bioinfo-tools
module load bwa
module load samtools
module load CNVnator

cnvnator -root /pica/v10/b2014152/opt/NEWEST_FindSV/FindSV/output/P2109/CNVnator/P2109_162.root -tree $1
cnvnator -root /pica/v10/b2014152/opt/NEWEST_FindSV/FindSV/output/P2109/CNVnator/P2109_162.root -his 200 -d $2
cnvnator -root /pica/v10/b2014152/opt/NEWEST_FindSV/FindSV/output/P2109/CNVnator/P2109_162.root -stat 200 >> /pica/v10/b2014152/opt/NEWEST_FindSV/FindSV/output/P2109/CNVnator/P2109_162.cnvnator.log 
cnvnator -root /pica/v10/b2014152/opt/NEWEST_FindSV/FindSV/output/P2109/CNVnator/P2109_162.root -partition 200 
cnvnator -root /pica/v10/b2014152/opt/NEWEST_FindSV/FindSV/output/P2109/CNVnator/P2109_162.root -call 200 > /pica/v10/b2014152/opt/NEWEST_FindSV/FindSV/output/P2109/CNVnator/P2109_162.cnvnator.out 
cnvnator2VCF.pl /pica/v10/b2014152/opt/NEWEST_FindSV/FindSV/output/P2109/CNVnator/P2109_162.cnvnator.out  >  P2109_162_cnv.vcf 


