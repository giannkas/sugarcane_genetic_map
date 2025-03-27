save_location=/bioinfotmp2/genetic_map_CC_01_1940/results/mergevariants/;

VCF_in=/bioinfotmp2/genetic_map_CC_01_1940/results/mergevariants/mergevariants_filtered.95ids.vcf;
FILTER_GENOMICREGIONS=/biodata6/genetic_map_CC_01_1940/data/reference/lessthan100kbAND_NOTpseudochromosomes_scaffoldsORrepetitive_regions.txt; #File with known regions to filter out.

JAVA="java -d64 -Xmx64g"; #performance space for JAVA.
NGSEP=/biodata1/biotools/ngsep/ngsep_lib/NGSEPcore_3.3.3.jar; #Java module to do variant (Single Nucleotide Variations) calling.

# MultiSampleVariantsDetector
${JAVA} -jar ${NGSEP} FilterVCF -d 20 -s -frs ${FILTER_GENOMICREGIONS} ${VCF_in} 1> ${save_location}mergevariants_filtered-d20added.95ids.vcf 2> ${save_location}ngsep_mergevariants_filtered-d20added.95ids.log;

# NGSEP documentation: https://github.com/NGSEP/NGSEPcore
