save_location=/bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/;

VCF_in=/bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/mergevcf.95ids.b_fourthfiltered.vcf;
#KNOWNTransposons=; #File with known transposons.

JAVA="java -d64 -Xmx64g"; #performance space for JAVA.
NGSEP=/biodata1/biotools/ngsep/ngsep_lib/NGSEPcore_3.3.3.jar; #Java module to do variant (Single Nucleotide Variations) calling.

${JAVA} -jar ${NGSEP} ConvertVCF -p1 CC_01746 -p2 CC_011940 -printJoinMap ${VCF_in} ${save_location}mergevcf.95ids.b_fourthfiltered