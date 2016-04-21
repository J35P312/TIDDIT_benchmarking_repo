#! /bin/bash -l
#SBATCH -A b2015313
#SBATCH -J Manta_NA12877_S2_FINAL.job
#SBATCH -p core
#SBATCH -t 3-00:00:00
# $1 is the input bam file, $2 is the reference

module load bioinfo-tools
module load manta


configManta.py --normalBam $1 --reference $2 --runDir Manta
python Manta/runWorkflow.py -m local
