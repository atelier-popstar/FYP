#Start = Load AEAEMTDialFULL  -- Re-Analysis of the Full AEMT Corpus # 12 July 2019
#Proportions extraction, Tukey Test and P-Value Extraction per Speakers in the AEMT

#summary(AEMTDialFULL)
######################################################################
#Test with Level + Clear history console and Environment
######################################################################
### aemt01
######################################################################

PValuesLoc1 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/PValues/TukeyTestLevelaemt01_OS"
PValuesLoc2 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/PValues/TukeyTestLevelaemt01_SS"
PValuesLoc3 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/PValues/TukeyTestLevelaemt02_OS"
PValuesLoc4 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/PValues/TukeyTestLevelaemt02_SS"

PValuesN1Loc1 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/PValuesN1/TukeyTestLevelaemt01N1_OS"
PValuesN1Loc2 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/PValuesN1/TukeyTestLevelaemt01N1_SS"
PValuesN1Loc3 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/PValuesN1/TukeyTestLevelaemt02N1_OS"
PValuesN1Loc4 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/PValuesN1/TukeyTestLevelaemt02N1_SS"

PValuesN2Loc1 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/PValuesN2/TukeyTestLevelaemt01N2_OS"
PValuesN2Loc2 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/PValuesN2/TukeyTestLevelaemt01N2_SS"
PValuesN2Loc3 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/PValuesN2/TukeyTestLevelaemt02N2_OS"
PValuesN2Loc4 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/PValuesN2/TukeyTestLevelaemt02N2_SS"

ConfInt1Loc1 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglht/Claemt01_OS"
ConfInt1Loc2 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglht/Claemt01_SS"
ConfInt1Loc3 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglht/Claemt01N1_OS"
ConfInt1Loc4 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglht/Claemt01N1_SS"
ConfInt1Loc5 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglht/Claemt01N2_OS"
ConfInt1Loc6 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglht/Claemt01N2_SS"
ConfInt1Loc7 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglht/Claemt02_OS"
ConfInt1Loc8 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglht/Claemt02_OS"
ConfInt1Loc9 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglht/Claemt02N1_OS"
ConfInt1Loc10 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglht/Claemt02N1_SS"
ConfInt1Loc11 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglht/Claemt02N2_OS"
ConfInt1Loc12 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglht/Claemt02N2_SS"

ConfInt2Loc1 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglm/Claemt01_OS"
ConfInt2Loc2 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglm/Claemt01_SS"
ConfInt2Loc3 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglm/Claemt01N1_OS"
ConfInt2Loc4 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglm/Claemt01N1_SS"
ConfInt2Loc5 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglm/Claemt01N2_OS"
ConfInt2Loc6 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglm/Claemt01N2_SS"
ConfInt2Loc7 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglm/Claemt02_OS"
ConfInt2Loc8 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglm/Claemt02_OS"
ConfInt2Loc9 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglm/Claemt02N1_OS"
ConfInt2Loc10 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglm/Claemt02N1_SS"
ConfInt2Loc11 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglm/Claemt02N2_OS"
ConfInt2Loc12 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/ConfidenceIntervals/Clglm/Claemt02N2_SS"

UnderPValuesLoc1 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/PValues/TukeyTestLevelaemt01_OS"
UnderPValuesLoc2 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/PValues/TukeyTestLevelaemt01_SS"
UnderPValuesLoc3 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/PValues/TukeyTestLevelaemt02_OS"
UnderPValuesLoc4 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/PValues/TukeyTestLevelaemt02_SS"

UnderPValuesN1Loc1 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt01N1_OS"
UnderPValuesN1Loc2 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt01N1_SS"
UnderPValuesN1Loc3 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt02N1_OS"
UnderPValuesN1Loc4 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt02N1_SS"

UnderPValuesN2Loc1 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt01N2_OS"
UnderPValuesN2Loc2 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt01N2_SS"
UnderPValuesN2Loc3 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt02N2_OS"
UnderPValuesN2Loc4 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt02N2_SS"

UnderConfInt1Loc1 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglht/Claemt01_OS"
UnderConfInt1Loc2 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglht/Claemt01_SS"
UnderConfInt1Loc3 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglht/Claemt01N1_OS"
UnderConfInt1Loc4 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglht/Claemt01N1_SS"
UnderConfInt1Loc5 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglht/Claemt01N2_OS"
UnderConfInt1Loc6 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglht/Claemt01N2_SS"
UnderConfInt1Loc7 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglht/Claemt02_OS"
UnderConfInt1Loc8 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglht/Claemt02_OS"
UnderConfInt1Loc9 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglht/Claemt02N1_OS"
UnderConfInt1Loc10 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglht/Claemt02N1_SS"
UnderConfInt1Loc11 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglht/Claemt02N2_OS"
UnderConfInt1Loc12 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglht/Claemt02N2_SS"

UnderConfInt2Loc1 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglm/Claemt01_OS"
UnderConfInt2Loc2 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglm/Claemt01_SS"
UnderConfInt2Loc3 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglm/Claemt01N1_OS"
UnderConfInt2Loc4 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglm/Claemt01N1_SS"
UnderConfInt2Loc5 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglm/Claemt01N2_OS"
UnderConfInt2Loc6 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglm/Claemt01N2_SS"
UnderConfInt2Loc7 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglm/Claemt02_OS"
UnderConfInt2Loc8 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglm/Claemt02_OS"
UnderConfInt2Loc9 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglm/Claemt02N1_OS"
UnderConfInt2Loc10 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglm/Claemt02N1_SS"
UnderConfInt2Loc11 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglm/Claemt02N2_OS"
UnderConfInt2Loc12 <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisRUnder/ConfidenceIntervals/Clglm/Claemt02N2_SS"


AEMTDialLocation <- "C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/AEMTDialFULL/AEMTDialFull.DATA"
AEMTDialFULL<- read.table(AEMTDialLocation,header=TRUE,sep="\t")
aemt01 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt01",]
#summary(aemt01)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt01$DialID <- factor(aemt01$DialID)
attach(aemt01)


Level <- factor(Level)
REALITY <- Reality < 1
REALITY  <- factor(REALITY)
DialogType <- ifelse( REALITY==TRUE, c("Actual"), c("Randomized"))
DialogType <- factor(DialogType)
Speakers <- factor(Speakers)
NSS <- (NGrams-SS)
NOS <- (NGrams-OS)
# eliminate eventual negative values in NOS and NSS
NOS[NOS < 0] <- 0
NSS[NSS < 0] <- 0

OSprop <- cbind(OS,NOS)
SSprop <- cbind(SS,NSS)

library(multcomp)
#glm(OSprop~DialogType*Speakers*Level,family = binomial)

OSfos <- interaction(DialogType,Speakers,Level)
OSmfos <- glm(OSprop~OSfos,family = binomial)
OSmfos.mc <- glht(OSmfos,linfct=mcp(OSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999)
OSs <- summary(OSmfos.mc)
# residual deviance and residual
#1-pchisq(172500,124929)
#plot(summary(OSmfos.mc))
CIOSs <- confint(OSmfos)
CIOSTs <- confint(OSmfos.mc)

capture.output(OSs, file = PValuesLoc1)
capture.output(CIOSs, file = ConfInt2Loc1)
capture.output(CIOSTs, file = ConfInt1Loc1)

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = PValuesLoc2)
capture.output(CISSs, file = ConfInt2Loc2)
capture.output(CISSTs, file = ConfInt1Loc2)
detach(aemt01)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt01N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt01"&AEMTDialFULL$N==1,]
#summary(aemt01N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt01N1$DialID <- factor(aemt01N1$DialID)
attach(aemt01N1)

Level <- factor(Level)
REALITY <- Reality < 1
REALITY  <- factor(REALITY)
DialogType <- ifelse( REALITY==TRUE, c("Actual"), c("Randomized"))
DialogType <- factor(DialogType)
Speakers <- factor(Speakers)
NSS <- (NGrams-SS)
NOS <- (NGrams-OS)
# eliminate eventual negative values in NOS and NSS
NOS[NOS < 0] <- 0
NSS[NSS < 0] <- 0

OSprop <- cbind(OS,NOS)
SSprop <- cbind(SS,NSS)

library(multcomp)
#glm(OSprop~DialogType*Speakers*Level,family = binomial)

OSfos <- interaction(DialogType,Speakers,Level)
OSmfos <- glm(OSprop~OSfos,family = binomial)
OSmfos.mc <- glht(OSmfos,linfct=mcp(OSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999)
OSs <- summary(OSmfos.mc)
# residual deviance and residual
#1-pchisq(172500,124929)
#plot(summary(OSmfos.mc))
CIOSs <- confint(OSmfos)
CIOSTs <- confint(OSmfos.mc)

capture.output(OSs, file = PValuesN1Loc1)
capture.output(CIOSs, file = ConfInt2Loc3)
capture.output(CIOSTs, file = ConfInt1Loc3)

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = PValuesN1Loc2)
capture.output(CISSs, file = ConfInt2Loc4)
capture.output(CISSTs, file = ConfInt1Loc4)
detach(aemt01N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt01N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt01"&AEMTDialFULL$N==2,]
#summary(aemt01N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt01N2$DialID <- factor(aemt01N2$DialID)
attach(aemt01N2)

Level <- factor(Level)
REALITY <- Reality < 1
REALITY  <- factor(REALITY)
DialogType <- ifelse( REALITY==TRUE, c("Actual"), c("Randomized"))
DialogType <- factor(DialogType)
Speakers <- factor(Speakers)
NSS <- (NGrams-SS)
NOS <- (NGrams-OS)
# eliminate eventual negative values in NOS and NSS
NOS[NOS < 0] <- 0
NSS[NSS < 0] <- 0

OSprop <- cbind(OS,NOS)
SSprop <- cbind(SS,NSS)

library(multcomp)
#glm(OSprop~DialogType*Speakers*Level,family = binomial)

OSfos <- interaction(DialogType,Speakers,Level)
OSmfos <- glm(OSprop~OSfos,family = binomial)
OSmfos.mc <- glht(OSmfos,linfct=mcp(OSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999)
OSs <- summary(OSmfos.mc)
# residual deviance and residual
#1-pchisq(172500,124929)
#plot(summary(OSmfos.mc))
CIOSs <- confint(OSmfos)
CIOSTs <- confint(OSmfos.mc)

capture.output(OSs, file = PValuesN2Loc1)
capture.output(CIOSs, file = ConfInt2Loc5)
capture.output(CIOSTs, file = ConfInt1Loc5)

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = PValuesN2Loc2)
capture.output(CISSs, file = ConfInt2Loc6)
capture.output(CISSTs, file = ConfInt1Loc6)
detach(aemt01N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
### aemt02
######################################################################
aemt02 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt02",]
#summary(aemt02)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt02$DialID <- factor(aemt02$DialID)
attach(aemt02)

Level <- factor(Level)
REALITY <- Reality < 1
REALITY  <- factor(REALITY)
DialogType <- ifelse( REALITY==TRUE, c("Actual"), c("Randomized"))
DialogType <- factor(DialogType)
Speakers <- factor(Speakers)
NSS <- (NGrams-SS)
NOS <- (NGrams-OS)
# eliminate eventual negative values in NOS and NSS
NOS[NOS < 0] <- 0
NSS[NSS < 0] <- 0

OSprop <- cbind(OS,NOS)
SSprop <- cbind(SS,NSS)

library(multcomp)
#glm(OSprop~DialogType*Speakers*Level,family = binomial)

OSfos <- interaction(DialogType,Speakers,Level)
OSmfos <- glm(OSprop~OSfos,family = binomial)
OSmfos.mc <- glht(OSmfos,linfct=mcp(OSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999)
OSs <- summary(OSmfos.mc)
# residual deviance and residual
#1-pchisq(172500,124929)
#plot(summary(OSmfos.mc))
CIOSs <- confint(OSmfos)
CIOSTs <- confint(OSmfos.mc)

capture.output(OSs, file = PValuesLoc3)
capture.output(CIOSs, file = ConfInt2Loc7)
capture.output(CIOSTs, file = ConfInt1Loc7)

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = PValuesLoc4)
capture.output(CISSs, file = ConfInt2Loc8)
capture.output(CISSTs, file = ConfInt1Loc8)
detach(aemt02)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt02N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt02"&AEMTDialFULL$N==1,]
#summary(aemt02N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt02N1$DialID <- factor(aemt02N1$DialID)
attach(aemt02N1)

Level <- factor(Level)
REALITY <- Reality < 1
REALITY  <- factor(REALITY)
DialogType <- ifelse( REALITY==TRUE, c("Actual"), c("Randomized"))
DialogType <- factor(DialogType)
Speakers <- factor(Speakers)
NSS <- (NGrams-SS)
NOS <- (NGrams-OS)
# eliminate eventual negative values in NOS and NSS
NOS[NOS < 0] <- 0
NSS[NSS < 0] <- 0

OSprop <- cbind(OS,NOS)
SSprop <- cbind(SS,NSS)

library(multcomp)
#glm(OSprop~DialogType*Speakers*Level,family = binomial)

OSfos <- interaction(DialogType,Speakers,Level)
OSmfos <- glm(OSprop~OSfos,family = binomial)
OSmfos.mc <- glht(OSmfos,linfct=mcp(OSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999)
OSs <- summary(OSmfos.mc)
# residual deviance and residual
#1-pchisq(172500,124929)
#plot(summary(OSmfos.mc))
CIOSs <- confint(OSmfos)
CIOSTs <- confint(OSmfos.mc)

capture.output(OSs, file = PValuesN1Loc3)
capture.output(CIOSs, file = ConfInt2Loc9)
capture.output(CIOSTs, file = ConfInt1Loc9)

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = PValuesN1Loc4)
capture.output(CISSs, file = ConfInt2Loc10)
capture.output(CISSTs, file = ConfInt1Loc10)
detach(aemt02N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt02N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt02"&AEMTDialFULL$N==2,]
#summary(aemt02N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt02N2$DialID <- factor(aemt02N2$DialID)
attach(aemt02N2)

Level <- factor(Level)
REALITY <- Reality < 1
REALITY  <- factor(REALITY)
DialogType <- ifelse( REALITY==TRUE, c("Actual"), c("Randomized"))
DialogType <- factor(DialogType)
Speakers <- factor(Speakers)
NSS <- (NGrams-SS)
NOS <- (NGrams-OS)
# eliminate eventual negative values in NOS and NSS
NOS[NOS < 0] <- 0
NSS[NSS < 0] <- 0

OSprop <- cbind(OS,NOS)
SSprop <- cbind(SS,NSS)

library(multcomp)
#glm(OSprop~DialogType*Speakers*Level,family = binomial)

OSfos <- interaction(DialogType,Speakers,Level)
OSmfos <- glm(OSprop~OSfos,family = binomial)
OSmfos.mc <- glht(OSmfos,linfct=mcp(OSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999)
OSs <- summary(OSmfos.mc)
# residual deviance and residual
#1-pchisq(172500,124929)
#plot(summary(OSmfos.mc))
CIOSs <- confint(OSmfos)
CIOSTs <- confint(OSmfos.mc)

capture.output(OSs, file = PValuesN2Loc3)
capture.output(CIOSs, file = ConfInt2Loc11)
capture.output(CIOSTs, file = ConfInt1Loc11)

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = PValuesN2Loc4)
capture.output(CISSs, file = ConfInt2Loc12)
capture.output(CISSTs, file = ConfInt1Loc12)
detach(aemt02N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################

######################################################################
######################################################################
#        UNDERCHANCE
######################################################################
### aemt01
######################################################################
aemt01 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt01",]
#summary(aemt01)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt01$DialID <- factor(aemt01$DialID)
attach(aemt01)

Level <- factor(Level)
REALITY <- Reality < 1
REALITY  <- factor(REALITY)
DialogType <- ifelse( REALITY==TRUE, c("Actual"), c("Randomized"))
DialogType <- factor(DialogType)
Speakers <- factor(Speakers)
NSS <- (NGrams-SS)
NOS <- (NGrams-OS)
# eliminate eventual negative values in NOS and NSS
NOS[NOS < 0] <- 0
NSS[NSS < 0] <- 0

OSprop <- cbind(OS,NOS)
SSprop <- cbind(SS,NSS)

library(multcomp)
#glm(OSprop~DialogType*Speakers*Level,family = binomial)

OSfos <- interaction(DialogType,Speakers,Level)
OSmfos <- glm(OSprop~OSfos,family = binomial)
OSmfos.mc <- glht(OSmfos,linfct=mcp(OSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999)
OSs <- summary(OSmfos.mc)
# residual deviance and residual
#1-pchisq(172500,124929)
#plot(summary(OSmfos.mc))
CIOSs <- confint(OSmfos)
CIOSTs <- confint(OSmfos.mc)

capture.output(OSs, file = UnderPValuesLoc1)
capture.output(CIOSs, file = UnderConfInt2Loc1)
capture.output(CIOSTs, file = UnderConfInt1Loc1)

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = UnderPValuesLoc2)
capture.output(CISSs, file = UnderConfInt2Loc2)
capture.output(CISSTs, file = UnderConfInt1Loc2)
detach(aemt01)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt01N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt01"&AEMTDialFULL$N==1,]
#summary(aemt01N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt01N1$DialID <- factor(aemt01N1$DialID)
attach(aemt01N1)

Level <- factor(Level)
REALITY <- Reality < 1
REALITY  <- factor(REALITY)
DialogType <- ifelse( REALITY==TRUE, c("Actual"), c("Randomized"))
DialogType <- factor(DialogType)
Speakers <- factor(Speakers)
NSS <- (NGrams-SS)
NOS <- (NGrams-OS)
# eliminate eventual negative values in NOS and NSS
NOS[NOS < 0] <- 0
NSS[NSS < 0] <- 0

OSprop <- cbind(OS,NOS)
SSprop <- cbind(SS,NSS)

library(multcomp)
#glm(OSprop~DialogType*Speakers*Level,family = binomial)

OSfos <- interaction(DialogType,Speakers,Level)
OSmfos <- glm(OSprop~OSfos,family = binomial)
OSmfos.mc <- glht(OSmfos,linfct=mcp(OSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999)
OSs <- summary(OSmfos.mc)
# residual deviance and residual
#1-pchisq(172500,124929)
#plot(summary(OSmfos.mc))
CIOSs <- confint(OSmfos)
CIOSTs <- confint(OSmfos.mc)

capture.output(OSs, file = UnderPValuesN1Loc1)
capture.output(CIOSs, file = UnderConfInt2Loc3)
capture.output(CIOSTs, file = UnderConfInt1Loc3)

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = UnderPValuesN1Loc2)
capture.output(CISSs, file = UnderConfInt2Loc4)
capture.output(CISSTs, file = UnderConfInt1Loc4)
detach(aemt01N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt01N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt01"&AEMTDialFULL$N==2,]
#summary(aemt01N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt01N2$DialID <- factor(aemt01N2$DialID)
attach(aemt01N2)

Level <- factor(Level)
REALITY <- Reality < 1
REALITY  <- factor(REALITY)
DialogType <- ifelse( REALITY==TRUE, c("Actual"), c("Randomized"))
DialogType <- factor(DialogType)
Speakers <- factor(Speakers)
NSS <- (NGrams-SS)
NOS <- (NGrams-OS)
# eliminate eventual negative values in NOS and NSS
NOS[NOS < 0] <- 0
NSS[NSS < 0] <- 0

OSprop <- cbind(OS,NOS)
SSprop <- cbind(SS,NSS)

library(multcomp)
#glm(OSprop~DialogType*Speakers*Level,family = binomial)

OSfos <- interaction(DialogType,Speakers,Level)
OSmfos <- glm(OSprop~OSfos,family = binomial)
OSmfos.mc <- glht(OSmfos,linfct=mcp(OSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999)
OSs <- summary(OSmfos.mc)
# residual deviance and residual
#1-pchisq(172500,124929)
#plot(summary(OSmfos.mc))
CIOSs <- confint(OSmfos)
CIOSTs <- confint(OSmfos.mc)

capture.output(OSs, file = UnderPValuesN2Loc1)
capture.output(CIOSs, file = UnderConfInt2Loc5)
capture.output(CIOSTs, file = UnderConfInt1Loc5)

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = UnderPValuesN2Loc2)
capture.output(CISSs, file = UnderConfInt2Loc6)
capture.output(CISSTs, file = UnderConfInt1Loc6)
detach(aemt01N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
### aemt02
######################################################################
aemt02 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt02",]
#summary(aemt02)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt02$DialID <- factor(aemt02$DialID)
attach(aemt02)

Level <- factor(Level)
REALITY <- Reality < 1
REALITY  <- factor(REALITY)
DialogType <- ifelse( REALITY==TRUE, c("Actual"), c("Randomized"))
DialogType <- factor(DialogType)
Speakers <- factor(Speakers)
NSS <- (NGrams-SS)
NOS <- (NGrams-OS)
# eliminate eventual negative values in NOS and NSS
NOS[NOS < 0] <- 0
NSS[NSS < 0] <- 0

OSprop <- cbind(OS,NOS)
SSprop <- cbind(SS,NSS)

library(multcomp)
#glm(OSprop~DialogType*Speakers*Level,family = binomial)

OSfos <- interaction(DialogType,Speakers,Level)
OSmfos <- glm(OSprop~OSfos,family = binomial)
OSmfos.mc <- glht(OSmfos,linfct=mcp(OSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999)
OSs <- summary(OSmfos.mc)
# residual deviance and residual
#1-pchisq(172500,124929)
#plot(summary(OSmfos.mc))
CIOSs <- confint(OSmfos)
CIOSTs <- confint(OSmfos.mc)

capture.output(OSs, file = UnderPValuesLoc3)
capture.output(CIOSs, file = UnderConfInt2Loc7)
capture.output(CIOSTs, file = UnderConfInt1Loc7)

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = UnderPValuesLoc4)
capture.output(CISSs, file = UnderConfInt2Loc8)
capture.output(CISSTs, file = UnderConfInt1Loc8)
detach(aemt02)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt02N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt02"&AEMTDialFULL$N==1,]
#summary(aemt02N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt02N1$DialID <- factor(aemt02N1$DialID)
attach(aemt02N1)

Level <- factor(Level)
REALITY <- Reality < 1
REALITY  <- factor(REALITY)
DialogType <- ifelse( REALITY==TRUE, c("Actual"), c("Randomized"))
DialogType <- factor(DialogType)
Speakers <- factor(Speakers)
NSS <- (NGrams-SS)
NOS <- (NGrams-OS)
# eliminate eventual negative values in NOS and NSS
NOS[NOS < 0] <- 0
NSS[NSS < 0] <- 0

OSprop <- cbind(OS,NOS)
SSprop <- cbind(SS,NSS)

library(multcomp)
#glm(OSprop~DialogType*Speakers*Level,family = binomial)

OSfos <- interaction(DialogType,Speakers,Level)
OSmfos <- glm(OSprop~OSfos,family = binomial)
OSmfos.mc <- glht(OSmfos,linfct=mcp(OSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999)
OSs <- summary(OSmfos.mc)
# residual deviance and residual
#1-pchisq(172500,124929)
#plot(summary(OSmfos.mc))
CIOSs <- confint(OSmfos)
CIOSTs <- confint(OSmfos.mc)

capture.output(OSs, file = UnderPValuesN1Loc3)
capture.output(CIOSs, file = UnderConfInt2Loc9)
capture.output(CIOSTs, file = UnderConfInt1Loc9)

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = UnderPValuesN1Loc4)
capture.output(CISSs, file = UnderConfInt2Loc10)
capture.output(CISSTs, file = UnderConfInt1Loc10)
detach(aemt02N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt02N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt02"&AEMTDialFULL$N==2,]
#summary(aemt02N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt02N2$DialID <- factor(aemt02N2$DialID)
attach(aemt02N2)

Level <- factor(Level)
REALITY <- Reality < 1
REALITY  <- factor(REALITY)
DialogType <- ifelse( REALITY==TRUE, c("Actual"), c("Randomized"))
DialogType <- factor(DialogType)
Speakers <- factor(Speakers)
NSS <- (NGrams-SS)
NOS <- (NGrams-OS)
# eliminate eventual negative values in NOS and NSS
NOS[NOS < 0] <- 0
NSS[NSS < 0] <- 0

OSprop <- cbind(OS,NOS)
SSprop <- cbind(SS,NSS)

library(multcomp)
#glm(OSprop~DialogType*Speakers*Level,family = binomial)

OSfos <- interaction(DialogType,Speakers,Level)
OSmfos <- glm(OSprop~OSfos,family = binomial)
OSmfos.mc <- glht(OSmfos,linfct=mcp(OSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999)
OSs <- summary(OSmfos.mc)
# residual deviance and residual
#1-pchisq(172500,124929)
#plot(summary(OSmfos.mc))
CIOSs <- confint(OSmfos)
CIOSTs <- confint(OSmfos.mc)

capture.output(OSs, file = UnderPValuesN2Loc3)
capture.output(CIOSs, file = UnderConfInt2Loc11)
capture.output(CIOSTs, file = UnderConfInt1Loc11)

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = UnderPValuesN2Loc4)
capture.output(CISSs, file = UnderConfInt2Loc12)
capture.output(CISSTs, file = UnderConfInt1Loc12)
detach(aemt02N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
