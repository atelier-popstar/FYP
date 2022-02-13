# Clearing Sets and Creating AEMTDialFULL
# load mergedAEMT ### DO NOT FORGET TO REMOVE THE LINES THAT ARE SAME AS THE HEADER
#Selecting one dialogue + Supression of unsuable column 
#library(dplyr)
#,fileEncoding="UTF-16LE"

mergedAEMT<- read.csv("mergedAEMTCLEAN.csv",header=TRUE,sep="\t")
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

AEMTDialLONG <- reshape(data=AEMTDialFULL, 
                        idvar="AEMTDialFULL[row.names]", 
                        varying=c("Speakers","Tokens","NGrams","SS","OS","N","DialID","Reality","Level"),
                        v.names=c("Value"),
                        times=c("Speakers","Tokens","NGrams","SS","OS","N","DialID","Reality","Level"),
                        direction="long")

#AEMTDialLONG <- data.table.melt(AEMTDialFULL, id.vars=c("GlobalIndex")
                     
                     
#                     )

connection <- file("C:/Users/tanya/OneDrive/Documents/Tom's Stuff/FYP/AEMT_Corp_Reverdy_Test/AnalysisR/AEMTDialFULL/AEMTDialFULL.DATA",open="at")
write.table(AEMTDialLONG, connection, sep="\t")
close(connection)

