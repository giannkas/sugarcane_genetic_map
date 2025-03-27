p=$1; #variable which will be assigned to $1 parameter.

save_location=/bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/;

VCF_in=/bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/mergevcf.95ids.c_thirdfiltered.vcf;
#KNOWNTransposons=; #File with known transposons.

SelectSNPs=/bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/snps_with_hwe_diversitystats_mergevcf.95ids.001b_secondfiltered.log;

JAVA="java -d64 -Xmx64g"; #performance space for JAVA.
NGSEP=/biodata1/biotools/ngsep/ngsep_lib/NGSEPcore_4.0.1.jar; #Java module to do variant (Single Nucleotide Variations) calling.

# MultiSampleVariantsDetector
${JAVA} -jar ${NGSEP} VCFFilter -srs ${SelectSNPs} -i ${VCF_in} -o ${save_location}mergevcf.95ids.c_fourthfiltered.vcf 2> ${save_location}mergevcf.95ids.c_fourthfiltered.log;

# NGSEP documentation: https://github.com/NGSEP/NGSEPcore
