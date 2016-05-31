#! /bin/bash -l
#SBATCH -A b2015375
#SBATCH -J FermiKit_benchmark
#SBATCH -p node
#SBATCH -t 1-00:00:00
#the sbatch script used to run fermikit, note to run the script
#first argument is the input bam file, second argument is the reference genome, third is the output prefix
module load bioinfo-tools
module load bwa
module load samtools
module load fermikit

samtools bam2fq $1 > $3.fastq
fermi2.pl unitig -s3g -t16 -l150 -p $3 $3.fastq > $3.mak
make -f $3.mak
run-calling -t16 $2 $3.mag.gz | sh
