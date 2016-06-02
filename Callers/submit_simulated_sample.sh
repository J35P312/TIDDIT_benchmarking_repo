# $1 is the input bam file, $2 is the reference fasta file, $3 is the output prefix, $4 is the directory of the reference files split per chromosome
#this script should be used to analyse the NA12878 sample

sbatch Manta.slurm $1 $2 $3
sbatch CNVnator_simulated.sh $1 $4 $3
sbatch DELLY.sh $1 $2 $3
sbatch fermkit.slurm $1 $2 $3
sbatch lumpy.slurm $1 $3
sbatch TIDDIT_simulated.sh $1 $3
