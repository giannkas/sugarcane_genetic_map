# Get SNPs without significance deviation of HWE (Hardy-Weinberg Equilibrium)

awk -F: '
{
  if($8 > 0.01){
    print $0
  }
}' /bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/diversitystats_mergevcf.95ids.b_secondfiltered.log | awk '{ print $1,$2,$3 }' > /bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/snps_with_hwe_diversitystats_mergevcf.95ids.001b_secondfiltered.log
