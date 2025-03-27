p=$1; #variable which will be assigned to $1 parameter.

save_location=/bioinfotmp2/genetic_map_CC_01_1940/results/mulvardet/;

REFERENCE=/biodata6/genetic_map_CC_01_1940/data/reference/scaffolds_final_NGSEP_polished.fa; #Reference genome CC-01-1940.
KNOWNSTRs=/bioinfotmp2/genetic_map_CC_01_1940/results/mulvardet/scaffolds_final_polished_trf_2_7_7_80_10_20_50.txt; #File with known short tandem reapeats (STRs). This is a text file with at least three columns: chromosome, first position and last position. Positions should be 1-based and inclusive.

JAVA="java -d64 -Xmx1024g"; #performance space for JAVA.
NGSEP=/biodata1/biotools/ngsep/ngsep_lib/NGSEPcore_3.3.3.jar; #Java module to do variant (Single Nucleotide Variations) calling.

# MultiSampleVariantsDetector
${JAVA} -jar ${NGSEP} MultisampleVariantsDetector -r ${REFERENCE} -minQuality 40 -maxBaseQS 30 -knownSTRs ${KNOWNSTRs} -ploidy 10 -psp -o ${save_location}mulvardet.95ids.vcf ${p}*_bowtie2_sorted.bam >& ${save_location}ngsep_mulvardet.95ids.log;

# NGSEP documentation: https://github.com/NGSEP/NGSEPcore

#${JAVA} -Xmx24g -jar ${NGSEP} FindVariants -noRep -noRD -noRP -ignore5 ${f} -ignore3 ${t} -maxBaseQS 30 -minQuality 40 -ignoreXS -ignoreLowerCaseRef -maxAlnsPerStartPos 100 -sampleId ${p} ${REFERENCE} ${p}_bowtie2_sorted_unique.bam ${p}_bowtie2_NGSEP >& ${p}_bowtie2_NGSEP.log;

