# Clearing Sets and Creating AEMTDialFULL
# load mergedAEMT ### DO NOT FORGET TO REMOVE THE LINES THAT ARE SAME AS THE HEADER
#Selecting one dialogue + Supression of unsuable column 
#library(dplyr)

mergedAEMT<- read.csv("mergedAEMT.csv",header=TRUE,sep="\t",fileEncoding="UTF-16LE")
mergedAEMT[-seq(1, nrow(mergedAEMT), by = 966)]
AEMTDialFULL<- mergedAEMT[-c(3,4,10,11,12)]

names(AEMTDialFULL)[names(AEMTDialFULL) == 'GlobalIndex'] <- 'Speakers'
names(AEMTDialFULL)[names(AEMTDialFULL) == 'Speaker'] <- 'GlobalIndex'

names(AEMTDialFULL)[names(AEMTDialFULL) == 'OtherShared'] <- 'OS'
names(AEMTDialFULL)[names(AEMTDialFULL) == 'SelfShared'] <- 'SS'

#Adding first a level in the factors in order to obtain only IG and IF
levels(AEMTDialFULL$Speakers) <- c(levels(AEMTDialFULL$Speakers), "IG")
levels(AEMTDialFULL$Speakers) <- c(levels(AEMTDialFULL$Speakers), "IF")

AEMTDialFULL$Speakers[AEMTDialFULL$Speakers == 'g'] <- 'IG'
AEMTDialFULL$Speakers[AEMTDialFULL$Speakers == 'f'] <- 'IF'
AEMTDialFULL$Speakers <- factor(AEMTDialFULL$Speakers)

AEMTDialLONG <- reshape(data=AEMTDialFULL, 
                        idvar="GlobalIndex", 
                        varying=c("Speakers","Tokens","NGrams","SS","OS","N","DialID","Reality","Level"),
                        v.names=c("Value"),
                        times=c("Speakers","Tokens","NGrams","SS","OS","N","DialID","Reality","Level"),
                        direction="long")

#AEMTDialLONG <- data.table.melt(AEMTDialFULL, id.vars=c("GlobalIndex")
                     
                     
#                     )

connection <- file("C:/Users/ttye7/Desktop/4th Year/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/AEMTDialFULL/AEMTDialFULL.DATA",open="at")
write.table(AEMTDialLONG, connection, sep="\t")
close(connection)

