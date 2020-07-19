ulimit -s unlimited
FILE=$1
markovorder=$2
confid1=$3
confid2=$4
confid3=$5

start_time=$(date +%s)

rm *output  # remove older file with outout suffix to avoid appending

cc scripts/seg_clus1.c -lm
./a.out $FILE $markovorder $confid1 $confid2 $confid3 seg_clus_output.txt 

finish_time=$(date +%s)

echo "Time duration for segmentation: $((finish_time - start_time)) secs."
