# Clearing Sets and Creating AEMTDialFULL
# load mergedAEMT ### DO NOT FORGET TO REMOVE THE LINES THAT ARE SAME AS THE HEADER
#Selecting one dialogue + Supression of unsuable column 

mergedAEMT<- read.csv("mergedAEMT.csv",header=TRUE,sep="\t",fileEncoding="UTF-16LE")
AEMTDialFULL<- mergedAEMT[-c(2,3,4,10,11,12)]

names(AEMTDialFULL)[names(AEMTDialFULL) == 'Speaker'] <- 'Speakers'

names(AEMTDialFULL)[names(AEMTDialFULL) == 'OtherShared'] <- 'OS'
names(AEMTDialFULL)[names(AEMTDialFULL) == 'SelfShared'] <- 'SS'

#Adding first a level in the factors in order to obtain only IG and IF
levels(AEMTDialFULL$Speakers) <- c(levels(AEMTDialFULL$Speakers), "IG")
levels(AEMTDialFULL$Speakers) <- c(levels(AEMTDialFULL$Speakers), "IF")

AEMTDialFULL$Speakers[AEMTDialFULL$Speakers == 'g'] <- 'IG'
AEMTDialFULL$Speakers[AEMTDialFULL$Speakers == 'f'] <- 'IF'
AEMTDialFULL$Speakers <- factor(AEMTDialFULL$Speakers)


connection <- file("C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/AEMTDialFULL/AEMTDialFULL.csv",open="at")
write.table(AEMTDialFULL, connection, sep="\t")

