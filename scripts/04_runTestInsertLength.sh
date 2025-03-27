p=$1;
o=$2;
m=`echo ${p} | sed 's/_USD.*//g'`;

 # input files
f1=/biodata6/genetic_map_CC_01_1940/data/${m}/${p}_1.fq.gz;
f2=/biodata6/genetic_map_CC_01_1940/data/${m}/${p}_2.fq.gz;
REFERENCE=/biodata6/genetic_map_CC_01_1940/data/reference/scaffolds_final_NGSEP_polished;

 # software variables. Write paths only if you can not install the programs or can not use installed versions
BOWTIE2=/biodata1/biotools/bowtie2/bowtie2;
SAMTOOLS=/biodata1/biotools/samtools/1.9/samtools-1.9/samtools;

 # Align the first 250000 reads
zcat ${f1} | head -n 1000000 > ${p}_testInsert_1.fastq;
zcat ${f2} | head -n 1000000 > ${p}_testInsert_2.fastq;
${BOWTIE2} --rg-id ${p} --rg SM:${p} -X 1000 ${o} -k 3 -t -x ${REFERENCE} -1 ${p}_testInsert_1.fastq -2 ${p}_testInsert_2.fastq -S ${p}_testInsert.sam >& ${p}_testInsert.log;

# Calculate the distribution of predicted insert length
${SAMTOOLS} view -SF 268 ${p}_testInsert.sam | awk '{l=$9;if(l>=0){i=sprintf("%d",l/25)+1;if(i<100)a[i]++;else aM++}}END{for(i=1;i<100;i++)print (i-1)*25,a[i];print "More",aM}' >> ${p}_testInsert.log;
 
 # remove other files
rm -f ${p}_testInsert_1.fastq ${p}_testInsert_2.fastq ${p}_testInsert.sam;
