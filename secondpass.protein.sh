perl filter_blastout2.pl blastp.txt 13algataxaname.txt r.txt
## filter out query and subject combo that are duplicated
awk -F"\t" '!seen[$1, $2]++' r.txt >r2.txt

## extract protein id that hits more than 7 rhodophyta
awk 'NR>1 {count[$1]++} END {for (i in count) print i, count[i]}' r2.txt |awk -F ' ' '$2>7'|cut -d " " -f1 | cut -d "|" -f4 | cut -d "|" -f4|cut -d "." -f1 > filtergene.round2.txt

## remove alien protein sequences that failed to pass phyletic pattern
perl  reextract.pl aliengene.txt filtergene.round2.txt secondpass_alienprotein.txt
perl extractprotein.pl alienprotein.fa secondpass_alienprotein.txt > secondpass_alienprotein.fa

rm r.txt r2.txt filtergene.round2.txt
