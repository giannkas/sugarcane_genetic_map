#Count number of snps in a heterzigosity or MAF level

save_location=/bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/minor_allele_frequency.95ids.p1.d_secondfiltered.log;
load_location=/bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/diversitystats_mergevcf.95ids.p1.d_secondfiltered.log;

#OH

# awk -F ':' '
# 	m=($3 ~ /[0-9]/) {print $3}
# ' ${load_location} |
# sort |
# awk -v s=0 -v e=1.0 -v d=0.01 '
# 	BEGIN { m = 1/d }
# 	{ a[int($1*m)]++ }
# 	END{ e *= m; for(s = int(s*m); s <= e; s++) print s*d, a[s]+0 }
# ' > ${save_location}

# MAF

awk -F ':' '
	m=($5 ~ /[0-9]/) {print $5}
' ${load_location} |
sort |
awk -v s=0 -v e=0.5 -v d=0.01 '
	BEGIN { m = 1/d }
	{ a[int($1*m)]++ }
	END{ e *= m; for(s = int(s*m); s <= e; s++){
			if (s == e)
				print s*d, a[s]+0
			else
				print s*d"-"(s+1)*d, a[s]+0
		}
	}
' > ${save_location}