# Filter homozygous parents and any parent without genotyping

awk '
{
  if($1 ~ /#/)
  	print $0
  else if (!($10 ~ "1/1" && $11 ~ "1/1"))
  	  if (!($10 ~ "0/0" && $11 ~ "0/0"))
        if ($10 !~ "\\./\\.")
          if ($11 !~ "\\./\\.")
            print $0
}' /bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/mergevcf.95ids.b_firstfiltered.vcf > /bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/mergevcf.95ids.b_secondfiltered.vcf
