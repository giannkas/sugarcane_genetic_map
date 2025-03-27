#p=$1; #variable which will be assigned to $1 parameter.
#sample=`echo ${p} | awk -F "/" '{print $7}' |sed 's/_USD.*//g'`;
save_location=/bioinfotmp2/genetic_map_CC_01_1940/results/mergevcf/;
load_location=/bioinfotmp2/genetic_map_CC_01_1940/results/symbolic_links_findvariants_knownvariants/;

SEQUENCENAMES=/biodata6/genetic_map_CC_01_1940/data/reference/scaffolds_final_NGSEP_polished.fa.fai; #The sequence names file is a text file which just has the ids of the sequencesin the reference. It is used by the program to determine the order of the reference sequences.

JAVA="java -d64 -Xmx64g"; #performance space for JAVA.
NGSEP=/biodata1/biotools/ngsep/ngsep_lib/NGSEPcore_3.3.3.jar; #Java module to do variant (Single Nucleotide Variations) calling.


# Running Java
$JAVA -jar ${NGSEP} MergeVCF ${SEQUENCENAMES} ${load_location}*.vcf 1> ${save_location}mergevcf.95ids.vcf 2> ${save_location}ngsep_mergevcf.95ids.log;

