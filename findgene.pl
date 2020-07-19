#!/user/bin/perl

####### *********Input file#1************* ###############";
my $f = $ARGV[0];
open(FILE,$f);

$cluster = $ARGV[2];

@D =<FILE>;
$si=@D;
#print "$D[2]";
$COUNT = 0;
$i=0;
$j=0;
	foreach $D(@D)
	{
		chomp $D;

		@C = split(/\s+/,$D);
		@arr1[$i++]=$C[0];
		@arr2[$j++]=$C[1];
		@arr3[$k++]=$C[2];
		@arr4[$l++]=$C[3];
		@arr5[$m++]=$C[4];
		@arr6[$n++]=$C[5];
		@arr7[$z++]=$C[6];

	}

$len2=$i;
print "$len2\n";

for($i=0;$i<$len2;$i++)
{
	$gs = $gs + $arr6[$i];

	#if(($arr2[$i] == 2)||($arr2[$i] == 3)||($arr2[$i] == 4))
	if(($arr2[$i] != $cluster))
	{
	$total=$total + $arr6[$i];
		$arr1[$b++]=$arr1[$i];
		$arr2[$c++]=$arr2[$i];
		$arr3[$d++]=$arr4[$i];
		$arr4[$e++]=$arr5[$i];
		$arr5[$f++]=$arr6[$i];
		$arr6[$g++]=$arr7[$i];

	}

}$len=$b;

#######*********** Input file#2**************** ###############";
my $f1 = $ARGV[1];
open(FILE1,$f1);

@D1 =<FILE1>;
$si1=@D1;
#print "$D[2]";
$COUNT1 = 0;
$i=0;
$j=0;
	foreach $D1(@D1)
	{
		chomp $D1;

		@C1 = split(/\s+/,$D1);
		@ar1[$o++]=$C1[0];
		@ar2[$p++]=$C1[1];
		@ar3[$q++]=$C1[2];
		@ar4[$r++]=$C1[3];
		@ar5[$s++]=$C1[4];
		@ar6[$t++]=$C1[5];
	}

$len1=$o;
	for($i=0;$i<$len1;$i++)
	{
		$is=$is+$ar5[$i];
	}
#######################**Output files**########################################

$outfile2=$ARGV[3];
open(FH1,">$outfile2");

###################################################################

for($i=0;$i<$len1;$i++)
{$d=0;

	for($j=0;$j<$len;$j++)
 	{


		if(($ar3[$i] < $arr3[$j]) && ($ar4[$i] > $arr4[$j]))
		{
			$sum=$arr4[$j]-$arr3[$j];
			$cutoff[$i] = $sum/$ar5[$i];
			$d=$d+$cutoff[$i];
		}

		if(($ar3[$i] > $arr3[$j]) && ($ar4[$i] < $arr4[$j]))
		{
			$sum=$ar4[$i]-$ar3[$i];
			$cutoff[$i] = $sum/$ar5[$i];
			$d=$d+$cutoff[$i];

		}

		if(($ar3[$i] <= $arr3[$j]) && ($ar4[$i] >= $arr3[$j]) && ($ar4[$i] <= $arr4[$j]))
		{
			$sum=$ar4[$i]-$arr3[$j];
			$cutoff[$i] = $sum/$ar5[$i];
			$d=$d+$cutoff[$i];

		}

		if(($ar3[$i] >= $arr3[$j]) && ($ar3[$i] <= $arr4[$j]) && ($ar4[$i] >= $arr4[$j]))
		{
			$sum=$arr4[$j]-$ar3[$i];
			$cutoff[$i] = $sum/$ar5[$i];
			$d=$d+$cutoff[$i];
		}

#if($c>$MAX){$MAX=$c;}
	}
if($d>0.50){
print FH1 "$ar1[$i]\t$ar2[$i]\t$ar3[$i]\t$ar4[$i]\t$ar5[$i]\t$ar6[$i]\t$d\n";
}
}
#print FH1"$ct1[$i]\t$ct2[$i]\t$d\n";
