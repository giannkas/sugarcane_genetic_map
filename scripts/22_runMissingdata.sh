# Count the number of heterozygous, homozygous and misdata individuals in order to calculate pvalue aposteriori

awk -v het=0 -v hom=0 -v mis=0 -v tot=0 '
{
  if ($1 !~ /#/)
  {
  	i = 10
  	while(i<=NF){
  		if ($i ~ "0/1")
  			het += 1;
      else if ($i ~ "0/0" || $i ~ "1/1")
  		  hom += 1;
      else{
        mis += 1;
      }
      i += 1;
  	}
    tot = het + hom;    
  	print het,hom,mis,tot;
  	het = 0;
    hom = 0;
    mis = 0;
    tot = 0;
  }  
}' /bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/mergevcf.95ids.p1.d_firstfiltered.vcf > /bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/mergevcf.95ids.p1.d_firstfiltered_miscount.log
