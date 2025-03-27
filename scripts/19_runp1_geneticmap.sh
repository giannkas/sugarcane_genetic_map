# Filter heterozygous parent 1 and reference homozygous parent 2 - P1 genetic map

awk '
{
  if($1 ~ /#/)
  	print $0
  else if ($10 ~ "0/1" && ($11 ~ "0/0" || $11 ~ "1/1"))
  	 print $0
}' /bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/mergevcf.95ids.vcf > /bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/mergevcf.95ids.p1.d_firstfiltered.vcf
