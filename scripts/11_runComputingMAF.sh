awk '
{
  if ($1 ~ "scaffold_12997" && $2 ~ "5874"){
    n01 = 0
    n11 = 0
    n00 = 0
    n_ = 0
    for ( i = 10; i <= NF; i++ ){
      if ($i ~ "0/1")
        n01++
      else if ($i ~ "1/1")
        n11++
      else if ($i ~ "0/0")
        n00++
      else
        n_++
    }
    print n01,n11,n00,n_
  }

}' /bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/mergevcf.95ids.secondfiltered.vcf 