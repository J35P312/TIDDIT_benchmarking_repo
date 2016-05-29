#! /bin/bash -l
#SBATCH -A b2015375
#SBATCH -J Delly_benchmark
#SBATCH -p core
#SBATCH -t 4-00:00:00

#bam file is argument 1, output prefix is $2
module load bioinfo-tools
module load delly
module load vcftools

delly -t TRA -o $2.tra.vcf -g $1
delly -t DEL -o $2.del.vcf -g $1
delly -t DUP -o $2.dup.vcf -g $1
delly -t INV -o $2.inv.vcf -g $1
vcf-concat $2.tra.vcf $2.del.vcf $2.dup.vcf $2.inv.vcf > $2.dellySV.vcf
