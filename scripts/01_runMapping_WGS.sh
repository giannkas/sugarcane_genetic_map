#Edited by: Giann Karlo.
#Date: 14 May 2019.
#No significant differences between other file called 01_runMapping_radseq.sh:
#       1. No SAMTOOLS variable assigned in 01_runMapping_radseq.sh.
#       2. Last 4 lines in 01_runMapping_radseq.sh no exist here.


p=$1; #variable which will be assigned to $1 parameter.
i=$2; #variable which will be assigned to $2 parameter.
x=$3; #variable which will be assigned to $3 parameter.
o=$4; #variable which will be assigned to $4 parameter.
s=SM:${p}; #variable variable which will be assigned in parallel.
sample=`echo ${p} | sed 's/_USD.*//g'`;
save_location=/bioinfotmp2/genetic_map_CC_01_1940/results/alignment/${sample}/${p};

f1=/biodata6/genetic_map_CC_01_1940/data/${sample}/${p}_1.fq.gz; #WGS reads for different individuals 5'-3'.
f2=/biodata6/genetic_map_CC_01_1940/data/${sample}/${p}_2.fq.gz; #WGS reads for different individuals 3'-5'.

REFERENCE=/biodata6/genetic_map_CC_01_1940/data/reference/scaffolds_final_NGSEP_polished.fa; #Reference genome CC-01-1940.
INDEXES=/biodata6/genetic_map_CC_01_1940/data/reference/scaffolds_final_NGSEP_polished; # Bowtie file in which was saved reference genome indexes after a first alignment with radseq reads. These alignments are indexed to do faster queries.

BOWTIE2=/biodata1/biotools/bowtie2/2.3.5/bowtie2; #path where is the Bowtie binary.
PICARD=/biodata1/biotools/picard-tools/2.20/picard.jar; #path where is the Picard tool binary.
SAMTOOLS=/biodata1/biotools/samtools/1.9/samtools-1.9/samtools; #path where is the Samtools software.

JAVA="java -d64 -XX:MaxHeapSize=16g"; #performance space for JAVA.
#NGSEP=/biodata1/biotools/ngsep/ngsep_lib/3.3.3/NGSEPcore_3.3.0.jar; #Java module to do variant (Single Nucleotide Variations) calling.

# map the reads and sort the alignment

${BOWTIE2} --rg-id ${save_location} --rg ${s} --rg PL:ILLUMINA  -I ${i} -X ${x} ${o} -p 110 -k 3 -t -x $INDEXES -1 ${f1} -2 ${f2} 2> ${save_location}_bowtie2.log | ${SAMTOOLS} view -bhS - > ${save_location}_bowtie2.bam; #Alignment with the input parameters, the indexes and the reads. Bowtie generates an standard error which is saved in .log file. The alignment output is a .sam file which is used in Samtools to convert to .bam (${p}_bowtie2.bam).

mkdir ${save_location}_tmpdir; #Creates a temporal directory to save temporal files.
$JAVA -Xmx4g -jar ${PICARD} SortSam MAX_RECORDS_IN_RAM=1000000 SO=coordinate CREATE_INDEX=true TMP_DIR=${save_location}_tmpdir I=${save_location}_bowtie2.bam O=${save_location}_bowtie2_sorted.bam >& ${save_location}_bowtie2_sort.log; #Picard and Java are used to do SNVs for .bam of Bowtie. The I parameter means input and O, output. Also, a .log file is generated.
rm -rf ${save_location}_tmpdir; #Deletes temporal directory of temporal files without use.

#$JAVA -Xmx3g -jar ${NGSEP} QualStats ${REFERENCE} ${p}_bowtie2_sorted.bam >& ${p}_bowtie2_readpos.stats;
#$JAVA -Xmx3g -jar ${NGSEP} CoverageStats ${p}_bowtie2_sorted.bam ${p}_bowtie2_coverage.stats >& ${p}_bowtie2_coverage.log;


