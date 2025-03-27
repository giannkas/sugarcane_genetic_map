#p=$1; #variable which will be assigned to $1 parameter.
#sample=`echo ${p} | awk -F "/" '{print $7}' |sed 's/_USD.*//g'`;
save_location=/bioinfotmp2/genetic_map_CC_01_1940/results/mergevariants/;
load_location=/bioinfotmp2/genetic_map_CC_01_1940/results/symbolic_links_findvariants/;

SEQUENCENAMES=/biodata6/genetic_map_CC_01_1940/data/reference/scaffolds_final_NGSEP_polished.fa.fai; #The sequence names file is a text file which just has the ids of the sequencesin the reference. It is used by the program to determine the order of the reference sequences.

JAVA="java -d64 -Xmx64g"; #performance space for JAVA.
NGSEP=/biodata1/biotools/ngsep/ngsep_lib/NGSEPcore_3.3.3.jar; #Java module to do variant (Single Nucleotide Variations) calling.


# Running Java
$JAVA -jar ${NGSEP} MergeVariants ${SEQUENCENAMES} ${save_location}mergevariants.95ids.vcf ${load_location}*.vcf >& ${save_location}ngsep_mergevariants.95ids.log;

