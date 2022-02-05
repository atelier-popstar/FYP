#!/usr/bin/perl -w
use Getopt::Std;
use Switch;
use warnings;
use Data::Dumper;
#use List::Compare;

# Last Modified: Wed May 23 16:29:35 2012 (vogel) 
# cmv: created - May 15, 2010
# this is meant to parse dialog transcripts; in a way not too far
# removed from parsing a musical score.

#In principle, the working version should run from here:
$PROGRAMS="/CLG/TextAnalytics/Software.2010/Programs";

# Sample invocation:
# ./transcriptparser.pl


getopts("i:s:o:d:l:n:");
#$iinfile=$opt_i || die "no corpus list supplied"; #file name where file by file comparisons are
#$oinfile=$opt_o || die "no weirdness list supplied"; #output


my $realityrun = "";
my $rrindex = 0;
my $reality = 0;
my $realityrunmax = 10;



while ($rrindex <= $realityrunmax){

# hacky bit -- must hand-do for each day, noting that G speaks only in Day 2.
if (defined $opt_i) {$i=$opt_i;}else {$i="day2c.txt";}; 
my $infile = "$i";

#if (defined $opt_o) {$o=$opt_o;}else {$o="$i.stats";}; 

if (defined $opt_o) {$o=$opt_o;}else {$o="$i.fmtd";}; 
if (defined $opt_l) {$l=$opt_l;}else {$l="$o.speakers";}; 
if (defined $opt_s) {$st=$opt_s;}else {$st="01:01:01";}; 
if (defined $opt_d) {$dur=$opt_d;}else {$dur=120}; 


open (FILE, $infile);
$iloop=0;
$jloop=0;

while (<FILE>){
    chomp;
#    if (defined($_)){@line=split;push @files,@line;}

    if (defined($_)){
	@line=split("\t",$_); 
	if (defined($line[0])&&defined($line[1])){
	    $lines[$iloop]="$line[0]\t$line[1]";
	    $speaker[$iloop]="$line[0]";
	    $spoken[$iloop]="$line[1]";
	    $speakers{$line[0]}++;
	}else{
	    die "error in $infile at line $iloop\n";
	}
    }

    $iloop++;
}
close(FILE);

$i=0;
$nt=$st;
$start=$st;
$seconds=0;

open (FILE, ">$o");

while ($i < $iloop){
    $nt = timetominutes($start) + int(rand($dur));
    $newtime = secondstotime($nt);
    print FILE "$start\t$newtime\t$speaker[$i]\t\t\t\t\t$spoken[$i]\n";
    $start = $newtime;
    $i++
}

close (FILE);

open (FILE, ">$l") or die "unable to open $l\n";
#while ( ($person,$data) = each %interlocutors){
while (($person,$total) = each %speakers){
    print FILE "$person\n";
    print "speaker: $person spoke $total\n";
}
close (FILE);

die "done\n";


#foreach ($person,$total) (@count){
#	push @people, $person};
#}
#print Dumper(@people);

@start = split("\t",$lines{0});
$starttime = $start[0];
@stop = split("\t",$lines{($iloop-1)});
$stoptime = $stop[1];
$timeindex = $starttime;


print "start: $starttime stop: $stoptime $iloop\n";
#$starttime = secondstotime($starttime);
#$stoptime = secondstotime($stoptime);

$c = comptime($starttime,$stoptime);
$m1 = timetominutes($starttime);
$m2 = timetominutes($stoptime);
print "sta $starttime\n";
print "sto $stoptime\n";

print "c: $c\n";
print "m1: $m1\n";
print "m2: $m2\n";
#die "done";

my $kloop=0;
my $maxoverlap=10;
my %rindices;
my %randlines;

#while ( ($person,$data) = each %interlocutors){
#    print "person: $person $data :: $interlocutors{$person}\n";
#    print Dumper($person,$interlocutors{$person});
#}



while ($kloop < $iloop){
    $randstart = int(rand($m2));
    $randstop = $randstart+ int(rand($maxoverlap));
    $rstart = secondstotime($randstart);
    $rstop = secondstotime($randstop);
    @entry = split("\t",$lines{$kloop});
#    $randlines{$kloop} = "$rstart\t$rstop\t$entry[2]\t$kloop\t\t\t$entry[3]";
    $rindices{$kloop} = $randstop;
    $randlines{$kloop} = "$rstart\t$rstop\t$entry[2]\t$kloop\t$randstop\t\t\t$entry[3]";
    $kloop++;
}

open (FILE, ">$o");
my $lloop = 0;

#print Dumper(%randlines);
#die;

sub numerically {$a <=> $b}

foreach $key (sort {$rindices{$a} <=> $rindices{$b}} keys %rindices) {
#       print FILE "$key $rindices{$key}\n";
       print FILE "$randlines{$key}\n";
}

#foreach $stopindex (sort numerically keys %randlines){
#    print FILE "$randlines{$stoptime}\n";
#    print FILE "$randlines{$stopindex}\n";
#}


#while ($lloop < $kloop){
#    print FILE "$randlines{$lloop}\n";
#    $lloop++;
#}
close (FILE);

#die;

open (FILE, ">$o.o");
print FILE "start\n";
#foreach $key (keys %lines){
while (($jloop < $iloop)){
    $key = $jloop;
    $jloop++;
    print FILE "$lines{$key}\n";
}
close(FILE);

open (FILE, ">$o.t");
print FILE "start\n";

$i = 0;
print FILE "start n\n";
while (($i < $nindex)){
    print FILE "$n{$i}\n";
    $i++;
}
$i = 0;
print FILE "start d\n";
while (($i < $dindex)){
    print FILE "$d{$i}\n";
    $i++;
}
$i = 0;
print FILE "start f\n";
while (($i < $findex)){
    print FILE "$f{$i}\n";
    $i++;
}
$i = 0;
print FILE "start g\n";
while (($i < $gindex)){
    print FILE "$g{$i}\n";
    $i++;
}
$i = 0;
print FILE "start y\n";
while (($i < $yindex)){
    print FILE "$y{$i}\n";
    $i++;
}

foreach $name (@names){
    my $j=0;
    print FILE "start $name\n";
    while ($j < $counts{$name}){
	print FILE "$interlocutors{$name}{$j}\n";
	$j++;
    }
}


close(FILE);

while ($i < $iloop){
    $i++;
}

$newref = 0;
$reftime = speechstoptime($n{$ni});

open (FILE, ">$o.parsed");

print FILE "Speaker\tGlobalIndex\tStartTime\tStopTime\tTokens\tNGrams\tSelfShared\tOtherShared\tN\tOverlapCount\tOverlapSeconds\tAvgOverlap\tDay\tReality\n";
#while ((timediff($timeindex,$stoptime)>0)&&(($ki<$kindex)&&(($di<$dindex)&&(($ni<$nindex)&&(($gi<$gindex+1)&&($yi<$yindex)))))){

while ($N < $Nmax){
    $N++;


my %speakerindex;

    foreach $name (@names){
	$speakerindex{$name} = 0;
    }

my $ni=0; 
my $fi=0; 
my $yi=0; 
my $di=0; 
my $gi=0;


$timeindex = $starttime;
$prior = "NA";
$curr = "NA";
$overlap = 0;
$repetition = 0;
my %registers;

my %times;
my %time;
my %starts;
my %stops;
my %dtimes;

$outerindex = 0;
$outerlimit = $iloop;
my $laststart = "00:00:00";
my $laststop = "00:00:00";

print "STARTING: $timeindex\n";


    foreach $name (@names){
	$registers{$name} = "";
    }


$registers{"y"} = "";
$registers{"f"} = "";
$registers{"d"} = "";
$registers{"n"} = "";
$registers{"g"} = "";


   foreach $name (@names){
	$times{$name} = "";
    }


$times{"y"} = "";
$times{"f"} = "";
$times{"d"} = "";
$times{"n"} = "";
$times{"g"} = "";
    

while ((timediff($timeindex,$stoptime)>0)&&($outerindex<$outerlimit)){

#    @know = split("\t",$k{$ki});
#    @nnow = split("\t",$n{$ni});
#    @dnow = split("\t",$d{$di});
#    @gnow = split("\t",$g{$gi});
#    @ynow = split("\t",$y{$yi});



#    $kstart = speechstarttime($interlocutors{$tes}{$ki});

 #   $kstart = speechstarttime($k{$ki});

#    die "i $kpstart o $kstart ($mo)\n$moo\n";

    
    foreach $name (@names){
	$starts{$name} = speechstarttime($interlocutors{$name}{$speakerindex{$name}});
	print "$name starts here $starts{$name} at $speakerindex{$name}\n";
    }

    foreach $name (@names){
	$stops{$name} = speechstoptime($interlocutors{$name}{$speakerindex{$name}});
    }

    @timedifferences = [];
    foreach $name (@names){
	$dtimes{$name} = timediff($starttime,$starts{$name});
	push @timedifferences, $dtimes{$name};
	if ($dtimes{$name} < 0){
	    print "name: ";
	    print Dumper($name);
	    print "timeindex: ";
	    print Dumper($timeindex);
	    print "starttime: ";
	    print Dumper($starttime);
	    print "dtimes: ";
	    print Dumper(%dtimes);
	    print "starts: ";
	    print Dumper(%starts);
#	    die "ups";
	}else{
#	    print "name: ";
#	    print Dumper($name);
#	    print "timeindex: ";
#	    print Dumper($timeindex);
#	    print "starttime: ";
#	    print Dumper($starttime);
#	    print "dtimes: ";
#	    print Dumper(%dtimes);
#	    print "starts: ";
#	    print Dumper(%starts);
	}

    }


    $fstart = speechstarttime($f{$fi});
    $nstart = speechstarttime($n{$ni});
    $dstart = speechstarttime($d{$di});
    $gstart = speechstarttime($g{$gi});
    $ystart = speechstarttime($y{$yi});


    $fstop = speechstoptime($f{$fi});
    $nstop = speechstoptime($n{$ni});
    $dstop = speechstoptime($d{$di});
    $gstop = speechstoptime($g{$gi});
    $ystop = speechstoptime($y{$yi});


    $df = timediff($timeindex,$fstart);
    $dn = timediff($timeindex,$nstart);
    $dd = timediff($timeindex,$dstart);
    $dg = timediff($timeindex,$gstart);
    $dy = timediff($timeindex,$ystart);


    foreach $key (sort {$dtimes{$a} <=> $dtimes{$b}} keys %dtimes) {
	print "$key: $dtimes{$key}\n";
    }
	


    $timeindex = timestep($timeindex);

#   print "$dk $dn $dd $dg $dy $timeindex\n";
#   print "$dk $dn $dd $dy $timeindex\n";

#    if ((($dk<=$dn)&&(($dk<=$dd)&&($dk<=$dy)))){
#$n = lteall($i,($j,$k,$l,$m,$i,3));
#    if ((($dk<=$dn)&&(($dk<=$dd)&&(($dk<=$dy)&&($dk<=$dg))))){
 

    foreach $name (@names){

#	print Dumper($name,$dtimes{$name},@timedifferences);

#	    print "out here \n";
	if (lteall($dtimes{$name},@timedifferences)){
#	    print "in here \n";
	    if 	($speakerindex{$name} < $counts{$name}){

	my $spnow = $name;
	my $words = speech($interlocutors{$name}{$speakerindex{$name}});

	my $contrib = transcriptindex($interlocutors{$name}{$speakerindex{$name}})."\t".speechstarttime($interlocutors{$name}{$speakerindex{$name}})."\t".speechstoptime($interlocutors{$name}{$speakerindex{$name}});


	$repetitions = repeat("$spnow\tw\t$N",$words,%registers);

#	$registers{$spnow} = speech($k{$ki});
	$registers{$spnow} = speech($interlocutors{$name}{$speakerindex{$name}});
	print FILE "$spnow\t$contrib\t$repetitions\t$N\t";
#	display($spnow,%registers);
	print "before overlap check\n";
	$overlaps = overlap($spnow,$starts{$name},$stops{$name},%times);
	print "after overlap check ($overlaps)\n";

#	$times{$spnow} = "$kstart\t$kstop";
	$times{$spnow} = "$starts{$name}\t$stops{$name}";
	print FILE "$overlaps\t$day\t$reality\n";
	
	$speakerindex{$name}++;

	while (($key, $value) = each %speakerindex){
	    print "$key -- $value ($speakerindex{$key})\n";
	}

    $outerindex++;

	    }

	}
    }

sub ignorethis {
   if (lteall($df,($dn,$dd,$dy,$dg))){
	if ($fi < $findex){

	my $spnow = "f";
	my $words = speech($f{$fi});
	my $contrib = transcriptindex($f{$fi})."\t".speechstarttime($f{$fi})."\t".speechstoptime($f{$fi});


	$repetitions = repeat("$spnow\tw\t$N",$words,%registers);
	$registers{$spnow} = speech($f{$fi});
	print FILE "$spnow\t$contrib\t$repetitions\t$N\t";
#	display($spnow,%registers);

	$overlaps = overlap($spnow,$fstart,$fstop,%times);
	$times{$spnow} = "$fstart\t$fstop";
	print FILE "$overlaps\t$day\t$reality\n";
	
	$fi++;
#	print "Repeated $repetitions $overlaps.\n";
    $outerindex++;
	}
    }else{
#	print "OUT1";
    }


#    if ((($dn<=$dk)&&(($dn<=$dd)&&($dn<=$dy)))){
#    if ((($dn<=$dk)&&(($dn<=$dd)&&(($dn<=$dy)&&($dn<=$dg))))){
    if (lteall($dn,($df,$dd,$dy,$dg))){
	if ($ni < $nindex){

	my $spnow = "n";
	my $words = speech($n{$ni});
	my $contrib = transcriptindex($n{$ni})."\t".speechstarttime($n{$ni})."\t".speechstoptime($n{$ni});

	$repetitions = repeat("$spnow\tw\t$N",$words,%registers);
	$registers{$spnow} = speech($n{$ni});
	print FILE "$spnow\t$contrib\t$repetitions\t$N\t";
#	display($spnow,%registers);

	$overlaps = overlap($spnow,$nstart,$nstop,%times);
	$times{$spnow} = "$nstart\t$nstop";
	print FILE "$overlaps\t$day\t$reality\n";



#	$registers{"n"} = speech($n{$ni});
#	print FILE "n $n{$ni}\n";

	$ni++;

    $outerindex++;
	}
    }else{
#	print "OUT2";
    }


#    if ((($dy<=$dk)&&(($dy<=$dd)&&($dy<=$dn)))){
#    if ((($dy<=$dk)&&(($dy<=$dd)&&(($dy<=$dn)&&($dy<=$dg))))){
    if (lteall($dy,($df,$dd,$dn,$dg))){
	if ($yi < $yindex){

	my $spnow = "y";
	my $words = speech($y{$yi});
	my $contrib = transcriptindex($y{$yi})."\t".speechstarttime($y{$yi})."\t".speechstoptime($y{$yi});

	$repetitions = repeat("$spnow\tw\t$N",$words,%registers);
	$registers{$spnow} = speech($y{$yi});
	print FILE "$spnow\t$contrib\t$repetitions\t$N\t";
#	display($spnow,%registers);

	$overlaps = overlap($spnow,$ystart,$ystop,%times);
	$times{$spnow} = "$ystart\t$ystop";
	print FILE "$overlaps\t$day\t$reality\n";

#	$registers{"y"} = speech($y{$yi});
#	print FILE "y $y{$yi}\n";

	$yi++;

    $outerindex++;
	}
    }else{
#	print "OUT3";
    }

#    if ((($dd<=$dk)&&(($dd<=$dy)&&($dd<=$dk)))){
#    if ((($dd<=$dk)&&(($dd<=$dy)&&(($dd<=$dk)&&($dd<=$dg))))){




    if (lteall($dd,($df,$dn,$dy,$dg))){
	if ($di < $dindex){


	my $spnow = "d";
	my $words = speech($d{$di});
	my $contrib = transcriptindex($d{$di})."\t".speechstarttime($d{$di})."\t".speechstoptime($d{$di});

	$repetitions = repeat("$spnow\tw\t$N",$words,%registers);
	$registers{$spnow} = speech($d{$di});
	print FILE "$spnow\t$contrib\t$repetitions\t$N\t";
#	display($spnow,%registers);

	$overlaps = overlap($spnow,$dstart,$dstop,%times);
	$times{$spnow} = "$dstart\t$dstop";
	print FILE "$overlaps\t$day\t$reality\n";

#	print "overlap ($dstart\t$dstop): $overlaps\n";


#	$registers{"d"} = speech($d{$di});
#	print FILE "d $d{$di}\n";
	$di++;

    $outerindex++;
	}
    }else{
#	print "OUT4";
    }



#    if ((($dg<=$dk)&&(($dg<=$dy)&&(($dg<=$dk)&&($dg<=$dd))))){
    if (lteall($dg,($df,$dn,$dy,$dd))){
	if ($gi < $gindex){


	my $spnow = "g";
	my $words = speech($g{$gi});
	my $contrib = transcriptindex($g{$gi})."\t".speechstarttime($g{$gi})."\t".speechstoptime($g{$gi});

	$repetitions = repeat("$spnow\tw\t$N",$words,%registers);
	$registers{$spnow} = speech($g{$gi});
	print FILE "$spnow\t$contrib\t$repetitions\t$N\t";
#	display($spnow,%registers);

	$overlaps = overlap($spnow,$gstart,$gstop,%times);
	$times{$spnow} = "$gstart\t$gstop";
	print FILE "$overlaps\t$day\t$reality\n";

#	print "overlap ($dstart\t$dstop): $overlaps\n";


#	$registers{"d"} = speech($d{$di});
#	print FILE "d $d{$di}\n";
	$gi++;

    $outerindex++;
	}
    }else{
#	print "OUT4";
    }

}#ignorethis sub matched



}

}

close(FILE);




$fi = 0;
#while ($ki < $kindex)
while (1 < 0)
{
    $start = speechstarttime($f{$fi});
    $stop = speechstoptime($f{$fi});
    $spoken = speech($f{$fi});
    print "$fi\t$start\t$stop\t$spoken\n";
    $fi++;
}

$reality = $rrindex;
} #end realityruns


######## subroutines #########

sub comptime {
    my @argin = @_;
    my $h1 = 0;
    my $h2 = 0;
    my $m1 = 0;
    my $m2 = 0;
    my $dh = 0;
    my $dm = 0;

    $h1 = hours($argin[0]);
    $m1 = minutes($argin[0]);
    $s1 = seconds($argin[0]);

    $h2 = hours($argin[1]);
    $m2 = minutes($argin[1]);
    $s2 = seconds($argin[1]);

    $dh = $h1-$h2;
    $dm = $m1-$m2;
    $ds = $m1-$s2;
    return "$dh --- $dm --- $ds";
}


sub timediff {
    my @argin = @_;
    my $t1 = 0;
    my $t2 = 0;

    my $dm = 0;
    

    $t1 = timetominutes($argin[0]);
    $t2 = timetominutes($argin[1]);

#    print "$argin[0]\t$t1\n";
#    print "$argin[1]\t$t2\n";


    $dm = $t2-$t1;

    return $dm;
}


# input hh:mm output hh
sub hours {
    my @argin = split(":",@_[0]);
    return $argin[0];
}

# input hh:mm output mm
sub minutes {
    my @argin = split(":",@_[0]);
    return $argin[1];
}


# input hh:mm output mm
sub seconds {
    my @argin = split(":",@_[0]);
    return $argin[2];
}


# input hh:mm output hh*60 + mm
sub timetominutes { #seconds, really
    my $minutes;
    if (defined @_[0]){
	my @argin = split(":",@_[0]);
	my $h = $argin[0];
	my $m = $argin[1];
	my $s = $argin[2];

#	print "h: $h; m: $m; s: $s\n";

	$minutes = ($h*60*60)+($m*60)+$s;
    }else{
	$minutes = 0;
    }

    return $minutes;
}

sub secondstotime {
    my $time = "00:00:00";
    my $h = 0;
    my $hrem = 0;
    my $m = 0;
    my $s = 0;
    my $md;
    if (defined @_[0]){
	my $seconds = @_[0];
#	print "s: $seconds\n";
	@md = div($seconds,3600);
	$h = $md[0];
#	print "h: $h\n";
	@md = div($md[1],60);
	$m = $md[0];
	$s = $md[1];
	$time = "$h:$m:$s";
    }
    return $time;
}

sub div {
    my $remainder = 0;
    my $mod = 0;
    my @moddiv;
    if (((defined @_[0])&&(defined @_[1]))){
	my $l = @_[0];
	my $r = @_[1];
#	print Dumper(@_);
#	print "L: $l R: $r \n";

	if ($r == 0){ 
	    $remainder = 0;
	    $mod = $l;
	}else{
	    $remainder = $l % $r;
	    $mod = int($l / $r);
	}
    }

    $moddiv[0] = $mod;
    $moddiv[1] = $remainder;

    return @moddiv;
}


sub speechstarttime {
    my $time;
    if (defined $_[0]){
	my @argin = split("\t",@_[0]);
	$time = $argin[1];
    }else{
	$time = "00:10000:00";
    }
    return $time;
}

sub transcriptindex {
    my @argin = split("\t",@_[0]);
    my $time = $argin[0];
    return $time;
}

sub lteall {
    my $result = 1;
    my $queryvalue = @_[0];
    my @comparisons = @_;
#    print Dumper($queryvalue,@comparisons);
#    print Dumper($queryvalue,@_);
    my $i = 1;
    while ($i < $#comparisons + 1){
#	print "$i $#comparisons\n";
#	print "@comparisons[$i] vs. q $queryvalue \n";
	if ($queryvalue > @comparisons[$i]){ 
	    $result = 0;
	};
	$i++;
    }

    return $result;
}


sub speechstoptime {
    my $time;
    if (defined $_[0]){
	my @argin = split("\t",@_[0]);
	$time = $argin[2];
    }else{
	$time = "00:10000:00";
    }

    return $time;
}

sub speech {
    my @argin = split("\t",@_[0]);
    my $speech = $argin[3];
    return $speech;
}


sub timestep {
    my @argin = split(":",@_[0]);
    my $h = $argin[0];
    my $m = $argin[1];
    my $s = $argin[2];
    my $newtime;
    
    if ($s==59){
	$m++;
	$s="00";
	if ($m==60){
	    $h++;
	    $m="00";
	}

    }else{
	$s++;
    }
    
    $newtime = "$h:$m:$s";

#    print "NEW: $newtime\n";

    return $newtime;
}

sub display{
    my ($reference,%inargs) = @_;
    my $stuff;

#    print "beginDisplay1\n";

#    print "Reference: $reference\n";
#    print "value: $inargs{$reference}\n";

    while (($key, $value) = each %inargs)
    {
	if ($key eq $reference) { 
#noop
	}else{
	    print "$key: $inargs{$key}\n";
	}
    }
#    print Dumper($reference,%inargs,$inargs);
#    print Dumper($reference,%inargs,$inargs,${%inargs});

#    print "endDisplay1\n";


    return $stuff;
}



#$repetitions = repeat("k",$registers);
sub repeat{
    my ($key,$words,%repeats) = @_;
    my $repetition;
    my @pkey = split("\t",$key);
    my $repeater = $pkey[0];
    my $units = $pkey[1];
    my $N = $pkey[2];
    my $shared = 0;
    my $sshared = 0;
    my $oshared = 0;
    my $stats;

#   print Dumper($key,$units,$N,%repeats,$repeater);

    switch ($units){
	case "w" {

	    foreach  $r (keys %repeats){

#		print "repeat";

		if ($r eq $repeater){
		    @stats = split("\t",comparew($words,$repeats{$repeater},$N));
		    $sshared = $stats[2];
		}else{
		    #count repetitions
		    @stats = split("\t",comparew($words,$repeats{$r},$N));
		    $oshared = $stats[2];
#		   @Llist = $repeats[$r];
#		   @Rlist = $repeats[$repeatert];
#		   $lc = List::Compare->new('--unsorted', \@Llist, \@Rlist);
		    $shared = $shared + $oshared;
		}
	    }

	}
	case "l" {
	}
	else {
	}
    }
    $repetition = "$stats[0]\t$stats[1]\t$sshared\t$shared";

    return $repetition;
}


sub comparew{
    my @argin = @_;
    my @left = split(" ",$argin[0]);
    my @right = split(" ",$argin[1]);
    my $N = $argin[2];
    my $shared = 0;
    my %count;
    my $tokens = $#left+1;
    my $ngrams = $#left-$N+2;
    my $stats;

#    print "compare\n";
#    print "($argin[0]) WITH ($argin[1])\n";
#   print Dumper(@left,@right,$N);

#   foreach  $word (@right){
    
#       if (defined $count{$word}) { 
#	   print "counting $word\t $count{$word}\n";
#	   $count{$word}++;
#       }else{
#	   $count{$word}=0;
#       }
#   }

#   foreach  $word (@left){
#       if (defined $count{$word}) { 
#	   print "counting sharing $word\t $count{$word}\t$shared\n";
#	   $shared++;
#       }else{
#	   #noop
#       }
#   }


    my $m=$N;
    my $tmp=$#right-$m+2;
    for $i (0 ..($#right-$m+1)){
	$tmp=join(' ',@right[$i..($i+$m-1)]);
#	print "$tmp\n";
	$count{$tmp}++;               
    }


    $tmp=$#left-$m+2;
    $ngrams = $tmp;
    for $i (0 ..($#left-$m+1)){
	$tmp=join(' ',@left[$i..($i+$m-1)]);
#	print "$tmp\n";
	if (defined $count{$tmp}){
	    $shared++;
	}else{
	    #noop
	}
    }

    if ($ngrams < 1){
	$stats = "$tokens\t0\t0";
    }else{
	$stats = "$tokens\t$ngrams\t$shared";
    }
    return $stats;
}


# $overlaps = overlap($spnow,%times);
sub overlap{
    my ($reference,$start,$stop,%span) = @_;
    my $count = 0;
    my $duration = 0;
#    my @args = split("\t",$span{$reference});
#    my $ostart;
#    my $ostop;
    my $t1=0;
    my $t2=0;
    my $t3=0;
    my $t4=0;



    $t1 = timetominutes($start);
    $t2 = timetominutes($stop);
    
#    print Dumper($reference,$start,$stop,%span);
#    die "overlap";

    while (($key, $value) = each %span)
    {
	if ($key eq $reference) { 
#noop


	}else{
	    print "overlap $key: $span{$key}\n";
	    my @args = split("\t",$span{$key});

	$ostart = $args[0];
	$ostop = $args[1];

#	    print "vals: $ostart $args[0] $ostop $args[1] $span{$key}\n";

	    $t3 = timetominutes($ostart);
	    $t4 = timetominutes($ostop);	    

#	    print "minutes: $t1($start)\t$t2($stop)\t$t3($ostart)\t$t4($ostop)";

	    if (($t1 <= $t3)&&($t2 >= $t3)) {
		$duration =  $duration + timediff($ostart,$stop);
		$count++;
	    }else{
		
	    if (($t3 <= $t1)&&($t4 >= $t1)) {
		$count++;
		$duration = $duration + timediff($start,$ostop);

	    }


	    }


	}
    }
#    print Dumper($reference,%inargs,$inargs);
#    print Dumper($reference,%inargs,$inargs,${%inargs});

#    print "endDisplay1\n";
    
    my $avg = 0;
    if ($count > 0){ 
	$avg = $duration/$count;
    }

#    die "$count\t$duration\t$avg";
    return "$count\t$duration\t$avg";
}


