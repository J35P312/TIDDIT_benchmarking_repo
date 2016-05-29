#! /bin/bash -l
#SBATCH -A b2014152
#SBATCH -J lumpy_benchmark
#SBATCH -p core
#SBATCH -t 3-00:00:00
#SBATCH -n 1 
#script used to run lumpy express.
#supply the bam file as first argument, prefix as the second, the extractSplitReads variable must be set prior to running
module load bioinfo-tools
module load samtools

extractSplitReads="/sw/apps/bioinfo/LUMPY/0.2.12/milou/scripts/extractSplitReads_BwaMem"

samtools view -b -F 1294 $1 > $2_normal.D.unsorted.bam
samtools sort $2_normal.D.unsorted.bam $2_normal.D

samtools view -h $1 | $extractSplitReads -i stdin | samtools view -Sb - > $2_normal.S.unsorted.bam
samtools sort $2_normal.S.unsorted.bam $2_normal.S

module unload samtools
module load LUMPY

alias awk=gawk
lumpyexpress -B $1 -S $2_normal.S.bam -D $2_normal.D.bam  -o $2.lumpy.vcf
