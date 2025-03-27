# Get SNPs without significance deviation of HWE (Hardy-Weinberg Equilibrium)
lod=$1;
rf=$2;

awk '
  FNR==NR{
  	a[$1]=$2;
  	next
  }
  ($1 in a)
  	{print $1,$2}
' /bioinfotmp2/genetic_map_CC_01_1940/results/joinmap/lod${lod}_rf${rf}_sc_lg.txt /biodata6/genetic_map_CC_01_1940/data/reference/greaterthan100kbORpseudochromosomes_scaffolds_final_NGSEP_polished.fa.fai | awk '!seen[$1]++ {print $1,$2}' > /bioinfotmp2/genetic_map_CC_01_1940/results/joinmap/lod${lod}_rf${rf}_sc_size.txt