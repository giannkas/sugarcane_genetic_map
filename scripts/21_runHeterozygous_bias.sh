# Filter heterozygous ratio 1:1 at least 50% individuals are heterozygous

awk -v loci=116 '
  FNR==NR{
    a[FNR+loci]=$7;
    next
  }
  {
  	if(a[FNR] >= 0.1 || $1 ~ /#/)
      print $0;
  } 
' /bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/mergevcf.95ids.p1.d_firstfiltered_miscount.log /bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/mergevcf.95ids.p1.d_firstfiltered.vcf > /bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/mergevcf.95ids.p1.d_secondfiltered.vcf
