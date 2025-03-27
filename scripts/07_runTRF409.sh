/opt/biotools/tandem_repeats_finder/trf409.linux64 /biodata6/genetic_map_CC_01_1940/data/reference/scaffolds_final_NGSEP_polished.fa 2 7 7 80 10 20 50 -h -ngs | awk '{if(substr($0,1,1)=="@") c=substr($1,2);else print c,$0}' > /biodata6/genetic_map_CC_01_1940/data/reference/scaffolds_final_polished_trf_2_7_7_80_10_20_50.txt

# parameters explained:
# match=2, missmatch=-7, indel=-7
# ProbabilityMatch=80 ProbabilityIndel=10 (empirical suggested values)
# minAlignmentScore=20 # to filter afterwards
# maxSizeOfTandemPattern=50 # this seems rather large?

awk '{if( $4==1 || $4==2 || $5>=3 || $9>40 ) print $0}' /biodata6/genetic_map_CC_01_1940/data/reference/scaffolds_final_polished_trf_2_7_7_80_10_20_50.txt > /biodata6/genetic_map_CC_01_1940/data/reference/scaffolds_final_polished_trf_2_7_7_80_10_20_50_filtered.txt

# filter1 explained:
# $4 -> length of the tandem pattern (1 for AAAA, CCCC, etc. 2 for ATATAT, GCGCGC, CTCTCT, etc) 
# $5 -> number of tandem repeats (2.5 would be 'ATATA' for pattern AT)
# $9 -> alignment score (match=2,missmatch=-7,indel=-7)

# format explained:
# Chr00 start end  # 1 2 3
# lengthOfPattern  numberOfRepetitions  lengthOfConsensus  # 4 5 6
# percentOfMatches  percentOfIndels  # 7 8
# AligmentScore  # 9
# %A %C %G %T  # 10 11 12 13
# Entropy  # 14
