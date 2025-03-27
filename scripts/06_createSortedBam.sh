#Edited by: Giann Karlo.
#Date: 23 July 2019.
#No significant differences between other file called 01_runMapping_radseq.sh:
#       1. No SAMTOOLS variable assigned in 01_runMapping_radseq.sh.
#       2. Last 4 lines in 01_runMapping_radseq.sh no exist here.


p=$1; #variable which will be assigned to $1 parameter.
sample=`echo ${p} | sed 's/_USD.*//g'`;
save_location=/bioinfotmp2/genetic_map_CC_01_1940/results/alignment/${sample}/${p};

PICARD=/biodata1/biotools/picard-tools/2.20/picard.jar; #path where is the Picard tool binary.
SAMTOOLS=/biodata1/biotools/samtools/1.9/samtools-1.9/samtools; #path where is the Samtools software.

JAVA="java -d64 -XX:MaxHeapSize=16g"; #performance space for JAVA.
#NGSEP=/biodata1/biotools/ngsep/ngsep_lib/3.3.3/NGSEPcore_3.3.0.jar; #Java module to do variant (Single Nucleotide Variations) calling.

mkdir ${save_location}_tmpdir; #Creates a temporal directory to save temporal files.
$JAVA -Xmx4g -jar ${PICARD} SortSam MAX_RECORDS_IN_RAM=1000000 SO=coordinate CREATE_INDEX=true TMP_DIR=${save_location}_tmpdir I=${save_location}_bowtie2.bam O=${save_location}_bowtie2_sorted.bam >& ${save_location}_bowtie2_sort.log; #Picard and Java are used to do SNVs for .bam of Bowtie. The I parameter means input and O, output. Also, a .log file is generated.
rm -rf ${save_location}_tmpdir; #Deletes temporal directory of temporal files without use.



