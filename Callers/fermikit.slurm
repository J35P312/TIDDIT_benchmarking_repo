#! /bin/bash -l
#SBATCH -A b2015375
#SBATCH -o /pica/v10/b2014152/opt/NEWEST_FindSV/FindSV/output/P2109/fermiKit/sbatch_out/fermiKit_P2109_162.out
#SBATCH -e /pica/v10/b2014152/opt/NEWEST_FindSV/FindSV/output/P2109/fermiKit/sbatch_err/fermiKit_P2109_162.err
#SBATCH -J FermiKit_P2109_162.job
#SBATCH -p node
#SBATCH -t 4-00:00:00
#the sbatch script used to run fermikit, note to run the script, $SNIC_TMP must be set. Also, the destination of cp at line 24 should be changed
#first argument is the input bam file, second argument is the reference genome
module load bioinfo-tools
module load bwa
module load samtools
module load fermikit


mkdir -p $SNIC_TMP/P2109_162
rsync -rptoDLv $1 $SNIC_TMP/P2109_162
samtools bam2fq $SNIC_TMP/P2109_162/$1 > $SNIC_TMP/P2109_162/output.fastq
fermi2.pl unitig -s3g -t16 -p $SNIC_TMP/P2109_162/P2109_162 $SNIC_TMP/P2109_162/output.fastq > $SNIC_TMP/P2109_162/P2109_162.mak
make -f $SNIC_TMP/P2109_162/P2109_162.mak
echo run_calling
run-calling -t16 $2 $SNIC_TMP/P2109_162/P2109_162.mag.gz | sh
cd $SNIC_TMP/P2109_162
cp *vcf* /proj/b2014152/private/FT_article/
echo finished!


