#file upload
# with rsync -avz command to cluster

# how many reads?
wc -l filtered_insertion_32.fastq

# combine fastq, unzip and split for ease
gunzip *fastq.gz
cat *.fastq > insertion.fastq 

# remove super long reads
wc -l insertion.fastq 
awk 'BEGIN {FS = "\t" ; OFS = "\n"} {header = $0 ; getline seq ; getline qheader ; getline qseq ; if (length(seq) < 20000) {print header, seq, qheader, qseq}}' < insertion_32.fastq > processed/filtered_insertion_32.fastq
wc -l processed/filtered_insertion.fastq

# split massive file 
split -d -l 40000000 filtered_insertion.fastq split/sub_fil_insertion_t

# 10% file
f
# 10% of subfile 
636816

split -d -l 636816 00_barcode_1.fastq /subsets
