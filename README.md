# HGTs_Pipeline
A protocol for horizontally acquired metabolic gene detection in genomic sequences

Step1 :	The first step in the protocol is to identify compositionally distinct classes of DNAs of apparent alien origin in a given genomes

sh scripts/seg_clus.sh input_file markovorder confid1 confid2 confid3 segmentation_output clustering_output


Step 2 :	Examining the phyletic pattern of the first pass putative alien genes (i.e., their presence or absence in the close relatives)

blastp -query alienprotein.fa -db 13algataxaprotein.fa  -evalue 1e-5 -qcov_hsp_perc 70  -outfmt "6 qaccver saccver pident evalue qcovs" -num_threads 4 -out blastp.txt

Step3: Sequence alignment against the non-redundant database

blastp -query <inputfile> -db nr -outfmt "7 std qlen qcovs" -num_threads 4 -out <out_file>

Step4: d.	Validation of results using maximum likelihood (ML) phylogenetic analysis
