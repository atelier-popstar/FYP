#Start = Load AEAEMTDialFULL  -- Re-Analysis of the Full AEMT Corpus # 1 Aug 2019
#Proportions extraction, Tukey Test and P-Value Extraction per Speakers in the AEMT

#summary(AEMTDialFULL)
######################################################################
#Test with Level + Clear history console and Environment
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
OSmfos.mc <- glht(OSmfos,linfct=mcp(OSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999)
OSs <- summary(OSmfos.mc)
# residual deviance and residual
#1-pchisq(172500,124929)
#plot(summary(OSmfos.mc))
CIOSs <- confint(OSmfos)
CIOSTs <- confint(OSmfos.mc)

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt01_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt01_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt01_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt01_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt01_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt01_SS.txt")
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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt01N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt01N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt01N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt01N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt01N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt01N1_SS.txt")
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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt01N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt01N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt01N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt01N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt01N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt01N2_SS.txt")
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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt02_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt02_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt02_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt02_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt02_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt02_SS.txt")
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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt02N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt02N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt02N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt02N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt02N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt02N1_SS.txt")
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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt02N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt02N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt02N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt02N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt02N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt02N2_SS.txt")
detach(aemt02N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt03
######################################################################
aemt03 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt03",]
#summary(aemt03)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt03$DialID <- factor(aemt03$DialID)
attach(aemt03)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt03_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt03_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt03_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt03_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt03_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt03_SS.txt")
detach(aemt03)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt03N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt03"&AEMTDialFULL$N==1,]
#summary(aemt03N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt03N1$DialID <- factor(aemt03N1$DialID)
attach(aemt03N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt03N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt03N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt03N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt03N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt03N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt03N1_SS.txt")
detach(aemt03N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt03N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt03"&AEMTDialFULL$N==2,]
#summary(aemt03N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt03N2$DialID <- factor(aemt03N2$DialID)
attach(aemt03N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt03N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt03N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt03N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt03N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt03N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt03N2_SS.txt")
detach(aemt03N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt04
######################################################################
aemt04 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt04",]
#summary(aemt04)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt04$DialID <- factor(aemt04$DialID)
attach(aemt04)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt04_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt04_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt04_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt04_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt04_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt04_SS.txt")
detach(aemt04)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt04N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt04"&AEMTDialFULL$N==1,]
#summary(aemt04N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt04N1$DialID <- factor(aemt04N1$DialID)
attach(aemt04N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt04N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt04N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt04N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt04N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt04N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt04N1_SS.txt")
detach(aemt04N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt04N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt04"&AEMTDialFULL$N==2,]
#summary(aemt04N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt04N2$DialID <- factor(aemt04N2$DialID)
attach(aemt04N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt04N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt04N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt04N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt04N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt04N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt04N2_SS.txt")
detach(aemt04N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt05
######################################################################
aemt05 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt05",]
#summary(aemt05)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt05$DialID <- factor(aemt05$DialID)
attach(aemt05)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt05_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt05_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt05_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt05_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt05_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt05_SS.txt")
detach(aemt05)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt05N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt05"&AEMTDialFULL$N==1,]
#summary(aemt05N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt05N1$DialID <- factor(aemt05N1$DialID)
attach(aemt05N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt05N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt05N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt05N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt05N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt05N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt05N1_SS.txt")
detach(aemt05N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt05N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt05"&AEMTDialFULL$N==2,]
#summary(aemt05N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt05N2$DialID <- factor(aemt05N2$DialID)
attach(aemt05N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt05N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt05N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt05N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt05N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt05N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt05N2_SS.txt")
detach(aemt05N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt06
######################################################################
aemt06 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt06",]
#summary(aemt06)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt06$DialID <- factor(aemt06$DialID)
attach(aemt06)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt06_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt06_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt06_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt06_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt06_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt06_SS.txt")
detach(aemt06)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt06N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt06"&AEMTDialFULL$N==1,]
#summary(aemt06N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt06N1$DialID <- factor(aemt06N1$DialID)
attach(aemt06N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt06N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt06N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt06N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt06N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt06N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt06N1_SS.txt")
detach(aemt06N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt06N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt06"&AEMTDialFULL$N==2,]
#summary(aemt06N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt06N2$DialID <- factor(aemt06N2$DialID)
attach(aemt06N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt06N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt06N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt06N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt06N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt06N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt06N2_SS.txt")
detach(aemt06N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt07
######################################################################
aemt07 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt07",]
#summary(aemt07)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt07$DialID <- factor(aemt07$DialID)
attach(aemt07)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt07_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt07_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt07_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt07_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt07_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt07_SS.txt")
detach(aemt07)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt07N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt07"&AEMTDialFULL$N==1,]
#summary(aemt07N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt07N1$DialID <- factor(aemt07N1$DialID)
attach(aemt07N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt07N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt07N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt07N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt07N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt07N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt07N1_SS.txt")
detach(aemt07N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt07N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt07"&AEMTDialFULL$N==2,]
#summary(aemt07N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt07N2$DialID <- factor(aemt07N2$DialID)
attach(aemt07N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt07N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt07N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt07N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt07N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt07N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt07N2_SS.txt")
detach(aemt07N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt08
######################################################################
aemt08 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt08",]
#summary(aemt08)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt08$DialID <- factor(aemt08$DialID)
attach(aemt08)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt08_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt08_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt08_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt08_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt08_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt08_SS.txt")
detach(aemt08)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt08N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt08"&AEMTDialFULL$N==1,]
#summary(aemt08N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt08N1$DialID <- factor(aemt08N1$DialID)
attach(aemt08N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt08N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt08N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt08N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt08N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt08N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt08N1_SS.txt")
detach(aemt08N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt08N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt08"&AEMTDialFULL$N==2,]
#summary(aemt08N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt08N2$DialID <- factor(aemt08N2$DialID)
attach(aemt08N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt08N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt08N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt08N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt08N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt08N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt08N2_SS.txt")
detach(aemt08N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
### aemt09
######################################################################
aemt09 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt09",]
#summary(aemt09)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt09$DialID <- factor(aemt09$DialID)
attach(aemt09)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt09_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt09_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt09_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt09_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt09_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt09_SS.txt")
detach(aemt09)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt09N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt09"&AEMTDialFULL$N==1,]
#summary(aemt09N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt09N1$DialID <- factor(aemt09N1$DialID)
attach(aemt09N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt09N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt09N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt09N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt09N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt09N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt09N1_SS.txt")
detach(aemt09N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt09N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt09"&AEMTDialFULL$N==2,]
#summary(aemt09N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt09N2$DialID <- factor(aemt09N2$DialID)
attach(aemt09N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt09N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt09N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt09N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt09N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt09N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt09N2_SS.txt")
detach(aemt09N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
### aemt10
######################################################################
aemt10 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt10",]
#summary(aemt10)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt10$DialID <- factor(aemt10$DialID)
attach(aemt10)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt10_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt10_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt10_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt10_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt10_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt10_SS.txt")
detach(aemt10)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt10N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt10"&AEMTDialFULL$N==1,]
#summary(aemt10N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt10N1$DialID <- factor(aemt10N1$DialID)
attach(aemt10N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt10N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt10N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt10N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt10N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt10N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt10N1_SS.txt")
detach(aemt10N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt10N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt10"&AEMTDialFULL$N==2,]
#summary(aemt10N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt10N2$DialID <- factor(aemt10N2$DialID)
attach(aemt10N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt10N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt10N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt10N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt10N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt10N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt10N2_SS.txt")
detach(aemt10N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt11
######################################################################
aemt11 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt11",]
#summary(aemt11)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt11$DialID <- factor(aemt11$DialID)
attach(aemt11)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt11_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt11_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt11_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt11_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt11_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt11_SS.txt")
detach(aemt11)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt11N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt11"&AEMTDialFULL$N==1,]
#summary(aemt11N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt11N1$DialID <- factor(aemt11N1$DialID)
attach(aemt11N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt11N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt11N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt11N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt11N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt11N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt11N1_SS.txt")
detach(aemt11N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt11N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt11"&AEMTDialFULL$N==2,]
#summary(aemt11N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt11N2$DialID <- factor(aemt11N2$DialID)
attach(aemt11N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt11N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt11N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt11N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt11N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt11N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt11N2_SS.txt")
detach(aemt11N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt12
######################################################################
aemt12 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt12",]
#summary(aemt12)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt12$DialID <- factor(aemt12$DialID)
attach(aemt12)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt12_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt12_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt12_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt12_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt12_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt12_SS.txt")
detach(aemt12)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt12N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt12"&AEMTDialFULL$N==1,]
#summary(aemt12N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt12N1$DialID <- factor(aemt12N1$DialID)
attach(aemt12N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt12N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt12N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt12N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt12N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt12N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt12N1_SS.txt")
detach(aemt12N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt12N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt12"&AEMTDialFULL$N==2,]
#summary(aemt12N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt12N2$DialID <- factor(aemt12N2$DialID)
attach(aemt12N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt12N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt12N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt12N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt12N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt12N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt12N2_SS.txt")
detach(aemt12N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt13
######################################################################
aemt13 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt13",]
#summary(aemt13)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt13$DialID <- factor(aemt13$DialID)
attach(aemt13)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt13_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt13_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt13_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt13_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt13_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt13_SS.txt")
detach(aemt13)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt13N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt13"&AEMTDialFULL$N==1,]
#summary(aemt13N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt13N1$DialID <- factor(aemt13N1$DialID)
attach(aemt13N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt13N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt13N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt13N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt13N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt13N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt13N1_SS.txt")
detach(aemt13N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt13N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt13"&AEMTDialFULL$N==2,]
#summary(aemt13N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt13N2$DialID <- factor(aemt13N2$DialID)
attach(aemt13N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt13N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt13N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt13N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt13N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt13N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt13N2_SS.txt")
detach(aemt13N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt14
######################################################################
aemt14 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt14",]
#summary(aemt14)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt14$DialID <- factor(aemt14$DialID)
attach(aemt14)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt14_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt14_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt14_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt14_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt14_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt14_SS.txt")
detach(aemt14)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt14N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt14"&AEMTDialFULL$N==1,]
#summary(aemt14N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt14N1$DialID <- factor(aemt14N1$DialID)
attach(aemt14N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt14N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt14N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt14N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt14N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt14N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt14N1_SS.txt")
detach(aemt14N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt14N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt14"&AEMTDialFULL$N==2,]
#summary(aemt14N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt14N2$DialID <- factor(aemt14N2$DialID)
attach(aemt14N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt14N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt14N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt14N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt14N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt14N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt14N2_SS.txt")
detach(aemt14N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt15
######################################################################
aemt15 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt15",]
#summary(aemt15)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt15$DialID <- factor(aemt15$DialID)
attach(aemt15)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt15_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt15_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt15_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt15_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt15_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt15_SS.txt")
detach(aemt15)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt15N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt15"&AEMTDialFULL$N==1,]
#summary(aemt15N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt15N1$DialID <- factor(aemt15N1$DialID)
attach(aemt15N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt15N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt15N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt15N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt15N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt15N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt15N1_SS.txt")
detach(aemt15N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt15N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt15"&AEMTDialFULL$N==2,]
#summary(aemt15N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt15N2$DialID <- factor(aemt15N2$DialID)
attach(aemt15N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt15N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt15N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt15N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt15N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt15N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt15N2_SS.txt")
detach(aemt15N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt16
######################################################################
aemt16 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt16",]
#summary(aemt16)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt16$DialID <- factor(aemt16$DialID)
attach(aemt16)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt16_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt16_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt16_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValues/TukeyTestLevelaemt16_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt16_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt16_SS.txt")
detach(aemt16)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt16N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt16"&AEMTDialFULL$N==1,]
#summary(aemt16N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt16N1$DialID <- factor(aemt16N1$DialID)
attach(aemt16N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt16N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt16N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt16N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN1/TukeyTestLevelaemt16N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt16N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt16N1_SS.txt")
detach(aemt16N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt16N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt16"&AEMTDialFULL$N==2,]
#summary(aemt16N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt16N2$DialID <- factor(aemt16N2$DialID)
attach(aemt16N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt16N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt16N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt16N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="l")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/PValuesN2/TukeyTestLevelaemt16N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglm/CIaemt16N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisR/ConfidenceIntervals/CIglht/CIaemt16N2_SS.txt")
detach(aemt16N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt01_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt01_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt01_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt01_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt01_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt01_SS.txt")
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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt01N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt01N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt01N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt01N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt01N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt01N1_SS.txt")
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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt01N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt01N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt01N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt01N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt01N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt01N2_SS.txt")
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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt02_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt02_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt02_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt02_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt02_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt02_SS.txt")
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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt02N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt02N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt02N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt02N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt02N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt02N1_SS.txt")
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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt02N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt02N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt02N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt02N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt02N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt02N2_SS.txt")
detach(aemt02N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt03
######################################################################
aemt03 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt03",]
#summary(aemt03)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt03$DialID <- factor(aemt03$DialID)
attach(aemt03)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt03_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt03_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt03_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt03_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt03_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt03_SS.txt")
detach(aemt03)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt03N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt03"&AEMTDialFULL$N==1,]
#summary(aemt03N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt03N1$DialID <- factor(aemt03N1$DialID)
attach(aemt03N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt03N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt03N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt03N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt03N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt03N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt03N1_SS.txt")
detach(aemt03N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt03N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt03"&AEMTDialFULL$N==2,]
#summary(aemt03N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt03N2$DialID <- factor(aemt03N2$DialID)
attach(aemt03N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt03N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt03N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt03N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt03N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt03N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt03N2_SS.txt")
detach(aemt03N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt04
######################################################################
aemt04 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt04",]
#summary(aemt04)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt04$DialID <- factor(aemt04$DialID)
attach(aemt04)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt04_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt04_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt04_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt04_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt04_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt04_SS.txt")
detach(aemt04)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt04N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt04"&AEMTDialFULL$N==1,]
#summary(aemt04N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt04N1$DialID <- factor(aemt04N1$DialID)
attach(aemt04N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt04N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt04N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt04N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt04N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt04N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt04N1_SS.txt")
detach(aemt04N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt04N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt04"&AEMTDialFULL$N==2,]
#summary(aemt04N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt04N2$DialID <- factor(aemt04N2$DialID)
attach(aemt04N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt04N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt04N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt04N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt04N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt04N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt04N2_SS.txt")
detach(aemt04N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt05
######################################################################
aemt05 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt05",]
#summary(aemt05)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt05$DialID <- factor(aemt05$DialID)
attach(aemt05)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt05_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt05_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt05_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt05_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt05_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt05_SS.txt")
detach(aemt05)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt05N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt05"&AEMTDialFULL$N==1,]
#summary(aemt05N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt05N1$DialID <- factor(aemt05N1$DialID)
attach(aemt05N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt05N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt05N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt05N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt05N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt05N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt05N1_SS.txt")
detach(aemt05N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt05N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt05"&AEMTDialFULL$N==2,]
#summary(aemt05N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt05N2$DialID <- factor(aemt05N2$DialID)
attach(aemt05N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt05N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt05N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt05N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt05N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt05N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt05N2_SS.txt")
detach(aemt05N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt06
######################################################################
aemt06 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt06",]
#summary(aemt06)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt06$DialID <- factor(aemt06$DialID)
attach(aemt06)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt06_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt06_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt06_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt06_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt06_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt06_SS.txt")
detach(aemt06)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt06N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt06"&AEMTDialFULL$N==1,]
#summary(aemt06N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt06N1$DialID <- factor(aemt06N1$DialID)
attach(aemt06N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt06N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt06N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt06N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt06N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt06N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt06N1_SS.txt")
detach(aemt06N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt06N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt06"&AEMTDialFULL$N==2,]
#summary(aemt06N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt06N2$DialID <- factor(aemt06N2$DialID)
attach(aemt06N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt06N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt06N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt06N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt06N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt06N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt06N2_SS.txt")
detach(aemt06N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt07
######################################################################
aemt07 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt07",]
#summary(aemt07)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt07$DialID <- factor(aemt07$DialID)
attach(aemt07)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt07_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt07_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt07_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt07_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt07_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt07_SS.txt")
detach(aemt07)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt07N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt07"&AEMTDialFULL$N==1,]
#summary(aemt07N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt07N1$DialID <- factor(aemt07N1$DialID)
attach(aemt07N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt07N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt07N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt07N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt07N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt07N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt07N1_SS.txt")
detach(aemt07N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt07N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt07"&AEMTDialFULL$N==2,]
#summary(aemt07N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt07N2$DialID <- factor(aemt07N2$DialID)
attach(aemt07N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt07N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt07N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt07N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt07N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt07N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt07N2_SS.txt")
detach(aemt07N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt08
######################################################################
aemt08 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt08",]
#summary(aemt08)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt08$DialID <- factor(aemt08$DialID)
attach(aemt08)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt08_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt08_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt08_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt08_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt08_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt08_SS.txt")
detach(aemt08)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt08N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt08"&AEMTDialFULL$N==1,]
#summary(aemt08N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt08N1$DialID <- factor(aemt08N1$DialID)
attach(aemt08N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt08N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt08N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt08N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt08N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt08N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt08N1_SS.txt")
detach(aemt08N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt08N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt08"&AEMTDialFULL$N==2,]
#summary(aemt08N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt08N2$DialID <- factor(aemt08N2$DialID)
attach(aemt08N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt08N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt08N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt08N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt08N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt08N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt08N2_SS.txt")
detach(aemt08N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
### aemt09
######################################################################
aemt09 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt09",]
#summary(aemt09)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt09$DialID <- factor(aemt09$DialID)
attach(aemt09)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt09_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt09_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt09_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt09_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt09_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt09_SS.txt")
detach(aemt09)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt09N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt09"&AEMTDialFULL$N==1,]
#summary(aemt09N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt09N1$DialID <- factor(aemt09N1$DialID)
attach(aemt09N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt09N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt09N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt09N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt09N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt09N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt09N1_SS.txt")
detach(aemt09N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt09N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt09"&AEMTDialFULL$N==2,]
#summary(aemt09N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt09N2$DialID <- factor(aemt09N2$DialID)
attach(aemt09N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt09N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt09N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt09N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt09N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt09N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt09N2_SS.txt")
detach(aemt09N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
### aemt10
######################################################################
aemt10 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt10",]
#summary(aemt10)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt10$DialID <- factor(aemt10$DialID)
attach(aemt10)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt10_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt10_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt10_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt10_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt10_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt10_SS.txt")
detach(aemt10)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt10N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt10"&AEMTDialFULL$N==1,]
#summary(aemt10N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt10N1$DialID <- factor(aemt10N1$DialID)
attach(aemt10N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt10N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt10N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt10N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt10N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt10N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt10N1_SS.txt")
detach(aemt10N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt10N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt10"&AEMTDialFULL$N==2,]
#summary(aemt10N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt10N2$DialID <- factor(aemt10N2$DialID)
attach(aemt10N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt10N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt10N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt10N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt10N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt10N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt10N2_SS.txt")
detach(aemt10N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt11
######################################################################
aemt11 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt11",]
#summary(aemt11)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt11$DialID <- factor(aemt11$DialID)
attach(aemt11)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt11_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt11_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt11_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt11_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt11_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt11_SS.txt")
detach(aemt11)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt11N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt11"&AEMTDialFULL$N==1,]
#summary(aemt11N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt11N1$DialID <- factor(aemt11N1$DialID)
attach(aemt11N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt11N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt11N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt11N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt11N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt11N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt11N1_SS.txt")
detach(aemt11N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt11N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt11"&AEMTDialFULL$N==2,]
#summary(aemt11N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt11N2$DialID <- factor(aemt11N2$DialID)
attach(aemt11N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt11N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt11N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt11N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt11N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt11N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt11N2_SS.txt")
detach(aemt11N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt12
######################################################################
aemt12 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt12",]
#summary(aemt12)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt12$DialID <- factor(aemt12$DialID)
attach(aemt12)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt12_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt12_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt12_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt12_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt12_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt12_SS.txt")
detach(aemt12)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt12N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt12"&AEMTDialFULL$N==1,]
#summary(aemt12N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt12N1$DialID <- factor(aemt12N1$DialID)
attach(aemt12N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt12N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt12N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt12N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt12N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt12N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt12N1_SS.txt")
detach(aemt12N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt12N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt12"&AEMTDialFULL$N==2,]
#summary(aemt12N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt12N2$DialID <- factor(aemt12N2$DialID)
attach(aemt12N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt12N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt12N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt12N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt12N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt12N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt12N2_SS.txt")
detach(aemt12N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt13
######################################################################
aemt13 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt13",]
#summary(aemt13)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt13$DialID <- factor(aemt13$DialID)
attach(aemt13)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt13_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt13_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt13_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt13_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt13_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt13_SS.txt")
detach(aemt13)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt13N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt13"&AEMTDialFULL$N==1,]
#summary(aemt13N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt13N1$DialID <- factor(aemt13N1$DialID)
attach(aemt13N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt13N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt13N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt13N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt13N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt13N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt13N1_SS.txt")
detach(aemt13N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt13N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt13"&AEMTDialFULL$N==2,]
#summary(aemt13N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt13N2$DialID <- factor(aemt13N2$DialID)
attach(aemt13N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt13N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt13N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt13N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt13N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt13N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt13N2_SS.txt")
detach(aemt13N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt14
######################################################################
aemt14 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt14",]
#summary(aemt14)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt14$DialID <- factor(aemt14$DialID)
attach(aemt14)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt14_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt14_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt14_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt14_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt14_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt14_SS.txt")
detach(aemt14)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt14N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt14"&AEMTDialFULL$N==1,]
#summary(aemt14N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt14N1$DialID <- factor(aemt14N1$DialID)
attach(aemt14N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt14N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt14N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt14N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt14N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt14N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt14N1_SS.txt")
detach(aemt14N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt14N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt14"&AEMTDialFULL$N==2,]
#summary(aemt14N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt14N2$DialID <- factor(aemt14N2$DialID)
attach(aemt14N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt14N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt14N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt14N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt14N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt14N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt14N2_SS.txt")
detach(aemt14N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt15
######################################################################
aemt15 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt15",]
#summary(aemt15)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt15$DialID <- factor(aemt15$DialID)
attach(aemt15)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt15_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt15_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt15_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt15_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt15_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt15_SS.txt")
detach(aemt15)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt15N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt15"&AEMTDialFULL$N==1,]
#summary(aemt15N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt15N1$DialID <- factor(aemt15N1$DialID)
attach(aemt15N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt15N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt15N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt15N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt15N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt15N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt15N1_SS.txt")
detach(aemt15N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt15N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt15"&AEMTDialFULL$N==2,]
#summary(aemt15N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt15N2$DialID <- factor(aemt15N2$DialID)
attach(aemt15N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt15N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt15N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt15N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt15N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt15N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt15N2_SS.txt")
detach(aemt15N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################

######################################################################
### aemt16
######################################################################
aemt16 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt16",]
#summary(aemt16)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt16$DialID <- factor(aemt16$DialID)
attach(aemt16)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt16_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt16_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt16_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValues/TukeyTestLevelaemt16_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt16_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt16_SS.txt")
detach(aemt16)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt16N1 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt16"&AEMTDialFULL$N==1,]
#summary(aemt16N1)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt16N1$DialID <- factor(aemt16N1$DialID)
attach(aemt16N1)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt16N1_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt16N1_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt16N1_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN1/TukeyTestLevelaemt16N1_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt16N1_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt16N1_SS.txt")
detach(aemt16N1)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
aemt16N2 <- AEMTDialFULL[AEMTDialFULL$DialID=="aemt16"&AEMTDialFULL$N==2,]
#summary(aemt16N2)
#Drop factor levels in a subsetted data frame we have to 'refactorize' them
aemt16N2$DialID <- factor(aemt16N2$DialID)
attach(aemt16N2)

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

capture.output(OSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt16N2_OS.txt")
capture.output(CIOSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt16N2_OS.txt")
capture.output(CIOSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt16N2_OS.txt")

SSfos <- interaction(DialogType,Speakers,Level)
SSmfos <- glm(SSprop~SSfos,family = binomial)
SSmfos.mc <- glht(SSmfos,linfct=mcp(SSfos="Tukey"), alternative="g")
# Addition to write the output of the test in a file
options(max.print=999999) 
SSs <- summary(SSmfos.mc)

CISSs <- confint(SSmfos)
CISSTs <- confint(SSmfos.mc)

capture.output(SSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/PValuesN2/TukeyTestLevelaemt16N2_SS.txt")
capture.output(CISSs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglm/CIaemt16N2_SS.txt")
capture.output(CISSTs, file = "/home/justine/Desktop/AEMT/InteractionAnalysis_AEMT/AnalysisRUnder/ConfidenceIntervals/CIglht/CIaemt16N2_SS.txt")
detach(aemt16N2)

rm(list=setdiff(ls(), "AEMTDialFULL"))
######################################################################
######################################################################
