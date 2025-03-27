p=$1; #variable which will be assigned to $1 parameter.
sample=`echo ${p} | awk -F "/" '{print $7}' |sed 's/_USD.*//g'`;
save_location=/bioinfotmp2/genetic_map_CC_01_1940/results/findvariants/${sample}/;

REFERENCE=/biodata6/genetic_map_CC_01_1940/data/reference/scaffolds_final_NGSEP_polished.fa; #Reference genome CC-01-1940.
KNOWNSTRs=/bioinfotmp2/genetic_map_CC_01_1940/results/mulvardet/scaffolds_final_polished_trf_2_7_7_80_10_20_50.txt; #File with known short tandem reapeats (STRs). This is a text file with at least three columns: chromosome, first position and last position. Positions should be 1-based and inclusive.

JAVA="java -d64 -Xmx64g"; #performance space for JAVA.
NGSEP=/biodata1/biotools/ngsep/ngsep_lib/NGSEPcore_3.3.3.jar; #Java module to do variant (Single Nucleotide Variations) calling.


# Running Java
$JAVA -jar ${NGSEP} FindVariants -minQuality 40 -maxBaseQS 30 -knownSTRs ${KNOWNSTRs} -sampleId ${sample} -ploidy 10 -psp ${REFERENCE} ${p} ${save_location}findvariants.${sample} >& ${save_location}ngsep_findvariants.${sample}.log;

#MAX BASESQ, base values greater than 30 will be changed to 30.
#MaxalnsPerStartPos, will consider maximum sequences which start in the position (100).

