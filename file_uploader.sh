#file upload
rsync -avz /Volumes/Expansion/20230512_rb_cello_l1egfp/20230512_rb_cello_l1egfp/20230512_1228_1C_PAK73482_bd039484/fastq_pass/ grte3662@gateway.arc.ox.ac.uk:/data/paed-transponsons-long-reads/grte3662/data

#!/bin/sh
#SBATCH -o per.out
#SBATCH -e per.err
#SBATCH --partition=devel
#SBATCH --qos=standard
#SBATCH --job-name=per
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=10G
#SBATCH --mail-user=francesco.rivetti@gtc.ox.ac.uk

wc -l filtered_insertion_32.fastq

# combine fastq, unzip and split for ease
gunzip *fastq.gz
cat *.fastq > insertion_32.fastq 

# remove super long reads
wc -l insertion_32.fastq
awk 'BEGIN {FS = "\t" ; OFS = "\n"} {header = $0 ; getline seq ; getline qheader ; getline qseq ; if (length(seq) < 20000) {print header, seq, qheader, qseq}}' < insertion_32.fastq > processed/filtered_insertion_32.fastq
wc -l processed/filtered_insertion_32.fastq

# split massive file 
split -d -l 40000000 filtered_insertion_32.fastq split/sub_fil_insertion_t

# 10% file
f
# 10% of subfile 
636816

split -d -l 636816 00_barcode_1.fastq /subsets
