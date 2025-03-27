p=$1; #variable which will be assigned to $1 parameter.

save_location=/bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/;

VCF_in=/bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/mergevcf.95ids.vcf;
#KNOWNTransposons=; #File with known transposons.

JAVA="java -d64 -Xmx64g"; #performance space for JAVA.
NGSEP=/biodata1/biotools/ngsep/ngsep_lib/NGSEPcore_3.3.3.jar; #Java module to do variant (Single Nucleotide Variations) calling.

# MultiSampleVariantsDetector
${JAVA} -jar ${NGSEP} FilterVCF -minI 60 -minMAF 0.10 -minOH 0.10 -maxOH 0.90 ${VCF_in} 1> ${save_location}mergevcf.95ids.b2_firstfiltered.vcf 2> ${save_location}mergevcf.95ids.b2_firstfiltered.log;

# NGSEP documentation: https://github.com/NGSEP/NGSEPcore
