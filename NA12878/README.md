use the benchmarking_NA.sh script to benchmark the callers on the NA12878 sample.

Generate each vcf file using the caller scripts in the caller folder.
The benchmarking_NA.sh assumes that each called variant is presented as one single line in the VCF file.
Thus, the output of Manta, lumpy and TIDDIT needs to be filtered using the script found in 
TIDDIT_benchmarking_repo/Simulated_data/filtered_Lumpy_TIDDIT_manta/
