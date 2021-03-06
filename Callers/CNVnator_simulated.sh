#! /bin/bash -l
#SBATCH -A b2015375
#SBATCH -J CNVnator_benchmark
#SBATCH -p core
#SBATCH -t 2-00:00:00
#SBATCH -n 1 
#the script used to run cnvnator, note that the output directories needs to be changed, argument 1 is the bam file, argument 2 is the reference, split per chromosome, third argument is the output prefix
#this script will use bins of size 200
#this script is used on the simulated data, here the -chrom flag is used to tell which chromosomes are populated
module load bioinfo-tools
module load CNVnator

cnvnator -root $3.root  -chrom chr1 chr2 chr3 chr20 chr21 chr19 -tree $1
cnvnator -root $3.root  -chrom chr1 chr2 chr3 chr20 chr21 chr19 -his 200 -d $2
cnvnator -root $3.root  -chrom chr1 chr2 chr3 chr20 chr21 chr19 -stat 200 >> $3.cnvnator.log 
cnvnator -root $3.root  -chrom chr1 chr2 chr3 chr20 chr21 chr19 -partition 200 
cnvnator -root $3.root  -chrom chr1 chr2 chr3 chr20 chr21 chr19 -call 200 > $3.out 
cnvnator2VCF.pl $3.out  >  $3.cnvnator.vcf 


