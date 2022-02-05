#!/usr/bin/perl
# JR

#Pragmas
use utf8;
use strict;
use warnings;

#ID01En
#Format change for next processing
open ( my $IN,  "TukeyTestLevelaemt01N1_SS.txt");

open ( my $OUT, ">PValuesN1/pValuesaemt01N1_SS.txt");

my $expr1f = qr/Randomized\.IF\./;
my $expr1g = qr/Randomized\.IG\./;
my $expr2 = qr/ - Actual\.IF\./;
my $expr4 = qr/ - Actual\.IG\./;
my $expr3 = qr/ <= 0 /;
my $value = qr/-*\d+\.\d+e*-*\+*\d*/;

while (<$IN>) {
    chomp;
	#Creating header
        #Isolation of the null hypothesis results/ Extracting the g Pvalues
	if (/Multiple.*/) {
		print $OUT "aemt01N1_SSN1PValue";
	} elsif (/$expr1g\Q1\E$expr4\Q1\E$expr3\s*$value\s*$value\s*$value\s*[<>]?($value)/) {
        print $OUT "\naemt01 IG 1 $+";
	} elsif (/$expr1g\Q2\E$expr4\Q2\E$expr3\s*$value\s*$value\s*$value\s*[<>]?($value)/) {
        print $OUT "\naemt01 IG 2 $+";
	} elsif (/$expr1g\Q3\E$expr4\Q3\E$expr3\s*$value\s*$value\s*$value\s*[<>]?($value)/) {
        print $OUT "\naemt01 IG 3 $+";
	} elsif (/$expr1g\Q4\E$expr4\Q4\E$expr3\s*$value\s*$value\s*$value\s*[<>]?($value)/) {
        print $OUT "\naemt01 IG 4 $+";
	} elsif (/$expr1g\Q5\E$expr4\Q5\E$expr3\s*$value\s*$value\s*$value\s*[<>]?($value)/) {
        print $OUT "\naemt01 IG 5 $+";
	}

        #Extracting the f Pvalues
	elsif (/$expr1f\Q1\E$expr2\Q1\E$expr3\s*$value\s*$value\s*$value\s*[<>]?($value)/) {
        print $OUT "\naemt01 IF 1 $+";
	} elsif (/$expr1f\Q2\E$expr2\Q2\E$expr3\s*$value\s*$value\s*$value\s*[<>]?($value)/) {
        print $OUT "\naemt01 IF 2 $+";
	} elsif (/$expr1f\Q3\E$expr2\Q3\E$expr3\s*$value\s*$value\s*$value\s*[<>]?($value)/) {
        print $OUT "\naemt01 IF 3 $+";
	} elsif (/$expr1f\Q4\E$expr2\Q4\E$expr3\s*$value\s*$value\s*$value\s*[<>]?($value)/) {
        print $OUT "\naemt01 IF 4 $+";
	} elsif (/$expr1f\Q5\E$expr2\Q5\E$expr3\s*$value\s*$value\s*$value\s*[<>]?($value)/) {
        print $OUT "\naemt01 IF 5 $+";
	}
}

close $IN;
close $OUT;

