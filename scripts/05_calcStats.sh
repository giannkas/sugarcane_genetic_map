#Author: Giann Karlo Aguirre Samboní
#Date: June 12th 2019

p=$1; #variable which will be assigned to $1 parameter.
sample=`echo ${p} | sed 's/_USD.*//g'`;
load_location=/bioinfotmp2/genetic_map_CC_01_1940/results/alignment/${sample}/${p};
save_location=/bioinfotmp2/genetic_map_CC_01_1940/results/depth_analysis/ngsep/${sample}/${p};

REFERENCE=/biodata6/genetic_map_CC_01_1940/data/reference/scaffolds_final_NGSEP_polished.fa; #Reference genome CC-01-1940.

JAVA="java -d64 -XX:MaxHeapSize=16g"; #performance space for JAVA.
NGSEP=/biodata1/biotools/ngsep/ngsep_lib/NGSEPcore_3.3.3.jar; #Java module to do variant (Single Nucleotide Variations) calling.

$JAVA -Xmx3g -jar ${NGSEP} QualStats ${REFERENCE} ${load_location}_bowtie2_sorted.bam >& ${save_location}_bowtie2_readpos.stats; # QualStats calculate with NGSEP.
$JAVA -Xmx3g -jar ${NGSEP} CoverageStats ${load_location}_bowtie2_sorted.bam ${save_location}_bowtie2_coverage.stats >& ${save_location}_bowtie2_coverage.log; # CoverageStats calculate with NGSEP.
