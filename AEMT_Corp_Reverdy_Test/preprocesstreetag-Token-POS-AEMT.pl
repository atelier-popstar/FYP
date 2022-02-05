#!/usr/bin/perl
# JR  #Modif Feb 24

#pragmas
use Lingua::TreeTagger;
use utf8;
use strict;
use warnings; 


#AEMT aemt01
    # Create a Tagger object.
    my $tagger = Lingua::TreeTagger->new(
        'language' => 'english',
        #'options'  => [ qw( -token -no-unknown -base -pt-with-lemma ) ],
	'options'  => [ qw( -token -lemma -no-unknown -base -pt-with-lemma ) ],
    );

    #The tagger's input text is stored in a file.
    my $file_path = 'Corpus/CorpusWithoutTab/aemt01.txt';
    
	#$file_path =~ tr/--/ /;
    
	my $tagged_text = $tagger->tag_file( $file_path );

    # Both methods return a Lingua::TreeTagger::TaggedText object, i.e. a
    # sequence of Lingua::TreeTagger::Token objects, which can be stringified
    # as raw text...
    #Print into a file
    open (my $fh, '>', 'CorporaTagged/aemt01.Tag.txt');
    
    print $fh $tagged_text->as_text();
    
    close $fh;
    
#Format change for next processing 
open (IN,  "CorporaTagged/aemt01.Tag.txt");
open (OUT, ">Dialogue/aemt01/AnalysisToken+POS/aemt01-token-POS");

	while (<IN>) {
	chomp;
		#Isolation of the speaker
		if ( $_ =~ /(^g	|^f	)\s*/) {
			print OUT "\n$1";
		} else {
			# remplacement des tabulations par des espaces
			tr/\t/ /;
			#print OUT "$_\n";  #--> verification d'encodage a ce point [ UTF-8 vs Western 
				# Reordering Lemma per dialogue act
				if ($_ =~/(@[a-z]*|[a-zA-Z]*|[a-zA-Z]*\?) ([A-Z]*) (@[a-z]*|[a-zA-Z]*|[a-zA-Z]*\?)/) {
					print OUT "$1+$2 ";
				}
			}
}
close IN;
close OUT;

#AEMT aemt02
    # Create a Tagger object.
    my $tagger = Lingua::TreeTagger->new(
        'language' => 'english',
        #'options'  => [ qw( -token -no-unknown -base -pt-with-lemma ) ],
	'options'  => [ qw( -token -lemma -no-unknown -base -pt-with-lemma ) ],
    );

    #The tagger's input text is stored in a file.
    my $file_path = 'Corpus/CorpusWithoutTab/aemt02.txt';
    
	#$file_path =~ tr/--/ /;
    
	my $tagged_text = $tagger->tag_file( $file_path );

    # Both methods return a Lingua::TreeTagger::TaggedText object, i.e. a
    # sequence of Lingua::TreeTagger::Token objects, which can be stringified
    # as raw text...
    #Print into a file
    open (my $fh, '>', 'CorporaTagged/aemt02.Tag.txt');
    
    print $fh $tagged_text->as_text();
    
    close $fh;
    
#Format change for next processing 
open (IN,  "CorporaTagged/aemt02.Tag.txt");
open (OUT, ">Dialogue/aemt02/AnalysisToken+POS/aemt02-token-POS");

	while (<IN>) {
	chomp;
		#Isolation of the speaker
		if ( $_ =~ /(^g	|^f	)\s*/) {
			print OUT "\n$1";
		} else {
			# remplacement des tabulations par des espaces
			tr/\t/ /;
			#print OUT "$_\n";  #--> verification d'encodage a ce point [ UTF-8 vs Western 
				# Reordering Lemma per dialogue act
				if ($_ =~/(@[a-z]*|[a-zA-Z]*|[a-zA-Z]*\?) ([A-Z]*) (@[a-z]*|[a-zA-Z]*|[a-zA-Z]*\?)/) {
					print OUT "$1+$2 ";
				}
			}
}
close IN;
close OUT;

