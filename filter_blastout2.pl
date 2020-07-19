#!/user/bin/perl
#perl filter_blastout2.pl blastp3.txt 13algataxaname.txt r.txt
#print"enter the sequence file name:";
my $f = $ARGV[0];
open(FILE,$f);

my $f1 = $ARGV[1];
open(FILE1,$f1);

$outfile1=$ARGV[2];
open(FH,">$outfile1");

@D =<FILE>;
$si=@D;
	foreach $D(@D)
	{
		chomp $D;

		@C = split(/\t+/,$D);
		@arr1[$a++]=$C[0];
		@arr2[$b++]=$C[1];
		@arr3[$c++]=$C[2];
		@arr4[$d++]=$C[3];
		@arr5[$e++]=$C[4];


	}

print "$a\n";
$len=$a;

############## reading header file with taxa name
@D1 =<FILE1>;
$s=@D1;


foreach $D1(@D1)
{
	chomp $D1;

	@C1 = split(/\s+/,$D1);
	@ar1[$m++]=$C1[0];
	@ar2[$n++]=$C1[1];


}
$len1=$m;
print "$len1\n";
############## ############## ##############

for($i=0;$i<$len;$i++)
{
 $flag=0;
 $j=0;
	while($j<$len1 && $flag==0)
	{

		if(($arr2[$i] eq $ar1[$j]))
		{
			$arr2[$i]=$ar2[$j];
			$flag=1
		}

		$j++;
	}

	if($flag==0)
	{
		#print FH "$D1[$i] is in EXon region";
	}


}


## filter out alignment with less than 30% identity
for($z=0;$z<$len;$z++)
{

if(($arr3[$z] >30))
{
print FH"$arr1[$z]\t$arr2[$z]\t$arr3[$z]\t$arr4[$z]\t$arr5[$z]\t$arr6[$z]\n";
}
}
