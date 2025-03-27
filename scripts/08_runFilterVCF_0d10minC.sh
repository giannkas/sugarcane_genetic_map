p=$1; #variable which will be assigned to $1 parameter.

save_location=/bioinfotmp2/genetic_map_CC_01_1940/results/filtervcf/;

VCF_in=/bioinfotmp2/genetic_map_CC_01_1940/results/mulvardet/mulvardet.95ids.lastline_filtered.vcf;
#KNOWNTransposons=; #File with known transposons.

JAVA="java -d64 -Xmx64g"; #performance space for JAVA.
NGSEP=/biodata1/biotools/ngsep/ngsep_lib/NGSEPcore_3.3.3.jar; #Java module to do variant (Single Nucleotide Variations) calling.

# MultiSampleVariantsDetector
${JAVA} -jar ${NGSEP} FilterVCF -q 40 -s -fi -minI 95 -minC 10 -minMAF 0.15 -minOH 0.1 -maxOH 0.8 ${VCF_in} 1> ${save_location}filtervcf.95ids.lastline_filtered_0d10minC.vcf 2> ${save_location}filtervcf.95ids.lastline_filtered_0d10minC.log;

# NGSEP documentation: https://github.com/NGSEP/NGSEPcore
