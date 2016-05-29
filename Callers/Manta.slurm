#! /bin/bash -l
#SBATCH -A b2015313
#SBATCH -J Manta_benchmark
#SBATCH -p core
#SBATCH -t 3-00:00:00
# $1 is the input bam file, $2 is the reference, $3 is the output prefix

module load bioinfo-tools
module load manta


configManta.py --normalBam $1 --reference $2 --runDir $3
python $3/runWorkflow.py -m local
