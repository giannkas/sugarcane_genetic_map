p=$1; #variable which will be assigned to $1 parameter.

save_location=/bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/;

VCF_in=/bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/mergevcf.95ids.b_secondfiltered.vcf;
#KNOWNTransposons=; #File with known transposons.

JAVA="java -d64 -Xmx64g"; #performance space for JAVA.
NGSEP=/biodata1/biotools/ngsep/ngsep_lib/NGSEPcore_4.0.1.jar; #Java module to do variant (Single Nucleotide Variations) calling.

# MultiSampleVariantsDetector
${JAVA} -jar ${NGSEP} VCFFilter -minMAF 0.20 -maxMAF 0.40 -minOH 0.35 -maxOH 0.65 -i ${VCF_in} -o ${save_location}mergevcf.95ids.c_thirdfiltered.vcf 2> ${save_location}mergevcf.95ids.c_thirdfiltered.log;

# NGSEP documentation: https://github.com/NGSEP/NGSEPcore
