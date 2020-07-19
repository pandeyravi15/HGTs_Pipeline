#!/user/bin/perl
$fname1 = $ARGV[1];
open (FILE1, $fname1);

while( $line = <FILE1> )
{
  chomp $line;
   @fields = split (/\t/, $line);
#print "@fields\n";

@arr1[$i++] = $fields[0];
@arr2[$j++] = $fields[1];
@arr3[$k++] = $fields[2];
@arr4[$l++] = $fields[3];
@arr5[$m++] = $fields[4];
@arr6[$n++] = $fields[5];
@arr7[$o++] = $fields[6];


}
$length = $i;
#print "$length\n";
for ($i = 0; $i < $length; $i++)
{
	my $pattern = $arr6[$i];

use strict;
use File::Basename;
my $fasta_file = $ARGV[0];


	open(INPUT, $fasta_file) || die "Cannot open FASTA file.\n";
	my ($sequence, $prev_header) = (0, "", '');
	while(<INPUT>){
	my $this_line = $_;
	$this_line =~ s/\r\n/\n/;
	#chomp $this_line;
	#$sequence .= $this_line if(eof(INPUT));
	if(/\>(.*)/ || eof(INPUT)){
	my $header = $1;
	#If all of sequence read, and header matches, export sequence
	print ">$prev_header\n$sequence\n" if($prev_header =~ /$pattern/);
	$prev_header = $header;
	$sequence = '';
	} else {
#append sequence
	$sequence .= $this_line;
	}
	}
}
close(INPUT);
