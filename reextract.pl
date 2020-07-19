my $f = $ARGV[0];
open(FILE,$f);

my $f1 = $ARGV[1];
open(FILE1,$f1);

$outfile1=$ARGV[2];
open(FH,">$outfile1");


@D =<FILE>;
$s=@D;


foreach $D(@D)
{
	chomp $D;

	@C = split(/\s+/,$D);
  @arr1[$a++]=$C[0];
  @arr2[$b++]=$C[1];
  @arr3[$c++]=$C[2];
  @arr4[$d++]=$C[3];
  @arr5[$e++]=$C[4];
  @arr6[$ff++]=$C[5];
  @arr7[$g++]=$C[6];


}
$len=$a;
print "$len\n";

############## reading header file with taxa name
@D1 =<FILE1>;
$s=@D1;


foreach $D1(@D1)
{
	chomp $D1;

	@C1 = split(/\s+/,$D1);
	@ar1[$p++]=$C1[0];


}
$len1=$p;
print "$len1\n";
############## ############## ##############

for($i=0;$i<$len;$i++)
{
 $flag=0;
 $j=0;
	while($j<$len1 && $flag==0)
	{

		if(($arr6[$i] eq $ar1[$j]))
		{
			$flag=1
		}

		$j++;
	}

	if($flag==0)
	{
		print FH "$arr1[$i]\t$arr2[$i]\t$arr3[$i]\t$arr4[$i]\t$arr5[$i]\t$arr6[$i]\t$arr7[$i]\n";
	}


}
