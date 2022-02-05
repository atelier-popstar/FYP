#!/bin/bash

perl ./iyp-treat.pl -i Corpus/CorpusTab/aemt01.txt

perl ./iyp-treat.pl -i Dialogue/AEMT01/AnalysisPOS/aemt01-POS

perl ./iyp-treat.pl -i Dialogue/AEMT01/AnalysisLemma+POS/aemt01-lemma-POS

perl ./iyp-treat.pl -i Dialogue/AEMT01/AnalysisLemma/aemt01-lemma

perl ./iyp-treat.pl -i Dialogue/AEMT01/AnalysisToken+POS/aemt01-token-POS

perl ./iyp-treat.pl -i Corpus/CorpusTab/aemt02.txt

perl ./iyp-treat.pl -i Dialogue/AEMT02/AnalysisPOS/aemt02-POS

perl ./iyp-treat.pl -i Dialogue/AEMT02/AnalysisLemma+POS/aemt02-lemma-POS

perl ./iyp-treat.pl -i Dialogue/AEMT02/AnalysisLemma/aemt02-lemma

perl ./iyp-treat.pl -i Dialogue/AEMT02/AnalysisToken+POS/aemt02-token-POS