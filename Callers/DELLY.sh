#! /bin/bash -l
#SBATCH -A b2015375
#SBATCH -o /pica/v10/b2014152/opt/NEWEST_FindSV/FindSV/output/P2109/Delly/sbatch_out/DellyTra_P2109_162.out
#SBATCH -e /pica/v10/b2014152/opt/NEWEST_FindSV/FindSV/output/P2109/Delly/sbatch_err/DellyTra_P2109_162.err
#SBATCH -J DellyTra_P2109_162.job
#SBATCH -p core
#SBATCH -t 3-00:00:00

#bam file is argument 1, output prefix is $2
module load bioinfo-tools
module load delly

delly -t TRA -o $2.tra.vcf -g $1
delly -t DEL -o $2.del.vcf -g $1
delly -t DUP -o $2.dup.vcf -g $1
delly -t INV -o $2.inv.vcf -g $1
