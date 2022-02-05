#!/usr/bin/perl
# JReverdy - last edit 28/02/2019
# Post processing - level type column adding

# Token Level = 1, Lemma Level = 2, Lemma+POS Level = 3, POS Level = 4, Token+POS Level = 5.

#Pragmas
use utf8;
use strict;
use warnings; 


#Format change for next processing AEMT Token
open (IN,  "Dialogue/merged_aemt01Token.data");
open (OUT, ">Dialogue/merged_aemt01TokenLevel.data");

	while (<IN>) {
	chomp;
		#Isolation of the speaker  
		#if ( $_ =~ /(Speaker)\t(GlobalIndex)\t(StartTime)\t(StopTime)\t(Tokens)\t(NGrams)\t(SelfShared)\t(OtherShared)\t(N)\t(OverlapCount)\t(OverlapSeconds)\t(AvgOverlap)\t(Day)\t(Reality)/){
		if ( $_ =~ /(Speaker\tGlobalIndex\tStartTime\tStopTime\tTokens\tNGrams\tSelfShared\tOtherShared\tN\tOverlapCount\tOverlapSeconds\tAvgOverlap\t)(Day)(\tReality)/){
			print OUT "$1DialID$3\tLevel\n";
		} else {
				# Reordering lemma+POS per dialogue act
				if ($_ =~/(.*	\d*	\d*:\d*:\d*	\d*:\d*:\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*)\t(\d)(	\d*)/) {
					print OUT "$1\taemt01$3\t1\n";
				}
			}
}
close IN;
close OUT;

#Format change for next processing AEMT Lemma
open (IN,  "Dialogue/merged_aemt01Lemma.data");
open (OUT, ">Dialogue/merged_aemt01LemmaLevel.data");

	while (<IN>) {
	chomp;
		#Isolation of the speaker  
		#if ( $_ =~ /(Speaker)\t(GlobalIndex)\t(StartTime)\t(StopTime)\t(Tokens)\t(NGrams)\t(SelfShared)\t(OtherShared)\t(N)\t(OverlapCount)\t(OverlapSeconds)\t(AvgOverlap)\t(Day)\t(Reality)/){
		if ( $_ =~ /(Speaker\tGlobalIndex\tStartTime\tStopTime\tTokens\tNGrams\tSelfShared\tOtherShared\tN\tOverlapCount\tOverlapSeconds\tAvgOverlap\t)(Day)(\tReality)/){
			print OUT "$1DialID$3\tLevel\n";
		} else {
				# Reordering lemma+POS per dialogue act
				if ($_ =~/(.*	\d*	\d*:\d*:\d*	\d*:\d*:\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*)\t(\d)(	\d*)/) {
					print OUT "$1\taemt01$3\t2\n";
				}
			}
}
close IN;
close OUT;

#Format change for next processing AEMT Lemma+POS
open (IN,  "Dialogue/merged_aemt01LemmaPOS.data");
open (OUT, ">Dialogue/merged_aemt01Lemma-POSLevel.data");

	while (<IN>) {
	chomp;
		#Isolation of the speaker  
		#if ( $_ =~ /(Speaker)\t(GlobalIndex)\t(StartTime)\t(StopTime)\t(Tokens)\t(NGrams)\t(SelfShared)\t(OtherShared)\t(N)\t(OverlapCount)\t(OverlapSeconds)\t(AvgOverlap)\t(Day)\t(Reality)/){
		if ( $_ =~ /(Speaker\tGlobalIndex\tStartTime\tStopTime\tTokens\tNGrams\tSelfShared\tOtherShared\tN\tOverlapCount\tOverlapSeconds\tAvgOverlap\t)(Day)(\tReality)/){
			print OUT "$1DialID$3\tLevel\n";
		} else {
				# Reordering lemma+POS per dialogue act
				if ($_ =~/(.*	\d*	\d*:\d*:\d*	\d*:\d*:\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*)\t(\d)(	\d*)/) {
					print OUT "$1\taemt01$3\t3\n";
				}
			}
}
close IN;
close OUT;

#Format change for next processing AEMT POS
open (IN,  "Dialogue/merged_aemt01POS.data");
open (OUT, ">Dialogue/merged_aemt01POSLevel.data");

	while (<IN>) {
	chomp;
		#Isolation of the speaker  
		#if ( $_ =~ /(Speaker)\t(GlobalIndex)\t(StartTime)\t(StopTime)\t(Tokens)\t(NGrams)\t(SelfShared)\t(OtherShared)\t(N)\t(OverlapCount)\t(OverlapSeconds)\t(AvgOverlap)\t(Day)\t(Reality)/){
		if ( $_ =~ /(Speaker\tGlobalIndex\tStartTime\tStopTime\tTokens\tNGrams\tSelfShared\tOtherShared\tN\tOverlapCount\tOverlapSeconds\tAvgOverlap\t)(Day)(\tReality)/){
			print OUT "$1DialID$3\tLevel\n";
		} else {
				# Reordering lemma+POS per dialogue act
				if ($_ =~/(.*	\d*	\d*:\d*:\d*	\d*:\d*:\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*)\t(\d)(	\d*)/) {
					print OUT "$1\taemt01$3\t4\n";
				}
			}
}
close IN;
close OUT;

#Format change for next processing AEMT Token POS
open (IN,  "Dialogue/merged_aemt01TokenPOS.data");
open (OUT, ">Dialogue/merged_aemt01Token-POSLevel.data");

	while (<IN>) {
	chomp;
		#Isolation of the speaker  
		#if ( $_ =~ /(Speaker)\t(GlobalIndex)\t(StartTime)\t(StopTime)\t(Tokens)\t(NGrams)\t(SelfShared)\t(OtherShared)\t(N)\t(OverlapCount)\t(OverlapSeconds)\t(AvgOverlap)\t(Day)\t(Reality)/){
		if ( $_ =~ /(Speaker\tGlobalIndex\tStartTime\tStopTime\tTokens\tNGrams\tSelfShared\tOtherShared\tN\tOverlapCount\tOverlapSeconds\tAvgOverlap\t)(Day)(\tReality)/){
			print OUT "$1DialID$3\tLevel\n";
		} else {
				# Reordering lemma+POS per dialogue act
				if ($_ =~/(.*	\d*	\d*:\d*:\d*	\d*:\d*:\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*)\t(\d)(	\d*)/) {
					print OUT "$1\taemt01$3\t5\n";
				}
			}
}
close IN;
close OUT;
###################################################
#Format change for next processing AEMT Token
open (IN,  "Dialogue/merged_aemt02Token.data");
open (OUT, ">Dialogue/merged_aemt02TokenLevel.data");

	while (<IN>) {
	chomp;
		#Isolation of the speaker  
		#if ( $_ =~ /(Speaker)\t(GlobalIndex)\t(StartTime)\t(StopTime)\t(Tokens)\t(NGrams)\t(SelfShared)\t(OtherShared)\t(N)\t(OverlapCount)\t(OverlapSeconds)\t(AvgOverlap)\t(Day)\t(Reality)/){
		if ( $_ =~ /(Speaker\tGlobalIndex\tStartTime\tStopTime\tTokens\tNGrams\tSelfShared\tOtherShared\tN\tOverlapCount\tOverlapSeconds\tAvgOverlap\t)(Day)(\tReality)/){
			print OUT "$1DialID$3\tLevel\n";
		} else {
				# Reordering lemma+POS per dialogue act
				if ($_ =~/(.*	\d*	\d*:\d*:\d*	\d*:\d*:\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*)\t(\d)(	\d*)/) {
					print OUT "$1\taemt02$3\t1\n";
				}
			}
}
close IN;
close OUT;

#Format change for next processing AEMT Lemma
open (IN,  "Dialogue/merged_aemt02Lemma.data");
open (OUT, ">Dialogue/merged_aemt02LemmaLevel.data");

	while (<IN>) {
	chomp;
		#Isolation of the speaker  
		#if ( $_ =~ /(Speaker)\t(GlobalIndex)\t(StartTime)\t(StopTime)\t(Tokens)\t(NGrams)\t(SelfShared)\t(OtherShared)\t(N)\t(OverlapCount)\t(OverlapSeconds)\t(AvgOverlap)\t(Day)\t(Reality)/){
		if ( $_ =~ /(Speaker\tGlobalIndex\tStartTime\tStopTime\tTokens\tNGrams\tSelfShared\tOtherShared\tN\tOverlapCount\tOverlapSeconds\tAvgOverlap\t)(Day)(\tReality)/){
			print OUT "$1DialID$3\tLevel\n";
		} else {
				# Reordering lemma+POS per dialogue act
				if ($_ =~/(.*	\d*	\d*:\d*:\d*	\d*:\d*:\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*)\t(\d)(	\d*)/) {
					print OUT "$1\taemt02$3\t2\n";
				}
			}
}
close IN;
close OUT;

#Format change for next processing AEMT Lemma+POS
open (IN,  "Dialogue/merged_aemt02LemmaPOS.data");
open (OUT, ">Dialogue/merged_aemt02Lemma-POSLevel.data");

	while (<IN>) {
	chomp;
		#Isolation of the speaker  
		#if ( $_ =~ /(Speaker)\t(GlobalIndex)\t(StartTime)\t(StopTime)\t(Tokens)\t(NGrams)\t(SelfShared)\t(OtherShared)\t(N)\t(OverlapCount)\t(OverlapSeconds)\t(AvgOverlap)\t(Day)\t(Reality)/){
		if ( $_ =~ /(Speaker\tGlobalIndex\tStartTime\tStopTime\tTokens\tNGrams\tSelfShared\tOtherShared\tN\tOverlapCount\tOverlapSeconds\tAvgOverlap\t)(Day)(\tReality)/){
			print OUT "$1DialID$3\tLevel\n";
		} else {
				# Reordering lemma+POS per dialogue act
				if ($_ =~/(.*	\d*	\d*:\d*:\d*	\d*:\d*:\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*)\t(\d)(	\d*)/) {
					print OUT "$1\taemt02$3\t3\n";
				}
			}
}
close IN;
close OUT;

#Format change for next processing AEMT POS
open (IN,  "Dialogue/merged_aemt02POS.data");
open (OUT, ">Dialogue/merged_aemt02POSLevel.data");

	while (<IN>) {
	chomp;
		#Isolation of the speaker  
		#if ( $_ =~ /(Speaker)\t(GlobalIndex)\t(StartTime)\t(StopTime)\t(Tokens)\t(NGrams)\t(SelfShared)\t(OtherShared)\t(N)\t(OverlapCount)\t(OverlapSeconds)\t(AvgOverlap)\t(Day)\t(Reality)/){
		if ( $_ =~ /(Speaker\tGlobalIndex\tStartTime\tStopTime\tTokens\tNGrams\tSelfShared\tOtherShared\tN\tOverlapCount\tOverlapSeconds\tAvgOverlap\t)(Day)(\tReality)/){
			print OUT "$1DialID$3\tLevel\n";
		} else {
				# Reordering lemma+POS per dialogue act
				if ($_ =~/(.*	\d*	\d*:\d*:\d*	\d*:\d*:\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*)\t(\d)(	\d*)/) {
					print OUT "$1\taemt02$3\t4\n";
				}
			}
}
close IN;
close OUT;

#Format change for next processing AEMT Token POS
open (IN,  "Dialogue/merged_aemt02TokenPOS.data");
open (OUT, ">Dialogue/merged_aemt02Token-POSLevel.data");

	while (<IN>) {
	chomp;
		#Isolation of the speaker  
		#if ( $_ =~ /(Speaker)\t(GlobalIndex)\t(StartTime)\t(StopTime)\t(Tokens)\t(NGrams)\t(SelfShared)\t(OtherShared)\t(N)\t(OverlapCount)\t(OverlapSeconds)\t(AvgOverlap)\t(Day)\t(Reality)/){
		if ( $_ =~ /(Speaker\tGlobalIndex\tStartTime\tStopTime\tTokens\tNGrams\tSelfShared\tOtherShared\tN\tOverlapCount\tOverlapSeconds\tAvgOverlap\t)(Day)(\tReality)/){
			print OUT "$1DialID$3\tLevel\n";
		} else {
				# Reordering lemma+POS per dialogue act
				if ($_ =~/(.*	\d*	\d*:\d*:\d*	\d*:\d*:\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*	\d*)\t(\d)(	\d*)/) {
					print OUT "$1\taemt02$3\t5\n";
				}
			}
}
close IN;
close OUT;
##############################################
