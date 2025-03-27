# Get SNPs without significance deviation of HWE (Hardy-Weinberg Equilibrium)
lod=$1;
rf=$2;

awk '
  BEGIN {lg=1}
  FNR==NR{
  	a[$1]=$2;
  	next
  }
  ($1 in a){
  	if($2 == lg)
  	  sum += a[$1]
  	else
  	  {print lg,sum;sum = 0; lg = $2}
  }
  END {print lg,sum}
' /bioinfotmp2/genetic_map_CC_01_1940/results/joinmap/lod${lod}_rf${rf}_sc_size.txt /bioinfotmp2/genetic_map_CC_01_1940/results/joinmap/lod${lod}_rf${rf}_sc_lg.txt > /bioinfotmp2/genetic_map_CC_01_1940/results/joinmap/lod${lod}_rf${rf}_lg_size.txt
