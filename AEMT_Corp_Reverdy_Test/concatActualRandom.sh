#!/bin/bash

cat Dialogue/AEMT01/AnalysisLemma/*.parsed > Dialogue/merged_aemt01Lemma.data

cat Dialogue/AEMT01/AnalysisLemma+POS/*.parsed > Dialogue/merged_aemt01LemmaPOS.data

cat Dialogue/AEMT01/AnalysisToken+POS/*.parsed > Dialogue/merged_aemt01TokenPOS.data

cat Dialogue/AEMT01/AnalysisToken/*.parsed > Dialogue/merged_aemt01Token.data

cat Dialogue/AEMT01/AnalysisPOS/*.parsed > Dialogue/merged_aemt01POS.data

cat Dialogue/AEMT02/AnalysisLemma/*.parsed > Dialogue/merged_aemt02Lemma.data

cat Dialogue/AEMT02/AnalysisLemma+POS/*.parsed > Dialogue/merged_aemt02LemmaPOS.data

cat Dialogue/AEMT02/AnalysisToken+POS/*.parsed > Dialogue/merged_aemt02TokenPOS.data

cat Dialogue/AEMT02/AnalysisToken/*.parsed > Dialogue/merged_aemt02Token.data

cat Dialogue/AEMT02/AnalysisPOS/*.parsed > Dialogue/merged_aemt02POS.data