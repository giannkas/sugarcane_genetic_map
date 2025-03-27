# Filter heterozygous parent 2 and reference homozygous parent 1 - P2 genetic map

awk '
{
  if($1 ~ /#/)
  	print $0
  else if ($10 ~ "0/0" && $11 ~ "0/1")
  	 print $0
}' /bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/mergevcf.95ids.vcf > /bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/mergevcf.95ids.p1_geneticmap.vcf
