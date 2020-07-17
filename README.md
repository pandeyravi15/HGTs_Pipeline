# HGTs_Pipeline
A protocol for horizontally acquired metabolic gene detection in genomic sequences

Step1 :	The first step in the protocol is to identify compositionally distinct classes of DNAs of apparent alien origin in a given genomes

usage:
sh scripts/seg_clus.sh input_file markovorder confid1 confid2 confid3 segmentation_output clustering_output

--------------------------------------------------
INPUTS
--------------------------------------------------

input_file: genomic sequences of interest in fasta format

markovorder: 0, 1, or 2. It is Markov model order.

confid1: Threshold parameter for the segmentation(takes values between 0 - 1)

confid2: Threshold parameter for the first-step clustering (grouping contiguous similar segments)(take values between 0 - 1)

confid3: Threshold parameter for the second-step clustering (grouping non-contiguous similar segments or clusters)(takes values between 0 -1)
you can tune/change segmentation and clustering parameters as well as markov model order at which you want to segment all genomes.

For example :
sh scripts/seg_clus.sh test.fasta 2 0.8 0.7 0.7

where 2 is Markov model order, 0.8 is the threshold for segmentation, 0.7 is the threshold for first-step clustering (grouping contiguous similar segments), and 0.7 is the threshold for second-step clustering (grouping non-contiguous similar segments or clusters).

These 4 parameters can be tuned by the user from command prompt.


-----------------------------------
OUTPUTS
-----------------------------------

All outputs will be stored in same folder.

Files with these suffix will contain final classification:
1. segmentation_output: It contains information of segments of genome after segmentation step

2. clustering_output: It contains final clustered segments after clustering the segmented regions of genome.

filename,Cluster,Segment,Start,End,length,Size,Percent
