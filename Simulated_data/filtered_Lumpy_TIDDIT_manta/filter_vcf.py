import sys
#accepts a lumpy, tiddit or manta vcf, removes all the mates of breakpoints, generating a vcf contining only one line per variant
caller = ""
manta_variants=[]
for line in open(sys.argv[1]):
	if line[0] == "#":
		print(line.strip());
		if "##source" in line:
			if "LUMPY" in line:
				caller = "LUMPY"
			elif "TIDDIT" in line:
				caller = "TIDDIT"
			#manta vcf
			elif "GenerateSV" in line:
				caller = "MANTA"
	else:

		varID= line.split("\t")[2]
		variant= line.split("\t")[4]

		if caller == "":
			#print all variants, they are all representing a unique breakpoints
			print line.strip()
		elif caller == "LUMPY":
			#mates are given by x_1, x_2, print only one of them, if a variatn is without mate, then print it
			if not "_" in varID or varID.endswith("_1"):
				print(line.strip())
		elif caller == "TIDDIT":
            #mates are given by x_1, x_2 print only one of them, if a variatn is without mate, then print it
            #The IDUP is written using 3 entries, two entries describing a translocation, and one entry for the duplication. We should print only the translocation it self for these variants
            #keep only the x_3 idup translocation
			if not "IDUP" in variant and varID.endswith("_1") or varID.endswith("_3"):
				print(line.strip())
  
		else:
			#the manta variants have a more complicated pattern, here the variant type is first given, therafter the variatn id number,
			#then a number giving the breakend number, a bunch of numbers and lastly a number telling the mate id, print only one mate id per break end(the 0th)
			variant_number=varID.split(":")
			if variant_number[-1] == "0": 
				print(line.strip())
				manta_variants.append(variant_number)
