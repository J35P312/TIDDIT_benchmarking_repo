import sys
import os
#accepts the path to a file containing the validated deletions as input, prints only the deletions larger than 500 bp.
#note that the deletions file needs to be changed to the same format as NA12878_500.db
inputFile=sys.argv[1];

for line in open(inputFile):
    content=line.split("\t")
    if(int(content[3])-int(content[2]) > 500):
        print(line.strip())


