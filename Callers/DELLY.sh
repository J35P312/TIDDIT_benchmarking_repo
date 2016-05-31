#! /bin/bash -l
#SBATCH -A b2015375
#SBATCH -J Delly_benchmark
#SBATCH -p core
#SBATCH -t 4-00:00:00

#bam file is argument 1, reference $2 output prefix is $3
module load bioinfo-tools
module load delly
module load vcftools

delly -t TRA -o $3.tra.vcf -g $2 $1
delly -t DEL -o $3.del.vcf -g $2 $1
delly -t DUP -o $3.dup.vcf -g $2 $1
delly -t INV -o $3.inv.vcf -g $2 $1
vcf-concat $3.tra.vcf $3.del.vcf $3.dup.vcf $3.inv.vcf > $3.dellySV.vcf
