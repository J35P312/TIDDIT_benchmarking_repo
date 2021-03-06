#first argument: the vcf path
#second argument: the name of the caller
#third the input DB
echo "the number of variants in the db"
wc -l $3
DB_size=$(wc -l < $3)
echo "the number of hits:"
python query/query_db.py --no_var --variations $1 --files $3 > $2_query.vcf
grep ";OCC=1" $2_query.vcf | wc -l
hits=$(grep ";OCC=1" $2_query.vcf | wc -l)
echo "the total number of calls"
grep ";OCC=" $2_query.vcf | wc -l
calls=$(grep ";OCC=" $2_query.vcf | wc -l)
python count_stats.py $DB_size $hits $calls
